VERSION = 0.3.0

TAR	= tar

PREFIX		= /usr/local
LIBCHISE_OPTS	= 
XEMACS_OPTS	= --site-includes=/sw/include:/sw/include/db4 \
	--site-libraries=/sw/lib


all:	config-libchise build-libchise

config-libchise: libchise
	cd libchise && ./configure $(LIBCHISE_OPTS)

build-libchise:
	cd libchise && make

install:	install-libchise install-db

install-libchise:
	cd libchise && make install

install-db:
	(cd chise-db; tar cvf - lib share/chise) \
		| (cd $(PREFIX); tar xvf -)


config-xemacs:	xemacs-chise
	cd xemacs-chise && ./configure --with-chise --without-xim --pdump \
		$(XEMACS_OPTS) --with-database=berkdb

build-xemacs:		config-xemacs
	cd xemacs-chise && make

install-xemacs:
	cd xemacs-chise && make install

install-ids:	ids
	cd ids && make install


generate-db:	install-xemacs install-ids

chise-db:
	-mkdir chise-db
	(cd $(PREFIX); tar cvf -  share/chise \
		lib/xemacs-21.4.15/etc/chise-db ) \
		| (cd chise-db; tar xvf - )

tar:
	cd /tmp; mkdir chise-base-$(VERSION)
	#rsync -av Makefile libchise chise-db \
	#	 xemacs-chise ids 
	#	/tmp/chise-base-$(VERSION)
	rsync -av Makefile libchise chise-db /tmp/chise-base-$(VERSION)
	cd /tmp; tar cvzf chise-base-$(VERSION).tar.gz \
		chise-base-$(VERSION)

libchise:
	cvs -d :pserver:anonymous@cvs.m17n.org:/cvs/chise login
	cvs -d :pserver:anonymous@cvs.m17n.org:/cvs/chise co libchise

xemacs-chise:
	cvs -d :pserver:anonymous@cvs.m17n.org:/cvs/chise login
	cvs -d :pserver:anonymous@cvs.m17n.org:/cvs/chise co \
		-d xemacs-chise xemacs

ids:
	cvs -d :pserver:anonymous@cvs.m17n.org:/cvs/chise login
	cvs -d :pserver:anonymous@cvs.m17n.org:/cvs/chise co ids


distclean:
	cd libchise; make distclean
	cd xemacs-chise; make distclean
	cd ids; make clean
