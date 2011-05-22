#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "common"
require "chise/idsdb"
require "chise/management"

#class TestIDS_DB < Test::Unit::TestCase
class TestIDS_DB
  def check_ccs_db(cd)
    cd.each_line {|code, ids|
      assert_instance_of(String, code)
      assert_instance_of(String, ids)
    }
    cd.each_character {|char, ids|
      assert_instance_of(CHISE::Character, char)
      assert_instance_of(String, ids)
    }
  end

  def test_ids_db
    @idb = CHISE::IDS_DB.instance
    assert_instance_of(CHISE::IDS_DB, @idb)
    @idb.each_ccs {|ccs|
      cd = @idb.get_ccs(ccs)
      assert_instance_of(CHISE::IDS_CCS_DB, cd)
      #check_ccs_db(cd)
    }
    cd = @idb.get_ccs("JIS-X0208-1990")
    check_ccs_db(cd)
  end
end

class TestIDS_DB_Management < Test::Unit::TestCase
  def test_management
    man = CHISE::IDS_DB_Management.new
    # make sure there is no conflict	   ruby    : ext
    #man.check_conflict_of_ids_text	#  151.633 : 150.287
    #man.store_ids_as_text		#  172.024 : 177.618	86470
    #man.store_ids_de_er		#   47.99  :  38.926	81899
    #man.check_integrity_of_ids_tree	#   58.185 :  48.015	79417
    man.make_by_ids_db_org		#   29.572 :  24.511	75562
    #man.store_ids_aggregated		#   66.609 :  51.832	79417
    #man.store_ids_subparts		# 1638.966 : 959.413	79417
    #man.store_ids_contained		#  773.808 : 696.374
    #man.make_by_ids_db			#   28.071 :  31.0
  end
end
