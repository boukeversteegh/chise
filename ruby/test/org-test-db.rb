#!/usr/bin/env ruby
# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.
# This file is in SJIS charset.  Japanese Character -> 漢字.

require "common"

class TestDataBase < Test::Unit::TestCase
  def setup
    @cdb = CHISE::CharDB.instance
    @sdb = CHISE::CodesysDB.instance
  end

  def test_each_db(db)
    assert_instance_of(Array, db.keys)
  end

  def test_make_db(db)
    h = {"a" => 1, "b" => 2, "c" => 3}
    db.remove_db("test-db") #まず最初に消しておく
    assert_not_nil(db.make_db("test-db", h))
    assert_not_nil(db.open_db("test-db"))
    assert_equal(1, db.get("test-db", "a"))
    assert_equal(2, db.get("test-db", "b"))
    assert_equal(3, db.get("test-db", "c"))
    db.remove_db("test-db") #最後にまた消しておく
  end

  def test_dbs
    test_each_db(@cdb)
    test_each_db(@sdb)
#    test_make_db(@cdb)
#    test_make_db(@sdb)
  end
end

class TestCodesys < Test::Unit::TestCase
  def setup
    @db = CHISE::CodesysDB.instance
  end

  def test_db_length
    assert_equal(6287, @db.get("=jis-x0208").keys.length)
    assert_equal(590,  @db.get("japanese-jisx0208").keys.length)
    assert_equal(499,  @db.get("japanese-jisx0208-1978").keys.length)
    assert_equal(593,  @db.get("japanese-jisx0208-1990").keys.length)
    assert_equal(6067, @db.get("japanese-jisx0212").keys.length)
    assert_equal(1697, @db.get("japanese-jisx0213-1").keys.length)
    assert_equal(2345, @db.get("japanese-jisx0213-2").keys.length)
    assert_equal(4270, @db.get("ucs-jis").keys.length)
  end

  def test_db
    keys = @db.keys
    assert_instance_of(Array, @db.keys, "db.keys")
    db = @db.get("ascii")
    assert_equal(128, db.keys.length, "can get keys")
    assert_equal(63,   @db.get("katakana-jisx0201").keys.length)
    assert_equal(94,   @db.get("latin-jisx0201").keys.length)

    counter = 0
    @db.each("=jis-x0208"){|k, v| #引数のCodesysデータベースのそれぞれに対して実行する
      er0 = sprintf("&J90-%04X;", k)
      er1 = CHISE::Character.new(v).to_er
      counter += 1; break if 10 < counter
    }
  end

  def test_jis_codesys
    db = CHISE::CodesysDB.instance
    codesys = db.get_codesys("=jis-x0208")
    ks = codesys.keys.sort #とすることによって、JISX0208 1990の集合全部のkeysが得られる
#   assert_equal(6880, ks.length)
    assert_equal(8481, ks.first)
    assert_equal(29566, ks.last)
    char = codesys.get(15226) #"字"
    assert_equal("字".su, char.to_s)

    assert_equal("亜".su, codesys.get(12321))
    jis = "亜".su.char.japanese_jisx0208_1990
#    assert_equal("亜", codesys.get(jis))
#    assert_equal("亜", sprintf("&J90-%04X;", jis).de_er)

#    codesys = db.get_codesys("japanese-jisx0208-1990") #旧名
    codesys = db.get_codesys("=jis-x0208-1990")
    assert_equal(8481, ks.first)
    assert_equal(29566, ks.last)
  end

end
