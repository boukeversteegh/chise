#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"
require "chise/management"

class TestManagement < Test::Unit::TestCase
  def test_management
    @cd = CHISE::ChiseDB.instance
    char_id = "字".char.char_id
    feature = @cd.get_feature("test-dump")
    feature.set_value(char_id, "dump test")
    assert_equal("dump test", feature.get_value(char_id))
    feature.sync

    ds = @cd.instance_eval { @ds }
    #path = ds.location+"character/feature/test-dump"
    path = CHISE::DataSource::DB_DIR.path+"character/feature/test-dump"
    assert_equal(true, path.exist?)

    txt = CHISE::DataSource::DB_DIR.path+"character/feature/test-dump.txt"
    #assert_equal(false, txt.exist?)
    feature.dump
    assert_equal(true, txt.exist?)
    str = txt.open("rb") {|f| f.read }
    assert_equal("23383\tdump test\n", str)
  end
end
