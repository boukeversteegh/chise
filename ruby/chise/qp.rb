# Copyright (C) 2003-2004 Kouichirou Eto, All rights reserved.
# This is free software with ABSOLUTELY NO WARRANTY.
# You can redistribute it and/or modify it under the terms of the GNU GPL2.

module QP
  def caller_msg(ca)
    file, linenum, msg = ca.first.split(/:([0-9]+):/)
    msg = $1 if msg =~ /^in `(.+)'$/
    File.basename(file)+":"+linenum+":"+msg.to_s
  end

  def ar_inspect(ar)
    "["+ar.map {|arg| arg.inspect }.join(", ")+"]"
  end

  def runtime()
    $__qp_t__ = Time.now unless defined? $__qp_t__
    sprintf("%.1f", Time.now - $__qp_t__)
  end

  def qp(ca, *args)
    QP.caller_msg(ca)+"\t"+QP.ar_inspect(args)
  end

  def tp(ca, *args)
    QP.runtime()+":"+QP.qp(ca, *args)
  end

  module_function :caller_msg, :ar_inspect, :runtime, :qp, :tp
end

def qp(*args)
  print QP.qp(caller(1), *args)+"\n"
end

def tp(*args)
  print QP.tp(caller(1), *args)+"\n"
end
