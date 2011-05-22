# Copyright (C) 2002-2004 Kouichirou Eto, All rights reserved.

RUBY=ruby

test:
	$(RUBY) -I. all.rb

idsdb:
	ruby test-idsdb.rb

clean:
	-rm *~

cleandump:
	-rm ../../chise-db/character/by_feature/*.txt
	-rm ../../chise-db/character/feature/*.txt

cleanidsdb:
	-rm ../../chise-db/character/by_feature/ids*
	-rm ../../chise-db/character/by_ids/ids*
	-rm ../../chise-db/character/feature/ids*
