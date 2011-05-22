# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

module CHISE
  class Node < Array # a branch of Tree structure
    def initialize(nodeleaf=nil, nodenum=nil)
      super() # without arg
      @nodeleaf = nodeleaf
      @nodenum = nodenum
      if @nodeleaf
	original_add(@nodeleaf)
      end
    end
    attr_reader :nodenum

    alias original_add <<
      private :original_add

    def <<(obj)
      original_add(obj)
      @nodenum -= 1 if @nodenum
    end

    def nodes
      ar = []
      ar << self.to_s
      self.each {|n|
	ar += n.nodes if n.is_a? Node
      }
      ar
    end
  end

  class Tree
    def initialize
      @root = Node.new
      @stack = [@root]
      @leafnum = 0
      @depth = 1 # the deepest stack size.  If there is no tree, depth is 1.
    end

    def depth() @depth - 1; end

    def add_node(nodeleaf=nil, nodenum=nil) # add a node
      new_node = Node.new(nodeleaf, nodenum)
      @stack.last << new_node
      @stack << new_node
      if @depth < @stack.length
	@depth = @stack.length
      end
      self
    end

    def end_node # terminate this node.
      @stack.pop
      self
    end

    def add_leaf(a) # add a leaf.
      @stack.last << a
      end_check()
      self
    end

    def end_check
      n = @stack.last.nodenum
      if n && n == 0
	end_node
	end_check # recursive.
      end
    end

    def check_integrity
      n = @stack.last.nodenum
      return nil if @root.length == 0 # no tree is good tree
      raise "unmatch leaves" if n && n != 0
      raise "extra nodes" if @root.first.is_a?(Node) && @root.length != 1
      raise "extra leaves" if @root.length != 1
      return nil
    end

    def nodes
      r = @root.nodes
      r.shift
      r
    end

    def sub_nodes
      r = nodes
      r.shift
      r
    end

    def to_s()    @root.to_s    end

    def inspect() @root.inspect end
  end

  class IDS_Tree < Tree
    def initialize(str)
      @str = str
      super()
      parse
    end

    def parse
      @str.each_character {|char|
	if is_idc?(char)
	  add_node(char, idc_argument_number(char))
	else
	  add_leaf(char)
	end
      }
    end

    def is_idc?(obj)
      return true if obj.is_idc?
      return true if "+*".include?(obj.to_s) # only for test
      return false
    end

    def idc_argument_number(obj)
      n = obj.idc_argument_number
      return n if 0 < n
      return 2 # only for test
    end

    def check_integrity
      super
      raise "contains ques" if /\?/ =~ @str #?が含まれている?
      return nil
    end

  end
end
