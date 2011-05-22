#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"
p "字".decompose	# "+宀子"
p "榊".decompose
p "榊".decompose_all
p "鬱".decompose	# "木缶木冖鬯彡"
p "鬱".decompose_all	# 再帰的分解
p "終了".decompose
p "終了".decompose_all
