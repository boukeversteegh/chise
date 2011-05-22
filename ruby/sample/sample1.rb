#!/usr/bin/env ruby

$LOAD_PATH.unshift("..")
require "chise"

str = "字"		# Stringを拡張している．UTF8で与える．
p str.ucs		# その文字のucsの値が表示される．
p str.total_strokes	# 画数が表示される．
p str.gb2312		# などなど．
str.each_feature {|f, v|	# 全素性を表示する．
  print f, ": ", v, "\n"
}
