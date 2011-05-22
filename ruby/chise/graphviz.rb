# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

class DotElement
  def initialize()
    @attr = Hash.new
  end

  def method_missing(mid, *args) #参考:ostruct.rb
    mname = mid.id2name
    return @attr[mname] if args.length == 0
    @attr[mname.chop] = args[0] if mname =~ /=$/ #代入
  end

  def to_s
    str = "  #{mainstr()} "
    str << "[" + @attr.map {|k, v| %Q|#{k}="#{v}"| }.join(" ") + "]" if 0 < @attr.length
    str << ";\n"
    str
  end
end

class DotPage < DotElement
  def initialize()
    super()
    @nodes = []
    @edges = []
  end

  def mainstr() @name.to_s; end

  def add_node(node)
    return unless node.is_a? DotNode
    @nodes << node
  end

  def add_edge(edge)
    return unless edge.is_a? DotEdge
    @edges << edge
  end

  def to_s()
    str = "digraph G {\n"
#    str << %Q|  size="6, 6"\n|
    str << @attr.map {|k, v| %Q|  #{k}="#{v}"\n| }.join("")
    @nodes.each {|node|
      str << node.to_s
    }
    @edges.each {|edge|
      str << edge.to_s
    }
    str << "}\n"
    str
  end
end

class DotNode < DotElement
  def initialize(name)
    @name = name
    super()
  end

  def mainstr() @name.to_s; end
end

class DotEdge < DotElement
  def initialize(from, to)
    @from, @to = from, to
    super()
  end

  def mainstr() "#{@from.to_s} -> #{@to.to_s}"; end
end

class Graphviz # abstract class
  DOT = 0
  TWOPI = 1
  NEATO = 2

  def initialize(type=DOT)
    @type = type
    @codepage = nil
    @target = nil
    @in = nil
    @out = nil
  end
  attr_accessor :type, :codepage, :target, :in, :out

  def post_process() #同じファイルに上書きにする。
    str = open(@out).read
    str.gsub!(/&amp;#x/, "&#x")
    #str.gsub!(/font-family:MS Gothic;/, "")
    #str.gsub!(/font-family:MS Gothic;/, "font-family:MS-Mincho;")
    str.gsub!(/font-family:Times New Roman;/, "")
    open(@out, "w"){|out| out.print str}
  end
end

class GraphvizCLI < Graphviz
# COMMAND_DIR = "c:\Program Files\ATT\Graphviz\bin"
  COMMAND_DIR = "" #PATHがとおってないとだめみたい。
# NAMES = "dot twopi neato".split
  NAMES = %w(dot twopi neato)

  def generate(debug=false)
    ar = []
    #ar << COMMAND_DIR + NAMES[@type] + ".exe"
    ar << COMMAND_DIR + NAMES[@type]
    #ar << "-V"
    #ar << "-Gpack"
    ar << "-T#{@target}"
    ar << "-o #{@out}"
    ar << @in
    cmd = ar.join(" ")
    print cmd,"\n"
    system cmd
    if @target =~ /svg/i
      post_process
    end
  end
end

class GraphvizOLE < Graphviz
  #NAMES = "DOT TWOPI NEATO".split

  def generate(debug=false)
    require "win32ole"
    names = "DOT TWOPI NEATO".split
    @ole = WIN32OLE.new("Wingraphviz." + names[@type])
    @ole.codepage = cp if @codepage  #neato.codepage = 65001 #codepage: 65001 Unicode UTF-8 
    @instr = open(@in).read

    if @target =~ /svg/i
      result = @ole.toSVG(@instr)
      open(@out, "w"){|out| out.print result}
      post_process
    elsif @target =~ /svg/i
      result = @ole.toPNG(@dot)
      result.save(@out)
    end
  end

  def nu_to_png(filename=nil)
    return "" unless @dot.is_a?(String)
    png = @ole.toPNG(@dot)
    png.save(filename) unless filename.nil?
    return png
  end

  #p neato.validate(str)
  #ps = neato.toPS(str)
  #open("test.ps", "w"){|out|  out.print ps  }
end
