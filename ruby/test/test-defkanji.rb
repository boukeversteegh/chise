#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"
require "chise/defkanji"

class TestDefKanji < Test::Unit::TestCase
  def test_defkanji
    idsdef = CHISE::IDS_Definition.instance
    assert_instance_of(CHISE::IDS_Definition, idsdef)
    #idsdef.define_all
  end
end
