# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "chise/char"
require "chise/ids"
require "chise/qp"
require "chise/management"

module CHISE
  class IDS_DB_Management
    def initialize
      @cd = ChiseDB.instance
      @idsdb = IDS_DB.instance
    end

    def check_conflict_of_ids_text
      @idsdb.each_ccs {|ccs|
	#qp ccs
	c = Hash.new(0)
	h = {}
	@idsdb.get_ccs(ccs).each_character {|char, ids|
	  c["char"] += 1
	  next if ids == char.to_s
	  next if ids.char_length == 1
	  char_id = char.char_id
	  cids = h[char_id]
	  if cids.nil? # There is no ids yet.
	    h[char_id] = ids # just set it.
	    c["good"] += 1
	  else # but, if there is already a ids?
	    if cids == ids # the two are same.
	      c["same"] += 1 # and just ignore
	    else # but, if the two are not same?
	      c["conflict"] += 1
	      puts "conflict\t#{char.to_s}\t#{ids}\t#{cids}"
	    end
	  end
	}
	puts "#{ccs}\t#{c['char']}\t#{c['same']}\t#{c['conflict']}\t#{c['good']}"
      }
    end

    def store_ids_as_text
      max = 20000
      h = {}
      @idsdb.each_ccs {|ccs|
	qp ccs
	@idsdb.get_ccs(ccs).each_character {|char, ids|
	  next if ids == char.to_s
	  next if ids.char_length == 1
	  char.ids_text = ids # just set it.
	  h[char.char_id] = ids
#	  break if max <= h.length
	}
#	break if max <= h.length
      }
      qp "%08X" % h.keys.max
      qp "sync", @cd.get_feature("ids-text").sync
      @cd.get_feature("ids-text").dump
      qp h.length
      qp @cd.get_feature("ids-text").to_hash.length
    end

    def store_ids_de_er
      h = {}
      @cd.get_feature("ids-text").each_char {|cid, ids_text|
	char = Character.get(cid)
	begin
	  ids = ids_text.de_er # parse Entity Reference
	rescue => e
	  qp cid, ids_text
	  next
	end
	next if ids == char.to_s
	next if ids.char_length == 1
	char.ids_de_er = ids # set it.
	h[char.char_id] = ids
      }
      qp "%08X" % h.keys.max
      @cd.get_feature("ids-de-er").dump
      qp h.length
      qp @cd.get_feature("ids-de-er").to_hash.length
    end

    def check_integrity_of_ids_tree
      h = {}
      @cd.get_feature("ids-de-er").each_char {|cid, ids|
	char = Character.get(cid)
	idstree = IDS_Tree.new(ids)
	begin
	  raise "contains self" if ids.include?(char.to_s)
	  idstree.check_integrity
	rescue => e
	  #puts "#{cid}\t#{e.message}\t#{ids}"
	  char.ids_error = e.message
	  next
	end
	char.ids_org = ids # set it.
	h[char.char_id] = ids
      }
      @cd.get_feature("ids-org").dump
      qp h.length
      qp @cd.get_feature("ids-org").to_hash.length
      @cd.get_feature("ids-error").dump
    end

    def make_by_ids_db_org
      h = {}
      byids = @cd.get_ccs_str("ids-org")
      @cd.get_feature("ids-org").each_char {|cid, ids|
	char = Character.get(cid)
	byids.set_by_str(ids, cid)
	h[ids] = cid
      }
      qp h.length
      byids.dump
      qp byids.to_hash.length
    end

    def store_ids_aggregated
      h = {}
      @cd.get_feature("ids-org").each_char {|cid, ids|
	char = Character.get(cid)
	#ids = char.decompose
	#ids = char.ids
	ag = ids.to_ids.aggregate("ids-org")
	#puts "#{char.to_s}\t#{ids}\t#{ag}"
	char.ids = ag # ids-aggregated
	h[char.char_id] = ids
      }
      @cd.get_feature("ids").dump
      qp h.length
      qp @cd.get_feature("ids").to_hash.length
    end

    def store_ids_subparts
      h = {}
      @cd.get_feature("ids").each_char {|cid, v|
	char = Character.get(cid)
	pids = char.to_s # previous_ids
	ar = []
	i = 0 # only for infinite loop check
	loop {
	  ids = pids.decompose
	  break if ids == pids # break if there is no possibilities.
	  ar += ids.to_a
	  i += 1
	  qp [char.to_s, pids, ids, ar] if 10 < i # something wrong.
	  pids = ids
	}
	str = ar.sort.uniq.join("") # can contain IDC.
	char.ids_subparts = str
	h[char.char_id] = str
      }
      @cd.get_feature("ids-subparts").dump
      qp h.length
      qp @cd.get_feature("ids-subparts").to_hash.length
    end

    def store_ids_contained
      h = Hash.new
      @cd.get_feature("ids-subparts").each_char {|cid, v|
	char = Character.get(cid)
	parts = char.ids_subparts
	parts.each_char {|ch|
	  h[ch] = [] if h[ch].nil?
	  h[ch] << cid
	}
      }
      h.each {|char, ar|
	str = ar.sort.map {|cid| Character.get(cid).to_s }.join
	char.ids_contained = str
      }
      @cd.get_feature("ids-contained").dump
    end

    def make_by_ids_db
      byids = @cd.get_ccs("ids")
      @cd.get_feature("ids").each_char {|cid, ids|
	char = Character.get(cid)
	byids.set_by_str(ids, cid)
      }
      byids.dump
    end
  end

  class IDS_DB
    include Singleton

    def initialize
      @config = Config.instance
      @path = @config.ids_dir.path
      @dbs = {}
    end
    attr_reader :path

    def get_ccs(ccs)
      @dbs[ccs] = IDS_CCS_DB.new(self, ccs) if @dbs[ccs].nil?
      @dbs[ccs]
    end

    def each_ccs
      @path.each_entry {|f|
	next unless /\AIDS-(.+)\.txt\Z/ =~ f
	yield($1)
      }
    end
  end

  class IDS_CCS_DB
    def initialize(idsdb, ccs)
      @idsdb, @ccs = idsdb, ccs
      @path = @idsdb.path+("IDS-"+ccs+".txt")
    end

    def each_line
      @path.open {|f|
	f.each {|line|
	  next if /\A;/ =~ line # skip comment
	  line.chomp!
	  code, picture, ids = line.split
	  raise if code.nil?
	  ids = "" if ids.nil?
	  yield(code, ids)
	}
      }
    end

    def each_character
      each_line {|code, ids|
	next if ids.nil?
	next if ids == "" # If there is no IDS, ignore it.

	er = "&"+code+";"
	begin
	  char = Character.get(er)
	rescue
	  #qp er
	  next
	end
	next if char.nil?
	yield(char, ids)
      }
    end

  end
end
