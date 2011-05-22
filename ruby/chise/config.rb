# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "singleton"
require "chise/version"

module CHISE
  # on Winodws
  DB_DIR  = "c:/chise/chise-db" # /character/feature/=ucs
  IDS_DIR = "c:/chise/ids" # /IDS-JIS-X0208-1990.txt

  # on Unix
  #DB_DIR  = "/usr/local/lib/xemacs-21.4.14/i686-pc-linux/chise-db"
  #IDS_DIR = "/home/eto/work/chise/ids"

  def windows?()
    rp = RUBY_PLATFORM
    rp.index("cygwin") || rp.index("mswin32") || rp.index("mingw32")
  end
  module_function :windows?

  class Config
    include Singleton

    def initialize
      @version = VERSION
      @release_date = RELEASE_DATE

      @base_dir = File.expand_path(File.dirname(__FILE__)+"/../..")
      @csf_dir = @base_dir+"/csf"

      @db_dir  = DB_DIR
      @ids_dir = IDS_DIR

      instance_variables.each {|name|
	self.class.class_eval { attr_reader name.delete("@") }
      }
    end
  end
end
