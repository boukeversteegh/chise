# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "pathname"
require "chise/config"

class String
  def path
    Pathname.new(self)
  end
end

class Pathname
  def escape
    s = self.to_s.gsub(/([\/%]+)/n){
      "%" + $1.unpack("H2" * $1.size).join("%").upcase
    }
    Pathname.new(s)
  end

  def unescape # copied from cgi.rb
    s = @path.tr("+", " ").gsub(/((?:%[0-9a-fA-F]{2})+)/n) {
      [$1.delete("%")].pack("H*")
    }
    Pathname.new(s)
  end

  # translate file name for deal with the restriction of Windows file system.
  def unix_to_win
    win = @path.gsub(/</, "(")
    win = win.gsub(/>/, ")")
    win = win.gsub(/\*/, "+")
    win = win.gsub(/\?/, "!")
    Pathname.new(win)
  end

  def win_to_unix
    unix = @path.gsub(/\)/, ">")
    unix = unix.gsub(/\(/, "<")
    unix = unix.gsub(/\!/, "?")
    unix = unix.gsub(/\+/, "*")
    Pathname.new(unix)
  end

  def escape_win_filename
    return self.unix_to_win if CHISE.windows?
    self
  end

  def unescape_win_filename
    return self.win_to_unix if CHISE.windows?
    self
  end
end
