#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# kage testcase by eto 2003-0318

require "common"
require "chise/stroke"
#include StrokeFont

class TestKage < Test::Unit::TestCase
  def setup
    @kage = KageFont.new
  end

  def test_stroke
  end

  def test_kage
    char = Character.get(0x4e03) #七
    font = @kage.get(0x4e03)
    assert_instance_of(KageGlyph, font)
    font.parse

    svg = <<"EOT"
      M 50,540 950,255 
      M 330,50 330,900 M 330,900 Q 330,950 380,950 M 380,950 840,950 M 840,950 Q 890,950 915,850 
EOT
    strokes = KageParser.parse(svg)
    #p strokes
  end

  def test_path
    pr = PathResolver.new
    assert_equal([[0, 0, 1000, 1000]], pr.parse("M 0,0 1000,1000"))
    assert_equal([[0, 0, 0, 1000], [0, 1000, 1000, 1000]], pr.parse("M 0,0 0,1000 1000,1000"))
#    assert_equal([[0, 0, 0.0, 0.0], [0.0, 0.0, 62.5, 437.5], [62.5, 437.5, 250.0, 750.0], [250.0, 750.0, 562.5, 937.5]], pr.parse("M 0,0 Q 0,1000 1000,1000"))
  end

end
