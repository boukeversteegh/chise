#!/usr/bin/env ruby
$LOAD_PATH << '../ruby/src'
require 'chise'
require 'kanjilist'
include CHISE

h = Hash.new(0)
KanjiList.instance.jisx0208.each_character {|char|
  ids = char.decompose
  if ids.nil? || ids.char_length < 2
    h['element'] += 1
  else
    idc = ids.char_at(0)
    h[idc] += 1
  end
}
p h.to_a.sort
