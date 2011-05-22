#!/usr/bin/env ruby
$LOAD_PATH << '../ruby/src'
require 'chise'
include CHISE
p "字"			#"字"
p "字".ucs		#23383
p "字".total_strokes	#6
p "字".inspect_all		#→いろいろでてくる。
p "字".ideograph_daikanwa	#6942	#大漢和番号6942である。
