#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

$LOAD_PATH.unshift("..")
require "find"
require "pathname"
require "fileutils"
require "chise/path"
require "chise/qp"

def usage()
  puts "Usage: make-chisedb-tarball.rb <CHISE-DB dir> <tmp dir>"
  puts "% ./make-chisedb-tarball.rb /usr/local/lib/xemacs-21.4.14/i686-pc-linux/chise-db /var/tmp"
  exit
end

def main(argv)
  usage if argv.length < 1
  dir = argv.shift
  unless dir.path.directory?
    print "no chise-db here. #{dir}\n"
    usage
  end
  tmpdir = argv.shift || "/var/tmp"
  orgdir = Dir.pwd

  print "copy all chise-db to tmpdir"
  system "cp -a #{dir} #{tmpdir}" # 
  puts "."

  print "escape special characters"
  Find.find(tmpdir+"/chise-db") {|f|
    next if f.path.directory?
    nf = f.path.escape.unix_to_win.to_s
    next if f == nf
    cmd = "mv '#{f}' '#{nf}'"
    #puts cmd
    system cmd
  }
  puts "."

  Dir.chdir(tmpdir){
    print "make tarball"
    system "tar czf chise-db.tar.gz chise-db"
    puts "."
    print "mv it"
    system "mv chise-db.tar.gz #{orgdir}"
    puts "."
    print "remove tmpdir/chise-db"
    system "rm -rf #{tmpdir}/chise-db"
    puts "."
  }
end
main(ARGV)
