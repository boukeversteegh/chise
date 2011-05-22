#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestString < Test::Unit::TestCase
  def test_string
    # test_utf8
    assert_equal(true,  "字".is_a_utf8?)
    assert_equal(false, "字字".is_a_utf8?)
    assert_raises(RuntimeError){ "字字".char }
    assert_raises(RuntimeError){ "字字".ucs }

    # test_feature
    assert_equal(25991, "文".ucs)
    assert_equal(23383, "字".ucs)
  end

  def test_er
    assert_equal("字", CHISE::Character.get("&J90-3B7A;").to_s)
    assert_equal("字", "字".de_er) # no effect
    assert_equal("字", "&J90-3B7A;".de_er)
    assert_equal("文字列", "文&J90-3B7A;列".de_er)
    assert_equal("文字列", "文&M-06942;列".de_er)
    assert_equal("文字列", "文&MCS-00005B57;列".de_er)
    assert_equal("文字列", "文&U-5B57;列".de_er)
    assert_equal("文字列", "文&U+5B57;列".de_er)
    assert_raises(RuntimeError){ "文&nosucher;列".de_er }
  end

  def test_de_er_ccs
    assert_equal("\346\270\241", "&C1-602E;".de_er) # 渡
    assert_equal("\370\273\222\237\215", "&C1-6030;".de_er) # unknown
    # test_hanziku
    assert_equal("\360\240\210\264", "&HZK01-C947;".de_er)
#    assert_equal(1644203214, "&CDP-8CCE;".de_er)
#    assert_equal(1644202927, "&CDP-8BAF;".de_er)
  end

  def test_characters
    assert_equal(["文","字","列"], "文字列".to_a)
    ar = []
    "文字列".each_char {|char| ar << char }
    assert_equal(["文","字","列"], ar)

    # test_map
    str = "文字列".map_char {|ch|
      ch+ch
    }
    assert_equal("文文字字列列", str)
  end
end
