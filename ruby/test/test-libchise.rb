#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestLibChise < Test::Unit::TestCase
  def test_libchise
    db_dir = CHISE::DataSource::DB_DIR
    assert_match(/chise-db\Z/, db_dir)

    @ds = CHISE::DataSource.new(CHISE::DataSource::Berkeley_DB, db_dir, 0, 0755)
    assert_instance_of(CHISE::DataSource, @ds)

    @ds.each_feature_name {|name|
      #assert_instance_of(String, name)
    }

    # get a feature value
    char_id = 0x4ECF
    feature = @ds.get_feature("ideographic-structure")
    assert_instance_of(CHISE::Feature, feature)
    assert_equal(true, feature.setup_db(0))
    assert_equal(true, feature.sync)
    value = feature.get_value(char_id)
    assert_equal("(?\342\277\260 ?\344\272\273 ?\345\216\266)", value)

    # shortcut
    value = @ds.load_feature(char_id, "ideographic-structure")
    assert_equal("(?\342\277\260 ?\344\272\273 ?\345\216\266)", value)

    # set a value
    feature = @ds.get_feature("test-libchise")
    assert_instance_of(CHISE::Feature, feature)
    v = "testvalue"+$$.to_s
    assert_equal(true, feature.set_value(char_id, v))
    assert_equal(v, feature.get_value(char_id))

    # each char
    feature = @ds.get_feature("numeric-value")
    feature.each_char {|cid, valdatum|
      assert_kind_of(Numeric, cid)
      assert_instance_of(String, valdatum)

      ucs = @ds.get_feature("=ucs").get_value(cid)
      if ucs
	assert_instance_of(String, ucs)
      else
	ucs = @ds.get_feature("=>ucs").get_value(cid)
	if ucs
	  assert_instance_of(String, ucs)
	end
      end

      name = @ds.get_feature("name").get_value(cid)
      if name
	assert_instance_of(String, name)
      end
    }

    # get a character by Daikanwa number 364.
    ccs = @ds.get_ccs("=daikanwa")
    assert_instance_of(CHISE::CCS, ccs)
    assert_equal(true, ccs.setup_db(0))
    assert_equal(true, ccs.sync)
    char_id = ccs.decode(364)
    assert_equal(0x4ECF, char_id)

    # shortcut
    char_id = @ds.decode_char("=daikanwa", 364)
    assert_equal(0x4ECF, char_id)

    # set a code_point
    ccs = @ds.get_ccs("test-ccs")
    assert_instance_of(CHISE::CCS, ccs)
    assert_equal(true, ccs.set($$, 0x4ECF))
    assert_equal(0x4ECF, ccs.decode($$))

    @ds.close
  end
end
