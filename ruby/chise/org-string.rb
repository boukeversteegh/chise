class String
  def to_utf8()
    return to_a.map {|ch|
      ch.char.to_utf8
    }.join("")
  end

  def map_char!(block = Proc.new)
    return unless block_given?
    self.replace(self.map_char {|ch| block.call(ch)})
  end

  def map_character(block = Proc.new)
    return unless block_given?
    return self.to_a.map {|ch| (block.call(ch.char)).to_s }.join("")
  end

  def map_character!(block = Proc.new)
    return unless block_given?
    self.replace(self.map_char {|ch| block.call(ch.char)})
  end

  def map_utf8() map_char {|ch| ch.char.map_utf8 } end
  alias map_ucs map_utf8

  def map_ucs_er() map_char {|ch| ch.char.map_ucs_er } end
  def to_er() map_char {|ch| ch.char.to_er } end

  #put関係、[]関係は用意しないことにした。

  def inspect_all() map_char {|ch| ch.char.inspect_all } end
  def inspect_x()   map_char {|ch| ch.char.inspect_x   } end

# def to_euc()   map_char {|ch| ch.char.to_euc   } end
  def map_euc()  map_char {|ch| ch.char.map_euc  } end
# def to_sjis()  map_char {|ch| ch.char.to_sjis  } end
  def map_sjis() map_char {|ch| ch.char.map_sjis } end

  def glyph_decompose() map_char {|ch| ch.char.glyph_decompose } end
#  def decompose!() self.replace(self.decompose); self; end

  def nu_decompose_all(level=nil)
    level = 0 if level.nil?
    if 10 < level
      p ["too many recursive", self] 
      exit
    end
    de = self.decompose
    return de.decompose_all(level+1) if de != self #なにか変化があったから再帰
    de #もうこれ以上変化は無さそうだぞと。
  end

  def decompose_all!() self.replace(self.decompose_all); self; end

  def find() #"日雲"→"曇"とかいう感じの操作
    ar = []
    length = char_length()
    each_char {|ch|
      char = ch.char
      ar << char.ids_contained #その文字を含んでいる漢字のリスト
    }
    h = Hash.new(0)
    ar.each {|list|
      next if list.nil?
      list.each_char {|ch|
	h[ch] += 1
      }
    }
    str = ""
    h.each {|k, v|
      #      p [k, v]
      if length == v #全部に顔を出していたら
	str += k
      end
    }
    #    p str
    str
  end

end
