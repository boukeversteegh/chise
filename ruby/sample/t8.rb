#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"
require "chise/kanjilist"

[CHISE::IDC_0, CHISE::IDC_1, CHISE::IDC_2, CHISE::IDC_3, CHISE::IDC_4, CHISE::IDC_5, CHISE::IDC_6, CHISE::IDC_7, CHISE::IDC_8, CHISE::IDC_9, CHISE::IDC_A, CHISE::IDC_B].each {|idc|
  p idc
  CHISE::KanjiList::JOYO_KANJI_LIST.each_character {|char|
    d = char.decompose
    p [char, d] if d.include?(idc)
  }
}
