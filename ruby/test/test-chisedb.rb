#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"

class TestChiseDB < Test::Unit::TestCase
  def test_chisedb
    @cd = CHISE::ChiseDB.instance

    @cd.each_feature_name {|f|
      assert_instance_of(String, f)
    }

    # get a feature value
    char_id = 0x4ECF
    feature = @cd.get_feature("ideographic-structure")
    assert_instance_of(CHISE::FeatureDB, feature)
    #assert_equal(true, feature.setup_db(0))
    #assert_equal(true, feature.sync)
    value = feature.get_value(char_id)
    assert_equal("(?\342\277\260 ?\344\272\273 ?\345\216\266)", value)

    # shortcut
    value = @cd.load_feature(char_id, "ideographic-structure")
    assert_equal("(?\342\277\260 ?\344\272\273 ?\345\216\266)", value)

    # set a value
    feature = @cd.get_feature("test-chisedb")
    assert_instance_of(CHISE::FeatureDB, feature)
    v = "testvalue"+$$.to_s
    assert_equal(true, feature.set_value(char_id, v))
    assert_equal(v, feature.get_value(char_id))

    # dump the feature
    feature.dump
    
    # each char
    feature = @cd.get_feature("numeric-value")
    feature.each_char {|cid, valdatum|
      assert_kind_of(Numeric, cid)
      #assert_instance_of(String, valdatum)
    }

    # get a character by Daikanwa number 364.
    ccs = @cd.get_ccs("=daikanwa")
    assert_instance_of(CHISE::CCS_DB, ccs)
    #assert_equal(true, ccs.setup_db(0))
    #assert_equal(true, ccs.sync)
    char_id = ccs.decode(364)
    assert_equal(0x4ECF, char_id)

    # shortcut
    char_id = @cd.decode_char("=daikanwa", 364)
    assert_equal(0x4ECF, char_id)

    # set a code_point
    ccs = @cd.get_ccs("test-ccs")
    assert_instance_of(CHISE::CCS_DB, ccs)
    assert_equal(true, ccs.set($$, 0x4ECF))
    assert_equal(0x4ECF, ccs.decode($$))

    @cd.close
  end

  def test_chisedb2
    @cd = CHISE::ChiseDB.instance
    char_id = 0x4ECF
    value = @cd.load_feature(char_id, "=ucs")
    assert_equal(20175, value)
  end

  def test_each_ccs
    @cd = CHISE::ChiseDB.instance
    @cd.each_ccs {|ccs|
      assert_instance_of(String, ccs)
      ccsdb = @cd.get_ccs(ccs)
      assert_instance_of(CHISE::CCS_DB, ccsdb)
    }
  end

  def test_ccs_each_char
    @cd = CHISE::ChiseDB.instance
    ccs = @cd.get_ccs("=ucs")
    ccs.each_char {|code_point, cid|
      assert_kind_of(Integer, code_point)
      assert_kind_of(Integer, cid)
    }
  end

  def test_set
    @cd = CHISE::ChiseDB.instance
    char_id = "字".char.char_id
    feature = @cd.get_feature("test")
    feature.setup_db(1) # writable
    feature.set_value(char_id, "test1")
    assert_equal("test1", feature.get_value(char_id))
    #feature.sync

    ds = @cd.instance_eval { @ds }
    path = CHISE::DataSource::DB_DIR.path+"character/feature/test"
    assert_equal(true, path.exist?)
  end

  def test_error
    db_dir = CHISE::DataSource::DB_DIR
    @ds = CHISE::DataSource.new(CHISE::DataSource::Berkeley_DB, db_dir, 0, 0755)
    @feature = @ds.get_feature("nosuchfeature")
    v = @feature.get_value(20175)
    assert_equal(nil, v)
  end

  def test_ascii
    @cd = CHISE::ChiseDB.instance
    char_id = @cd.decode_char("ascii", 65)
    assert_equal(65, char_id)
    assert_equal("A", CHISE::Character.get(char_id).to_s)
  end
end
