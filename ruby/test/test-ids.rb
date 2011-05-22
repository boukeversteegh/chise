#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"
require "chise/ids"

class TestIDS < Test::Unit::TestCase
  def test_idc
    char = CHISE::Character.get(0x2FF0)
    assert_equal("IDEOGRAPHIC DESCRIPTION CHARACTER LEFT TO RIGHT", char.name)
    assert_equal(char.to_er, "&#x2ff0;")
    assert_equal(char.bidi_category, "ON")

    assert_equal(true,  "⿸".is_idc?)
    assert_equal(false, "木".is_idc?)
    assert_equal(2, "⿰".idc_argument_number)
    assert_equal(2, "&U+2FF0;".de_er.idc_argument_number)
    assert_equal(2, "&U+2FF1;".de_er.idc_argument_number)
    assert_equal(3, "&U+2FF2;".de_er.idc_argument_number)
    assert_equal(3, "&U+2FF3;".de_er.idc_argument_number)

    assert_equal("⿰", "&U+2FF0;".de_er.to_s)
    assert("&U+2FF0;".de_er.is_idc?)
    assert("&U+2FFF;".de_er.is_idc?)
    #assert_match(/U\+2FF0/, "&U+2FF0;".de_er.char.inspect_x)
    #assert_match(/IDEOGRAPHIC DESCRIPTION CHARACTER LEFT TO RIGHT/, "&U+2FF0;".de_er.inspect_all)
    (0x2FF0..0x2FFB).each {|i|
      assert_match(/IDEOGRAPHIC DESCRIPTION CHARACTER/, CHISE::Character.new(i).name)
    }

    assert_match(/LEFT TO RIGHT/, "&U+2FF0;".de_er.name)
    assert_match(/ABOVE TO BELOW/, "&U+2FF1;".de_er.name)
    assert_match(/LEFT TO MIDDLE AND RIGHT/, "&U+2FF2;".de_er.name)
    assert_match(/ABOVE TO MIDDLE AND BELOW/, "&U+2FF3;".de_er.name)
    assert_match(/FULL SURROUND/, "&U+2FF4;".de_er.name)
    assert_match(/SURROUND FROM ABOVE/, "&U+2FF5;".de_er.name)
    assert_match(/SURROUND FROM BELOW/, "&U+2FF6;".de_er.name)
    assert_match(/SURROUND FROM LEFT/, "&U+2FF7;".de_er.name)
    assert_match(/SURROUND FROM UPPER LEFT/, "&U+2FF8;".de_er.name)
    assert_match(/SURROUND FROM UPPER RIGHT/, "&U+2FF9;".de_er.name)
    assert_match(/SURROUND FROM LOWER LEFT/, "&U+2FFA;".de_er.name)
    assert_match(/OVERLAID/, "&U+2FFB;".de_er.name)
  end

  def test_decompose
    assert_equal("\342\277\261\345\256\200\345\255\220", "字".ids)
    assert_equal("⿱宀子", "字".ids)
    assert_equal(CHISE::IDC_1+"宀子", "字".ids)
    assert_equal("\342\277\260\346\227\245\345\257\272", "時".ids)
    assert_equal(CHISE::IDC_0+"日寺", "時".ids)

    assert_equal("⿰木神",   "榊".ids)
    assert_equal("⿰木神",   "榊".decompose)
    assert_equal("⿰木⿰⺭申", "榊".decompose.decompose)
    assert_equal("⿰木⿰⺭申", "榊".decompose_all)

    assert_equal("⿱宀子", "字".decompose)
    assert_equal("文⿱宀子", "文字".decompose)
    assert_equal("⿰木神", "榊".decompose)

    assert_equal("⿰木神", "榊".ids_text)
    assert_equal("⿰木神", "榊".ids_org)
    assert_equal("⿰木神", "榊".ids)
    assert_equal("⿰⺭申", "神".ids_text)
    assert_equal("⿰⺭申", "神".ids_org)
    assert_equal("⿰⺭申", "神".ids)

    assert_equal("⿰⺭申", "神".decompose)

    assert_equal("⿰木⿰⺭申", "榊".decompose_all)
    assert_equal("⿳⿲木缶木冖⿰鬯彡", "鬱".decompose)

    de = "細".decompose
    assert_match(/田$/, de)  
    assert_equal(3, de.char_length)
    de = "&JX2-7577;".de_er.decompose
    de = "&CDP-8B60;".de_er.decompose
    assert_equal(1, de.char_length)
    de = "&JX2-217E;".de_er.decompose
    assert_match(/^⿰/, de)  
    assert_equal(3, de.char_length)
  end

  def test_by_ids
    cd = CHISE::ChiseDB.instance
    byidsdb = cd.get_by_ids_db("ids")
    assert_instance_of(CHISE::ByIDS_DB, byidsdb)
    assert_equal(true, byidsdb.setup_db)
    assert_equal(26519, byidsdb.decode("⿰木木"))
  end

  def test_compose
    assert_equal("⿰木木", "林".decompose)
    assert_equal("⿱木林", "森".ids)
    assert_equal("林", "⿰木木".compose)

    # test_aggregate
    assert_equal("⿱木林", "⿱木⿰木木".aggregate)
    assert_equal("森", "⿱木⿰木木".aggregate.compose)

    # test_compose
    assert_equal("林", "⿰木木".compose)
    assert_equal("森", "⿱木⿰木木".compose)
  end

  def test_find()
    #p "日雲".find #"曇"
    assert(4 <= "日雲".find .char_length) #"曇"
    #p "鬼".find
  end

  def test_idc_example
    assert_equal(CHISE::IDC_0, "林".decompose.to_a[0])
    assert_equal(CHISE::IDC_0+"木木", "林".decompose)

    assert_equal(CHISE::IDC_1, "森".decompose.to_a[0])
    assert_equal(CHISE::IDC_1+"木林", "森".decompose)
    assert_equal(CHISE::IDC_1+"火火", "炎".decompose)

    assert_equal(CHISE::IDC_2, "班".decompose.to_a[0])
    assert_equal(CHISE::IDC_2+"彳"+CHISE::IDC_1+"山王"+"攵", "徴".decompose) # meaning?

#    assert_equal(CHISE::IDC_3, "鼻".decompose.to_a[0])
#    assert_equal(CHISE::IDC_3+"自田廾", "鼻".decompose)
    assert_equal(CHISE::IDC_3+"士冖匕", "壱".decompose)
    assert_equal(CHISE::IDC_3+"穴厶心", "窓".decompose)
    assert_equal(CHISE::IDC_3+"丗冖巾", "帯".decompose)

    assert_equal(CHISE::IDC_4, "囲".decompose.to_a[0])
    assert_equal(CHISE::IDC_4+"囗井", "囲".decompose)
    assert_equal(CHISE::IDC_4+"行韋", "衛".decompose)
    assert_equal(CHISE::IDC_4+"行圭", "街".decompose)
    assert_equal(CHISE::IDC_4+"行重", "衝".decompose)
    assert_equal(CHISE::IDC_4+CHISE::IDC_1+"一凵田", "画".decompose)

    assert_equal(CHISE::IDC_5, "問".decompose.to_a[0])
    assert_equal(CHISE::IDC_5+"門口", "問".decompose)
    assert_equal(CHISE::IDC_5+"門"+CHISE::IDC_0+"豆寸", "闘".decompose)
    assert_equal(CHISE::IDC_5+"戌女", "威".decompose)
    assert_equal(CHISE::IDC_5+"茂臣", "蔵".decompose)
    assert_equal(CHISE::IDC_5+"尺旦", "昼".decompose)
#    assert_equal(CHISE::IDC_5+"冂入", "内".decompose)
    assert_equal(CHISE::IDC_5+"几丶", "凡".decompose)
#    assert_equal(CHISE::IDC_5+"几"+CHISE::IDC_1+"丿虫", "風".decompose)

    assert_equal(CHISE::IDC_6, "凶".decompose.to_a[0])
    assert_equal(CHISE::IDC_1+"止"+CHISE::IDC_6+"凵米", "歯".decompose)

    assert_equal(CHISE::IDC_7, "匠".decompose.to_a[0])
    assert_equal(CHISE::IDC_7+"匚斤", "匠".decompose)
    assert_equal(CHISE::IDC_7+"匚矢", "医".decompose)
    assert_equal(CHISE::IDC_7+"匚若", "匿".decompose)
    assert_equal(CHISE::IDC_7+"匚儿", "匹".decompose)

    assert_equal(CHISE::IDC_8, "庁".decompose.to_a[0])
    assert_equal(CHISE::IDC_8+"广丁", "庁".decompose)
    assert_equal(CHISE::IDC_8+"歹匕", "死".decompose)
    assert_equal(CHISE::IDC_8+"尹口", "君".decompose)
    assert_equal(CHISE::IDC_8+"麻鬼", "魔".decompose)
    assert_equal(CHISE::IDC_8+"府肉", "腐".decompose)
    assert_equal(CHISE::IDC_8+"麻手", "摩".decompose)
    assert_equal(CHISE::IDC_8+"虍思", "慮".decompose)
#    assert_equal(CHISE::IDC_8+"食口", "倉".decompose)
#    assert_equal(CHISE::IDC_1+"日"+CHISE::IDC_8+"耳又", "最".decompose)
#    assert_equal(CHISE::IDC_8+"手目", "看".decompose) # meaning
    assert_equal(CHISE::IDC_8+"辰口", "唇".decompose) #?

    assert_equal(CHISE::IDC_9, "句".decompose.to_a[0])
    assert_equal(CHISE::IDC_9+"勹口", "句".decompose)
    assert_equal(CHISE::IDC_9+"勹丶", "勺".decompose)
    assert_equal(CHISE::IDC_9+"勹日", "旬".decompose)
    assert_equal(CHISE::IDC_9+"戈廾", "戒".decompose)
    assert_equal(CHISE::IDC_9+"弋工", "式".decompose)
    assert_equal(CHISE::IDC_9+"刀丿", "刃".decompose)
#    assert_equal(CHISE::IDC_9+"鳥山", "島".decompose) # meaning

    assert_equal(CHISE::IDC_A, "通".decompose.to_a[0])
    assert_equal(CHISE::IDC_A+"廴聿", "建".decompose)
    assert_equal(CHISE::IDC_A+"走戉", "越".decompose)
    assert_equal(CHISE::IDC_A+"走巳", "起".decompose)
    assert_equal(CHISE::IDC_A+"走取", "趣".decompose)
    assert_equal(CHISE::IDC_A+"走召", "超".decompose)
    assert_equal(CHISE::IDC_A+"是頁", "題".decompose)
    assert_equal(CHISE::IDC_A+"免力", "勉".decompose)
    assert_equal(CHISE::IDC_A+"鬼未", "魅".decompose)
#    assert_equal(CHISE::IDC_A+"黒犬", "黙".decompose)

#    assert_equal(CHISE::IDC_B, "太".decompose.to_a[0])
#    assert_equal(CHISE::IDC_B+"大丶", "太".decompose)
    assert_equal(CHISE::IDC_B+"衣中", "衷".decompose)
    assert_equal(CHISE::IDC_B+"衣里", "裏".decompose)
    assert_equal(CHISE::IDC_B+"勹巳", "包".decompose)
    assert_equal(CHISE::IDC_B+"勹乂", "匁".decompose)
#    assert_equal(CHISE::IDC_B+"木日", "東".decompose) # meaning
    assert_equal(CHISE::IDC_B+"弍一", "弐".decompose)
    assert_equal(CHISE::IDC_B+"衣保", "褒".decompose)
  end
end
