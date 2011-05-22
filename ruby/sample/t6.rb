#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"

(0x2ff0..0x2ffb).each {|i|
  char = CHISE::Character.get(i)
  p [char.name, char]
}
