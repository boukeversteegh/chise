# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# libchise extension compatible library.

require "bdb"
require "pathname"
require "fileutils"
require "chise/config"
require "chise/path"

module CHISE
  module ChiseValue; end
  module TableAccessModule; end

  module EachEntryModule
    def each_entry(subdir)
      #dir = @location + subdir
      dir = DataSource::DB_DIR.path + subdir
      dir.each_entry {|f|
	next if f.to_s == "." || f.to_s == ".."
	next if f.to_s =~ /\.txt\Z/
	yield(f.unescape_win_filename.unescape.to_s)
      }
    end
  end

  class DataSource_R
    NONE = 0
    Berkeley_DB = 1
    #DB_DIR = "/cygdrive/c/chise/chise-db"
    DB_DIR = CHISE::DB_DIR

    def initialize(type=Berkeley_DB, loc=DB_DIR, subtype=0, modemask=0755)
      @type = type
      #loc = Config.instance.db_dir if loc.nil?
      @location = loc.path
      @subtype = subtype
      @modemask = modemask
      @fdb = {}
      @cdb = {}
    end
    attr_reader :type, :location, :subtype, :modemask

    def close() end

    def get_feature(f)
      @fdb[f] = Feature.new(self, f) if @fdb[f].nil?
      @fdb[f]
    end

    def get_ccs(ccs)
      @cdb[ccs] = CCS.new(self, ccs) if @cdb[ccs].nil?
      @cdb[ccs]
    end

    def each_feature_name
      each_entry("character/feature") {|f| yield f }
    end

    def load_feature(cid, name)
      feature = get_feature(name)
      return nil if feature.nil?
      feature.get_value(cid)
    end

    def decode_char(ccs, code_point)
      ccst = get_ccs(ccs)
      return nil if ccst.nil?
      ccst.decode(code_point)
    end

    private
    include EachEntryModule
  end

  class AttributeTable
    def initialize(dir, cat, keytype, name, amask, mmask)
      @dir, @cat, @keytype, @name, @amask, @mmask = dir, cat, keytype, name, amask, mmask
      @db = nil
      setup_db
      at_exit {
	close
      }
    end

    def close
      return if @db.nil?
      begin
	@db.sync
	@db.close
	# @db = nil
      rescue => e
	p e
      end
    end

    def get(k)    setup_db; @db.get(k);    end
    def put(k, v) setup_db; @db.put(k, v); end

    def each() setup_db; @db.each {|k, v| yield(k, v) } end

    private
    def setup_db
      return if @db
      dbdir  = @dir + @cat + @keytype
      path = dbdir + @name.path.escape.escape_win_filename
      #TODO: should make dir.
      if @amask == BDB::RDONLY
	raise unless FileTest.exist?(path.to_s)
      end
      #qp path.to_s
      @db = BDB::Hash.open(path.to_s, nil, @amask)
    end
  end

  module TableAccessModule
    def reset
      @db = nil
      @access = 0
    end

    def sync
      @db.close if @db
      reset
      true
    end
    alias close sync

    def setup_db(writable=nil)
      if writable
	sync if @access & BDB::CREATE == 0
	access = BDB::CREATE
      else
	access = BDB::RDONLY
      end

      return true if @db

      begin
	db_dir = @ds.location
	modemask = @ds.modemask
      rescue
	db_dir = CHISE::DataSource::DB_DIR.path
	modemask = 0755
      end

      #qp db_dir, @category, @keyvalue, @name, @access, modemask
      begin
	@db = AttributeTable.new(db_dir, @category, @keyvalue,
				 @name, access, modemask)
	return false if @db.nil?
	@access = access
      rescue => e
	#puts $!, $@
	@db = nil
	return false
      end
      true
    end
  end

  class Feature_R
    include ChiseValue
    include TableAccessModule

    def initialize(ds, name)
      @ds, @name = ds, name
      @category, @keyvalue = "character", "feature"
      reset
    end

    def get_value(cid)
      setup_db
      return nil if @db.nil?
      @db.get(format_char_id(cid))
    end

    def set_value(cid, value)
      setup_db(true)
      raise "@db is nil." if @db.nil?
      @db.put(format_char_id(cid), value)
      true
    end

    def each_char
      setup_db
      raise "@db is nil." if @db.nil?
      @db.each {|k, v|
	yield(parse_c_string(k), v)
      }
    end
  end

  class CCS_R
    include ChiseValue
    include TableAccessModule

    def initialize(ds, name)
      @ds, @name = ds, name
      @category, @keyvalue = "character", "by_feature"
      reset
    end

    def set(code_point, cid)
      setup_db(true)
      raise "@db is nil." if @db.nil?
      parse_c_string(@db.get(code_point.to_s))
      @db.put(code_point.to_s, format_char_id(cid))
      true
    end

    def decode(code_point)
      setup_db
      return nil if @db.nil?
      parse_c_string(@db.get(code_point.to_s))
    end

    def set_decoded_char(code_point, cid)
      setup_db(true)
      raise "@db is nil." if @db.nil?
      @db.put(code_point.to_s, format_char_id(cid))
    end

    def each_char
      setup_db
      if @db.nil?
	#raise "@db is nil."+@name
	p "@db is nil."+@name
	return nil
      end
      @db.each {|code_point, cid|
	yield(code_point, parse_c_string(cid))
      }
    end
  end

  module ChiseValue
    def parse_c_string(str)
      return nil if str.nil?

      i = 0
      c = str[i]
      i += 1
      len = str.length

      raise unless 2 <= len && c == ?\?

      c = str[i]
      i += 1

      if (c == ?\\)
	raise if (len < 3)
	c = str[i]
	i += 1
	if (c == ?^)
	  raise if (len < 4)
	  c = str[i]
	  i += 1
	  if c == ?\?
	    return 0x7F
	  else
	    return c & (0x80 | 0x1F)
	  end
	end
	# raise # ?
      end

      if ( c < 0xC0 )
	cid = c
	counter = 0
      elsif ( c < 0xE0 )
	cid = c & 0x1f
	counter = 1
      elsif ( c < 0xF0 )
	cid = c & 0x0f
	counter = 2
      elsif ( c < 0xF8 )
	cid = c & 0x07
	counter = 3
      elsif ( c < 0xFC )
	cid = c & 0x03
	counter = 4
      else
	cid = c & 0x01
	counter = 5
      end

      if (counter + 2 <= len)
	(0...counter).each {|j|
	  cid = (cid << 6) | (str[j + i] & 0x3F)
	}
	return cid
      end

      raise
    end

    def format_char_id(cid)
      case cid
      when ?\t  then return "?\t"
      when ?\n  then return "?\n"
      when ?\r  then return "?\r"
      when 0x1C then return "?\^\\"
      end

      if cid <= 0x1F
	return "?\\^"+(?@+cid).chr
      elsif (cid == ?\s) || (cid == ?\") ||
	  (cid == ?\#) || (cid == ?\') ||
	  (cid == ?\() || (cid == ?\)) ||
	  (cid == ?\,) || (cid == ?\.) ||
	  (cid == ?\;) || (cid == ?\?) ||
	  (cid == ?\[) || (cid == ?\\) ||
	  (cid == ?\]) || (cid == ?\`)
	return "?\\"+cid.chr
      elsif (cid <= 0x7E)
	return("?"+cid.chr)
      elsif (cid == 0x7F)
	return "?\\^?"+0.chr
      elsif (cid <= 0x9F)
	dest = "?\\^"
	dest += (((cid + ?@) >> 6) | 0xC0).chr
	dest += (((cid + ?@) & 0x3F) | 0x80).chr
	return dest
      elsif (cid <= 0x7FF)
	dest = "?  "
	dest[1] = (cid >> 6) | 0xC0
	dest[2] = (cid & 0x3F) | 0x80
	return dest
      elsif (cid <= 0xFFFF)
	dest = "?   "
	dest[1] =  (cid >> 12) | 0xE0
	dest[2] = ((cid >>  6) & 0x3F) | 0x80
	dest[3] =  (cid        & 0x3F) | 0x80
	return dest
      elsif (cid <= 0x1FFFFF)
	dest = "?    "
	dest[1] =  (cid >> 18) | 0xF0
	dest[2] = ((cid >> 12) & 0x3F) | 0x80
	dest[3] = ((cid >>  6) & 0x3F) | 0x80
	dest[4] =  (cid        & 0x3F) | 0x80
	return dest
      elsif (cid <= 0x3FFFFFF)
	dest = "?     "
	dest[1] =  (cid >> 24) | 0xF8
	dest[2] = ((cid >> 18) & 0x3F) | 0x80
	dest[3] = ((cid >> 12) & 0x3F) | 0x80
	dest[4] = ((cid >>  6) & 0x3F) | 0x80
	dest[5] =  (cid        & 0x3F) | 0x80
	return dest
      else
	dest = "?      "
	dest[1] =  (cid >> 30) | 0xFC
	dest[2] = ((cid >> 24) & 0x3F) | 0x80
	dest[3] = ((cid >> 18) & 0x3F) | 0x80
	dest[4] = ((cid >> 12) & 0x3F) | 0x80
	dest[5] = ((cid >>  6) & 0x3F) | 0x80
	dest[6] =  (cid        & 0x3F) | 0x80
	return dest
      end
      raise
    end
  end
end
