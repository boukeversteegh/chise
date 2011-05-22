# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "chise/char"
require "chise/kanjilist"
require "chise/defkanji"
require "chise/graphviz"

module CHISE
  class KanjiNetwork # 漢字間のネットワークを計算する
    def initialize()
      reset()
      @formatter = GraphvizFormatter.new(self)
      # @formatter = XSpringiesFormatter.new(self)
    end
    attr_reader :h, :list

    def reset
      @h = Hash.new
      @done = Hash.new
      @list = []
    end

    def make_network(list) # @h, @listに結果を入れていく。
      list.each_char {|ch|
	make_network_one(ch)
      }
    end
    
    def make_network_one(ch) #実質的にこれが本体。再帰で呼ばれる。
      return if @done[ch]
      
      @h[ch] = []
      @list << ch #登場文字リストに追加
      
      char = ch.char
      ids = char.decompose
#     if ids.char_length == 1 #分割できない文字は、リンクを探す。
      if ids.is_a_utf8? #分割できない文字は、リンクを探す。
	link = char.ids_represent if char.ids_represent
	link = char.ids_link if char.ids_link
	return if link.nil?
	@h[ch] << link #親字に追加する。
	@list << link
	return
      end
      
      ids.each_char {|idsch|
	idschar = idsch.char
	next if idschar.is_ids?
	@h[ch] << idsch #親字に追加する。
	@list << idsch
	make_network_one(idsch) #再帰する。
      }
      @done[ch] = true
    end
    
    def nodes_and_edges() #これを二つのarrayで返す
      nodear = []
      nodeh  = Hash.new
      @list.sort.uniq.each_with_index {|ch, index|
	nodear[index] = ch
	nodeh[ch] = index
      }
      edgear = []
      @h.each {|ch, ar|
	ar.each {|idsch|
	  edgear << [nodeh[ch], nodeh[idsch]]
	}
      }
      return nodear, edgear
    end

    def out(filename)
      open(filename, "w"){|out| out.print to_s }
    end

    def to_s() @formatter.to_s; end
  end

  class GraphvizFormatter # Graphviz関係
    def initialize(network)
      @network = network
    end

    def to_s() #Graphvizのフォーマット、dotフォーマットに変換する。
      page = DotPage.new
      page.size = "5.5, 5.5"
      #page.pack = "true"
      #page.epsilon = 0.001
      #page.epsilon = 0.01
      #page.overlap = false
      #page.overlap = scale
      #page.spline = true

      #p @network.list
      @network.list.sort.uniq.each {|ch|
	char = ch.char
	node = DotNode.new(char.to_i)
	node.label = char.map_ucs_er #node.label = char.to_utf8
	node.fontsize = (node.label =~ /^&#/) ? 12 : 6
	#node.fontsize = (node.label =~ /^&#/) ? 24 : 6
	node.shape = "plaintext"
	node.fontname = "MS-Mincho" #呪われてるがしかたがない
	#node.fontname = "Arial-Unicode-MS" #ダメ
	page.add_node(node)
      }

      @network.h.each {|ch, ar|
	char = ch.char
	ar.each {|idsch|
	  idschar = idsch.char
	  edge = DotEdge.new(char.to_i, idschar.to_i)
	  #edge.len = 4
	  #edge.len = 2
	  #edge.color = "gray"
	  edge.color = "lightgray"
	  page.add_edge(edge)
	}
      }
      return page.to_s
    end
  end

  class XSpringiesFormatter
    def initialize(network)
      @network = network
    end

    def to_s # #1.0 *** XSpringies data file
      str = ""
      @network.list.sort.uniq.each {|ch|
	char = ch.char
	num = char.to_i
	label = char.map_ucs_er
	str << "mass #{num}\n"
      }
      @network.h.each {|ch, ar|
	char = ch.char
	ar.each {|idsch|
	  idschar = idsch.char
	  from = char.to_i
	  to = idschar.to_i
	  str << "spng #{from} #{to}\n"
	}
      }
      str
    end

  end
end
