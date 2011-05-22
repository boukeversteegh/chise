# Makefile
#

CC=gcc -Wall
INSTALL=install
WGET=wget
BINDIR=/usr/local/bin
SHAREDIR=/usr/local/share/kagecgi
DBURL=http://fonts.jp/kagedb/kagedb

CFLAGS=
LIBS= -lpng -ldb -lm

#for MacOSX with fink
#CFLAGS= -I/sw/include -I/sw/include/db3 -I/sw/include/libpng/
#LIBS= -L/sw/lib -lpng -ldb

all: kage.cgi

kage.cgi: kagecgi.o kagepng.o kagedf.o kagecd.o kageic.o kagepoly.o kagedb.o kageeg.o kagecomb.o kagechar.o kagetool.o kagestr.o
	$(CC) $(CFLAGS) -o kage.cgi kagecgi.o kagepng.o kagedf.o kagecd.o kageic.o kagepoly.o kagedb.o kageeg.o kagecomb.o kagechar.o kagetool.o kagestr.o $(LIBS)

kagecgi.o: kagecgi.c
kagedf.o: kagedf.c
kagecd.o: kagecd.c
kageic.o: kageic.c
kagepoly.o: kagepoly.c
kagedb.o: kagedb.c
kageeg.o: kageeg.c
kagechar.o: kagechar.c
kagecomb.o: kagecomb.c
kagetool.o: kagetool.c
kagepng.o: kagepng.c
kagestr.o: kagestr.c

clean:
	\rm -r -f *.o *~ *.exe *.cgi *.stackdump kagedb

install: kage.cgi
	mkdir -p $(BINDIR)
	$(INSTALL) -c -m 755 kage.cgi $(BINDIR)
	mkdir -p $(SHAREDIR)
	$(INSTALL) -c -m 644 error.png $(SHAREDIR)

kagedb:
	$(WGET) $(DBURL)

database: kagedb
	$(INSTALL) -c -m 644 kagedb $(SHAREDIR)
