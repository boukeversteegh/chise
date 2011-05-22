# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "chise/stroke"

module StrokeFont
  class CodeViewer
    WIDTH, HEIGHT = 256, 256
    SCALE = 2

    def initialize(cx=0, cy=0)
      @cx, @cy = cx, cy
      @s = SCALE
      @x1, @y1 = @cx-@s*WIDTH/2, @cy-@s*HEIGHT/2
      @x2, @y2 = @cx+@s*WIDTH/2, @cy+@s*HEIGHT/2
      @px, @py = @cx, @cy #とりあえず中心が開始点
      @pw, @ph, @pr = 30, 30, 10
      @dragging = false
      @onkeydown = false
      @code = 0
      calc_code
    end
    attr_reader :code

    def draw
      colorHSV(0, 0, 100, 10) #まずは下敷きになる枠を書きます。
      rect(@x1, @y1, @x2, @y2)
      lineWidth(1)
      colorHSV(0, 0, 100, 50)
      b = 8; s = @s*WIDTH/b
      (0..b).each {|n|
	line(@x1, @y1+n*s, @x2, @y1+n*s)
	line(@x1+n*s, @y1, @x1+n*s, @y2)
      }
      colorHSV(0, 100, 100, 100) # 次にポインターを書きます
      circle(@px, @py, @pr)
      line(@px-@pw/2, @py, @px+@pw/2, @py)
      line(@px, @py-@ph/2, @px, @py+@ph/2)
    end

    def onMouse(x, y)
      if @onkeydown
	x, y = @px, @py
      end
      if @dragging || @onkeydown
	@onkeydown = false
	@px, @py = x, y      #p [x, y]
	@px = @x1 if @px < @x1
	@py = @y1 if @py < @y1
	@px = @x2-1 if @x2-1 < @px
	@py = @y2-1 if @y2-1 < @py
	return calc_code
      else
	return false
      end
    end

    def calc_code()
      x = ((@px - @x1)/@s).to_i
      y = HEIGHT-1 - ((@py - @y1)/@s).to_i
      code = x + y*WIDTH
      if @code != code
	@code = code
	return true #changed
	#p [x, y, code]
	printf("%02x %02x %04x\n", x, y, @code)
      else
	return false
      end
    end

    def show_list(list)
      colorHSV(0, 100, 100, 100)
      list.each {|code|
	x, y = code_to_xy(code)
	rect(x, y, x+2, y-2)
      }
    end

    def code_to_xy(code)
      cx = code % WIDTH
      cy = HEIGHT - (code / WIDTH) #intになる?
      x = cx * SCALE + @x1
      y = cy * SCALE + @y1
      return x, y
    end

    def length(x, y)    Math.sqrt(x*x + y*y)  end

    def onMouseDown(x, y)
      if length(@px-x, @py-y) < @pr
	@dragging = true
      end
    end

    def onMouseUp(x, y)    @dragging = false  end

    def onKeyDown(key)
      @onkeydown = true
      case key
      when 273
	@py += @s
      when 274
	@py -= @s
      when 276
	@px -= @s
      when 275
	@px += @s
      end
    end
  end
end

if $0 == __FILE__
  $LOAD_PATH << "../../src"
  require "chise"
  include CHISE
  require "chise/stroke"
  include StrokeFont

  def setup
    useSmooth()
    window(-300,-300,300,300)
    background 0,0,20
    useFramerate(30)
    @cs = CodeViewer.new
    @csf1 = CSFFont.new()  #普通の文字
    @csf2 = CSFFont.new(CSF_KOUKOTSU_FILE) #甲骨文字
    @key = 1
    @kage = KageFont.new()
    @changed = nil
  end

  def display
    @changed = @cs.onMouse(mouseX, mouseY) #変化があったか?
    @cs.draw
    @cs.show_list(@kage.cache_list)
    code = @cs.code

    push
    scale 0.2
    translate -500,-500
    lineWidth(2)
    draw_kage(code)
    draw_csf(code)
    pop
  end

  def draw_kage(code)
    char = Character.get(code)
    return if char.nil?
    @kage.init(code) if @changed
    @kage.print(code) if @changed
    @kage.draw(code)
  end

  def draw_csf(ucs)
    char = Character.get(ucs)
    return if char.nil?
    j = char.japanese_jisx0208
    return if j.nil?
    code = j
    csf = @key == 1 ? @csf1 : @csf2
    csf.init(code) if @changed
    csf.print(code) if @changed
    csf.draw(code)
  end

  def onMouseDown(x, y)  @cs.onMouseDown(x, y)end
  def onMouseUp(x, y)  @cs.onMouseUp(x, y)end
  def onKeyDown(key)
    @key = key
    @cs.onKeyDown(key)
  end
  mainloop
end
