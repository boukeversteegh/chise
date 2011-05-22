# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

$VERBOSE = true
$KCODE = "u"

# $debug = false # for test
# $debug = true  # for test
# $stdout.binmode if $debug
# $stdout.sync = true if $debug

$LOAD_PATH.unshift("..")
$LOAD_PATH.unshift("../ext")
require "test/unit"
require "chise/libchise"
require "chise/char"
require "chise/qp"

class String
  alias su sjistou8
end
