# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# StrokeFont library by eto 2003-0311

require "sgl"
require "chise/kage"
require "chise/csf"

module StrokeFont
  class StrokesRenderer
    def initialize
      @start_time = nil
      @strokes = nil
#     @hsv = [0, 0, 100] #白
      @hsv = [0, 0, 0] #黒
      init
    end
    attr_accessor :hsv

    def init() @start_time = Time.now; end

    def set_strokes(strokes)
      @strokes = strokes
      init
    end

    def draw
      return if @strokes.nil?
      @strokes.strokes.each_with_index {|stroke, index|
	#draw_delay(stroke, index)
	draw_alpha(stroke, 100)
      }
    end

    def draw_alpha(stroke, time)
      px, py = 0, 0
      span = 0.1
      time += span*2
      stroke.points.each {|x, y|
	a = time / span
	colorHSV(@hsv[0], @hsv[1], @hsv[2], a*100.0)
	line(px, py, x, y) if (px != 0 || py != 0) #最初の点ではない
	px, py = x, y
	time -= span
      }
    end

    def draw_delay(stroke, index)
      now = Time.now
      @start_time = Time.now if @start_time == nil
      diff = now - @start_time #開始からの秒数がはいる
      draw_alpha(stroke, diff - index*0.3)
    end
  end

  class Stroke # a connected line
    def initialize
      @points = []
      @length = nil
    end
    attr_reader :points

    def add_point(x, y)
      @points << [x, y]
    end

    def length #未チェック
      return @length if @length
      len = 0.0
      px, py = -1, -1
      @points.each {|x, y|
	if px != -1
	  len += Math.sqrt((x-px)*(x-px)+(y-py)*(y-py))
	end
	px, py = x, y
      }
      @length = len
      return @length
    end
  end

  class Strokes # lines
    def initialize
      @strokes = []
      @px1, @py1, @px2, @py2 = 0, 0, 0, 0
      @x1, @y1, @x2, @y2 = 0, 0, 0, 0
      @px, @py = -1, -1
    end
    attr_reader :strokes

    def add_line(x1, y1, x2, y2)
      if (@px != x1 || @py != y1) #以前の点とつながっていなかったら、
	@strokes << Stroke.new
	@strokes.last.add_point(x1, y1)
      end
      @strokes.last.add_point(x2, y2)
      @px, @py = x2, y2
    end

  end
end
