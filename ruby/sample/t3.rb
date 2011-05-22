#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"
p "⿰木木".compose
p "⿱木⿰木木".de_er.compose
