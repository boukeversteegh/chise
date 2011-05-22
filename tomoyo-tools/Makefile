#
# Makefile for TOMOYO-tools.
#

PACKAGE = tomoyo-tools
VERSION	= 0.25

TAR	= tar
RM	= /bin/rm -f
CP	= /bin/cp -p

EMACS	= emacs
XEMACS	= xemacs
FLAGS   = -batch -q -no-site-file -l TOMOYO-MK

PREFIX	= NONE
LISPDIR = NONE
PACKAGEDIR = NONE
VERSION_SPECIFIC_LISPDIR = NONE

GOMI	= *.elc

ARC_DIR = /var/www/chise/dist/XEmacs


elc:	package

install-elc:	install-package

install:	install-elc


package:
	$(XEMACS) $(FLAGS) -f compile-tomoyo-package $(PACKAGEDIR)

install-package:	package
	$(XEMACS) $(FLAGS) -f install-tomoyo-package $(PACKAGEDIR)


clean:
	-$(RM) $(GOMI)


tar:
	cvs commit
	sh -c 'cvs tag -R $(PACKAGE)-`echo $(VERSION) | tr . _`; \
	cd /tmp; \
	cvs -d :pserver:anonymous@cvs.m17n.org:/cvs/chise \
		export -d $(PACKAGE)-$(VERSION) \
		-r $(PACKAGE)-`echo $(VERSION) | tr . _` \
		tomoyo-tools'
	$(RM) /tmp/$(PACKAGE)-$(VERSION)/ftp.in
	cd /tmp; $(TAR) cvzf $(PACKAGE)-$(VERSION).tar.gz $(PACKAGE)-$(VERSION)
	cd /tmp; $(RM) -r $(PACKAGE)-$(VERSION)
	sed "s/VERSION/$(VERSION)/" < ftp.in | sed "s/API/$(API)/" \
		| sed "s/PACKAGE/$(PACKAGE)/" \
		> ftp

release:
	-$(RM) $(ARC_DIR)/$(PACKAGE)-$(VERSION).tar.gz
	mv /tmp/$(PACKAGE)-$(VERSION).tar.gz $(ARC_DIR)
