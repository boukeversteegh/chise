#!/usr/bin/env ruby

$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise"

def test1
p "字"			# "字"
p "字".ucs		# 23383
p "字".total_strokes	# 6
p "字".inspect_all	# 保有する素性情報を全て出力する
p "字".daikanwa		# 6942（大漢和番号）
end

def test2
p "字字".ucs		# 例外
end

def test3
char = "字".char	# Character classのインスタンスを生成
char = CHISE::Character.get("?字")	# 上記とまったく同じ
end

def test4
# 数値参照化する
p "字". to_er		# "&#x5b57;"     

#数値参照を復号
p "&#x5b57;".de_er	# "字"

# JIS X 0208-1990 による実体参照を復号
p "&J90-3B7A;".de_er

# 大漢和番号による実体参照を復号
p "&M-06942;".de_er
end

def test5
  str = "文字列"
  str.each_character{|c|
    p c
  }
  str2 = str.map_character{|c|
    c.to_er
  }
  p str2
  p str.char_length
  #p str.to_er
  p str2.de_er
end

def test6
"木".mydepth = 1
"林".mydepth = 2
"森".mydepth = 3
end

def test7
p "木".mydepth
p "林".mydepth
p "森".mydepth
end

def test8
p "字".decompose
p "字".decompose_all
p "榊".decompose
p "榊".decompose_all
p "終了".decompose
p "終了".decompose_all
p "鬱".decompose
p "鬱".decompose_all
end

def test9
p "#x2ff0;木木".compose
end

def test10
p "日雲".find
end

test1
#test2
test3
test4
test5
test6
test7
test8
test9
test10
