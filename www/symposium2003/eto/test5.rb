#!/usr/bin/env ruby
$LOAD_PATH << '../ruby/src'
require 'chise'
include CHISE
p "字".decompose		#"⿱宀子"	#分解する
p "⿱宀子".compose		#"字"	#合成する
p "鬱".decompose		#"木缶木冖鬯彡"	#難しい字も分解できます。
p "鬱".decompose_all		#これ以上分解できないところまで再帰的に分解する。
p "木缶".find		#二つの部品を含む漢字をリストアップする。
p "木缶".find.map_ucs	#二つの部品を含む漢字をリストアップする。
