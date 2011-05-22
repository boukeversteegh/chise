# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "pathname"
require "fileutils"
require "chise/char"
require "chise/qp"

module CHISE
  class DataBaseManagement
    def dump_all
      cd = ChiseDB.instance
      cd.each_feature_name {|f|
	ft = cd.get_feature(f)
	ft.dump
	ft.close
      }
      cd.each_ccs {|ccs|
	ct = cd.get_ccs(ccs)
	ct.dump
	ct.close
      }
    end
  end

  class DataBaseFileManagement

    # from specs/char-atr.ja.txt
    OBSOLETE_FEATURES = "
cns-radical
cns-radical?
kangxi-radical
daikanwa-radical

cns-strokes
kangxi-strokes
daikanwa-strokes
shinjigen-1-radical
gb-original-radical
japanese-strokes
jis-strokes-a
jisx0208-strokes
unicode-strokes

cns-total-strokes

non-morohashi

=>ucs*
#=>mojikyo
#=mojikyo
->identical

ancient-ideograph-of
ancient-char-of-shinjigen-1
original-ideograph-of
original-char-of-shinjigen-1
vulgar-ideograph-of
vulgar-char-of-shinjigen-1
ideographic-variants
variant-of-shinjigen-1

iso-10646-comment
".split

    def initialize()
      # @opt = {:noop=>true, :verbose=>true}
      @opt = {:verbose=>true}
    end

    def move_obsolete_files
      #fpath = Config.instance.db_dir.path+"system-char-id"
      fpath = Config.instance.db_dir.path+"character/feature"
      #fpath.chdir {
      Dir.chdir(fpath.to_s) {
	opath = "obsolete".path
	opath.mkdir unless opath.directory?

	OBSOLETE_FEATURES.each {|attr|
	  next if attr.nil?
	  next if /\A#/ =~ attr
	  f = attr.path.escape.escape_win_filename
	  FileUtils.mv(f.to_s, opath.to_s, @opt) if f.exist?
	  f = (f.to_s+".txt").path
	  FileUtils.mv(f.to_s, opath.to_s, @opt) if f.exist?
	}
      }
    end

    def rename_files
      path = Config.instance.db_dir.path

      nfpath = path+"character/feature"
      FileUtils.mkdir_p(nfpath.to_s, @opt) unless nfpath.directory?

      fpath = path+"system-char-id"
      fpath.each_entry {|f|
	next if /\A\./ =~ f
	FileUtils.mv((fpath+f).to_s, nfpath.to_s, @opt)
      }

      ncpath = path+"character/by_feature"
      FileUtils.mkdir_p(ncpath.to_s, @opt) unless ncpath.directory?

      path.each_entry {|f|
	next if /\A\./ =~ f
	next if f.to_s == "character"
	d = path + f
	next unless d.directory?
	ff = d + "system-char-id"
	FileUtils.mv(ff.to_s, (ncpath+f).to_s, @opt) if ff.exist?
      }
    end
  end
end
