#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# This file is in SJIS charset.  Japanese Character -> Š¿Žš.

require "common"

class TestIconv < Test::Unit::TestCase
  def test_original_iconv
    u8 = "Žš".sjistou8
    s = Iconv.iconv_to_from("UTF-16", "UTF-8", u8)
#    assert_equal("\376\377\x5b\x57", s) #  \376\377 -> Byte Order Mark?
    s = Iconv.iconv_to_from("UTF-32", "UTF-8", u8)
#    assert_equal("\0\0\376\377\0\0[W", s)
  end

  def test_iconv
    u8 = "Žš".sjistou8 # U+5B57 (0x8E9A): CJK Unified Ideograph
    assert_equal("\345\255\227", u8)
    assert_equal("\x8e\x9a", u8.u8tosjis)
    assert_equal("\273\372", u8.u8toeuc)
    assert_equal("\e$B;z\e(B", u8.u8tojis)
    assert_equal(u8, u8.u8tosjis.sjistou8)
    assert_equal(u8, u8.u8toeuc.euctou8)
    assert_equal(u8, u8.u8tojis.jistou8)
    u16 = "\x5b\x57" # "[W"
#    assert_equal(u16, u8.u8tou16)
    u32 = "\0\0[W"
#    assert_equal(u32, u8.u8tou32)
#    assert_equal(u8, u32.u32tou8)
#    assert_equal("[W", u32.u32tou16)
#    assert_equal("\273\372", u16.u16toeuc)
#    assert_equal("\216\232", u16.u16tosjis)
#    assert_equal(23383, u32.u32to_i)
#    assert_equal(23383, u8.u8to_i)

#    assert_equal(u32, CHISE.i_tou32(23383))
#    assert_equal(u8, CHISE.i_tou8(23383))

    u8 = "Š¿Žš".sjistou8
    assert_equal("\346\274\242\345\255\227", u8)
    assert_equal("\212\277\x8e\x9a", u8.u8tosjis)
    assert_equal("\264\301\273\372", u8.u8toeuc)
    assert_equal("\e$B4A;z\e(B", u8.u8tojis)
    u16 = "o\"[W"
#    assert_equal(u16, u8.u8tou16)
    u32 = "\0\0o\"\0\0[W"
#    assert_equal(u32, u8.u8tou32)
#    assert_equal(u8, u32.u32tou8)
#    assert_equal("o\"[W", u32.u32tou16)
#    assert_equal("\264\301\273\372", u16.u16toeuc)
#    assert_equal("\212\277\216\232", u16.u16tosjis)
  end
end
