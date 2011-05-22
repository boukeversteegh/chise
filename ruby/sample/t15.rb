#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"

puts "鬼".find.split(//u).sort.join
exit

#str = "門火"
str = "木"
p str.find
str.find.each_character{|c|
  puts c.ids
  puts c.inspect_all
}

#p "日雲".find.inspect_all
#p "木缶".find.inspect_all
