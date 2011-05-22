# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "chise/character"
require "chise/parser"
require "chise/ids"

class String
  include CHISE::StringIDS

  # copied from htree/encoder.rb
  UTF8_RE = /\A(?:
        [\x00-\x7f]
       |[\xc0-\xdf][\x80-\xbf]
       |[\xe0-\xef][\x80-\xbf][\x80-\xbf]
       |[\xf0-\xf7][\x80-\xbf][\x80-\xbf][\x80-\xbf]
       |[\xf8-\xfb][\x80-\xbf][\x80-\xbf][\x80-\xbf][\x80-\xbf]
       |[\xfc-\xfd][\x80-\xbf][\x80-\xbf][\x80-\xbf][\x80-\xbf][\x80-\xbf])\Z/nx

  def is_a_utf8? # Is this string one character in UTF-8?
    (UTF8_RE =~ self) != nil
  end

  def char
    raise unless is_a_utf8?
    CHISE::Character.get("?"+self)
  end

  def method_missing(mid, *args, &block)
    #char.method_missing(mid, *args)
    char.send(mid, *args, &block)
  end

  def to_a
    self.split(//u)
  end

  def char_length
    to_a.length
  end

  def each_char
    to_a.each {|c|
      yield(c)
    }
  end

  def map_char
    to_a.map {|c|
      yield(c).to_s
    }.join
  end

  def each_character
    to_a.each {|ch|
      yield ch.char
    }
  end

  def map_character
    to_a.map {|ch|
#      next nil if c.nil?
      yield(ch.char).to_s
    }.join
  end

  def de_er()
    pa = CHISE::EntityReferenceParser.new
    pa.de_er(self)
  end
end
