#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"
require "chise/utf8"

class TestUtf8 < Test::Unit::TestCase
  include CHISE::UTF8Value
  def test_utf8
    u8 = "字" # U+5B57 (0x8E9A): CJK Unified Ideograph
    assert_equal(23383, u8toi(u8))
    assert_equal(u8, itou8(23383))
    assert_equal("\375\242\200\210\263\216", itou8(1644203214))
    assert_equal(1644203214, u8toi("\375\242\200\210\263\216"))
  end
end
