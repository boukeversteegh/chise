#   Makefile for Microsoft NMAKE
#   Copyright (C) 1995 Board of Trustees, University of Illinois.
#   Copyright (C) 1995, 1996, 2000 Ben Wing.
#   Copyright (C) 1995 Sun Microsystems, Inc.
#   Copyright (C) 1998 Free Software Foundation, Inc.
#
# This file is part of XEmacs.
#
# XEmacs is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any
# later version.
#
# XEmacs is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with XEmacs; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.
#
# Synched up with: Not in FSF.
#

TARGETOS=BOTH
APPVER=4.0

default: all

# APA: Since there seems to be no way to determine the directory where
# xemacs.mak is located (from within nmake) we just insist on the user
# to invoke nmake in the directory where xemacs.mak is.
!if !exist("$(MAKEDIR)\setup.mak")
!error Please run nmake from the directory of this makefile (xemacs\netinstall).
!endif

XEMACS=$(MAKEDIR)\..

# Define a variable for the 'del' command to use
DEL=-del

# Configuration from nt subdirectory if needed

!include "$(XEMACS)\nt\config.inc"

OUTDIR = obj

#
# Compiler command echo control. Define VERBOSECC=1 to get verbose compilation.
#
!if !defined(VERBOSECC)
VERBOSECC=0
!endif
!if $(VERBOSECC)
CCV=$(CC)
!else
CCV=@$(CC)
!endif

!if $(DEBUG_XEMACS)
cdebug=-Od -Gr -Zi -Zp8
!else
cdebug=-Oxsb2 -Oy- -G5rFs -Zi -Zp8
!endif

defines = -DWIN32_NATIVE -I$(ZLIBDIR) $(ZLIB_FLAGS)

#
# Object files
#
OBJS = 	\
	$(OUTDIR)\choose.obj \
	$(OUTDIR)\concat.obj \
	$(OUTDIR)\desktop.obj \
	$(OUTDIR)\dialog.obj \
	$(OUTDIR)\diskfull.obj \
	$(OUTDIR)\download.obj \
	$(OUTDIR)\find.obj \
	$(OUTDIR)\fromcwd.obj \
	$(OUTDIR)\geturl.obj \
	$(OUTDIR)\hash.obj \
	$(OUTDIR)\ini.obj \
	$(OUTDIR)\init.obj \
	$(OUTDIR)\inilex.obj \
	$(OUTDIR)\iniparse.obj \
	$(OUTDIR)\install.obj \
	$(OUTDIR)\localdir.obj \
	$(OUTDIR)\log.obj \
	$(OUTDIR)\main.obj \
	$(OUTDIR)\mkdir.obj \
	$(OUTDIR)\mklink2.obj \
	$(OUTDIR)\regedit.obj \
	$(OUTDIR)\msg.obj \
	$(OUTDIR)\net.obj \
	$(OUTDIR)\netio.obj \
	$(OUTDIR)\nio-ie5.obj \
	$(OUTDIR)\nio-file.obj \
	$(OUTDIR)\nio-ftp.obj \
	$(OUTDIR)\nio-http.obj \
	$(OUTDIR)\other.obj \
	$(OUTDIR)\postinstall.obj \
	$(OUTDIR)\root.obj \
	$(OUTDIR)\simpsock.obj \
	$(OUTDIR)\site.obj \
	$(OUTDIR)\source.obj \
	$(OUTDIR)\splash.obj \
	$(OUTDIR)\state.obj \
	$(OUTDIR)\tar.obj \
	$(OUTDIR)\uninstall.obj \
	$(OUTDIR)\version.obj

#
# Libraries
#
LIBS = libcmt.lib $(olelibsmt) \
	kernel32.lib shell32.lib \
	wsock32.lib netapi32.lib \
	wininet.lib $(zlib)

# Rules

.SUFFIXES:
.SUFFIXES:	.c .cc .obj .texi .info

# nmake rule
.cc{$(OUTDIR)}.obj:
	$(CC) /TP $(cflags) $(cdebug) $(cvarsmt) $(defines) -Fo$@ $<
.c{$(OUTDIR)}.obj:
	$(CC) $(cflags) $(cdebug) $(cvarsmt) $(defines) -Fo$@ $<

#
# Main target
#
all: setup.exe

#
# Link target. setargv.obj is provided in the compiler library directory.
#
setup.exe: $(OUTDIR) $(OBJS) res.res
	$(link) /OUT:$@ $(ldebug) $(guilflags) $(OBJS) res.res $(LIBS)

iniparse.c iniparse.h : iniparse.y
	bison -d -o iniparse.c $(srcdir)/iniparse.y

$(OUTDIR)\inilex.obj: iniparse.h

inilex.c : inilex.l iniparse.h
	flex -t $(srcdir)/inilex.l | sed "/^extern int isatty YY/d" > inilex.c

version.c : $(srcdir)/ChangeLog version.pl
	perl version.pl < ChangeLog > version.c

res.res: res.rc
	$(rc) $(rcvars) $(rcflags) /fo$@ $**

$(OUTDIR):
	-@mkdir $(OUTDIR)

install:: all

clean::
	$(DEL) $(OUTDIR)\*.obj *.pdb *.aps res.res lex.yy.c

distclean:: clean
	$(DEL) *~ setup.exe

# DO NOT DELETE

$(OUTDIR)/autoload.obj: autoload.c win32.h 
$(OUTDIR)/inilex.obj: inilex.c win32.h  ini.h iniparse.h
$(OUTDIR)/init.obj: win32.h  dialog.h resource.h \
	state.h ini.h concat.h msg.h log.h find.h reginfo.h
$(OUTDIR)/iniparse.obj: iniparse.c ini.h iniparse.h port.h
$(OUTDIR)/inilex.obj: inilex.c win32.h  ini.h iniparse.h
$(OUTDIR)/mklink2.obj: mklink2.c win32.h 
$(OUTDIR)/choose.obj: choose.cc win32.h  dialog.h resource.h \
	state.h ini.h concat.h msg.h log.h find.h reginfo.h
$(OUTDIR)/concat.obj: concat.cc win32.h
$(OUTDIR)/desktop.obj: desktop.cc win32.h  \
	resource.h ini.h msg.h state.h \
	concat.h mkdir.h dialog.h version.h reginfo.h regedit.h port.h
$(OUTDIR)/dialog.obj: dialog.cc win32.h  dialog.h msg.h log.h \
	win32.h
$(OUTDIR)/diskfull.obj: diskfull.cc  diskfull.h
$(OUTDIR)/download.obj: download.cc win32.h  resource.h msg.h \
	ini.h dialog.h concat.h geturl.h state.h mkdir.h log.h
$(OUTDIR)/find.obj: find.cc win32.h  port.h
$(OUTDIR)/fromcwd.obj: fromcwd.cc win32.h  \
	ini.h resource.h concat.h \
	state.h dialog.h msg.h find.h version.h port.h
$(OUTDIR)/geturl.obj: geturl.cc win32.h  dialog.h geturl.h \
	resource.h netio.h msg.h log.h
$(OUTDIR)/hash.obj: hash.cc win32.h hash.h
$(OUTDIR)/ini.obj: ini.cc win32.h  ini.h resource.h concat.h \
	state.h geturl.h dialog.h msg.h mkdir.h log.h reginfo.h version.h
$(OUTDIR)/install.obj: install.cc win32.h  \
	$(ZLIBDIR)/zlib.h $(ZLIBDIR)/zconf.h \
	resource.h ini.h dialog.h concat.h geturl.h mkdir.h state.h tar.h \
	diskfull.h msg.h regedit.h reginfo.h log.h hash.h port.h
$(OUTDIR)/localdir.obj: localdir.cc win32.h  dialog.h resource.h \
	state.h msg.h concat.h log.h
$(OUTDIR)/log.obj: log.cc win32.h  resource.h msg.h log.h dialog.h \
	state.h concat.h mkdir.h
$(OUTDIR)/main.obj: main.cc win32.h  resource.h dialog.h state.h \
	msg.h netio.h find.h log.h port.h
$(OUTDIR)/mkdir.obj: mkdir.cc win32.h  mkdir.h
$(OUTDIR)/msg.obj: msg.cc win32.h  dialog.h log.h
$(OUTDIR)/net.obj: net.cc win32.h  dialog.h resource.h state.h \
	msg.h log.h
$(OUTDIR)/netio.obj: netio.cc win32.h  resource.h state.h msg.h \
	netio.h nio-file.h nio-ie5.h nio-http.h nio-ftp.h dialog.h log.h port.h \
	win32.h
$(OUTDIR)/nio-file.obj: nio-file.cc  netio.h nio-file.h resource.h \
	msg.h
$(OUTDIR)/nio-ftp.obj: nio-ftp.cc win32.h  resource.h state.h \
	simpsock.h log.h netio.h nio-ftp.h
$(OUTDIR)/nio-http.obj: nio-http.cc win32.h  resource.h state.h \
	simpsock.h msg.h netio.h nio-http.h
$(OUTDIR)/nio-ie5.obj: nio-ie5.cc win32.h  resource.h state.h \
	dialog.h msg.h netio.h nio-ie5.h
$(OUTDIR)/other.obj: other.cc win32.h  dialog.h resource.h state.h \
	msg.h log.h
$(OUTDIR)/postinstall.obj: postinstall.cc win32.h  \
	state.h dialog.h find.h \
	concat.h regedit.h reginfo.h resource.h port.h
$(OUTDIR)/regedit.obj: regedit.cc win32.h  reginfo.h regedit.h \
	msg.h resource.h dialog.h
$(OUTDIR)/root.obj: root.cc win32.h  dialog.h resource.h state.h \
	msg.h regedit.h reginfo.h concat.h log.h
$(OUTDIR)/simpsock.obj: simpsock.cc win32.h  simpsock.h msg.h \
	win32.h
$(OUTDIR)/site.obj: site.cc  dialog.h resource.h state.h geturl.h \
	msg.h concat.h regedit.h reginfo.h log.h port.h
$(OUTDIR)/source.obj: source.cc win32.h  dialog.h resource.h \
	state.h msg.h log.h
$(OUTDIR)/splash.obj: splash.cc win32.h  dialog.h resource.h msg.h \
	version.h
$(OUTDIR)/state.obj: state.cc state.h
$(OUTDIR)/uninstall.obj: install.cc win32.h  \
	$(ZLIBDIR)/zlib.h $(ZLIBDIR)/zconf.h \
	resource.h ini.h dialog.h concat.h geturl.h mkdir.h state.h tar.h \
	diskfull.h msg.h regedit.h reginfo.h log.h hash.h port.h
$(OUTDIR)/tar.obj: tar.cc win32.h  \
	$(ZLIBDIR)/zlib.h $(ZLIBDIR)/zconf.h \
	tar.h mkdir.h log.h port.h

#
# Local Variables:
# mode: makefile
# End:
