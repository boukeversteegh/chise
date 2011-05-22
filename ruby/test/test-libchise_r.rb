#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestLibChise_R < Test::Unit::TestCase
  include CHISE::ChiseValue

  def test_parse_c_string
    u8 = "字"
    assert_equal(23383,	parse_c_string("?"+u8))
    assert_equal(0,	parse_c_string("?\\^@"))
    assert_equal(9,	parse_c_string("?\t"))
    assert_equal(10,	parse_c_string("?\n"))
    assert_equal(13,	parse_c_string("?\r"))
    assert_equal(94,	parse_c_string("?^\\"))
    assert_equal(31,	parse_c_string("?\\^_"))
    assert_equal(32,	parse_c_string("?\\ "))
    assert_equal(34,	parse_c_string("?\\\""))
    assert_equal(126,	parse_c_string("?~"))
    assert_equal(127,	parse_c_string("?\\^?\000"))
    assert_equal(131,	parse_c_string("?\\^\303\237"))
    assert_equal(0x7FF,	parse_c_string("?\337\277"))
    assert_equal(0xFFFF,	parse_c_string("?\357\277\277"))
    assert_equal(0x1FFFFF,	parse_c_string("?\367\277\277\277"))
    assert_equal(0x3FFFFFF,	parse_c_string("?\373\277\277\277\277"))
    assert_equal(0xFFFFFFF,	parse_c_string("?\374\217\277\277\277\277"))
    assert_raise(RuntimeError) { parse_c_string("nosuch") }
  end

  def test_format_char_id
    u8 = "字"
    assert_equal("?\345\255\227",	format_char_id(23383))
    assert_equal("?"+u8,		format_char_id(23383))
    assert_equal("?\\^@",	format_char_id(0))
    assert_equal("?\t",		format_char_id(?\t))
    assert_equal("?\n",		format_char_id(?\n))
    assert_equal("?\r",		format_char_id(?\r))
    assert_equal("?^\\",	format_char_id(0x1C))
    assert_equal("?\\^_",	format_char_id(0x1F))
    assert_equal("?\\ ",	format_char_id(?\s))
    assert_equal("?\\\"",	format_char_id(?\"))
    assert_equal("?~",		format_char_id(0x7E))
    assert_equal("?\\^?\000",	format_char_id(0x7F))
    assert_equal("?\\^\303\237",	format_char_id(0x9F))
    assert_equal("?\337\277",	format_char_id(0x7FF))
    assert_equal("?\357\277\277",	format_char_id(0xFFFF))
    assert_equal("?\367\277\277\277",	format_char_id(0x1FFFFF))
    assert_equal("?\373\277\277\277\277",	format_char_id(0x3FFFFFF))
    assert_equal("?\374\217\277\277\277\277",	format_char_id(0xFFFFFFF))
  end
end
