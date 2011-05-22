#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class Test_Config < Test::Unit::TestCase
  def test_config
    @config = CHISE::Config.instance
    assert_match(%r|/chise\Z|,		@config.base_dir.to_s)
    assert_match(%r|/chise-db\Z|,	@config.db_dir.to_s)
    assert_match(%r|/chise/ids\Z|,	@config.ids_dir.to_s)
  end
end
