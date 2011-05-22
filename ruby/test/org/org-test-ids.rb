#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# by eto 2003-0112

require "common"

class TestIDS < Test::Unit::TestCase
  def setup
  end

  def test_ids
    char = "榊".char
    assert_equal("⿰木神", char.ids)
    assert_equal("⿰木神", char.decompose)
    str = "榊"
    assert_equal("⿰木神", str.char.ids)
    assert_equal("⿰木神", str.decompose)
    assert_equal("⿰木⿰⺭申", str.decompose.decompose)
    assert_equal("⿰木神", str.decompose!)
    assert_equal("⿰木⿰⺭申", str.decompose!)
    str = "榊"
    assert_equal("⿰木⿰⺭申", str.decompose_all)
    assert_equal("⿰木⿰⺭申", str.decompose_all!)
    assert_equal("⿰木⿰⺭申", str)
    #今はまだcomposeはできない。

    de = "細".decompose
    assert_match(/田$/, de)  
    assert_equal(3, de.char_length)
    de = "&JX2-7577;".de_er.decompose
    de = "&CDP-8B60;".de_er.decompose
    assert_equal(1, de.char_length)
    de = "&JX2-217E;".de_er.decompose
    assert_match(/^⿰/, de)  
    assert_equal(3, de.char_length)
    assert_equal(6, de.decompose!.char_length)
#    assert_equal(6, de.decompose!.char_length)

    assert("⿸".char.is_ids?)
    assert(! "木".char.is_ids?)
    assert_equal(2, "⿰".char.ids_operator_argc)
    assert_equal(2, "&U+2FF0;".de_er.char.ids_operator_argc)
    assert_equal(2, "&U+2FF1;".de_er.char.ids_operator_argc)
    assert_equal(3, "&U+2FF2;".de_er.char.ids_operator_argc)
    assert_equal(3, "&U+2FF3;".de_er.char.ids_operator_argc)

    assert_equal("⿰", "&U+2FF0;".de_er.to_s)
    assert("&U+2FF0;".de_er.char.is_ids?)
    assert("&U+2FFF;".de_er.char.is_ids?)
    #assert_match(/U\+2FF0/, "&U+2FF0;".de_er.char.inspect_x)
    assert_match(/IDEOGRAPHIC DESCRIPTION CHARACTER LEFT TO RIGHT/, "&U+2FF0;".de_er.char.inspect_all)
    (0x2FF0..0x2FFB).each {|i|
      assert_match(/IDEOGRAPHIC DESCRIPTION CHARACTER/, CHISE::Character.new(i).name)
    }

    assert_match(/LEFT TO RIGHT/, "&U+2FF0;".de_er.char.name)		#∫
    assert_match(/ABOVE TO BELOW/, "&U+2FF1;".de_er.char.name)		#∨
    assert_match(/LEFT TO MIDDLE AND RIGHT/, "&U+2FF2;".de_er.char.name)	#∬
    assert_match(/ABOVE TO MIDDLE AND BELOW/, "&U+2FF3;".de_er.char.name)	#∀
    assert_match(/FULL SURROUND/, "&U+2FF4;".de_er.char.name)		#∃
    assert_match(/SURROUND FROM ABOVE/, "&U+2FF5;".de_er.char.name)		#∩
    assert_match(/SURROUND FROM BELOW/, "&U+2FF6;".de_er.char.name)		#∪
    assert_match(/SURROUND FROM LEFT/, "&U+2FF7;".de_er.char.name)		#⊂
    assert_match(/SURROUND FROM UPPER LEFT/, "&U+2FF8;".de_er.char.name)	#√
    assert_match(/SURROUND FROM UPPER RIGHT/, "&U+2FF9;".de_er.char.name)	#∂
    assert_match(/SURROUND FROM LOWER LEFT/, "&U+2FFA;".de_er.char.name)	#∠
    assert_match(/OVERLAID/, "&U+2FFB;".de_er.char.name) #∵
  end

  def test_tree
    assert_equal("[]", CHISE::Tree.new().inspect)
    assert_equal("[1]", CHISE::Tree.new().add_leaf(1).inspect)
    assert_equal("[1, 2]", CHISE::Tree.new().add_leaf(1).add_leaf(2).inspect)
    assert_equal("[[]]", CHISE::Tree.new().add_node.inspect)
    assert_equal("[[1]]", CHISE::Tree.new().add_node.add_leaf(1).inspect)
    assert_equal("[[1, 2]]", CHISE::Tree.new().add_node.add_leaf(1).add_leaf(2).inspect)
    assert_equal("[[1]]", CHISE::Tree.new().add_node.add_leaf(1).end_node.inspect)
    assert_equal("[[1], [1]]", CHISE::Tree.new().add_node.add_leaf(1).end_node.add_node.add_leaf(1).end_node.inspect)

    tree = CHISE::Tree.new
    assert_equal("[]", tree.inspect)
    assert_equal("[1]", tree.add_leaf(1).inspect)
    assert_equal(0, tree.depth)
    assert_equal("[1, 2]", tree.add_leaf(2).inspect)
    assert_equal("[1, 2, []]", tree.add_node.inspect)
    assert_equal("[1, 2, [3]]", tree.add_leaf(3).inspect)
    assert_equal(1, tree.depth)
    assert_equal("[1, 2, [3, 4]]", tree.add_leaf(4).inspect)
    assert_equal("[1, 2, [3, 4]]", tree.end_node.inspect)
    assert_equal("[1, 2, [3, 4], [5]]", tree.add_node.add_leaf(5).inspect)
    assert_equal("[1, 2, [3, 4], [5, [6]]]", tree.add_node.add_leaf(6).inspect)
    assert_equal(2, tree.depth)

    tree = CHISE::Tree.new
    assert_equal("[[\"+\"]]", tree.add_node("+", 2).inspect)
    assert_equal("[[\"+\", 1]]", tree.add_leaf(1).inspect)
    assert_equal("unmatch leaves", tree.check_integrity)
    assert_equal("[[\"+\", 1, 2]]", tree.add_leaf(2).inspect)
    assert_nil(tree.check_integrity)
    assert_equal("[[\"+\", 1, 2], 3]", tree.add_leaf(3).inspect)
    assert_equal("extra nodes", tree.check_integrity)
    
    tree = CHISE::Tree.new
    assert_equal("[[\"+\"]]", tree.add_node("+", 2).inspect)
    assert_equal("unmatch leaves", tree.check_integrity)
    assert_equal("[[\"+\", 1]]", tree.add_leaf(1).inspect)
    assert_equal("unmatch leaves", tree.check_integrity)
    assert_equal("[[\"+\", 1, [\"+\"]]]", tree.add_node("+", 2).inspect)
    assert_equal("unmatch leaves", tree.check_integrity)
    assert_equal("[[\"+\", 1, [\"+\", 2]]]", tree.add_leaf(2).inspect)
    assert_equal("unmatch leaves", tree.check_integrity)
    assert_equal("[[\"+\", 1, [\"+\", 2, 3]]]", tree.add_leaf(3).inspect)
    assert_nil(tree.check_integrity)

    tree = CHISE::Tree.new
    assert_equal("[1]", tree.add_leaf(1).inspect)
    assert_nil(tree.check_integrity)
    assert_equal("[1, 2]", tree.add_leaf(2).inspect)
    assert_equal("extra leaves", tree.check_integrity)
  end

  def test_ids_tree
#    assert_equal("[[<+,U+002B>, <A,U+0041>, <B,U+0042>]]", CHISE::IDS_Tree.new("+AB").inspect)
#    assert_equal("[[<+,U+002B>, <A,U+0041>, <B,U+0042>], <C,U+0043>]", CHISE::IDS_Tree.new("+ABC").inspect)
#    assert_equal("[[<+,U+002B>, <A,U+0041>, [<+,U+002B>, <B,U+0042>, <C,U+0043>]]]", CHISE::IDS_Tree.new("+A+BC").inspect)
#    assert_equal("[[<+,U+002B>, <A,U+0041>, [<+,U+002B>, <B,U+0042>, <C,U+0043>]], <D,U+0044>]", CHISE::IDS_Tree.new("+A+BCD").inspect)

    #assert_equal("[<榊,U+698A>]", CHISE::IDS_Tree.new("榊").inspect)
#    assert_equal("[[<⿰,U+2FF0>, <木,J90-4C5A>, <神,J90-3F40>]]", CHISE::IDS_Tree.new("⿰木神").inspect)
    assert_equal(1, CHISE::IDS_Tree.new("⿰木神").depth)
#    assert_equal("[[<⿰,U+2FF0>, <木,J90-4C5A>, [<⿰,U+2FF0>, <⺭,CDP-8B70>, <申,J90-3F3D>]]]", CHISE::IDS_Tree.new("⿰木⿰⺭申").inspect)
    assert_equal(2, CHISE::IDS_Tree.new("⿰木⿰⺭申").depth)
    assert_equal("unmatch leaves", CHISE::IDS_Tree.new("⿰木").check_integrity)
    assert_nil(CHISE::IDS_Tree.new("⿰木神").check_integrity)
    assert_equal("unmatch leaves", CHISE::IDS_Tree.new("⿰木⿰申").check_integrity)
    assert_nil(CHISE::IDS_Tree.new("⿰木⿰⺭申").check_integrity)
    assert_equal("extra nodes", CHISE::IDS_Tree.new("⿰木⿰⺭申申").check_integrity)
    assert_nil(CHISE::IDS_Tree.new("榊").check_integrity)
    assert_equal("extra leaves", CHISE::IDS_Tree.new("榊榊").check_integrity)

    assert_equal(3, "⿳".char.ids_operator_argc)
    assert_equal("⿳士冖匕", "壱".char.ids)
    assert_equal(3, "壱".char.ids.char.ids_operator_argc)
    assert_nil(CHISE::IDS_Tree.new("⿳士冖匕").check_integrity)
    assert_equal("unmatch leaves", CHISE::IDS_Tree.new("⿳士冖").check_integrity)
    assert_equal("extra nodes", CHISE::IDS_Tree.new("⿳士冖匕匕").check_integrity)

    assert_equal("contains ques", CHISE::IDS_Tree.new("⿳士冖?").check_integrity)
  end

  def test_tree_depth
    assert_equal(1, CHISE::IDS_Tree.new("林".decompose).depth)
#    assert_equal("["⿰木木"]", CHISE::IDS_Tree.new("林".decompose).nodes.inspect)
#    assert_equal("[]", CHISE::IDS_Tree.new("林".decompose).sub_nodes.inspect)
    assert_equal(2, CHISE::IDS_Tree.new("榊".decompose_all).depth)
#    assert_equal("["⿰木⿰⺭申", "⿰⺭申"]", CHISE::IDS_Tree.new("榊".decompose_all).nodes.inspect)
#    assert_equal("["⿰⺭申"]", CHISE::IDS_Tree.new("榊".decompose_all).sub_nodes.inspect)

#    assert_equal(3, CHISE::IDS_Tree.new("焔".decompose_all).depth)
#    assert_equal(3, CHISE::IDS_Tree.new("焔".decompose_all).nodes.length)
#    assert_equal(2, CHISE::IDS_Tree.new("焔".decompose_all).sub_nodes.length)

    assert_equal(2, CHISE::IDS_Tree.new("屡".decompose_all).depth)
    assert_equal("⿸尸娄", "⿸尸⿱米女".aggregate)
    assert_equal(3, CHISE::IDS_Tree.new("醤".decompose_all).depth)
  end

  def test_compose_exact #正確に一致するIDSを検知する
    assert_equal("榊", "榊".decompose.compose)
    assert_equal("壱", "壱".decompose.compose)
    assert_equal("⿰木木", "林".decompose)
    assert_equal("林", "⿰木木".compose)
    assert_equal("林", "林".decompose.compose)
    assert_equal("⿰木木", "⿰木木".compose.decompose)
    assert_equal("林".ucs, "⿰木木".compose.ucs)
  end

  def test_idc_shortcut
    assert_equal(IDC_LR, "林".decompose.first_char)
    assert_equal(IDC_LR+"木木", "林".decompose)

    assert_equal(IDC_AB, "森".decompose.first_char)
    assert_equal(IDC_AB+"木林", "森".decompose)
    assert_equal(IDC_AB+"火火", "炎".decompose)

    assert_equal(IDC_LMR, "班".decompose.first_char)
    assert_equal(IDC_LMR+"彳"+IDC_AB+"山王"+"攵", "徴".decompose) #meaning?

    assert_equal(IDC_AMB, "鼻".decompose.first_char)
    assert_equal(IDC_AMB+"自田廾", "鼻".decompose)
    assert_equal(IDC_AMB+"士冖匕", "壱".decompose)
    assert_equal(IDC_AMB+"穴厶心", "窓".decompose)
    assert_equal(IDC_AMB+"丗冖巾", "帯".decompose)

    assert_equal(IDC_FS, "囲".decompose.first_char)
    assert_equal(IDC_FS+"囗井", "囲".decompose)
    assert_equal(IDC_FS+"行韋", "衛".decompose)
    assert_equal(IDC_FS+"行圭", "街".decompose)
    assert_equal(IDC_FS+"行重", "衝".decompose)
    assert_equal(IDC_FS+IDC_AB+"一凵田", "画".decompose)

    assert_equal(IDC_FA, "問".decompose.first_char)
    assert_equal(IDC_FA+"門口", "問".decompose)
    assert_equal(IDC_FA+"門"+IDC_LR+"豆寸", "闘".decompose)
    assert_equal(IDC_FA+"戌女", "威".decompose)
    assert_equal(IDC_FA+"茂臣", "蔵".decompose)
    assert_equal(IDC_FA+"尺旦", "昼".decompose)
    assert_equal(IDC_FA+"冂入", "内".decompose)
    assert_equal(IDC_FA+"几丶", "凡".decompose)
    assert_equal(IDC_FA+"几"+IDC_AB+"丿虫", "風".decompose)

    assert_equal(IDC_FB, "凶".decompose.first_char)
    assert_equal(IDC_AB+"止"+IDC_FB+"凵米", "歯".decompose)

    assert_equal(IDC_FL, "匠".decompose.first_char)
    assert_equal(IDC_FL+"匚斤", "匠".decompose)
    assert_equal(IDC_FL+"匚矢", "医".decompose)
    assert_equal(IDC_FL+"匚若", "匿".decompose)
    assert_equal(IDC_FL+"匚儿", "匹".decompose)

    assert_equal(IDC_FUL, "庁".decompose.first_char)
    assert_equal(IDC_FUL+"广丁", "庁".decompose)
    assert_equal(IDC_FUL+"歹匕", "死".decompose)
    assert_equal(IDC_FUL+"尹口", "君".decompose)
    assert_equal(IDC_FUL+"麻鬼", "魔".decompose)
    assert_equal(IDC_FUL+"府肉", "腐".decompose)
    assert_equal(IDC_FUL+"麻手", "摩".decompose)
    assert_equal(IDC_FUL+"虍思", "慮".decompose)
    assert_equal(IDC_FUL+"食口", "倉".decompose)
    assert_equal(IDC_AB+"日"+IDC_FUL+"耳又", "最".decompose)
    assert_equal(IDC_FUL+"手目", "看".decompose) #meaning
    assert_equal(IDC_FUL+"辰口", "唇".decompose) #?

    assert_equal(IDC_FUR, "句".decompose.first_char)
    assert_equal(IDC_FUR+"勹口", "句".decompose)
    assert_equal(IDC_FUR+"勹丶", "勺".decompose)
    assert_equal(IDC_FUR+"勹日", "旬".decompose)
    assert_equal(IDC_FUR+"戈廾", "戒".decompose)
    assert_equal(IDC_FUR+"弋工", "式".decompose)
    assert_equal(IDC_FUR+"刀丿", "刃".decompose)
    assert_equal(IDC_FUR+"鳥山", "島".decompose) #meaning

    assert_equal(IDC_FLL, "通".decompose.first_char)
    assert_equal(IDC_FLL+"廴聿", "建".decompose)
    assert_equal(IDC_FLL+"走戉", "越".decompose)
    assert_equal(IDC_FLL+"走巳", "起".decompose)
    assert_equal(IDC_FLL+"走取", "趣".decompose)
    assert_equal(IDC_FLL+"走召", "超".decompose)
    assert_equal(IDC_FLL+"是頁", "題".decompose)
    assert_equal(IDC_FLL+"免力", "勉".decompose)
    assert_equal(IDC_FLL+"鬼未", "魅".decompose)
    assert_equal(IDC_FLL+"黒犬", "黙".decompose)

    assert_equal(IDC_O, "太".decompose.first_char)
    assert_equal(IDC_O+"大丶", "太".decompose)
    assert_equal(IDC_O+"衣中", "衷".decompose)
    assert_equal(IDC_O+"衣里", "裏".decompose)
    assert_equal(IDC_O+"勹巳", "包".decompose)
    assert_equal(IDC_O+"勹乂", "匁".decompose)
    assert_equal(IDC_O+"木日", "東".decompose)
    assert_equal(IDC_O+"弍一", "弐".decompose)
    assert_equal(IDC_O+"衣保", "褒".decompose)
  end

  def test_glyph_decompose
    assert_equal("音", "音".decompose)
#    assert_equal(IDC_AB+"立日", "音".glyph_decompose)
    assert_equal(IDC_FLL, "世".decompose.first_char)
    assert_equal("世", "世".glyph_decompose)
  end

  def test_find()
#    p "日雲".find #"曇"
    assert(4 <= "日雲".find .char_length) #"曇"
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
