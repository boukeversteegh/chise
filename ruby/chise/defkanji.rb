# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "singleton"

module CHISE
  class IDS_Definition
    include Singleton

    #●ids-element: stop-character。これ以上分割しない、基本要素文字。
    #その文字自身を値として持つ。それ以外の値を持つ場合は、それを代りの値として使うことを意味する。
    #つまり、101字の基本漢字は最小構成要素なので、それ以上分解しませんよ、ということ。
    IDS_ELEMENT = "六百回交向歩考出書多少高可"
    BASIC_KANJI = "人子女母父王口耳手足力目首毛心犬牛鳥貝角羽虫馬魚羊肉皮米竹木麦豆山川雨風水土石金田穴日月火音糸刀舟門戸衣矢弓車皿一二三四五六七八九十百千万寸尺上中下本玉立回食行止交向歩考入示走生出来書言大小白青多少高長"

    AWASE_KANJI = "鳴名加品古知問間聞取兄見切分粉貧林森校東明住位好岩砂里男畑習休短空坂島倉美孝赤看光初努協解新歌語話張強忘悲答晴現正字安守灰秋秒困国医包同合舌居右左受友反道返迷花菜集机主太氷州点店庫仕帳幼防引配早直班筆重番北化比死夏後進酒福私家世内谷半原前寺思電雲気布旅衆泣"

    #●ids-meaning: 意味的に考えるところのIDS。形としてはつながらないが、意味としてはこう分割できるというものを表す。
    IDS_MEANING = "
見	⿱目儿
東	⿻木日
里	⿱田土
赤	⿱大火
舌	⿱千口
太	⿻大丶
#州	⿻砂川
#重	⿱?土
世	⿺十⿰十十
内	⿵冂入
谷	⿱⿱八&CDP-8B5D;口
半	⿱八牛
孝	⿱老子
島	⿹鳥山
美	⿱羊大
看	⿸手目
倉	⿸食口
強	⿰弓⿱厶虫
&#x4e51;	⿲人人人
果	⿱田木
比	⿰匕匕
鼓	⿰&#x58f4;支
#承
鼻	&#x2ff3;自田廾
風	&#x2ff5;几⿱丿虫
#夜
&CDP-8C47;	⿰亡月
黙	⿺黒犬
".split("\n")

    #●ids-represent: これを持つもつ字は、それ以外の字を意味するということを意味する。
    #例えば人偏は、人を意味する。これは再帰的に摘要する。
    IDS_REPRESENT = "
&#x4ebb;	人
&CDP-8B5D;	人
&#x8864;	衣
&#x20086;	厂
&#x20087;	厂
&#x2ea1;	水
&#x6c35;	水
&CDP-8CCC;	羊
&#x2634c;	羊
&CDP-8B52;	老
&CDP-8CBB;	鳥
&CDP-8BEA;	刀
&#x5202;	刀
朩	木
&#x2ea9;	王
&#x571f;	土
&#x2090e;	匕
&CDP-8BC4;	泉
&#x2ed7;	雨
&CDP-8BE8;	申
&#x7cf9;	糸
&#x2eca;	足
&J90-5469;	夂
&CDP-8BD5;	西
&CDP-8BA9;	牛
&#x2eae;	竹
&#x9ed1;	黒
&CDP-8971;	冫
".split("\n")

    #●ids-link: 横列びの関係があるもの
    IDS_LINK = "
&#x826e;	&CDP-8B7C;
&CDP-8B48;	四
&#x5bf8;	&#x624d;
&#x3405;	米
#この部品はいろいろあるのだけど…。
".split("\n")

    def check
      #show_ids(IDS_ELEMENT) #ar = BASIC_KANJI+IDS_ELEMENT
      #show_ids(IDS_MEANING.join())
      #show_ids(KanjiList.instance.joyo)
      #show_ids(KanjiList.instance.awase(0))
      #show_ids(open("0208-shell.txt").read)
      #p "&U+2ff2;".de_er
      #p "休".decompose.to_er
      eval_print_loop
    end

    def show_ids(str)
      str.de_er.to_a.sort.uniq.each {|ch|
	char = ch.char
	ids = char.decompose_all
	print "#{char}	#{ids.map_ucs}\n" #できるだけucsに正規化するべし。
      }
    end

    def eval_print_loop
      while true
	line = STDIN.gets
	line.chomp!
	exit if line.nil? || line =~ /end/
	print "#{line.decompose}	#{line.decompose.to_er}\n"
	print "#{line.decompose_all}	#{line.decompose_all.to_er}\n"
      end
    end

    def define_all
      define_ids_element
      define_ids_meaning
      define_ids_represent
      define_ids_link
    end

    def define_ids_element
      IDS_ELEMENT.each_char {|ch|
	char = ch.char
	char.ids_element = ch
      }
    end

    def define_ids_meaning
      IDS_MEANING.each {|line|
	next if line.nil? || line == "" || line =~ /^#/
	ch, ids = line.split
	char = ch.de_er.char
	char.ids_meaning = ids.de_er
	print "#{ch}	#{ids}\n"
      }
    end

    def define_ids_represent
      IDS_REPRESENT.each {|line|
	next if line.nil? || line == "" || line =~ /^#/
	ch, rep = line.split
	char = ch.de_er.char
	char.ids_represent = rep.de_er
	print "#{char.map_ucs}	#{rep}\n"
      }
    end

    def define_ids_link
      IDS_LINK.each {|line|
	next if line.nil? || line == "" || line =~ /^#/
	ch, rep = line.split
	char = ch.de_er.char
	char.ids_link = rep.de_er
	print "#{char.map_ucs}	#{rep}\n"
      }
    end

  end
end

if $0 == __FILE__
  $LOAD_PATH << "../../src"
  require "chise"
  include CHISE
  ide = CHISE::IDS_Definition.instance
#  ide.go
  ide.define_all
end
