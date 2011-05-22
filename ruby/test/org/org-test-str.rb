#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestString < Test::Unit::TestCase
  def setup
    @str = "文字列"
  end

  def test_str
    ar = []
    @str.each_char {|char| ar << char }
    assert_equal(["文","字","列"], ar)
    assert_equal(["文","字","列"], @str.to_a)
    assert_equal("文", @str.char_at(0))
    assert_equal("字", @str.char_at(1))
    assert_equal("列", @str.char_at(2))
    assert_equal(nil, @str.char_at(3))
    assert_equal("列", @str.char_at(-1))
  end

  def test_attributes
    assert_equal(23383, "字".ucs)
    assert_raises(NameError, message=""){
      assert_equal(23383, "字字".ucs) #エラーが発生する
    }
    assert_equal(25991, "文".ucs)
    assert_raises(NameError, message=""){
      assert_equal(25991, @str.ucs) #エラーが発生する
    }
  end

  def test_er
    @char = @str.char_at(1)
    assert_equal(@char, CHISE::Character.get("&J90-3B7A;").to_s, "jisx0208")
    assert_equal("字", CHISE::Character.get("&J90-3B7A;").to_s, "jisx0208")
    assert_equal("字", "&J90-3B7A;".de_er, "jisx0208")
    assert_equal("文字", "文&J90-3B7A;".de_er, "with other character, at the bottom")
    assert_equal("字文", "&J90-3B7A;文".de_er, "at the top")
    assert_equal("文字字", "文&J90-3B7A;&J90-3B7A;".de_er, "two ERs")
    assert_equal("文字文字", "文&J90-3B7A;文&J90-3B7A;".de_er, "two ERs")
    assert_equal("文字", "文&MCS-00005B57;".de_er, "mcs")
    assert_equal("文字", "文&M-06942;".de_er, "morohashi")
    assert_equal("字", "字".de_er)

    str = "文&J90-3B7A;"
    str2 = str.de_er #本体に変更無し
    assert_equal("文&J90-3B7A;", str)
    assert_equal("文字", str2)
    str3 = str.de_er! #本体が変わります
    assert_equal("文字", str)
    assert_equal("文字", str3)

    assert_equal("字", "&MCS-00005B57;".de_er)
    assert_equal("字", "&U-5B57;".de_er)
    assert_equal("字", "&U+5B57;".de_er)
#    assert_equal("", "&nosucher;".de_er)
    assert_equal("字", "&U-5b57;".de_er)
  end

  def test_method
    str = @str.map_char {|ch|
      ch+ch
    }
    assert_equal("文文字字列列", str)
    assert_equal("文字列", @str)
    str = @str.map_char! {|ch|
      ch+ch
    }
    assert_equal("文文字字列列", str)
    assert_equal("文文字字列列", @str)
    assert_equal("文文字字列列", @str)

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
