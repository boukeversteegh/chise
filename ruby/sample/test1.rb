#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"

str = "字" #Stringを拡張している。UTF8で与えること。
p str.ucs #とすると、その文字のucsの値が表示される
p str.total_strokes #画数が表示される
p str.chinese_gb2312 #などなど
str.char.alist.each {|a, v| #こんな感じで全属性を表示できる
  print a, ": ", v, "\n"
}
p str.inspect_x #Characterについての情報が表示される。
p str.inspect_all #持っている属性情報を全て表示する。

str = "文字列" #もちろん一文字でなく文字列も扱える。UTF-8で与える。
p str.inspect_x #各文字の情報が表示される。
p str.inspect_all #各文字の属性情報を全て表示する。
