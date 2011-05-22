#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# by eto 2003-0112

require "common"

class TestIDS < Test::Unit::TestCase
  def test_compose_exact #正確に一致するIDSを検知する
    assert_equal("榊", "榊".decompose.compose)
    assert_equal("壱", "壱".decompose.compose)
    assert_equal("⿰木木", "林".decompose)
    assert_equal("林", "⿰木木".compose)
    assert_equal("林", "林".decompose.compose)
    assert_equal("⿰木木", "⿰木木".compose.decompose)
    assert_equal("林".ucs, "⿰木木".compose.ucs)
  end

  def test_glyph_decompose
    assert_equal("音", "音".decompose)
#    assert_equal(IDC_AB+"立日", "音".glyph_decompose)
    assert_equal(IDC_FLL, "世".decompose.first_char)
    assert_equal("世", "世".glyph_decompose)
  end

  def test_compose_part()
#    p de.compose_ar
#    p "神".compose_ar
#    p "木".compose_ar.join
  end

  def test_aggregate()
#    db = IDS_DB.instance
#    db.list_aggregate
  end

  def test_ids_error()
#    p "実".char.inspect_all
#    p "実".char.ids
#    assert_equal("contains ques", "実".char.ids_error)
#    assert_equal("unmatch leaves", "実".char.ids_error)
#    p CharDB.instance.get("ascii").keys
#    p CharDB.instance.get("no-such-attribute").keys
#    p CharDB.instance.get("ids-error").keys
  end

end
