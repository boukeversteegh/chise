#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestParser < Test::Unit::TestCase
  def setup
    @pa = CHISE::CharacterParser.new
  end

  def test_parse
    assert_raise(RuntimeError){ @pa.parse(nil) }
    assert_equal(65, @pa.parse(0x41))
    assert_raise(RuntimeError){ @pa.parse(Object.new) }
    assert_equal(65, @pa.parse("65"))
    assert_equal(20175, @pa.parse("?\344\273\217"))
    assert_raise(RuntimeError){ @pa.parse("nosuchcharacter") }
    assert_raise(RuntimeError){ @pa.parse("\344\273\217") }
  end

  def test_parse_er
    assert_equal(true, @pa.contain_er?("&#x41;"))
    assert_equal(true, @pa.contain_er?("This is &#x41; er."))
    assert_equal(true, @pa.is_er?("&#x41;"))
    assert_equal(false, @pa.is_er?("This is &#x41; er."))
    assert_equal(0xe001, @pa.parse("&my-1;"))
    assert_raise(RuntimeError){ @pa.parse_er("&nosucher;") }
    assert_raise(RuntimeError){ @pa.parse_er("nosucher") }

    assert_equal(23383, @pa.parse("&MCS-00005B57;"))
    assert_equal(23383, @pa.parse("&U5B57;"))
    assert_equal(23383, @pa.parse("&U-5B57;"))
    assert_equal(23383, @pa.parse("&U+5B57;"))
    assert_equal(23383, @pa.parse("&#x5B57;"))
    assert_equal(23383, @pa.parse("&#23383;"))
  end

  def test_parse_ccs
    assert_equal(23383, @pa.parse("&J90-3B7A;"))
    assert_equal(23383, @pa.parse("&I-J90-3B7A;"))
    assert_equal(23383, @pa.parse("&MCS-00005B57;"))
    assert_equal(23383, @pa.parse("&M-06942;"))
  end

  def test_comples_ccs
    assert_equal(28193, @pa.parse("&C1-602E;")) # 渡
    assert_equal(15542221, @pa.parse("&C1-6030;")) # unknown

    # test_ccs_etc
    assert_equal(131636, @pa.parse("&HZK01-C947;")) # =hanziku-1
    assert_equal(1644203214, @pa.parse("&CDP-8CCE;")) # CDP
    assert_equal(1644202927, @pa.parse("&CDP-8BAF;"))
    assert_equal(1644210346, @pa.parse("&B-A8AA;")) # =big5
#    assert_equal(1644202869, @pa.parse("&RUI6-E00E;")) # =ruimoku-v6
    assert_equal(15225021, @pa.parse("&JC3-50BD;")) # =jef-china3
    assert_equal(1644202692, @pa.parse("&CB00008;"))
#    assert_equal(14820071, @pa.parse("&CB08935;"))
  end

  def test_de_er
    @pa = CHISE::EntityReferenceParser.new
    assert_equal("This is A.", @pa.de_er("This is &#x41;."))
    assert_equal("A\345\255\227B", @pa.de_er("A&U5B57;B"))
    assert_equal("A\345\255\227B", @pa.de_er("A&J90-3B7A;B"))
  end
end
