#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

$VERBOSE = true

def load_files(base)
  Dir.glob(base+"-*.rb") {|filename|
    load filename
  }
end

load_files("test")

=begin
#require "test-network" #Graphvizが必要なため、普段は実行しない
#require "test-config"
=end
