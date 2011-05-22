#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"
require "chise/idstree"

class TestTree < Test::Unit::TestCase
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
    assert_raise(RuntimeError, "unmatch leaves") { tree.check_integrity }
    assert_equal("[[\"+\", 1, 2]]", tree.add_leaf(2).inspect)
    assert_nil(tree.check_integrity)
    assert_equal("[[\"+\", 1, 2], 3]", tree.add_leaf(3).inspect)
    assert_raise(RuntimeError, "extra nodes") { tree.check_integrity }
    
    tree = CHISE::Tree.new
    assert_equal("[[\"+\"]]", tree.add_node("+", 2).inspect)
    assert_raise(RuntimeError, "unmatch leaves") { tree.check_integrity }
    assert_equal("[[\"+\", 1]]", tree.add_leaf(1).inspect)
    assert_raise(RuntimeError, "unmatch leaves") { tree.check_integrity }
    assert_equal("[[\"+\", 1, [\"+\"]]]", tree.add_node("+", 2).inspect)
    assert_raise(RuntimeError, "unmatch leaves") { tree.check_integrity }
    assert_equal("[[\"+\", 1, [\"+\", 2]]]", tree.add_leaf(2).inspect)
    assert_raise(RuntimeError, "unmatch leaves") { tree.check_integrity }
    assert_equal("[[\"+\", 1, [\"+\", 2, 3]]]", tree.add_leaf(3).inspect)
    assert_nil(tree.check_integrity)

    tree = CHISE::Tree.new
    assert_equal("[1]", tree.add_leaf(1).inspect)
    assert_nil(tree.check_integrity)
    assert_equal("[1, 2]", tree.add_leaf(2).inspect)
    assert_raise(RuntimeError, "extra leaves") { tree.check_integrity }
  end
end

class TestIDSTree < Test::Unit::TestCase
  def check_tree(ids)
    CHISE::IDS_Tree.new(ids).check_integrity
  end

  def test_ids_tree()
#    assert_equal("[[<+,U+002B>, <A,U+0041>, <B,U+0042>]]", CHISE::IDS_Tree.new("+AB").inspect)
#    assert_equal("[[<+,U+002B>, <A,U+0041>, <B,U+0042>], <C,U+0043>]", CHISE::IDS_Tree.new("+ABC").inspect)
#    assert_equal("[[<+,U+002B>, <A,U+0041>, [<+,U+002B>, <B,U+0042>, <C,U+0043>]]]", CHISE::IDS_Tree.new("+A+BC").inspect)
#    assert_equal("[[<+,U+002B>, <A,U+0041>, [<+,U+002B>, <B,U+0042>, <C,U+0043>]], <D,U+0044>]", CHISE::IDS_Tree.new("+A+BCD").inspect)

    #assert_equal("[<榊,U+698A>]", CHISE::IDS_Tree.new("榊").inspect)
#    assert_equal("[[<⿰,U+2FF0>, <木,J90-4C5A>, <神,J90-3F40>]]", CHISE::IDS_Tree.new("⿰木神").inspect)
    assert_equal(1, CHISE::IDS_Tree.new("⿰木神").depth)
#    assert_equal("[[<⿰,U+2FF0>, <木,J90-4C5A>, [<⿰,U+2FF0>, <⺭,CDP-8B70>, <申,J90-3F3D>]]]", CHISE::IDS_Tree.new("⿰木⿰⺭申").inspect)
    assert_equal(2, CHISE::IDS_Tree.new("⿰木⿰⺭申").depth)
    assert_raise(RuntimeError, "unmatch leaves") { check_tree("⿰木") }
    assert_nil(CHISE::IDS_Tree.new("⿰木神").check_integrity)
    assert_raise(RuntimeError, "unmatch leaves") { check_tree("⿰木⿰申") }
    assert_nil(CHISE::IDS_Tree.new("⿰木⿰⺭申").check_integrity)
    assert_raise(RuntimeError, "unmatch leaves") { check_tree("⿰木⿰⺭申申") }
    assert_nil(CHISE::IDS_Tree.new("榊").check_integrity)
    assert_raise(RuntimeError, "extra leaves") { check_tree("榊榊") }
  end

  def test_ids_tree_by_character
    assert_equal(3, "⿳".char.idc_argument_number)
#    assert_equal("⿳士冖匕", "壱".ids)
#    assert_equal(3, "壱".ids.to_a[0].char.idc_argument_number)
    assert_nil(CHISE::IDS_Tree.new("⿳士冖匕").check_integrity)
    assert_raise(RuntimeError, "unmatch leaves") { check_tree("⿳士冖") }
    assert_raise(RuntimeError, "extra nodes") { check_tree("⿳士冖匕匕") }
    assert_raise(RuntimeError, "contains ques") { check_tree("⿳士冖?") }
  end

  def nutest_tree_depth
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
end
