#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"
p "字"			# "字"
p "字".ucs		# 23383
p "字".daikanwa		# 6942（大漢和番号）
p "字".total_strokes	# 6
p "字".inspect_all	# 保有する素性情報を全て出力する
