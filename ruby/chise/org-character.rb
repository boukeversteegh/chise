module CHISE
  class Character
    def mcs_hex() sprintf("%x", @char_id) end

    def char_feature_alist() check_all_database(); @features; end
    def char_feature_list()  check_all_database(); @features.keys; end
    alias alist char_feature_alist
    alias list  char_feature_list

    def has_feature?() # �Ӗ��̂���feature�������Ă܂���?
      keys = list
      keys.delete_if {|k|
	k =~ /ids/
      }
      return (keys.length != 0)
    end

    def check_database(a)
      db = CharDB.instance
      u8 = mcs_utf8()
      db.get(a, u8) # u8�ŕ\����镶����a�A�g���r���[�g�𒲂ׂ�B
    end

    def check_all_database() # ���݂�@char_id����A�����f�[�^�x�[�X���Q�Ƃ���
      return if @check_all_database
      return if @char_id.nil?
      db = CharDB.instance
      u8 = mcs_utf8()
      atrs = db.get_all(u8) #u8�ŕ\����镶���̃A�g���r���[�g��S�������Ă���
      atrs.each {|a,v|
	@features[a] = v #�Ƃ����������ő������̂ł�������?
      }
      @check_all_database = true #�d�������Ȃ̂ňꉞcheck����
    end

    def ucs()
      #p "ucs"
      #ar=%w{ucs ucs-big5 ucs-cdp ucs-cns ucs-jis ucs-ks =>ucs =>ucs* =>ucs-jis}
      #ar=%w{ucs ucs-jis ucs-big5 ucs-cdp ucs-cns ucs-ks =>ucs =>ucs* =>ucs-jis}
      ar = %w{ucs-jis ucs =>ucs-jis}
      #���я��͜��ӓI�ŁAucs-jis���ɏo���Ă���B�{���͂�����w��ł���悤�ɂ���ׂ��B
      ar.each {|a|	#p [a]
	u = get_char_feature(a)
	return u if u
      }
      nil
    end

    #-------------------------------------------------------------------CCS�֌W
    def to_utf8() Uconv.u4tou8(Character.u4itou4(ucs())) end #UTF8�������Ԃ�
    #alias to_s to_utf8
    alias to_s mcs_utf8

    def map_utf8()
      u = ucs()
      if u.nil? || 0xffff < u
	return to_er()
      else
	return to_utf8()
      end
    end
    alias map_ucs map_utf8

    def map_ucs_er()
      u = ucs()
      if u.nil? || 0xffff < u
	return to_er()
      else
	return Character.get(u).to_er()
      end
    end

    def to_euc()
      u = ucs()
      return "" if u.nil? || 0xffff < u
      Uconv.u16toeuc(Uconv.u4tou16(Character.u4itou4(ucs())))
    end

    def map_euc()
      e = to_euc()
      return e if e != ""
      return to_er()
    end

    def to_sjis()
      u = ucs()
      return "" if u.nil? || 0xffff < u
      Uconv.u16tosjis(Uconv.u4tou16(Character.u4itou4(ucs())))
    end

    def map_sjis()
      e = to_sjis()
      return e if e != ""
      return to_er()
    end

    def to_er_list()
      ar = []
      EntityReference.each_codesys {|codesys, er_prefix, keta, numtype|
	er = to_er(codesys)
	ar << er if er
      }
      ar
    end

    def inspect_all_codesys() #������
      #to_er��S�Ă�codesys�ɂ����Ď��s����B���̌��ʂ��R���p�N�g�ɂ܂Ƃ߂�
    end

    def inspect_all()
      ar = [inspect.chop]
      alist.to_a.sort.each {|a, v| ar << "#{a}:#{v}" }
      return ar.join(",")+">"
    end

    def dump_all()
      ar = [inspect]
      alist.to_a.sort.each {|a, v| ar << "#{a}:#{v}" }
      return ar.join('\n')+'\n'
    end

    def get_features()
      str = ""
      alist.to_a.sort.each {|a, v|
	str += "#{a}: #{v}\n"
      }
      str
    end

    def inspect_ids(hex_flag=false)
      ids = decompose
      ar = []
      ar << (hex_flag ? "x"+mcs_hex : to_utf8)
      if to_s != ids #ids�����i���̂��̂������畔�i�ǉ��͂��Ȃ�
	ids.each_char {|ch|
	  char = ch.char
	  next if char.is_ids?
	  if hex_flag then
	    ar << "x"+char.mcs_hex
	  else
	    u = char.to_utf8
	    if u != ""
	      ar << u
	    else
	      ar << char.to_er
	    end
	  end
	}
      end
      return "("+ar.join("\t")+")"
    end

  end
end
