# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

module CHISE
  module UTF8Value
    def u8toi(str)
      raise if str.nil?

      i = 0
      len = str.length

      raise unless 1 <= len

      c = str[i]
      i += 1

      if ( c < 0xC0 )
	cid = c
	counter = 0
      elsif ( c < 0xE0 )
	cid = c & 0x1f
	counter = 1
      elsif ( c < 0xF0 )
	cid = c & 0x0f
	counter = 2
      elsif ( c < 0xF8 )
	cid = c & 0x07
	counter = 3
      elsif ( c < 0xFC )
	cid = c & 0x03
	counter = 4
      else
	cid = c & 0x01
	counter = 5
      end

      if (counter + 1 <= len)
	(0...counter).each {|j|
	  cid = (cid << 6) | (str[j + i] & 0x3F)
	}
	return cid
      end

      raise
    end

    def itou8(cid)
      raise unless cid.kind_of?(Integer)
      if (cid <= 0x7F)
	return ""+cid.chr
      elsif (cid <= 0x7FF)
	dest = "  "
	dest[0] = (cid >> 6) | 0xC0
	dest[1] = (cid & 0x3F) | 0x80
	return dest
      elsif (cid <= 0xFFFF)
	dest = "   "
	dest[0] =  (cid >> 12) | 0xE0
	dest[1] = ((cid >>  6) & 0x3F) | 0x80
	dest[2] =  (cid        & 0x3F) | 0x80
	return dest
      elsif (cid <= 0x1FFFFF)
	dest = "    "
	dest[0] =  (cid >> 18) | 0xF0
	dest[1] = ((cid >> 12) & 0x3F) | 0x80
	dest[2] = ((cid >>  6) & 0x3F) | 0x80
	dest[3] =  (cid        & 0x3F) | 0x80
	return dest
      elsif (cid <= 0x3FFFFFF)
	dest = "     "
	dest[0] =  (cid >> 24) | 0xF8
	dest[1] = ((cid >> 18) & 0x3F) | 0x80
	dest[2] = ((cid >> 12) & 0x3F) | 0x80
	dest[3] = ((cid >>  6) & 0x3F) | 0x80
	dest[4] =  (cid        & 0x3F) | 0x80
	return dest
      else
	dest = "      "
	dest[0] =  (cid >> 30) | 0xFC
	dest[1] = ((cid >> 24) & 0x3F) | 0x80
	dest[2] = ((cid >> 18) & 0x3F) | 0x80
	dest[3] = ((cid >> 12) & 0x3F) | 0x80
	dest[4] = ((cid >>  6) & 0x3F) | 0x80
	dest[5] =  (cid        & 0x3F) | 0x80
	return dest
      end
    end
  end
end
