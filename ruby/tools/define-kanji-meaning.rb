#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

$LOAD_PATH.unshift("..")
require "chise/char"
require "chise/defkanji"

idsdef = CHISE::IDS_Definition.instance
idsdef.define_all
