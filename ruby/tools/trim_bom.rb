#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# remove BOM at the begining of the file by eto 2002-1203

STDOUT.binmode
while gets
  if /^\M-o\M-;\M-?/
    $_.sub!(/^\M-o\M-;\M-?/, "")
  end
  print $_
end
