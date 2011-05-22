#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestString < Test::Unit::TestCase
  def test_method

#    assert_equal("<文,C1-4546>", "文".inspect_x)
#    assert_equal("<字,J90-3B7A>", "字".inspect_x)
#    assert_equal("<列,J90-4E73>", "列".inspect_x)
#    assert_equal("<文,C1-4546><字,J90-3B7A><列,J90-4E73>", "文字列".inspect_x)

    ins = "字".inspect_all
#    assert_match(/^<字,J90-3B7A,/, ins)
    assert_match(/^<字,#x5b57,/, ins)
    assert_match(/=big5:42610/, ins)
    assert_match(/=cns11643-1:18291/, ins)
    assert_match(/=gb2312:22358/, ins)
    assert_match(/=daikanwa:6942/, ins)
    assert_match(/ideographic-radical:39/, ins)
    assert_match(/ideographic-strokes:3/, ins)
    assert_match(/=ks-x1001:27950/, ins)
    assert_match(/shinjigen-2:1777/, ins)
    assert_match(/total-strokes:6/, ins)
    assert_match(/=ucs:23383/, ins)
    assert_match(/=gt:8734/, ins)
    assert_match(/=gt-k:1624/, ins)
    assert_match(/=gt-pj-1:15226/, ins)
    assert_match(/=jis-x0208:15226/, ins)
  end
end
