#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# testcase for KanjiNetwork by eto 2003-0227

require "common"
require "chise/network"

class Test_KanjiNetwork < Test::Unit::TestCase
  def test_network
    @kl = CHISE::KanjiList.instance
    @kn = CHISE::KanjiNetwork.new
    @kn.make_network(@kl.awase)
    @kn.out("min.dot") #途中状態を保存

    @gv = CHISE::GraphvizOLE.new() #OLE version
    @gv.type = CHISE::Graphviz::TWOPI
    @gv.target = "svg"
    @gv.in  = "min.dot"
    @gv.out = "min.svg"
    @gv.generate()
  end
end
