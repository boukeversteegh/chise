# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "singleton"
require "chise/libchise"

module CHISE
  module ParseValueModule
    def parse_value(v)
      return nil if v.nil?
      return v.to_i if /\A\d+\Z/ =~ v # number?
      return $1 if /\A"(.+)"\Z/ =~ v # remove surrounding "
      v # sexp? or the other?
    end
  end

  class ChiseDB
    include Singleton

    def initialize
      @location = CHISE::DataSource::DB_DIR.path
      @ds = nil
      setup_ds
      @feature_db = {}
      @ccs_db = {}
      # @byids_db = {}
      @ccsstr_db = {}
    end
    attr_reader :ds, :location

    def setup_ds
      return if @ds
      @ds = DataSource.new(CHISE::DataSource::Berkeley_DB, @location.to_s, 0, 0755)
    end

    def close
      # @ds.close if @ds # do not close for now
      # @ds = nil
    end

    def each_feature_name()
      @ds.each_feature_name {|f|
	next if f.to_s == "." || f.to_s == ".."
	next if f.to_s =~ /\.txt\Z/
	yield(f.path.unescape_win_filename.unescape.to_s)
      }
    end

    def each_ccs
      each_entry("character/by_feature") {|f| yield(f) }
    end

    def get_feature(name)
      @feature_db[name] = FeatureDB.new(self, name) if @feature_db[name].nil?
      @feature_db[name]
    end

    def load_feature(cid, name)
      feature = get_feature(name)
      feature.get_value(cid)
    end

    def get_ccs(name)
      @ccs_db[name] = CCS_DB.new(self, name) if @ccs_db[name].nil?
      @ccs_db[name]
    end

    def decode_char(ccs, code_point)
      ccsdb = get_ccs(ccs)
      ccsdb.decode(code_point)
    end

    def nuget_by_ids_db(n)
      @byids_db[n] = ByIDS_DB.new(self, n) if @byids_db[n].nil?
      @byids_db[n]
    end

    def get_ccs_str(n)
      @ccsstr_db[n] = CCS_STR.new(self, n) if @ccsstr_db[n].nil?
#      @ccsstr_db[n] = CCS_STR_DB.new(self, n) if @ccsstr_db[n].nil?
      @ccsstr_db[n]
    end

    private
    include EachEntryModule
  end

  module TableManagementModule
    def to_hash
      sync # add.
      h = {}
      each_char {|k, v| h[k] = v }
      h
    end

    def dump
      txt = @name.path.escape.escape_win_filename.to_s+".txt"
      t = @cd.location+@category+@keyvalue+txt
      t.open("wb"){|out|
	to_hash.sort.each {|k, v|
	  out.printf("%s\t%s\n", k, v)
	}
      }
    end
  end

  class FeatureDB
    include ParseValueModule
    include TableManagementModule

    def initialize(cd, name)
      @cd, @name = cd, name
      @ds = @cd.ds
      @feature = @ds.get_feature(@name.path.escape.escape_win_filename.to_s)
      @category, @keyvalue = "character", "feature"
      at_exit {
	close
      }
    end
    def setup_db(w) @feature.setup_db(w); end
    def sync
      #qp "sync"
      @feature.sync
    end
    alias close sync

    def set_value(cid, value)
      @feature.set_value(cid, value.to_s)
    end

    def get_value(cid)
      parse_value(@feature.get_value(cid))
    end

    def each_char
      @feature.each_char {|cid, value|
	#qp cid, value
	yield(cid, parse_value(value))
      }
    end
  end

  class CCS_DB
    include TableManagementModule

    def initialize(cd, name)
      @cd, @name = cd, name
      @ds = @cd.ds
      @ccs = @ds.get_ccs(@name)
      @dsr = @ccsr = nil
      @category, @keyvalue = "character", "by_feature"
      at_exit {
	close
      }
    end
    def setup_db(w) @ccs.setup_db(w); end
    def sync() @ccs.sync(); end
    alias close sync
    def set(code_point, cid) @ccs.set(code_point, cid); end
    def decode(code_point) @ccs.decode(code_point); end

    def setup_ccs_r
      db_dir = CHISE::DataSource::DB_DIR
      @dsr = DataSource_R.new(CHISE::DataSource::Berkeley_DB, db_dir, 0, 0755) if @dsr.nil?
      #qp @name
      @ccsr = CCS_R.new(@dsr, @name) if @ccsr.nil?
    end

    def each_char # call CCS_R here.
      setup_ccs_r
      @ccsr.each_char {|code_point, cid|
	yield(code_point, cid)
      }
    end
  end

  class CCS_STR_DB
    include ParseValueModule
    include ChiseValue
    include TableAccessModule
    include TableManagementModule

    def initialize(cd, name)
      @cd, @name = cd, name
      @ds = @cd.ds
      @category, @keyvalue = "character", "by_ids"
      reset
      at_exit {
	close
      }
    end

    def get_by_str(str)
      setup_db
      return nil if @db.nil?
      parse_c_string(@db.get(str))
    end

    def set_by_str(str, cid)
      setup_db(true)
      raise "@db is nil." if @db.nil?
      @db.put(str, format_char_id(cid))
    end

    def each_char
      setup_db
      raise "@db is nil." if @db.nil?
      @db.each {|k, v|
	yield(parse_value(k), parse_c_string(v))
      }
    end
  end

end
