# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "singleton"
require "chise/parser"
require "chise/chisedb"
require "chise/iconv"
require "chise/utf8"
require "chise/ids"

module CHISE
  class CharacterFactory # generate Character object and cache them
    include Singleton

    MAX_CACHE_CHARACTER = 10000

    def initialize
      clear
      @parser = CharacterParser.new
    end

    def clear
      @chars = {}
    end

    def get(s)
      check_max
      mcs = @parser.parse(s)
      @chars[mcs] = Character.new(mcs) if @chars[mcs].nil?
      @chars[mcs]
    end

    def check_max
      clear if MAX_CACHE_CHARACTER < @chars.length # clear all cache
    end
  end

  class Character
    include UTF8Value
    include CharacterIDC
    include CharacterIDS

    def initialize(char_id)
      raise if char_id.nil?
      raise unless char_id.kind_of?(Integer) # make sure char_id is Integer.
      raise if char_id < 0 # make sure char_id is positive.
      @char_id = char_id
      @char_id.freeze
      @utf8_mcs = itou8(@char_id)
      @utf8_mcs.freeze
      @feature = {}
    end
    attr_reader :char_id
    attr_reader :utf8_mcs

    def self.get(s)
      CharacterFactory.instance.get(s)
    end

    def inspect
      sprintf("Char:%x", @char_id)
    end

    def to_s()	@utf8_mcs;	end

    def [](f)
      f = normalize_feature_name(f)

      v = @feature[f]
      return v if v
      v = @feature["="+f]
      return v if v

      v = get_feature(f)
      if v
	@feature[f] = v
	return v
      end

      v = get_feature("="+f)
      if v
	@feature["="+f] = v
	return v
      end

      nil
    end

    def []=(k,v)
      f = normalize_feature_name(k)
      cd = ChiseDB.instance
      feature = cd.get_feature(f)
      feature.set_value(@char_id, v)
      @feature[f] = v;
    end

    def method_missing(mid, *args) # ref. ostruct.rb
      mname = mid.id2name

      return self[mname] if args.empty? # get

      if args.length == 1 && /=\Z/ =~ mname # put
	self[mname.chop] = args.shift
	return
      end

      raise "error"
    end

    def to_er
      en = EntityReferenceEncoder.new
      en.to_er(self)
    end

    def each_feature
      cd = ChiseDB.instance
      cd.each_feature_name {|f|
	feature = cd.get_feature(f)
	begin
	  v = feature.get_value(@char_id)
	  next if v.nil?
	  yield(f, v)
	ensure
	  feature.close # important
	end
      }
    end

    def hash_feature
      h = {}
      each_feature {|k, v|
	h[k] = v
      }
      h
    end

    private

    def get_feature(f)
      cd = ChiseDB.instance
      cd.load_feature(@char_id, f)
    end

    def normalize_feature_name(a)
      a = a.gsub(/_/, "-") #underlineは-に置換
      a = a.sub(/-at-/,    "@")
      a = a.sub(/-plus-/,  "+")
      a = a.sub(/\Amap-/,  "=>")
      a = a.sub(/\Ato-/,   "->")
      a = a.sub(/\Afrom-/, "<-")
      a
    end

  end
end
