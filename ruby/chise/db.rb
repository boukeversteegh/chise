# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

require "singleton"
require "bdb"
require "chise/config"
require "chise/rbchise"
require "chise/util"

module NotUse_CHISE

  class DBS # collection of DBs. not yet
  end

  class ADB < BDB::Hash # A DataBase.
    def initialize(*args)
      super
      @filename = args[0]
      @modified = false
      at_exit {
#	p ["at_exit", @filename, @modified]
	if @modified
#	  p ["close", @filename, @modified]
	  self.close #これがないと、うまくデータベースがセーブされないのです。
	end
      }
    end

    def self.open_create(filename)
      ADB.open(filename, nil, BDB::CREATE | BDB::EXCL) #上書きはしない
    end
a
    def mykey(key)
      if key.is_a?(String)
	if key.char_length == 1
	  return "?"+key  #Stringだったら引く前に?を足す
	end
      end
      #key = key.to_s if key.is_a?(Numeric) #NumberだったらStringにする。
      #ここで && key ! =~ /^\?/ をいれると、?自身を検索できなくなってしまう。
      return key
    end

    def myget(key) #keyキーを引いて返す
      key = mykey(key)
      v = get(key) #存在しなかったらnilを返すことになる
      return myvalue(v)
    end

    def myput(key, v) #keyにvをいれる
      key = mykey(key)
      put(key, v) #putする
      @modified = true
    end
  end

  class DB # abstract class for DataBase
    def get_filename(t)
      return @pre + CHISE.unix_to_win(t) + @post if CHISE.windows?
      return @pre + t + @post
    end

    def get_dirname(t)
      File.dirname(get_filename(t))
    end

    def open_dbs()
      @dbs = Hash.new
      keys = find_keys()
      keys.each {|key| open_db(key) }
    end

    def find_keys()
      files = []
      Dir.glob(@glob){|f|
	next if ! File.file?(f)
	next if f =~ /.txt$/
	files << f
      }
      keys = []
      files.each {|f|
	t = CHISE.win_to_unix(f)
	t.sub!(%r|^#{@pre}|, "")
	t.sub!(%r|#{@post}$|, "") if @post != ""
	keys << t
      }
      keys
    end

    def close_db(t)
      db = get(t)
      return nil if db.nil?
      db.close
      @dbs.delete(t)
    end

    def open_db(t)
      return nil if get(t) #すでにopenしていたら再openはしない。
      begin
	bdb = ADB.open(get_filename(t), nil, 0)
	@dbs[t] = bdb if bdb != nil
      rescue
	p ["open error", get_filename(t)]; return nil
      end
      true
    end

    def make_db(t, h=nil) #tという名前でhという中身のデータベースを作る
      return nil if get(t) #すでにある場合はreturn
      Dir.mkdir(get_dirname(t)) unless FileTest.exist?(get_dirname(t))
      db = nil
      begin
	db = ADB.open_create(get_filename(t)) #上書きはしない
	if h != nil
	  h.each {|k, v|
	    k = "?"+k if k.is_a?(String)
	    db[k] = v
	  }
	end
	db.close
      rescue
	p ["make error", get_filename(t)]; return nil
      end
      true
    end

    def make_db_no_question_mark(t, h=nil) #tという名前でhという中身のデータベースを作る
      return nil if get(t) #すでにある場合はreturn
      Dir.mkdir(get_dirname(t)) unless FileTest.exist?(get_dirname(t))
      db = nil
      begin
	db = ADB.open_create(get_filename(t)) #上書きはしない
	if h != nil
	  h.each {|k, v|
	    #	     k = "?"+k if k.is_a?(String)
	    db[k] = v
	  }
	end
	db.close
      rescue
	p ["make error", get_filename(t)]; return nil
      end
      true
    end

    def remove_db(t) #tという名前のデータベースを消去する
      db = get(t)
      if db
	db.close
	@dbs.delete(t)
      end
      begin
	File.unlink(get_filename(t)) if FileTest.file?(get_filename(t))
      rescue
	p ["unlink error", get_filename(t)]; return nil
      end
      dn = get_dirname(t)
      Dir.rmdir(dn) if FileTest.directory?(dn) && Dir.entries(dn).length <= 2 #空directoryだったら消す
      true
    end

    def to_num(s)
      return s.to_i if s =~ /^\d+$/
      s
    end

    def dump_db(t)
      db = get(t)
      return nil unless db
      file = get_filename(t)
      open("#{file}.txt", "w"){|out|
	#	 out.binmode.sync = true
	ar = db.to_a
	ar.map! {|k, v| [to_num(k), to_num(v)] }
	ar.sort.each {|k, v|
	  out.printf("%s\t%s\n", k, v)
	}
      }
      true
    end

    def each_db()  @dbs.to_a.sort.each {|t, db| yield(t, db) } end
    def dump_all()  each_db {|t, db| dump_db(t) } end
    def close_all() each_db {|t, db| db.close   } end
    def keys() @dbs.keys end

    def each(t)
      return unless block_given?
      db = @dbs[t]
      return nil unless db
      db.each {|k, v|
	k = to_num(k)
	v = to_num(v)
	k.sub!(/^\?/, "") if k =~ /^\?/ #冒頭の?は取り除く
	vv = get(t, k)	#p ["each", t, k, v, vv]
	yield(k, vv)
      }
    end

    def each_sort(t)
      return unless block_given?
      db = @dbs[t]
      return nil unless db
      ar = db.to_a
      ar.map! {|k, v| [to_num(k), to_num(v)] }
      ar.sort.each {|k, v|
	k.sub!(/^\?/, "") if k =~ /^\?/ #冒頭の?は取り除く
	vv = get(t, k)	#p ["each", t, k, v, vv]
	yield(k, vv)
      }
    end

    def get(t, key=nil) #tというデータベースのkeyキーを引いて返す
      db = @dbs[t]
      return db if key.nil?
      return nil unless db
      db.myget(key)
    end

    def put(t, key, v) #tというデータベースのkeyにvをいれる
      db = @dbs[t]
      if db == nil
	db = make_db(t) 
	db = open_db(t) 
	db = @dbs[t]
      end
      db.myput(key, v) #putする
    end
  end

  class CharDB < DB # An Attribute DataBase.  Key is in UTF8-MCS.
    include Singleton

    def initialize()
      super
      dir = Config.instance.db_dir
      @glob, @pre, @post = "#{dir}/system-char-id/*", "#{dir}/system-char-id/", ""
      open_dbs()
    end

    def get_all(u8) #全データベースのu8キーを引いてHashにまとめて返す
      atrs = Hash.new
      @dbs.each {|t, db|
	v = get(t, u8)
	atrs[t] = v if v != nil
      }
      atrs
    end
  end

  class CodesysDB < DB # A CodeSystem DataBase.
    include Singleton

    def initialize()
      super
      dir = Config.instance.db_dir
      @glob, @pre, @post = "#{dir}/*/system-char-id", "#{dir}/", "/system-char-id"
      open_dbs()
    end

    #def keys() @dbs.keys.sort end #どんなCodesysの情報を持っているかの一覧
    def keys() @dbs.keys end #どんなCodesysの情報を持っているかの一覧

    def get_codesys(t)
      db = get(t)
      return nil unless db
      return Codesys.new(t)
    end
  end

  class Codesys < DB
    def initialize(name)
      #super
      @name = name
      @dbs = CodesysDB.instance
    end

    def keys() #どんなコードポイントの情報を持っているかの一覧
      ks = @dbs.get(@name).keys
#      if @name =~ /jisx0208/ #特別処理
#	n = @dbs.get("=jis-x0208").keys 
#	#	 p ["keys", @name, ks, n]
#	ks += n
#      end
      ks.map! {|k| to_num(k) }
      ks
    end

    def get(key)
      v = @dbs.get(@name, key)
      return v if v
#      if @name =~ /jisx0208/ #jisx0208が含まれている場合だけ特別処理する
#	return @dbs.get("=jis-x0208", key)
#      end
      return nil
    end

    def each()
      return unless block_given?
      db = @dbs.get(@name)
      return nil unless db
      db.each {|k, v|
	k = to_num(k)
	v = to_num(v)
	k.sub!(/^\?/, "") if k =~ /^\?/ #冒頭の?は取り除く
	vv = @dbs.get(@name, k)	#p ["each", t, k, v, vv]
	yield(k, vv)
      }
    end

    def each_sort()
      return unless block_given?
      db = @dbs.get(@name)
      return nil unless db
      ar = db.to_a
      ar.map! {|k, v| [to_num(k), to_num(v)] }
      ar.sort.each {|k, v|
	k.sub!(/^\?/, "") if k =~ /^\?/ #冒頭の?は取り除く
	vv = @dbs.get(@name, k)	#p ["each", t, k, v, vv]
	yield(k, vv)
      }
    end
  end

  class JISX0208
    def initialize
      db = CodesysDB.instance
      @common = db.get_codesys("=jis-x0208")
      @newest = db.get_codesys("japanese-jisx0208-1990")
    end

    def get_char(code)
      char = @common.get(code)
      return char unless char.nil?
      char = @newest.get(code)
      return char unless char.nil?
      return nil
    end

  end
end
