# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "sgl"
require "singleton"
require "chise/kageserver"

#こんな感じのフォーマットになっている。
#<?xml version="1.0"?>
#<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.0//EN" "http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd">
#<svg viewBox="0 0 1000 1000">
#<path d="M 50,540 950,255 " style="fill: none; stroke: black; stroke-width: 10; stroke-linecap: round;"/>
#<path d="M 330,50 330,900 M 330,900 Q 330,950 380,950 M 380,950 840,950 M 840,950 Q 890,950 915,850 " style="fill: none; stroke: black; stroke-width: 10; stroke-linecap: round;"/>
#</svg>

module StrokeFont
  class QuadraticPath # 動的な分割に対応できるようにする
    DEFAULT_DIVIDE = 4

    def initialize(p1, p2, p3)
      @p1, @p2, @p3 = p1, p2, p3
      @num = DEFAULT_DIVIDE
    end

    def divide_adaptic #適応的分割数をする。
    end

    def divide()
      divide_num(@num)
    end

    def divide_num(num) #分割数を指定できる
      #p [num]
      x1, y1 = @p1
      x2, y2 = @p2
      x3, y3 = @p3
      #2次のbezier曲線の計算式、 P(t) = (1-t)^2*P1 + 2*t*(1-t)*P2 + t^2*P3
      curve = []
      (num+1).times {|i|    #ここで最後の点を含めないのがポイント。これによって次の曲線との重複が無いようにしている。
	t = (i.to_f)/num
	x = (1-t)*(1-t)*x1 + 2*t*(1-t)*x2 + t*t*x3
	y = (1-t)*(1-t)*y1 + 2*t*(1-t)*y2 + t*t*y3
	curve << [x,y]
      }
      #p curve
      curve
    end

  end
  
  class PathResolver
    #M 50,540 950,255 
    #M 330,50 330,900 M 330,900 Q 330,950 380,950 M 380,950 840,950 M 840,950 Q 890,950 915,850 

    def initialize
      reset
    end

    def reset
      @lines = []
      @px, @py = -1, -1
    end

    def parse(str)
      reset
      cmd = []
      str.split.each {|par|
	if par.length == 1 #コマンドである
	  exec_cmd(cmd) if 0 < cmd.length #前のコマンドが残っていたら実行
	  cmd = [par] #cmdを新規生成
	elsif par =~ /[,0-9]+/ #座標値である
	  sx, sy = par.split(/,/)
	  x, y = sx.to_i, sy.to_i
	  cmd << [x, y] #cmdへのargを追加
	end
      }
      exec_cmd(cmd) if 0 < cmd.length #前のコマンドが残っていたら実行
      @lines
    end

    def exec_cmd(cmd)
      c = cmd.shift #先頭をとる
      case c
      when "M"
	cmd.each {|x, y| moveto(x, y) }
      when "Q"
	quadratic([@px, @py], cmd.shift, cmd.shift)
      end
    end

    def moveto(x, y)
      @lines << [@px, @py, x, y] if @px != -1
      @px, @py = x, y
    end

    def quadratic(p1, p2, p3)
      #p ["quadratic", p1, p2, p3]
      qp = QuadraticPath.new(p1, p2, p3)
      curve = qp.divide
      curve.each {|x, y|
	moveto(x, y)
      }
    end

  end

  class KageParser
    def self.parse(svg)
      @strokes = Strokes.new
      pr = PathResolver.new
      lines = svg.split(/\n/)
      lines.each {|line|
	next unless line =~ /^<path/
	if line =~ /d=\"([a-zA-Z0-9, ]+)\"/
	  #lines = KageParser.parse_path($1)
	  lines = pr.parse($1)
	  lines.each {|px, py, x, y|
	    @strokes.add_line(px, 1000-py, x, 1000-y)
	  }
	end
      }
      return @strokes
    end
  end

  class KageGlyph # てなかんじ
    def initialize(code, svg)
      @code = code
      @svg = svg
      @strokes = nil
    end
    attr_reader :strokes

    def parse
      return if @strokes
      @strokes = KageParser.parse(@svg)
    end

    def init
      parse if @strokes.nil?
    end
  end

  class KageFont
    def initialize
      @server = KageServer.instance
      @glyphs = []
      @cache_list = @server.list_cache
      @rend = nil
      @rend = StrokesRenderer.new
      # @rend.hsv = [13, 100, 100]
      # @rend.hsv = [0, 0, 0]
      # @rend.hsv = [13, 100, 100] #黄色
      @rend.hsv = [6, 100, 100] #オレンジ
    end
    attr_reader :cache_list, :server

    def get(code)
      return @glyphs[code] if @glyphs[code]
      svg = @server.get(code)
      return nil if svg.nil?
      @glyphs[code] = KageGlyph.new(code, svg)
    end

    def init(code)
      glyph = get(code)
      return if glyph.nil?
      glyph.init
      glyph.parse
      @rend.set_strokes(glyph.strokes)
    end

    def draw(code)
      glyph = get(code)
      return if glyph.nil?
      @rend.draw
    end

    def print(code)
      char = Character.new(@code)
      printf("[%s][%04x]\n", char.nil? ? "nil" : char.map_sjis, code)
    end

  end
end
