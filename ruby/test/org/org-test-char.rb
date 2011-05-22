#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# by eto 2003-0112

require "common"

class TestCharacter < Test::Unit::TestCase
  def setup()
    @char = CHISE::Character.get("字") #UTF8で与えること
  end

  def test_char(char)
#    assert_equal(6, char.get_char_attribute("total_strokes"), "get total strokes by XEmacs UTF-2000 like method")
    assert_equal(6, char["total_strokes"], "get total strokes by Hash like method") if char.is_a? CHISE::Character
    assert_equal(6, char.total_strokes, "get total strokes by method")
    assert_equal(23383, char.ucs, "translate to ucs")
    assert_equal(22358, char.gb2312, "get character code in chinese GB2312")
    assert_equal(1777, char.shinjigen_2, "get shinjigen 2")
    assert_equal(3, char.ideographic_strokes, "get")
    assert_equal(39, char.ideographic_radical, "get")
  end

  def test_chars
    test_char(CHISE::Character.get("字"))
    test_char(CHISE::Character.new("字"))
    test_char("字".char)
    test_char("字")
  end

#  def test_create
#    assert_equal(23383, CHISE::Character.parse_char_id("字"))
#  end

  def test_put_attributes
    @char.put_char_attribute("test_attribute", "test")
    assert_equal("test", @char.get_char_attribute("test_attribute"), "put, get")
    @char["test_attribute"] = "test"
    assert_equal("test", @char["test_attribute"], "[]=, []")
  end

  def test_method
    assert_instance_of(Hash, @char.char_attribute_alist, "returns Hash")
    assert_instance_of(Hash, @char.alist, ".alist returns Hash")
    assert_instance_of(Array, @char.char_attribute_list, "returns Array")
    assert_instance_of(Array, @char.list, ".list returns Array")
    assert_instance_of(String, @char.inspect)
  end

  def test_er
    assert_equal(@char, CHISE::Character.get("&J90-3B7A;"), "jisx0208") #まだ継承関係を実装していない。
#    assert_equal("&J90-3B7A;", @char.to_er, "jisx0208")
    assert_equal(@char, CHISE::Character.get("&MCS-00005B57;"), "mcs")
    assert_equal(@char, CHISE::Character.get("&M-06942;"), "ideograph-daikanwa, Morohashi")
  end

  def test_latin
    char = CHISE::Character.get("A")
    assert_equal(65, char.ascii, "ascii")
    assert_equal(char.bidi_category, "L", "bidi")
    assert_equal(char.name, "LATIN CAPITAL LETTER A", "name")
    assert_equal(65, char.ucs, "ucs")
    assert_equal(char.latin_jisx0201, 65, "jisx0201")
    assert_equal(char.latin_viscii, 65, "viscii") #って何?
#->fullwidth: (((name . "FULLWIDTH LATIN CAPITAL LETTER A") (ucs . 65313)))
#->lowercase: (((name . "LATIN SMALL LETTER A") (ucs . 97)))
#general-category: (letter uppercase)
#このへんのS式の展開が必要なものは、また後程扱うべし。
  end

  def test_ids
    char = CHISE::Character.get("⿰")
    assert_equal("IDEOGRAPHIC DESCRIPTION CHARACTER LEFT TO RIGHT", char.name, "ids name")
    #assert_equal(char.to_er, "&U+2FF0;", "ids er")
    assert_equal(char.to_er, "&#x2ff0;", "ids er")
    assert_equal(char.bidi_category, "ON", "ids bidi")
  end

  def test_jis
    char = CHISE::Character.get("逢")
    assert_instance_of(String, char.get_attributes)
    char = CHISE::Character.get("学")
    assert_instance_of(String, char.get_attributes)
  end

  def test_flyweight
    char1 = CHISE::Character.new("字")
    char2 = CHISE::Character.new("字") #.newで生成した場合は別々のinstanceになるのだ
    assert_equal(char1, char2) #==ではある
    assert_not_same(char1, char2) #equal?かというと違う

    cf = CHISE::CharacterFactory.instance
    char1 = cf.get("字")
    char2 = cf.get("字")
    assert_equal(char1, char2, "factory") #==である
    assert_same(char1, char2, "factory") #かつ同じinstanceであることが保証される

    char1 = CHISE::Character.get("字") #Character.newの代りにCharacter.getを使うとCharacterFactoryを使ったのと同じ効果がある。
    char2 = CHISE::Character.get("字")
    assert_equal(char1, char2) #==である
    assert_same(char1, char2) #かつ同じinstanceであることが保証される
  end

  def p_er(er)
    p er.de_er.char.inspect_all
  end

  def nu_test_has_attribute
    assert("&J90-4833;".de_er.char.has_attribute?) #罪
    assert(! "&MCS-00E06E9B;;".de_er.char.has_attribute?) #罪のisolated character, attributeを持ってない
    assert("&C1-602E;".de_er.char.has_attribute?) #渡
    assert("&J90-454F;".de_er.char.has_attribute?) #渡
    p_er("&C1-602E;") #渡
    p_er("&J90-454F;")
    p_er("&J83-4D63;") #翼
    p_er("&J90-4D63;")
    p_er("&J83-3958;") #購
    p_er("&J90-3958;")
  end

  def test_read_ucs
    assert_equal("字", "&U5B57;".de_er)
    assert_equal("字", "&U-5B57;".de_er)
    assert_equal("字", "&U+5B57;".de_er)
    assert_equal("字", "&#x5B57;".de_er)
  end

  def test_alias
    assert_raises(NameError, message=""){
      t = "字字".ucs
    }
    assert_equal(23383, "字".ucs)
    assert_equal(0x5B57, "字".ucs)
    assert_equal(0x5B57, @char.ucs)

    assert_equal(0xfa55, "突".char["=>ucs@jis"])
    assert_equal(0xfa55, "突".map_ucs_at_jis)

    char1 = CHISE::Character.get("23383")
    char2 = CHISE::Character.get(23383)
    assert_equal(char1, char2)

    char1 = CHISE::Character.get("2")
    char2 = CHISE::Character.get(2)
    assert_not_equal(char1, char2)

    assert_equal("(((name . \"FULLWIDTH DIGIT ONE\") (=ucs . 65297)))", "1".char["->fullwidth"])
    assert_equal("(((name . \"FULLWIDTH DIGIT ONE\") (=ucs . 65297)))", "1".char.to_fullwidth)
    assert_equal("(((name . \"DIGIT ONE\") (=ucs . 49)))", "１".char["<-fullwidth"])
    assert_equal("(((name . \"DIGIT ONE\") (=ucs . 49)))", "１".char.from_fullwidth)
  end
end

#===== PRINT_ALL [字] MCS-00005B57 &J90-3B7A; =====
#chinese-gb2312: 0x5756
#chinese-isoir165: 0x5756
#korean-ksc5601: 0x6D2E
#ucs: 0x5B57
#chinese-cns11643-1: 0x4773
#chinese-big5: 0xA672

#  test_print(CHISE::Character.get("&CDP-8B42;"))
#  test_print(CHISE::Character.get("&I-CDP-8AF6;"))
#===== PRINT_ALL [舛] MCS-00ECA524 &K0-743F; =====
