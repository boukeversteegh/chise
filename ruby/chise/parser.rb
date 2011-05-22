# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "chise/chisedb"
require "chise/utf8"

module CHISE
  module EntityReferenceModule
    PART    = "&([-+0-9A-Za-z#]+);"
    ALL     = '\A'+PART+'\Z'
    PART_RE = Regexp.new(PART)
    ALL_RE  = Regexp.new(ALL)

    def contain_er?(s)	(PART_RE =~ s) != nil;	end
    def is_er?(s)	(ALL_RE =~ s)  != nil;	end

    # the order is important.  The primary charset should be selectable.
    CCS_TABLE = [
      %w( =jis-x0208-1990	J90- 4 X),
      %w( =jis-x0208-1983	J83- 4 X),
      %w( =jis-x0208-1978	J78- 4 X),
      %w( =jis-x0208		J90- 4 X), # 継承のアドホックな実装
      %w( =jis-x0208		J83- 4 X), # 継承のアドホックな実装
      %w( =jis-x0208		J78- 4 X), # 継承のアドホックな実装
      %w( =jis-x0213-1-2000	JX1- 4 X),
      %w( =jis-x0213-2-2000	JX2- 4 X),
      %w( =jis-x0212		JSP- 4 X),
      %w( =big5-cdp		CDP- 4 X),
      %w( =big5			B-   4 X),
      %w( =cns11643-1		C1-  4 X),
      %w( =cns11643-2		C2-  4 X),
      %w( =cns11643-3		C3-  4 X),
      %w( =cns11643-4		C4-  4 X),
      %w( =cns11643-5		C5-  4 X),
      %w( =cns11643-6		C6-  4 X),
      %w( =cns11643-7		C7-  4 X),
      %w( =ks-x1001		K0-  4 X),
      %w( =daikanwa		M-   5 d),
      %w( =cbeta		CB   5 d),
      %w( =gt			GT-  5 d),
      %w( =gt-k			GT-K 5 d),
      %w( =hanziku-1		HZK01- 4 X),
      %w( =hanziku-2		HZK02- 4 X),
      %w( =hanziku-3		HZK03- 4 X),
      %w( =hanziku-4		HZK04- 4 X),
      %w( =hanziku-5		HZK05- 4 X),
      %w( =hanziku-6		HZK06- 4 X),
      %w( =hanziku-7		HZK07- 4 X),
      %w( =hanziku-8		HZK08- 4 X),
      %w( =hanziku-9		HZK09- 4 X),
      %w( =hanziku-10		HZK10- 4 X),
      %w( =hanziku-11		HZK11- 4 X),
      %w( =hanziku-12		HZK12- 4 X),
      %w( =ruimoku-v6		RUI6-  4 X),
      %w( =jef-china3		JC3-   4 X),
    ]
  end

  class CharacterParser
    include EntityReferenceModule
    include UTF8Value

    PRIVATE_USE_AREA = 0xe000

    def parse(c) # parse a value and return a number (MCS)
      raise "c is nil" if c.nil?

      if c.kind_of?(String)
	if /\A\?/ =~ c
	  c = c.sub(/\A\?/, "") # remove "?" in the head
	  #u4 = c.u8tou32 # translate from UTF-8 to UTF-32
	  #return u4.u32to_i # translate UTF-32 to UCS number
	  return u8toi(c)
	end

	return parse_er(c) if is_er?(c) # ER?

	return c.to_i if /^\d+$/ =~ c # only numbers?

	raise "unknown format"
      end

      if c.kind_of?(Numeric)
	c = 0x80000000 + c if c < 0 # negative value
	return c.to_i
      end
      
      raise "unknown object"
    end

    def parse_er(s) # parse a Entity Reference and return a number (MCS)
      raise "wrong ER." unless ALL_RE =~ s # don't use is_er? for getting $1.

      s = $1 # extract the part of ER

      return $1.hex if s =~ /\AMCS-([0-9A-Fa-f]+)\Z/ # MCS. It's a mystery.

      return $1.hex if s =~ /\AU[-+]?([0-9A-Fa-f]+)\Z/ ||
	  s =~ /\A#x([0-9A-Fa-f]+)\Z/ # Unicode code point in Hex.

      return $1.to_i if s =~ /\A#([0-9]+)\Z/ # Unicode code point in Decimal.

      if s =~ /\Amy-([0-9]+)\Z/ # my own code point. It's a secret.
	return PRIVATE_USE_AREA + $1.to_i # private use area of Unicode.
      end

      if s =~ /\AI-/ # I- stands for Isolated character. It's a wonder.
	s = s.sub(/\AI-/, "")
      end

      CCS_TABLE.each {|ccs, er_prefix, keta, numtype|
	if numtype == "d"
	  nre = '\d'
	elsif numtype == "X"
	  nre = "[0-9A-Fa-f]"
	else
	  next
	end

	re = "\\A#{er_prefix}(#{nre}{#{keta},#{keta}})\\Z"
	next unless Regexp.new(re) =~ s
	#qp s

	codestr = $1
	if numtype == "d"
	  code = codestr.to_i
	else
	  code = codestr.hex
	end

	u8 = get_ccs(ccs, code)
	#qp ccs, s, u8
	next if u8.nil?

	num = parse(u8)
	next if num.nil?

	return num
      }

      raise "unknown Entity Reference"
    end

    private
    def get_ccs(ccs, code_point)
      cd = ChiseDB.instance
      cd.decode_char(ccs, code_point)
    end
  end

  class EntityReferenceParser
    include EntityReferenceModule

    def de_er(s) # replace EntityReference with corresponding character.
      return s unless PART_RE =~ s # don't use contain_er? to get $1

      er = "&"+$1+";"
      char = Character.get(er)
      ss = s.sub(Regexp.new(Regexp.escape(er)), char.utf8_mcs)

      return de_er(ss) if contain_er?(ss) # recursive
      ss
    end
  end

  class EntityReferenceEncoder
    include EntityReferenceModule

    def to_er(char)
      cid = char.char_id
      return "&#x%04x;" % cid if cid <=  0xffff
      return "&#x%05x;" % cid if cid <= 0xfffff

      CCS_TABLE.each {|ccs, er_prefix, keta, numtype|
	code = char[ccs]
	next if code.nil?
	return "&#{er_prefix}%0#{keta}#{numtype};" % code
      }

      "&MCS-%08X;" % cid # the last answer
    end

    def to_er_by_ccs(cid, ccs) # not yet
    end

  end
end
