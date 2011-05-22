#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# This tool read all IDS text database and store them as BDB files.
# with normalizing IDS.

$LOAD_PATH.unshift("..")
require "chise/idsdb"

man = CHISE::IDS_DB_Management.new
# make sure there is no conflict   ruby    : ext
man.check_conflict_of_ids_text	#  151.633 : 150.287
man.store_ids_as_text		#  172.024 : 177.618	86470
man.store_ids_de_er		#   47.99  :  38.926	81899
man.check_integrity_of_ids_tree	#   58.185 :  48.015	79417
man.make_by_ids_db_org		#   29.572 :  24.511	75562
man.store_ids_aggregated	#   66.609 :  51.832	79417
man.store_ids_subparts		# 1638.966 : 959.413	79417
man.store_ids_contained		#  773.808 : 696.374
man.make_by_ids_db		#   28.071 :  31.0
