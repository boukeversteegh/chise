#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "libchise_c.so"
module CHISE
  DataSource = DataSource_C
  Feature = Feature_C
  CCS = CCS_C
end

$LOAD_PATH.unshift("..")
require "chise/qp"

def die(msg)
  puts msg
  @ds.close unless @ds.nil?
  exit 1
end

def main
  db_dir = CHISE::DataSource::DB_DIR
  @ds = CHISE::DataSource.new(CHISE::DataSource::Berkeley_DB, db_dir, 0, 0755)
  die "Can't open data source" if @ds.nil?

  # get a character by Daikanwa number 364.
  if true
    char_id = @ds.decode_char("=daikanwa", 364)
  else
    ccs = @ds.get_ccs("=daikanwa")
    die "Can't open CCS =daikanwa" if ccs.nil?
    char_id = ccs.decode(364)
  end
  puts char_id

  ft = @ds.get_feature("ideographic-structure")
  value = ft.get_value(char_id)
  printf("#x%X => %s\n", char_id, value)

  @ds.each_feature_name {|name|
    puts "feature : "+name
  }

  ft = @ds.get_feature("numeric-value")
  ft.each_char {|cid, valdatum|
    printf("#x%08X ", cid)

    ucs = @ds.get_feature("=ucs").get_value(cid)
    if ucs
      printf("[U-%08X]", ucs.to_i)
    else
      ucs = @ds.get_feature("=>ucs").get_value(cid)
      if ucs
	printf("(U-%08X)", ucs.to_i)
      else
	printf("            ")
      end
    end

    printf(" %s", @ds.get_feature("name").get_value(cid))
    printf(" %s\n", valdatum)
  }

  @ds.close
end
main
