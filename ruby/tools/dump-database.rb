#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

$LOAD_PATH.unshift("..")
require "chise/management"

man = CHISE::DataBaseManagement.new
man.dump_all
