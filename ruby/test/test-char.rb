#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestCharacter < Test::Unit::TestCase
  def test_equality
    c1 = "字".char # flyweight pattern
    c2 = CHISE::Character.get("?字")
    assert_equal(c1, c2) # equal
    assert_same(c1, c2)  # same instance
    c3 = CHISE::Character.new(0x5b57)
    assert_not_equal(c1, c3) # not equal
    assert_not_same(c1, c3)  # not same instance
    assert_equal(c1.char_id, c3.char_id)
  end

  def test_char
    char = "字".char
    assert_equal(23383,	char["=ucs"])
    assert_equal(23383,	char["ucs"])
    assert_equal(23383,	char.ucs)
    assert_equal(22358,	char.gb2312)
    assert_equal(6,	char.total_strokes)
    assert_equal(3,	char.ideographic_strokes)
    assert_equal(39,	char.ideographic_radical)
    assert_equal(nil,	char.nosuchfeature)
    assert_raise(RuntimeError){ char.nosuchmethod(0) }
  end

  def test_each
    "字".each_feature {|f, v|
      #qp f, v
      assert_instance_of(String, f)
    }

    h = "字".hash_feature
    assert_instance_of(Hash, h)
  end

  def test_bignum
    char = CHISE::Character.get(1644203214)
    assert_equal("\375\242\200\210\263\216",	char.to_s)
  end

  def test_latin
    char = "A".char
    assert_equal(65, char.ascii)
    assert_equal(65, char.ucs)
    assert_equal(65, char.latin_jisx0201)
    assert_equal(65, char.latin_viscii)
    assert_equal("L", char.bidi_category)
    #assert_equal("LATIN CAPITAL LETTER A", char.name)
  end

  def test_to_er
    assert_equal("&#x5b57;",	"字".char.to_er)
    assert_equal("&#x5b57;",	"&M-06942;".de_er.char.to_er)
    assert_equal("&#x2166b;",	"&M-06000;".de_er.char.to_er)
  end

  def test_alias
    assert_equal("DIGIT ONE", "1".name)
    assert_equal("DIGIT ONE", "1".char.name)
    assert_equal("DIGIT ONE", "1".char["name"])
    assert_equal("(((name . \"FULLWIDTH DIGIT ONE\") (=ucs . 65297)))", "1".char["->fullwidth"])
    assert_equal("(((name . \"FULLWIDTH DIGIT ONE\") (=ucs . 65297)))", "1".to_fullwidth)
    assert_equal("(((name . \"DIGIT ONE\") (=ucs . 49)))", "１".char["<-fullwidth"])
    assert_equal("(((name . \"DIGIT ONE\") (=ucs . 49)))", "１".from_fullwidth)
#   assert_equal(0xfa55, "突".map_ucs_at_jis)
#   assert_equal(0xfa55, "突".char["=>ucs@jis"])
  end

  def test_put
    char = "字".char
    #qp char.test_feature
    char.test_feature = "test1"
    assert_equal("test1", char.test_feature)
    #qp char.test_feature
    char.test_feature = "test2"
    assert_equal("test2", char.test_feature)
  end
end
