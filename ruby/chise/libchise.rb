# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

$LOAD_PATH.unshift("../ext")
require "chise/libchise_r"
begin
  require "libchise_c.so"
  #raise LoadError # uncomment, if you'd like to use libchise_r.
  module CHISE
    DataSource = DataSource_C
    Feature = Feature_C
    CCS = CCS_C
  end
rescue LoadError
  module CHISE
    DataSource = DataSource_R
    Feature = Feature_R
    CCS = CCS_R
  end
end
