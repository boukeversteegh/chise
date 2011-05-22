# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

all:
	echo "see Makefile"

define-kanji:
	ruby define-kanji-meaning.rb

dump:
	ruby dump-database.rb

tarball:
	ruby make-chisedb-tarball.rb /usr/local/lib/xemacs-21.4.14/i686-pc-linux/chise-db

ids-db:
	ruby make-ids-database.rb

move-obsolete:
	ruby move-obsolete-files.rb

rename-files:
	ruby rename-files.rb

cleandump:
	-rm ../../chise-db/character/by_feature/*.txt
	-rm ../../chise-db/character/feature/*.txt

cleanidsdb:
	-rm ../../chise-db/character/by_feature/ids*
	-rm ../../chise-db/character/by_ids/ids*
	-rm ../../chise-db/character/feature/ids*

scp-chisedb:
	scp aqua.eto.com:work/chise/ruby/tools/chise-db.tar.gz .
