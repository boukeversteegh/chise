#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"
require "chise/kanjilist"

def atom_list(list)
  list.map_character {|char|
    d = yield(char)
    d.char_length == 1 ? d : ""
  }
end

def check_list(list)
  d = atom_list(list){|char| char.decompose_by_meaning }
  g = atom_list(list){|char| char.decompose }
  da = d.to_a
  ga = g.to_a
  wa = da & ga
  dd = (da - wa).join("")
  gg = (ga - wa).join("")
  puts "意味で分解できない文字: "+d, "これだけに含まれる文字: "+dd
  puts   "形で分解できない文字: "+g, "これだけに含まれる文字: "+gg
end

puts "常用漢字を調べます。"
check_list(CHISE::KanjiList::JOYO_KANJI_LIST)
puts "JIS X 0208漢字集合を調べます。"
check_list(CHISE::KanjiList::JISX0208_KANJI_LIST)
