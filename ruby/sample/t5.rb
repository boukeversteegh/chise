#!/usr/bin/env ruby
$KCODE = "u"
$LOAD_PATH.unshift("..")
require "chise/char"

ki = "��".sjistou8
res = (("\xE2\xBF\xB0"+ki+ki).compose)
puts res.u8tosjis
