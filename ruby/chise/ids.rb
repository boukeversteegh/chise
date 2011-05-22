# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "chise/idstree"

module CHISE
  IDC_0 = "\342\277\260"
  IDC_1 = "\342\277\261"
  IDC_2 = "\342\277\262"
  IDC_3 = "\342\277\263"
  IDC_4 = "\342\277\264"
  IDC_5 = "\342\277\265"
  IDC_6 = "\342\277\266"
  IDC_7 = "\342\277\267"
  IDC_8 = "\342\277\270"
  IDC_9 = "\342\277\271"
  IDC_A = "\342\277\272"
  IDC_B = "\342\277\273"

  IDC_LEFT_TO_RIGHT = IDC_0
  IDC_ABOVE_TO_BELOW = IDC_1
  IDC_LEFT_TO_MIDDLE_AND_RIGHT = IDC_2
  IDC_ABOVE_TO_MIDDLE_AND_BELOW = IDC_3
  IDC_FULL_SURROUND = IDC_4
  IDC_SURROUND_FROM_ABOVE = IDC_5
  IDC_SURROUND_FROM_BELOW = IDC_6
  IDC_SURROUND_FROM_LEFT = IDC_7
  IDC_SURROUND_FROM_UPPER_LEFT = IDC_8
  IDC_SURROUND_FROM_UPPER_RIGHT = IDC_9
  IDC_SURROUND_FROM_LOWER_LEFT = IDC_A
  IDC_OVERLAID = IDC_B

  module StringIDS
    def decompose
      map_char {|ch| ch.char.decompose }
    end

    def decompose_all
      map_char {|ch| ch.char.decompose_all }
    end

    def ids_tree() IDS_Tree.new(self); end

    def compose(dbname="ids")
      ids = self.aggregate
      cd = ChiseDB.instance
      #byids = cd.get_by_ids_db(dbname)
      byids = cd.get_ccs(dbname)
      #cid = byids.decode(ids)
      cid = byids.get_by_str(ids)
      return "" if cid.nil? # TO CHECK: why "", not nil?
      composed = Character.get(cid).to_s
      return "" if composed.nil?
      return "" if composed.char_length == 0
      return composed if composed.char_length == 1
      composed.each_char {|ch|
	char = ch.char
	return ch # TO CHECK: the first character?
      }
      "" # TO CHECK: why "", not nil?
    end

    def aggregate(dbname="ids")
      # In each sub part of IDS, search the corresponding char_id.
      # If you could search the corresponding char_id, substitute with it.
      #tree = self.ids_tree
      tree = IDS_Tree.new(self)
      return self if tree.depth <= 1 # no sub_node
      tree.sub_nodes.each {|node|
	c = node.compose(dbname)
	next if c.nil? || c == ""
	n = self.gsub(node, c)
	return n.aggregate(dbname)
      }
      self
    end

    def find() # "日雲"→"曇"とかいう感じの操作
      ar = []
      length = char_length()
      each_char {|ch|
	char = ch.char
	ar << char.ids_contained #その文字を含んでいる漢字のリスト
      }
      h = Hash.new(0)
      #qp ar
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

  module CharacterIDC
    def is_idc?
      0x2ff0 <= @char_id && @char_id <= 0x2fff
    end

    def idc_argument_number
      return 0 unless is_idc?
      return 3 if @char_id == 0x2ff2 || @char_id == 0x2ff3
      return 2
    end
  end

  module CharacterIDS
    def decompose_by_meaning
      k = self.to_s
      ids = self.ids_represent
      return ids if ids && !ids.empty? && k != ids
      ids = self.ids_element
      return ids if ids && !ids.empty? && k != ids
      ids = self.ids_meaning
      return ids if ids && !ids.empty? && k != ids
      decompose
    end

    def decompose # by glyph
      k = self.to_s
      ids = self.ids
      return ids if ids && !ids.empty? && k != ids
      ids = self.ids_org
      return ids if ids && !ids.empty? && k != ids
      k
    end

    def decompose_all
      pde = ""
      de = self.decompose # the start point.
      level = 0
      while true
	pde = de
	de = pde.decompose # decompose it again.
	break if pde == de # previous is same.
	exit if 10 < level # p ["too many recursive", self] 
	level += 1
      end
      de
    end
  end
end
