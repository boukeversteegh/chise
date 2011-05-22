#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestCharacter < Test::Unit::TestCase
  def test_method
    @char = CHISE::Character.get("字") #UTF8で与えること
    assert_instance_of(Hash, @char.char_attribute_alist)
    assert_instance_of(Hash, @char.alist)
    assert_instance_of(Array, @char.char_attribute_list)
    assert_instance_of(Array, @char.list)
    assert_instance_of(String, @char.inspect)
  end

  def test_jis
    char = CHISE::Character.get("逢")
    assert_instance_of(String, char.get_attributes)
    char = CHISE::Character.get("学")
    assert_instance_of(String, char.get_attributes)
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
