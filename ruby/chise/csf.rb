# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "sgl"
require "chise/iconv"
require "chise/config"

module StrokeFont
  CSF_FONT_DIR = Config.instance.csf_dir+"/"
  CSF_DEFAULT_FILE  = "KST32B.CSF1"
  CSF_KOUKOTSU_FILE = "KST32ZX.CSF1"

  class CSFStrokeMaker
    DEST_WIDTH = 1000 #大きさをおおよそ1000x1000に正規化する。
    ORG_WIDTH = 32 #元のサイズは、横30×縦32
    def initialize
      @x, @y, @nx, @ny = 0, 0, 0, 0
      @strokes = Strokes.new
    end
    attr_reader :strokes

    def move_to_x(x) @x = x; @nx = x; end
    def draw_to_x(x) @nx = x; drawline; @x = @nx; @y = @ny; end
    def next_x_to(x) @nx = x; end
    def move_to_y(y) @y = y; @ny = y; end
    def draw_to_y(y) @ny = y; drawline; @x = @nx; @y = @ny; end

    def drawline()
      @strokes.add_line(t(@x), t(@y), t(@nx), t(@ny))
    end

    def t(a) a*DEST_WIDTH/ORG_WIDTH; end
  end

  class CSFParser
    def self.parse(str) #Strokesを返す
      return Strokes.new if str == nil
      sm = CSFStrokeMaker.new
      (0...str.length).each {|i|
        n = str[i]
	if 0x21 <= n && n <= 0x26
	  sm.move_to_x(n - 0x21)
	elsif 0x28 <= n && n <= 0x3f
	  sm.move_to_x(n - 0x28 + 6)
	elsif 0x40 <= n && n <= 0x5b
	  sm.draw_to_x(n - 0x40)
	elsif 0x5e <= n && n <= 0x5f
	  sm.draw_to_x(n - 0x5e + 28)
	elsif 0x60 <= n && n <= 0x7d
	  sm.next_x_to(n - 0x60)
	elsif 0x7e == n
	  sm.move_to_y(n - 0x7e)
	elsif 0xa1 <= n && n <= 0xbf
	  sm.move_to_y(n - 0xa1 + 1)
	elsif 0xc0 <= n && n <= 0xdf
	  sm.draw_to_y(n - 0xc0)
	end
      }
      return sm.strokes
    end
  end

  class CSFGlyph
    def initialize(code, stroke)
      @code = code
      @stroke_str = stroke
      @strokes = nil
    end
    attr_reader :strokes

    def parse()
      return if @strokes
      @strokes = CSFParser.parse(@stroke_str)
    end

    def init
      parse if @strokes.nil?
    end
  end

  class CSFFont
    def initialize(file=CSF_DEFAULT_FILE)
      @file = CSF_FONT_DIR + file
      @glyphs = []
      read_file
      @rend = nil
      @rend = StrokesRenderer.new
      @rend.hsv = [50, 100, 100]
    end

    def read_file()
      open(@file) {|f|
	while(line = f.gets)
	  next if line =~ /^\*/
	  c, s = line.split
	  code = c.hex #JISの値が数値ではいる
	  @glyphs[code] = CSFGlyph.new(code, s)
	end
      }
    end

    def init(code)
      glyph = @glyphs[code]
      return if glyph == nil
      glyph.init()
      glyph.parse
      @rend.set_strokes(glyph.strokes)
    end

    def draw(code) #引数にはJISを数値化したものがはいる
      glyph = @glyphs[code]
      return if glyph == nil
      @rend.draw
    end

    def print(code)
      jis = JISX0208.new
      char = jis.get_char(code)
      printf("[%s][%04x]\n", char.nil? ? "nil" : char.map_sjis, code)
    end

    def ucs_to_jis(ucs)
      char = Character.get(ucs)
      j = char.japanese_jisx0208
      return j
    end

  end
end
