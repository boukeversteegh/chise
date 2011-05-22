#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"

p "日雲".find
"日雲".find.each_character{|c|
  puts c.ids
}

#p "日雲".find.inspect_all
#p "木缶".find.inspect_all
