# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "singleton"
require "net/http"
require "uri"
require "chise"
require "chise/network"
require "chise/kanjilist"

class KageServer
  include Singleton

  TYPES = %w(skeleton mincho gothic)
  SKELETON = 0
  MINCHO = 1
  GOTHIC = 2
  URL  = "http://192.168.2.60:5100/"

  def initialize(url=URL)
    @url = url
    @glyphs = []
    @use_cache = true # retriev from cache.  default.
    # @offline = false
    @offline = true # for test
    c = Config.instance
    @cache_dir = c.base_dir+"/cache_kage"
    Dir.mkdir(@cache_dir) unless FileTest.directory?(@cache_dir)
  end
  attr_accessor :url, :use_cache, :offline

  def filename(num, type=SKELETON)
    sprintf("u%04x.%s", num, TYPES[type])
  end

  def cache_file(num, type=SKELETON)
    @cache_dir+"/"+filename(num, type)+".svg"
  end

  def list_cache
    ar = []
    Dir.chdir(@cache_dir)
    Dir.glob("*.svg").each {|file|
      if file =~ /^u([0-9a-fA-F]+).skeleton.svg$/
	code = $1.hex
	ar << code
      end
    }
    ar
  end

  def get(num, type=SKELETON)
    if FileTest.exist?(cache_file(num, type))
      return open(cache_file(num, type)) {|f| f.read }
    end
    svg = get_http(num, type)
    svg
  end

  def get_http(num, type=SKELETON)
    return nil if @offline

    uri = URI.parse(URL + filename(num, type))
    p ["uri", uri.to_s]

    Net::HTTP.version_1_1   # declear to use 1.1 features.
    Net::HTTP.start( uri.host, uri.port ) {|http|
      response, body = http.get("/"+filename(num, type)+".svg")
      if body
	if error?(body)
#	  p ["error", uri.to_s]
	  return nil
	else
	  store_cache(num, type, body)
	  return body
	end
      end
    }
    nil
  end

  def store_cache(num, type, svg)
    #p ["store", num]
    open(cache_file(num, type), "w") {|f|
      f.print svg
    }
  end

  def error?(svg)
    (svg =~ /<!-- error -->/)
  end

  def read_list
    h = {}
    open("kage-list.txt"){|f|
      while line = f.gets
	if line =~ /u([0-9a-f]+)\.skeleton/
	  code = $1
	  num = code.hex
	  error = false
	  error = true if line =~ /error/
	  h[num] = error
	end
      end
    }
    return h
  end

  def get_all
    #error_h = read_list
    STDOUT.binmode
    @kn = KanjiNetwork.new
    @kl = KanjiList.instance
    #list = @kl.awase(0)
    #list = @kl.awase(1)
    #list = @kl.joyo
    #list = open("../../jis.txt").read
    list = @kl.jisx0208()
    @kn.make_network(list)
    nodes, edges = @kn.nodes_and_edges
    ar = []
    nodes.each {|ch|
      char = ch.char
      num = char.to_i
      next if 0xffff < num
      next if num == 0x3561
      next if num == 0x4fdb
      next if num == 0x58d1
      next if num == 0x891d
      next if num == 0x8902
      next if num < 0x8900
      ar << num
    }
    get_ar(ar)
  end

  def get_ar(ar)
    ar.each {|num| #intの数列
      char = Character.get(num)
      ch = char.to_s
      er = char.to_er
      #TYPES.each_with_index {|type, index|
      #(0..2).each {|index|
      (0..0).each {|index|
	result = get(num, index) #cacheに保存するべしと。
	next if result
	err = "error"
	print "#{er}	#{ch}	#{err}\n"
      }
    }
  end

  def test_kanji
    char = "&CDP-8BA5;".de_er
    #p char.inspect_all
    #str = (char.to_s+"真")
    str = (char.to_s+"直")
    p str.find
  end
end

if $0 == __FILE__
  ks = KageServer.instance
  #print ks.get(0x4e03)
  ks.get_all
end
