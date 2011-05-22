#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"
require "chise/kanjilist"

def atom_list(list)
  list.map_character {|char|
    char.decompose.char_length == 1 ? char.decompose : ""
  }
end

puts atom_list(CHISE::KanjiList::JOYO_KANJI_LIST)
puts atom_list(CHISE::KanjiList::JISX0208_KANJI_LIST)
