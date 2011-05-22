#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

$LOAD_PATH.unshift("..")
require "test/unit"
require "chise/path"

class TestPath < Test::Unit::TestCase
  def test_path
    assert_equal("%2F", "/".path.escape.to_s)
    assert_equal("/", "%2F".path.unescape.to_s)
    assert_equal("()+!", "<>*?".path.unix_to_win.to_s)
    assert_equal("<>*?", "()+!".path.win_to_unix.to_s)
  end
end
