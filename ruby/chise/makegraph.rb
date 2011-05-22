# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

$LOAD_PATH << "../../lib" if $0 == __FILE__
require "chise"
require "chise/network"

module CHISE
  class MakeGraph # 実務的な処理を引き受ける。
    #GRAPHVIZ_CMD = 0 # CLI
    GRAPHVIZ_CMD = 1 # OLE
    GRAPHVIZ_TYPE = Graphviz::TWOPI
    #GRAPHVIZ_TYPE = Graphviz::NEATO
    START_GAKUNEN = 1
    END_GAKUNEN = 6
    
    def initialize()
      @kl = KanjiList.instance
      @hn = KanjiNetwork.new
    end

    def go()
      make_min
      #make_html_all
      #make_svg_all
    end

    def make_html_all()
      open("gakunen.html", "w"){|out|
	out.print %Q|<pre>\n|
	  (1..2).each {|type|
	  typestr = type.to_s
	  out.print %Q|#{typestr}グラフ\n|
	    (1..6).each {|gakunen|
	    out.print %Q|小学#{gakunen}年生 |
	      base = "han-#{type}-#{gakunen}-all"
	    out.print %Q|<a href="#{base}.svg">all</a> |
	      (0..3).each {|kubun|
	      base = "han-#{type}-#{gakunen}-#{kubun}"
	      out.print %Q|<a href="#{base}.svg">#{kubun}</a> |
	    }
	    out.print %Q|\n|
	  }
	}
	out.print %Q|</pre>\n|
      }
    end

    def make_min
      @hn.reset()
      @hn.make_network(@kl.awase(0))
      # @hn.make_network(@kl.awase(1))
      @hn.out("min.dot") #途中状態を保存
      #graphviz(Graphviz::NEATO, "min.dot", "min.svg")
      graphviz(GRAPHVIZ_TYPE, "min.dot", "min.svg")
    end

    def make_svg_all()
      (START_GAKUNEN..END_GAKUNEN).each {|gakunen|
	(0..3).each {|kubun|
	  make_dot(gakunen, kubun)
	  (2..2).each {|type|
	    make_svg(type, gakunen, kubun)
	  }
	}
	make_dot(gakunen, nil)
	(2..2).each {|type|
	  unless type == 2 && 5 <= gakunen
	    make_svg(type, gakunen, nil)
	  end
	}
      }
    end

    def gaku_name(gakunen, kubun=nil)
      return "#{gakunen}nen-all" if kubun.nil?
      return "#{gakunen}nen-#{kubun}"
    end

    def make_dot(gakunen, kubun=nil) #Graphvizのtype, 学年, 象形、指示などの区分
      @hn.reset()
      list = @kl.kyoiku(1..gakunen, kubun)
      @hn.make_network(list)
      dotf = "list-"+gaku_name(gakunen, kubun)+".dot"
      @hn.out(dotf) #途中状態を保存する
      p [dotf, "done"]
    end

    def make_svg(type, gakunen, kubun=nil) #Graphvizのtype, 学年, 象形、指示などの区分
      g = gaku_name(gakunen, kubun)
      dotf = "list-"+g+".dot"
      svgf = "han-"+g+"-"+GraphvizCLI::NAMES[type]+".svg"
      graphviz(type, dotf, svgf)
    end

    def dot2svg(dir)
      Dir.chdir(dir)
      Dir.glob("*.dot").each {|inf|
	out = inf.sub(/.dot$/, ".svg")
	type = 1 if inf =~ /^han-1/
	type = 2 if inf =~ /^han-2/
	graphviz(type, inf, out)
      }
    end

    def graphviz(type, inf, out)
      gv = GraphvizCLI.new() if GRAPHVIZ_CMD == 0
      gv = GraphvizOLE.new() if GRAPHVIZ_CMD == 1
      gv.type = type
      gv.target = "svg"
      gv.in  = inf
      gv.out = out
      gv.generate()
    end

  end
end

if $0 == __FILE__
  mg = MakeGraph.new
  mg.go
end
