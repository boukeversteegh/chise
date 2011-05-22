#   Makefile for Microsoft NMAKE
#   Copyright (C) 1995 Board of Trustees, University of Illinois.
#   Copyright (C) 1995, 1996, 2000, 2005 Ben Wing.
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

default: all

# APA: Since there seems to be no way to determine the directory where
# xemacs.mak is located (from within nmake) we just insist on the user
# to invoke nmake in the directory where xemacs.mak is.
!if !exist("$(MAKEDIR)\xemacs.mak")
!error Please run nmake from the directory of this makefile (xemacs\nt).
!endif

XEMACS=$(MAKEDIR)\..
LISP=$(XEMACS)\lisp
LIB_SRC=$(XEMACS)\lib-src
MODULES=$(XEMACS)\modules
NT=$(XEMACS)\nt
OUTDIR=$(NT)\obj
SRC=$(XEMACS)\src
LWLIB_SRCDIR=$(XEMACS)\lwlib
MAKEDIRSTRING=$(MAKEDIR:\=\\)
XEMACSDIRSTRING=$(MAKEDIRSTRING:\\nt=)

# Program name and version

!include "$(XEMACS)\version.sh"

# Put these before including config.inc so they can be overridden there.
# Note that some versions of some commands are deficient.

# Define a variable for the 'del' command to use.
# WinME's DEL command can only handle one argument and only has the /P flag.
# So only delete one glob at a time.  Override flags in config.inc.
DEL=-del

# Tell COPY, MOVE, and XCOPY to suppress confirmation for overwriting
# files.
COPYCMD=/y
# Define the 'copy' command to use.
COPY=xcopy /q
COPYDIR=xcopy /q /e

!include "config.inc"

!if !defined(INFODOCK)
INFODOCK=0
!endif

!if $(INFODOCK)
INFODOCK_VERSION_STRING=$(infodock_major_version).$(infodock_minor_version).$(infodock_build_version)
PROGRAM_DEFINES=-DINFODOCK 					\
	-DPATH_VERSION=\"$(INFODOCK_VERSION_STRING)\"		\
	-DPATH_PROGNAME=\"infodock\" 				\
	-DEMACS_PROGNAME=\"infodock\"				\
	-DEMACS_VERSION=\"$(INFODOCK_VERSION_STRING)\"		\
	-DINFODOCK_MAJOR_VERSION=$(infodock_major_version)	\
	-DINFODOCK_MINOR_VERSION=$(infodock_minor_version)	\
	-DINFODOCK_BUILD_VERSION=$(infodock_build_version)
!else
XEMACS_VERSION_STRING=$(emacs_major_version).$(emacs_minor_version)
!if "$(emacs_beta_version)" != ""
!if "$(emacs_is_beta)" != ""
XEMACS_VERSION_STRING=$(XEMACS_VERSION_STRING)-b$(emacs_beta_version)
!else
XEMACS_VERSION_STRING=$(XEMACS_VERSION_STRING).$(emacs_beta_version)
!endif
!endif
PROGRAM_DEFINES=						\
	-DPATH_VERSION=\"$(XEMACS_VERSION_STRING)\"		\
	-DPATH_PROGNAME=\"xemacs\"				\
	-DEMACS_VERSION=\"$(XEMACS_VERSION_STRING)\"		\
	-DEMACS_PROGNAME=\"xemacs\"
!endif

#
# Command line options defaults
#
!if !defined(INSTALL_DIR)
! if $(INFODOCK)
INSTALL_DIR=c:\Program Files\Infodock\Infodock-$(INFODOCK_VERSION_STRING)
! else
INSTALL_DIR=c:\Program Files\XEmacs\XEmacs-$(XEMACS_VERSION_STRING)
! endif
!endif
!if !defined(HAVE_MULE)
HAVE_MULE=0
!endif

# If PACKAGE_PATH was defined, use it.  If PACKAGE_PATH was not defined,
# but PACKAGE_PREFIX was, use PACKAGE_PREFIX to generate a package path.
# If neither PACKAGE_PATH nor PACKAGE_PREFIX was defined,
# do not define a package path.
!if !defined(PACKAGE_PATH)
! if defined(PACKAGE_PREFIX)
!  if $(HAVE_MULE)
PACKAGE_PATH=~\.xemacs;;$(PACKAGE_PREFIX)\site-packages;$(PACKAGE_PREFIX)\mule-packages;$(PACKAGE_PREFIX)\xemacs-packages
!  else
PACKAGE_PATH=~\.xemacs;;$(PACKAGE_PREFIX)\site-packages;$(PACKAGE_PREFIX)\xemacs-packages
!  endif
! endif
!endif
!if defined(PACKAGE_PATH)
PATH_PACKAGEPATH="$(PACKAGE_PATH:\=\\)"
!endif

!if !defined(HAVE_MS_WINDOWS)
HAVE_MS_WINDOWS=1
!endif
!if !defined(HAVE_X_WINDOWS)
HAVE_X_WINDOWS=0
!endif
!if !defined(HAVE_XPM)
HAVE_XPM=0
!endif
!if !defined(HAVE_PNG)
HAVE_PNG=0
!endif
!if !defined(HAVE_ZLIB)
HAVE_ZLIB=$(HAVE_PNG)
!endif
!if !defined(HAVE_TIFF)
HAVE_TIFF=0
!endif
!if !defined(HAVE_JPEG)
HAVE_JPEG=0
!endif
!if !defined(HAVE_XFACE)
HAVE_XFACE=0
!endif
!if !defined(HAVE_GIF)
HAVE_GIF=1
!endif
!if !defined(HAVE_GTK)
HAVE_GTK=0
!endif
!if !defined(HAVE_TOOLBARS)
HAVE_TOOLBARS=$(HAVE_XPM)
!endif
!if !defined(HAVE_DIALOGS)
HAVE_DIALOGS=1
!endif
!if !defined(HAVE_MSW_C_DIRED)
HAVE_MSW_C_DIRED=1
!endif
!if !defined(HAVE_NATIVE_SOUND)
HAVE_NATIVE_SOUND=1
!endif
!if !defined(HAVE_WIDGETS)
HAVE_WIDGETS=1
!endif
!if !defined(DEBUG_XEMACS)
DEBUG_XEMACS=0
!endif
!if !defined(QUICK_BUILD)
QUICK_BUILD=0
!endif
!if !defined(USE_UNION_TYPE)
USE_UNION_TYPE=0
!endif
!if !defined(USE_MINITAR)
USE_MINITAR=$(HAVE_ZLIB)
!endif
!if !defined(USE_PORTABLE_DUMPER)
USE_PORTABLE_DUMPER=1
!endif

# A little bit of adhockery. Default to use system malloc and
# DLL version of the C runtime library when using portable
# dumping. These are the optimal settings.
#
# NOTE: The various graphics libraries are generally compiled to use
# MSVCRT.DLL (the same that we use in USE_CRTDLL, more or less), so using
# this is a good thing.

!if !defined(USE_SYSTEM_MALLOC)
USE_SYSTEM_MALLOC=$(USE_PORTABLE_DUMPER)
!endif
!if !defined(USE_CRTDLL)
USE_CRTDLL=$(USE_PORTABLE_DUMPER)
!endif

#
# System configuration
#
!if !defined(OS)
OS=Windows_95/98
EMACS_CONFIGURATION=i586-pc-win32
!else if "$(PROCESSOR_ARCHITECTURE)" == "x86"
EMACS_CONFIGURATION=i586-pc-win32
!else if "$(PROCESSOR_ARCHITECTURE)" == "MIPS"
EMACS_CONFIGURATION=mips-pc-win32
!else if "$(PROCESSOR_ARCHITECTURE)" == "ALPHA"
EMACS_CONFIGURATION=alpha-pc-win32
!else if "$(PROCESSOR_ARCHITECTURE)" == "PPC"
EMACS_CONFIGURATION=ppc-pc-win32
!else
! error Unknown processor architecture type $(PROCESSOR_ARCHITECTURE)
!endif
STACK_TRACE_EYE_CATCHER=$(XEMACS_VERSION_STRING:.=_)
STACK_TRACE_EYE_CATCHER=xemacs_$(STACK_TRACE_EYE_CATCHER:-=_)_$(EMACS_CONFIGURATION:-=_)
PROGRAM_DEFINES=$(PROGRAM_DEFINES) -DSTACK_TRACE_EYE_CATCHER=$(STACK_TRACE_EYE_CATCHER)

#
# Conf error checks
#
CONFIG_ERROR=0
!if $(INFODOCK) && !exist("..\..\Infodock.rules")
!message Cannot build InfoDock without InfoDock sources
CONFIG_ERROR=1
!endif
!if !$(USE_PORTABLE_DUMPER) && $(USE_SYSTEM_MALLOC)
!message Cannot use system allocator when dumping old way, use portable dumper.
CONFIG_ERROR=1
!endif
!if !$(USE_PORTABLE_DUMPER) && $(USE_CRTDLL)
!message Cannot use C runtime DLL when dumping old way, use portable dumper.
CONFIG_ERROR=1
!endif
!if !$(USE_SYSTEM_MALLOC) && $(USE_CRTDLL)
!message GNU malloc currently cannot be used with CRT DLL.
!message [[[Developer note: If you want to fix it, read Q112297 first]]]  ####
CONFIG_ERROR=1
!endif
!if !$(HAVE_MS_WINDOWS) && !$(HAVE_X_WINDOWS)
!message Please specify at least one HAVE_MS_WINDOWS=1 and/or HAVE_X_WINDOWS=1
CONFIG_ERROR=1
!endif
!if $(HAVE_X_WINDOWS) && !defined(X11_DIR)
!message Please specify root directory for your X11 installation: X11_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_X_WINDOWS) && defined(X11_DIR) && !exist("$(X11_DIR)\LIB\X11.LIB")
!message Specified X11 directory does not contain "$(X11_DIR)\LIB\X11.LIB"
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_GTK) && !defined(GTK_DIR)
!message Please specify root directory for your GTK installation: GTK_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_XPM) && !defined(XPM_DIR)
!message Please specify root directory for your XPM installation: XPM_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_XPM) && defined(XPM_DIR) && !exist("$(XPM_DIR)\lib\Xpm.lib")
!message Specified XPM directory does not contain "$(XPM_DIR)\lib\Xpm.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_PNG) && !defined(PNG_DIR)
!message Please specify root directory for your PNG installation: PNG_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_PNG) && defined(PNG_DIR) && !exist("$(PNG_DIR)\libpng.lib")
!message Specified PNG directory does not contain "$(PNG_DIR)\libpng.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_PNG) && !defined(ZLIB_DIR)
!message Please specify root directory for your ZLIB installation: ZLIB_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_PNG) && defined(ZLIB_DIR) && !exist("$(ZLIB_DIR)\zlib.lib")
!message Specified ZLIB directory does not contain "$(ZLIB_DIR)\zlib.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_TIFF) && !defined(TIFF_DIR)
!message Please specify root directory for your TIFF installation: TIFF_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_TIFF) && !exist("$(TIFF_DIR)\libtiff\libtiff.lib")
!message Specified TIFF directory does not contain "$(TIFF_DIR)\libtiff\libtiff.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_JPEG) && !defined(JPEG_DIR)
!message Please specify root directory for your JPEG installation: JPEG_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_JPEG) && !exist("$(JPEG_DIR)\libjpeg.lib")
!message Specified JPEG directory does not contain "$(JPEG_DIR)\libjpeg.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_XFACE) && !defined(COMPFACE_DIR)
!message Please specify root directory for your COMPFACE installation: COMPFACE_DIR=path
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_XFACE) && !exist("$(COMPFACE_DIR)\libcompface.lib")
!message Specified COMPFACE directory does not contain "$(COMPFACE_DIR)\libcompface.lib"
CONFIG_ERROR=1
!endif
!if $(HAVE_MS_WINDOWS) && $(HAVE_TOOLBARS) && !$(HAVE_XPM)
!message Toolbars require XPM support
CONFIG_ERROR=1
!endif
!if $(CONFIG_ERROR)
!error Configuration error(s) found
!endif

#
# Whether to use dependency information generated by make-src-depend
#
!if !defined(DEPEND)
DEPEND=0
!endif
!if $(DEPEND) && exist("$(SRC)\depend")
! if [if not exist $(OUTDIR)\nul mkdir "$(OUTDIR)"]
! endif
# generate an nmake-readable version of depend
# #### here, it doesn't seem to matter if we double ^'s!
# results are the same with all single ^ and all double ^^!
# see comment below.
# #### Yuuuuuuuuuuck!!!  Cygwin is too smart for its own good.  If we are
# being run from within Cygwin, a Cygwin Perl seems to require twice as
# much backslash quoting.  This does not happen, of course, with a non-
# Cygwin Perl, so in that circumstance, you'd be screwed and would have
# to fix this Makefile to not have a special Cygwin case.
! if defined(_) || [perl -e "exit 1 if $$^O == 'cygwin';"]==1
!  if [perl -p -e "s/^\\x23if defined(.+)/!if defined$$1/; s/^\\x23e/!e/;" \
	-e "s/([\\s=^])([\\w\\d\\.\\-^]+\\.[ch^])/$$1$(SRC:\=\\\\)\\\\$$2/g;" \
	-e "s/^(.+)\\.o:(.+)/$(OUTDIR:\=\\\\)\\\\$$1.obj:$$2/;" \
	< $(SRC)\depend > $(OUTDIR)\depend.tmp]
!  endif
! else
!  if [perl -p -e "s/^\x23if defined(.+)/!if defined$$1/; s/^\x23e/!e/;" \
	-e "s/([\s=^])([\w\d\.\-^]+\.[ch^])/$$1$(SRC:\=\\)\\$$2/g;" \
	-e "s/^(.+)\.o:(.+)/$(OUTDIR:\=\\)\\$$1.obj:$$2/;" \
	< $(SRC)\depend > $(OUTDIR)\depend.tmp]
!  endif
! endif
! include "$(OUTDIR)\depend.tmp"
!else
! if [echo   WARNING: Compiling without dependency information.]
! endif
!endif

!if $(USE_INTEL_COMPILER)
CC=icl
# Use static library if possible
INTEL_LIBS=libircmt.lib libmmt.lib
# Debugging requires DLL version of libm
!if $(DEBUG_XEMACS)
INTEL_LIBS=libircmt.lib libmmd.lib
!endif
!endif

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
OPT=-Od -Zi
!else
OPT=-O2 -G5
!endif

!if $(USE_CRTDLL)
!if $(DEBUG_XEMACS)
C_LIBFLAG=-MDd
LIBC_LIB=msvcrtd.lib
!else
C_LIBFLAG=-MD
LIBC_LIB=msvcrt.lib
!endif
!else
C_LIBFLAG=-ML
LIBC_LIB=libc.lib
!endif

CFLAGS_NO_LIB=-nologo -W3 $(OPT)
CFLAGS=$(CFLAGS_NO_LIB) $(C_LIBFLAG)

!if $(HAVE_X_WINDOWS)
X_DEFINES=-DHAVE_X_WINDOWS
X_INCLUDES=-I$(X11_DIR)\include
X_LIBS=-libpath:$(X11_DIR)\lib Xaw.lib Xmu.lib Xt.lib SM.lib ICE.lib Xext.lib X11.lib
!endif

!if $(HAVE_MS_WINDOWS)
MSW_DEFINES=-DHAVE_MS_WINDOWS -DHAVE_SCROLLBARS -DHAVE_MENUBARS
MSW_INCLUDES=
MSW_LIBS=
!if $(HAVE_MSW_C_DIRED)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_MSW_C_DIRED
MSW_C_DIRED_SRC=$(SRC)\dired-msw.c
MSW_C_DIRED_OBJ=$(OUTDIR)\dired-msw.obj
!endif
!if $(HAVE_XPM)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_XPM -DFOR_MSW
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(XPM_DIR)" -I"$(XPM_DIR)\lib"
MSW_LIBS=$(MSW_LIBS) "$(XPM_DIR)\lib\Xpm.lib"
!endif
!if $(HAVE_GIF)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_GIF
MSW_GIF_SRC=$(SRC)\dgif_lib.c $(SRC)\gif_io.c
MSW_GIF_OBJ=$(OUTDIR)\dgif_lib.obj $(OUTDIR)\gif_io.obj
!endif
!if $(HAVE_PNG)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_PNG
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(PNG_DIR)" -I"$(ZLIB_DIR)"
MSW_LIBS=$(MSW_LIBS) "$(PNG_DIR)\libpng.lib" "$(ZLIB_DIR)\zlib.lib"
!endif
!if $(HAVE_TIFF)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_TIFF
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(TIFF_DIR)\libtiff"
MSW_LIBS=$(MSW_LIBS) "$(TIFF_DIR)\libtiff\libtiff.lib"
!endif
!if $(HAVE_JPEG)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_JPEG
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(JPEG_DIR)"
MSW_LIBS=$(MSW_LIBS) "$(JPEG_DIR)\libjpeg.lib"
!endif
!if $(HAVE_XFACE)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_XFACE
MSW_INCLUDES=$(MSW_INCLUDES) -I"$(COMPFACE_DIR)"
MSW_LIBS=$(MSW_LIBS) "$(COMPFACE_DIR)\libcompface.lib"
!endif
!if $(HAVE_TOOLBARS)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_TOOLBARS
MSW_TOOLBAR_SRC=$(SRC)\toolbar.c $(SRC)\toolbar-msw.c
MSW_TOOLBAR_OBJ=$(OUTDIR)\toolbar.obj $(OUTDIR)\toolbar-msw.obj
!endif
!if $(HAVE_DIALOGS)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_DIALOGS
MSW_DIALOG_SRC=$(SRC)\dialog.c $(SRC)\dialog-msw.c
MSW_DIALOG_OBJ=$(OUTDIR)\dialog.obj $(OUTDIR)\dialog-msw.obj
!endif
!if $(HAVE_WIDGETS)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_WIDGETS
!endif
!if $(HAVE_TOOLBARS) || $(HAVE_WIDGETS)
MSW_LIBS=$(MSW_LIBS) comctl32.lib
!endif
!if $(HAVE_NATIVE_SOUND)
MSW_DEFINES=$(MSW_DEFINES) -DHAVE_NATIVE_SOUND
!endif
!endif

!if $(HAVE_MULE)
MULE_DEFINES=-DMULE
!endif

!if $(DEBUG_XEMACS)
DEBUG_DEFINES=-DDEBUG_XEMACS -D_DEBUG 
DEBUG_FLAGS=-debug:full
!endif

!if $(QUICK_BUILD)
QUICK_DEFINES=-DQUICK_BUILD
!endif

!if $(USE_UNION_TYPE)
UNION_DEFINES=-DUSE_UNION_TYPE
!endif

!if $(USE_PORTABLE_DUMPER)
DUMPER_DEFINES=-DPDUMP
!endif

!if $(USE_SYSTEM_MALLOC)
MALLOC_DEFINES=-DSYSTEM_MALLOC
!else
MALLOC_DEFINES=-DGNU_MALLOC
!endif

# Hard-coded paths

!if $(INFODOCK)
PATH_PREFIX=../..
!else
PATH_PREFIX=..
!endif

PATH_DEFINES=-DPATH_PREFIX=\"$(PATH_PREFIX)\"

# Generic variables

INCLUDES=$(X_INCLUDES) -I$(NT)\inc -I$(SRC) $(MSW_INCLUDES) -I$(LWLIB_SRCDIR)

DEFINES=$(X_DEFINES) $(MSW_DEFINES) $(MULE_DEFINES) $(UNION_DEFINES) \
	$(DUMPER_DEFINES) $(MALLOC_DEFINES) $(QUICK_DEFINES) \
	-DWIN32_LEAN_AND_MEAN -DWIN32_NATIVE -Demacs \
	-DHAVE_CONFIG_H $(PROGRAM_DEFINES) $(PATH_DEFINES)

#------------------------------------------------------------------------------

$(OUTDIR)\nul:
	-@mkdir $(OUTDIR)

XEMACS_INCLUDES=\
 $(SRC)\config.h \
 $(SRC)\Emacs.ad.h \
 $(SRC)\paths.h

# #### Copying is cheap, we should just force these
$(SRC)\config.h:	config.h
	set COPYCMD=$(COPYCMD)
	copy config.h $(SRC)

$(SRC)\Emacs.ad.h:	Emacs.ad.h
	set COPYCMD=$(COPYCMD)
	copy Emacs.ad.h $(SRC)

$(SRC)\paths.h:	paths.h
	set COPYCMD=$(COPYCMD)
	copy paths.h $(SRC)

#------------------------------------------------------------------------------

# lib-src programs

LIB_SRC_DEFINES = -DHAVE_CONFIG_H -DWIN32_NATIVE

#
# Creating config.values to be used by config.el
#
CONFIG_VALUES = $(LIB_SRC)\config.values
!if [echo Creating $(CONFIG_VALUES) && echo ;;; Do not edit this file!>$(CONFIG_VALUES)]
!endif
# MAKEDIR has to be made into a string.
#!if [echo blddir>>$(CONFIG_VALUES) && echo $(ESC)"$(MAKEDIR:\=\\)\\..$(ESC)">>$(CONFIG_VALUES)]
!if [echo blddir>>$(CONFIG_VALUES) && echo "$(MAKEDIR:\=\\)\\..">>$(CONFIG_VALUES)]
!endif
!if [echo CC>>$(CONFIG_VALUES) && echo "$(CC:\=\\)">>$(CONFIG_VALUES)]
!endif
!if [echo CFLAGS>>$(CONFIG_VALUES) && echo "$(CFLAGS:\=\\)">>$(CONFIG_VALUES)]
!endif
!if [echo CPP>>$(CONFIG_VALUES) && echo "$(CPP:\=\\)">>$(CONFIG_VALUES)]
!endif
!if [echo CPPFLAGS>>$(CONFIG_VALUES) && echo "$(CPPFLAGS:\=\\)">>$(CONFIG_VALUES)]
!endif
!if [echo LISPDIR>>$(CONFIG_VALUES) && echo "$(MAKEDIR:\=\\)\\$(LISP:\=\\)">>$(CONFIG_VALUES)]
!endif
!if defined(PATH_PACKAGEPATH)
# PATH_PACKAGEPATH is already a quoted string.
! if [echo PACKAGE_PATH>>$(CONFIG_VALUES) && echo $(PATH_PACKAGEPATH)>>$(CONFIG_VALUES)]
! endif
!endif

# Inferred rule
{$(LIB_SRC)}.c{$(LIB_SRC)}.exe :
	cd $(LIB_SRC)
	$(CCV) -I. -I$(XEMACS)/src -I$(XEMACS)/nt/inc $(LIB_SRC_DEFINES) $(CFLAGS) -Fe$@ $** -link -incremental:no setargv.obj
	cd $(NT)

# Individual dependencies
ETAGS_DEPS = $(LIB_SRC)/getopt.c $(LIB_SRC)/getopt1.c $(LIB_SRC)/../src/regex.c
$(LIB_SRC)/etags.exe : $(LIB_SRC)/etags.c $(ETAGS_DEPS)
$(LIB_SRC)/movemail.exe: $(LIB_SRC)/movemail.c $(LIB_SRC)/pop.c $(ETAGS_DEPS)
	cd $(LIB_SRC)
	$(CCV) -I. -I$(XEMACS)/src -I$(XEMACS)/nt/inc $(LIB_SRC_DEFINES) $(CFLAGS) -Fe$@ $** wsock32.lib -link -incremental:no
	cd $(NT)

$(LIB_SRC)/winclient.exe: $(LIB_SRC)/winclient.c
	cd $(LIB_SRC)
	$(CCV) -I. -I$(XEMACS)/src -I$(XEMACS)/nt/inc $(LIB_SRC_DEFINES) $(CFLAGS) -Fe$@ $** user32.lib -link -incremental:no
	cd $(NT)

$(LIB_SRC)/minitar.exe : $(NT)/minitar.c
	$(CCV) $(CFLAGS_NO_LIB) -I"$(ZLIB_DIR)" $(LIB_SRC_DEFINES) -MD -Fe$@ $** $(ZLIB_DIR)\zlib.lib -link -incremental:no

LIB_SRC_TOOLS = \
	$(LIB_SRC)/etags.exe		\
	$(LIB_SRC)/hexl.exe		\
	$(LIB_SRC)/i.exe		\
	$(LIB_SRC)/winclient.exe	\
	$(LIB_SRC)/make-docfile.exe	\
	$(LIB_SRC)/mmencode.exe		\
	$(LIB_SRC)/movemail.exe		\
	$(LIB_SRC)/sorted-doc.exe	\
	$(LIB_SRC)/wakeup.exe
!if $(USE_MINITAR)
LIB_SRC_TOOLS = \
	$(LIB_SRC_TOOLS) \
	$(LIB_SRC)/minitar.exe
!endif
!if $(USE_PORTABLE_DUMPER)
LIB_SRC_TOOLS = \
	$(XEMACS_INCLUDES) \
	$(LIB_SRC)/make-dump-id.exe \
	$(LIB_SRC_TOOLS)
!endif

# Shorthand target
minitar: $(LIB_SRC)/minitar.exe

#------------------------------------------------------------------------------

# dump-id.c file that contains the dump id

$(SRC)\dump-id.c : $(LIB_SRC)/make-dump-id.exe 
	cd $(SRC)
	$(LIB_SRC)\make-dump-id.exe 
	cd $(NT)

#------------------------------------------------------------------------------

# LASTFILE Library

!if !$(USE_SYSTEM_MALLOC) || !$(USE_PORTABLE_DUMPER)

LASTFILE=$(OUTDIR)\lastfile.lib
LASTFILE_SRC=$(SRC)
LASTFILE_FLAGS=$(CFLAGS) $(INCLUDES) -Fo$@ -Fd$* -c
LASTFILE_OBJS= \
	$(OUTDIR)\lastfile.obj

$(LASTFILE): $(XEMACS_INCLUDES) $(LASTFILE_OBJS)
	link.exe -lib -nologo -out:$@ $(LASTFILE_OBJS)

$(OUTDIR)\lastfile.obj:	$(LASTFILE_SRC)\lastfile.c
	 $(CCV) $(LASTFILE_FLAGS) $**

!endif

#------------------------------------------------------------------------------

!if $(HAVE_X_WINDOWS)

# LWLIB Library

LWLIB=$(OUTDIR)\lwlib.lib
LWLIB_FLAGS=$(CFLAGS) $(INCLUDES) $(DEFINES) \
 -DNEED_ATHENA -DNEED_LUCID \
 -D_WINDOWS -DMENUBARS_LUCID -DSCROLLBARS_LUCID -DDIALOGS_ATHENA \
 -Fo$@ -c
LWLIB_OBJS= \
	$(OUTDIR)\lwlib-config.obj \
	$(OUTDIR)\lwlib-utils.obj \
	$(OUTDIR)\lwlib-Xaw.obj \
	$(OUTDIR)\lwlib-Xlw.obj \
	$(OUTDIR)\lwlib.obj \
	$(OUTDIR)\xlwmenu.obj \
	$(OUTDIR)\xlwscrollbar.obj

$(LWLIB): $(LWLIB_OBJS)
	link.exe -lib -nologo -out:$@ $(LWLIB_OBJS)

$(OUTDIR)\lwlib-config.obj:	$(LWLIB_SRCDIR)\lwlib-config.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\lwlib-utils.obj:	$(LWLIB_SRCDIR)\lwlib-utils.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\lwlib-Xaw.obj:	$(LWLIB_SRCDIR)\lwlib-Xaw.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\lwlib-Xlw.obj:	$(LWLIB_SRCDIR)\lwlib-Xlw.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\lwlib.obj:		$(LWLIB_SRCDIR)\lwlib.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\xlwmenu.obj:		$(LWLIB_SRCDIR)\xlwmenu.c
	 $(CCV) $(LWLIB_FLAGS) $**

$(OUTDIR)\xlwscrollbar.obj:	$(LWLIB_SRCDIR)\xlwscrollbar.c
	 $(CCV) $(LWLIB_FLAGS) $**

!endif
#------------------------------------------------------------------------------

DOC=$(LIB_SRC)\DOC
DOC_SRC1=\
 $(SRC)\abbrev.c \
 $(SRC)\alloc.c \
 $(SRC)\blocktype.c \
 $(SRC)\buffer.c \
 $(SRC)\bytecode.c \
 $(SRC)\callint.c \
 $(SRC)\callproc.c \
 $(SRC)\casefiddle.c \
 $(SRC)\casetab.c \
 $(SRC)\chartab.c \
 $(SRC)\cmdloop.c \
 $(SRC)\cmds.c \
 $(SRC)\console-stream.c \
 $(SRC)\console.c \
 $(SRC)\data.c \
 $(SRC)\device.c
DOC_SRC2=\
 $(SRC)\dired.c \
 $(SRC)\doc.c \
 $(SRC)\doprnt.c \
 $(SRC)\dragdrop.c \
 $(SRC)\dynarr.c \
 $(SRC)\editfns.c \
 $(SRC)\elhash.c \
 $(SRC)\emacs.c \
 $(SRC)\eval.c \
 $(SRC)\event-stream.c \
 $(SRC)\events.c \
 $(SRC)\extents.c \
 $(SRC)\faces.c \
 $(SRC)\file-coding.c \
 $(SRC)\fileio.c \
 $(SRC)\filemode.c \
 $(SRC)\floatfns.c \
 $(SRC)\fns.c 
DOC_SRC3=\
 $(SRC)\font-lock.c \
 $(SRC)\frame.c \
 $(SRC)\general.c \
 $(SRC)\getloadavg.c \
 $(SRC)\glyphs.c \
 $(SRC)\glyphs-eimage.c \
 $(SRC)\glyphs-widget.c \
 $(SRC)\gui.c  \
 $(SRC)\gutter.c \
 $(SRC)\hash.c \
 $(SRC)\imgproc.c \
 $(SRC)\indent.c \
 $(SRC)\insdel.c \
 $(SRC)\intl.c \
 $(SRC)\keymap.c \
 $(SRC)\line-number.c \
 $(SRC)\lread.c \
 $(SRC)\lstream.c \
 $(SRC)\macros.c \
 $(SRC)\marker.c
DOC_SRC4=\
 $(SRC)\md5.c \
 $(SRC)\menubar.c \
 $(SRC)\minibuf.c \
 $(SRC)\nt.c \
 $(SRC)\ntplay.c \
 $(SRC)\ntproc.c \
 $(SRC)\objects.c \
 $(SRC)\opaque.c \
 $(SRC)\print.c \
 $(SRC)\process.c \
 $(SRC)\process-nt.c \
 $(SRC)\profile.c \
 $(SRC)\rangetab.c \
 $(SRC)\realpath.c \
 $(SRC)\redisplay-output.c \
 $(SRC)\redisplay.c \
 $(SRC)\regex.c \
 $(SRC)\scrollbar.c \
 $(SRC)\search.c \
 $(SRC)\select.c \
 $(SRC)\signal.c \
 $(SRC)\sound.c 
DOC_SRC5=\
 $(SRC)\specifier.c \
 $(SRC)\strftime.c \
 $(SRC)\symbols.c \
 $(SRC)\syntax.c \
 $(SRC)\sysdep.c \
 $(SRC)\termcap.c  \
 $(SRC)\tparam.c \
 $(SRC)\undo.c \
 $(SRC)\window.c \
 $(SRC)\win32.c \
 $(SRC)\widget.c

!if $(HAVE_X_WINDOWS)
DOC_SRC6=\
 $(SRC)\balloon_help.c \
 $(SRC)\console-x.c \
 $(SRC)\device-x.c  \
 $(SRC)\dialog-x.c \
 $(SRC)\EmacsFrame.c \
 $(SRC)\EmacsManager.c \
 $(SRC)\EmacsShell-sub.c\
 $(SRC)\EmacsShell.c \
 $(SRC)\event-Xt.c  \
 $(SRC)\frame-x.c \
 $(SRC)\glyphs-x.c \
 $(SRC)\gui-x.c \
 $(SRC)\menubar.c \
 $(SRC)\menubar-x.c \
 $(SRC)\objects-x.c \
 $(SRC)\redisplay-x.c \
 $(SRC)\scrollbar-x.c \
 $(SRC)\balloon-x.c \
 $(SRC)\xgccache.c \
 $(SRC)\xmu.c \
 $(SRC)\select-x.c 
!endif

!if $(HAVE_MS_WINDOWS)
DOC_SRC7=\
 $(SRC)\console-msw.c \
 $(SRC)\device-msw.c  \
 $(SRC)\event-msw.c  \
 $(SRC)\frame-msw.c \
 $(SRC)\glyphs-msw.c \
 $(SRC)\gui-msw.c \
 $(SRC)\menubar-msw.c \
 $(SRC)\objects-msw.c \
 $(SRC)\redisplay-msw.c \
 $(SRC)\scrollbar-msw.c \
 $(SRC)\select-msw.c \
 $(MSW_C_DIRED_SRC) \
 $(MSW_TOOLBAR_SRC) \
 $(MSW_DIALOG_SRC) \
 $(MSW_GIF_SRC)
!endif

!if $(HAVE_MULE)
DOC_SRC8=\
 $(SRC)\mule.c \
 $(SRC)\mule-charset.c \
 $(SRC)\mule-ccl.c
! if $(HAVE_X_WINDOWS)
 DOC_SRC8=$(DOC_SRC8) $(SRC)\input-method-xlib.c
! endif
!endif

!if $(DEBUG_XEMACS)
DOC_SRC9=\
 $(SRC)\debug.c \
 $(SRC)\tests.c
!endif

!if !$(USE_SYSTEM_MALLOC)
DOC_SRC10=\
 $(SRC)\free-hook.c \
 $(SRC)\gmalloc.c \
 $(SRC)\ntheap.c \
 $(SRC)\vm-limit.c
!endif

!if !$(USE_PORTABLE_DUMPER)
DOC_SRC11=\
 $(SRC)\unexnt.c
!else
DOC_SRC11=\
 $(SRC)\dumper.c
!endif

#------------------------------------------------------------------------------

# TEMACS Executable

# This may not exist
!if "$(emacs_beta_version)" != ""
!if "$(emacs_is_beta)" != ""
EMACS_BETA_VERSION=-DEMACS_BETA_VERSION=$(emacs_beta_version)
!else
EMACS_PATCH_LEVEL=-DEMACS_PATCH_LEVEL=$(emacs_beta_version)
!endif
!endif

!if !$(USE_PORTABLE_DUMPER)
TEMACS_ENTRYPOINT=-entry:_start
!else
TEMACS_ENTRYPOINT=-entry:mainCRTStartup
!endif

TEMACS_DIR=$(SRC)
TEMACS=$(TEMACS_DIR)\temacs.exe
TEMACS_BROWSE=$(TEMACS_DIR)\temacs.bsc
TEMACS_SRC=$(SRC)
TEMACS_LIBS=$(LASTFILE) $(LWLIB) $(X_LIBS) $(MSW_LIBS) \
 oldnames.lib kernel32.lib user32.lib gdi32.lib comdlg32.lib advapi32.lib \
 shell32.lib wsock32.lib winmm.lib winspool.lib ole32.lib uuid.lib \
 $(INTEL_LIBS) $(LIBC_LIB)
TEMACS_LFLAGS=-nologo $(LIBRARIES) $(DEBUG_FLAGS) -base:0x1000000\
 -stack:0x800000 $(TEMACS_ENTRYPOINT) -subsystem:windows\
 -pdb:$(TEMACS_DIR)\temacs.pdb -map:$(TEMACS_DIR)\temacs.map \
 -heap:0x00100000 -nodefaultlib -incremental:no setargv.obj
TEMACS_CPP_FLAGS=-c \
 $(CFLAGS) $(INCLUDES) $(DEFINES) $(DEBUG_DEFINES) \
 -DEMACS_MAJOR_VERSION=$(emacs_major_version) \
 -DEMACS_MINOR_VERSION=$(emacs_minor_version) \
 $(EMACS_BETA_VERSION) \
 $(EMACS_PATCH_LEVEL) \
 -DXEMACS_CODENAME=\"$(xemacs_codename:&=and)\" \
!if defined(PATH_PACKAGEPATH)
 -DPATH_PACKAGEPATH=\"$(PATH_PACKAGEPATH)\" \
!endif
 -DEMACS_CONFIGURATION=\"$(EMACS_CONFIGURATION)\"

!if $(HAVE_X_WINDOWS)
TEMACS_X_OBJS=\
	$(OUTDIR)\balloon-x.obj \
	$(OUTDIR)\balloon_help.obj \
	$(OUTDIR)\console-x.obj \
	$(OUTDIR)\device-x.obj \
	$(OUTDIR)\dialog-x.obj \
	$(OUTDIR)\EmacsFrame.obj \
	$(OUTDIR)\EmacsManager.obj \
	$(OUTDIR)\EmacsShell.obj \
	$(OUTDIR)\TopLevelEmacsShell.obj\
	$(OUTDIR)\TransientEmacsShell.obj\
	$(OUTDIR)\event-Xt.obj \
	$(OUTDIR)\frame-x.obj \
	$(OUTDIR)\glyphs-x.obj \
	$(OUTDIR)\gui-x.obj \
	$(OUTDIR)\menubar-x.obj \
	$(OUTDIR)\objects-x.obj \
	$(OUTDIR)\redisplay-x.obj \
	$(OUTDIR)\scrollbar-x.obj \
	$(OUTDIR)\xgccache.obj \
	$(OUTDIR)\xmu.obj \
	$(OUTDIR)\select-x.obj
!endif

!if $(HAVE_MS_WINDOWS)
TEMACS_MSW_OBJS=\
	$(OUTDIR)\console-msw.obj \
	$(OUTDIR)\device-msw.obj \
	$(OUTDIR)\event-msw.obj \
	$(OUTDIR)\frame-msw.obj \
	$(OUTDIR)\glyphs-msw.obj \
	$(OUTDIR)\gui-msw.obj \
	$(OUTDIR)\menubar-msw.obj \
	$(OUTDIR)\objects-msw.obj \
	$(OUTDIR)\redisplay-msw.obj \
	$(OUTDIR)\scrollbar-msw.obj \
	$(OUTDIR)\select-msw.obj \
	$(MSW_C_DIRED_OBJ) \
	$(MSW_TOOLBAR_OBJ) \
	$(MSW_DIALOG_OBJ) \
	$(MSW_GIF_OBJ)
!endif

!if $(HAVE_MULE)
TEMACS_MULE_OBJS=\
	$(OUTDIR)\mule.obj \
	$(OUTDIR)\mule-charset.obj \
	$(OUTDIR)\mule-ccl.obj
! if $(HAVE_X_WINDOWS)
TEMACS_MULE_OBJS=\
	$(TEMACS_MULE_OBJS) $(OUTDIR)\input-method-xlib.obj
! endif
!endif

!if $(DEBUG_XEMACS)
TEMACS_DEBUG_OBJS=\
	$(OUTDIR)\debug.obj \
	$(OUTDIR)\tests.obj
!endif

!if !$(USE_SYSTEM_MALLOC)
TEMACS_ALLOC_OBJS=\
	$(OUTDIR)\free-hook.obj \
	$(OUTDIR)\gmalloc.obj \
	$(OUTDIR)\ntheap.obj \
	$(OUTDIR)\vm-limit.obj
!endif

!if !$(USE_PORTABLE_DUMPER)
TEMACS_DUMP_OBJS=\
	$(OUTDIR)\unexnt.obj
!else
TEMACS_DUMP_OBJS=\
	$(OUTDIR)\dumper.obj
!endif

TEMACS_OBJS= \
	$(TEMACS_X_OBJS)\
	$(TEMACS_MSW_OBJS)\
	$(TEMACS_CODING_OBJS)\
	$(TEMACS_MULE_OBJS)\
	$(TEMACS_DEBUG_OBJS)\
	$(TEMACS_ALLOC_OBJS)\
	$(TEMACS_DUMP_OBJS)\
	$(OUTDIR)\abbrev.obj \
	$(OUTDIR)\alloc.obj \
	$(OUTDIR)\blocktype.obj \
	$(OUTDIR)\buffer.obj \
	$(OUTDIR)\bytecode.obj \
	$(OUTDIR)\callint.obj \
	$(OUTDIR)\callproc.obj \
	$(OUTDIR)\casefiddle.obj \
	$(OUTDIR)\casetab.obj \
	$(OUTDIR)\chartab.obj \
	$(OUTDIR)\cmdloop.obj \
	$(OUTDIR)\cmds.obj \
	$(OUTDIR)\console-stream.obj \
	$(OUTDIR)\console.obj \
	$(OUTDIR)\data.obj \
	$(OUTDIR)\device.obj \
	$(OUTDIR)\dired.obj \
	$(OUTDIR)\doc.obj \
	$(OUTDIR)\doprnt.obj \
	$(OUTDIR)\dragdrop.obj \
	$(OUTDIR)\dynarr.obj \
	$(OUTDIR)\editfns.obj \
	$(OUTDIR)\elhash.obj \
	$(OUTDIR)\emacs.obj \
	$(OUTDIR)\eval.obj \
	$(OUTDIR)\event-stream.obj \
	$(OUTDIR)\events.obj \
	$(OUTDIR)\extents.obj \
	$(OUTDIR)\faces.obj \
	$(OUTDIR)\file-coding.obj \
	$(OUTDIR)\fileio.obj \
	$(OUTDIR)\filemode.obj \
	$(OUTDIR)\floatfns.obj \
	$(OUTDIR)\fns.obj \
	$(OUTDIR)\font-lock.obj \
	$(OUTDIR)\frame.obj \
	$(OUTDIR)\general.obj \
	$(OUTDIR)\getloadavg.obj \
	$(OUTDIR)\glyphs.obj \
	$(OUTDIR)\glyphs-eimage.obj \
	$(OUTDIR)\glyphs-widget.obj \
	$(OUTDIR)\gui.obj \
	$(OUTDIR)\gutter.obj \
	$(OUTDIR)\hash.obj \
	$(OUTDIR)\indent.obj \
	$(OUTDIR)\imgproc.obj \
	$(OUTDIR)\insdel.obj \
	$(OUTDIR)\intl.obj \
	$(OUTDIR)\keymap.obj \
	$(OUTDIR)\line-number.obj \
	$(OUTDIR)\lread.obj \
	$(OUTDIR)\lstream.obj \
	$(OUTDIR)\macros.obj \
	$(OUTDIR)\menubar.obj \
	$(OUTDIR)\marker.obj \
	$(OUTDIR)\md5.obj \
	$(OUTDIR)\minibuf.obj \
	$(OUTDIR)\nt.obj \
	$(OUTDIR)\ntplay.obj \
	$(OUTDIR)\ntproc.obj \
	$(OUTDIR)\objects.obj \
	$(OUTDIR)\opaque.obj \
	$(OUTDIR)\print.obj \
	$(OUTDIR)\process.obj \
	$(OUTDIR)\process-nt.obj \
	$(OUTDIR)\profile.obj \
	$(OUTDIR)\rangetab.obj \
	$(OUTDIR)\realpath.obj \
	$(OUTDIR)\redisplay-output.obj \
	$(OUTDIR)\redisplay.obj \
	$(OUTDIR)\regex.obj \
	$(OUTDIR)\scrollbar.obj \
	$(OUTDIR)\search.obj \
	$(OUTDIR)\select.obj \
	$(OUTDIR)\signal.obj \
	$(OUTDIR)\sound.obj \
	$(OUTDIR)\specifier.obj \
	$(OUTDIR)\strftime.obj \
	$(OUTDIR)\symbols.obj \
	$(OUTDIR)\syntax.obj \
	$(OUTDIR)\sysdep.obj \
	$(OUTDIR)\tparam.obj \
	$(OUTDIR)\undo.obj \
	$(OUTDIR)\widget.obj \
	$(OUTDIR)\window.obj \
	$(OUTDIR)\win32.obj

# Rules

.SUFFIXES:
.SUFFIXES:	.c .obj .texi .info

# nmake rule
!if $(DEBUG_XEMACS)
{$(TEMACS_SRC)}.c{$(OUTDIR)}.obj:
	$(CCV) $(TEMACS_CPP_FLAGS) $< -Fo$@ -Fr$*.sbr -Fd$(OUTDIR)\temacs.pdb
!else
{$(TEMACS_SRC)}.c{$(OUTDIR)}.obj:
	$(CCV) $(TEMACS_CPP_FLAGS) $< -Fo$@
!endif

$(OUTDIR)\emacs.obj:	$(XEMACS)\version.sh

$(OUTDIR)\TopLevelEmacsShell.obj:	$(TEMACS_SRC)\EmacsShell-sub.c
	$(CCV) $(TEMACS_CPP_FLAGS) -DDEFINE_TOP_LEVEL_EMACS_SHELL $** -Fo$@

$(OUTDIR)\TransientEmacsShell.obj: $(TEMACS_SRC)\EmacsShell-sub.c
	$(CCV) $(TEMACS_CPP_FLAGS) -DDEFINE_TRANSIENT_EMACS_SHELL $** -Fo$@

$(OUTDIR)\alloc.obj: $(TEMACS_SRC)\alloc.c

#$(TEMACS_SRC)\Emacs.ad.h: $(XEMACS)\etc\Emacs.ad
#	!"sed -f ad2c.sed < $(XEMACS)\etc\Emacs.ad > $(TEMACS_SRC)\Emacs.ad.h"

#$(TEMACS_SRC)\paths.h: $(TEMACS_SRC)\paths.h.in
#	!"cd $(TEMACS_SRC); cp paths.h.in paths.h"

$(TEMACS): $(TEMACS_INCLUDES) $(TEMACS_OBJS) $(OUTDIR)\xemacs.res
!if $(DEBUG_XEMACS)
	@dir /b/s $(OUTDIR)\*.sbr > bscmake.tmp
	bscmake -nologo -o$(TEMACS_BROWSE) @bscmake.tmp
	$(DEL) bscmake.tmp
!endif
!if $(USE_PORTABLE_DUMPER)
	@if exist $(SRC)\dump-id.c del $(SRC)\dump-id.c
# make a new dump id file.  There is probably a better way to do this, but this works
	@if exist $(OUTDIR)\dump-id.obj del $(OUTDIR)\dump-id.obj
	nmake -nologo -f xemacs.mak OUTDIR=$(OUTDIR) $(OUTDIR)\dump-id.obj
	link.exe @<<
  $(TEMACS_LFLAGS) -out:$@ $(TEMACS_OBJS) $(TEMACS_LIBS) $(OUTDIR)\dump-id.obj
<<
!else
	link.exe @<<
  $(TEMACS_LFLAGS) -out:$@ $(TEMACS_OBJS) $(OUTDIR)\xemacs.res $(TEMACS_LIBS)
<<
!endif

$(OUTDIR)\xemacs.res: xemacs.rc
	rc -Fo$@ xemacs.rc


PROGNAME=$(SRC)\xemacs.exe
TEMACS_BATCH="$(LIB_SRC)\i" "$(TEMACS)" -batch
XEMACS_BATCH="$(LIB_SRC)\i" "$(PROGNAME)" -vanilla -batch

# Section handling automated tests starts here

blddir=$(MAKEDIR:\=\\)\\..
temacs_loadup=$(TEMACS_BATCH) -l $(LISP)/loadup.el
dump_temacs   = $(temacs_loadup) dump
run_temacs    = $(temacs_loadup) run-temacs
## We have automated tests!!
testdir=../tests/automated
batch_test_emacs=-batch -l $(testdir)/test-harness.el -f batch-test-emacs $(testdir)

# .PHONY: check check-temacs

check:
	cd $(SRC)
	$(PROGNAME) $(batch_test_emacs)

check-temacs:
	cd $(SRC)
	set EMACSBOOTSTRAPLOADPATH=$(LISP)
	set EMACSBOOTSTRAPMODULEPATH=$(MODULES)
	$(run_temacs) $(batch_test_emacs)

# Section handling automated tests ends here

# Section handling tags starts here

tagslisp=lisp

tags:
	@echo If you don't have a copy of etags around, then do 'make lib-src' first.
	@echo To make use of the tags file, put the following in your .emacs:
	@echo	(setq tag-table-alist
	@echo	  '(("$(XEMACSDIRSTRING)\\" . "$(XEMACSDIRSTRING)\\")))
	cd $(XEMACS)
	$(DEL) TAGS
	set PATH=lib-src;%PATH%
# we need to double ^, but only before backslash!  Doubling it elsewhere
# causes problems.  I don't understand this -- CMD.EXE uses ^ as a quoting
# convention of sorts, but appears to leave it alone inside of double quotes,
# even before \.  Could this be nmake interference?
	etags -a -r "/[ 	]*DEF\(VAR\|INE\)_[A-Z_]+[ 	]*([ 	]*\"\([^^\"]+\)\"/\2/" src\*.c src\*.h lwlib\*.c lwlib\*.h lib-src\*.c lib-src\*.h
	etags -a -l none -r "/^(def\(var\|un\|alias\|const\|macro\|subst\|struct\|face\|group\|custom\|ine-\(function\|compiler-macro\|[a-z-]+alias\)\)[ 	]+'?\([^ 	]+\)/\3/" $(tagslisp)\*.el

# Section handling tags ends here

# Section handling info starts here

!if !defined(MAKEINFO)
MAKEINFO=$(XEMACS_BATCH) -l texinfmt -f batch-texinfo-format
!endif

MANDIR = $(XEMACS)\man
INFODIR = $(XEMACS)\info
INFO_FILES= \
	$(INFODIR)\cl.info \
	$(INFODIR)\custom.info \
	$(INFODIR)\emodules.info \
	$(INFODIR)\external-widget.info \
	$(INFODIR)\info.info \
	$(INFODIR)\standards.info \
	$(INFODIR)\term.info \
	$(INFODIR)\termcap.info \
	$(INFODIR)\texinfo.info \
	$(INFODIR)\widget.info \
	$(INFODIR)\xemacs-faq.info \
	$(INFODIR)\xemacs.info \
	$(INFODIR)\lispref.info \
	$(INFODIR)\new-users-guide.info \
	$(INFODIR)\internals.info

{$(MANDIR)}.texi{$(INFODIR)}.info:
	cd $(MANDIR)
	$(MAKEINFO) $(**F)

XEMACS_SRCS = \
	$(MANDIR)\xemacs\abbrevs.texi \
	$(MANDIR)\xemacs\basic.texi \
	$(MANDIR)\xemacs\buffers.texi \
	$(MANDIR)\xemacs\building.texi \
	$(MANDIR)\xemacs\calendar.texi \
	$(MANDIR)\xemacs\cmdargs.texi \
	$(MANDIR)\xemacs\custom.texi \
	$(MANDIR)\xemacs\display.texi \
	$(MANDIR)\xemacs\entering.texi \
	$(MANDIR)\xemacs\files.texi \
	$(MANDIR)\xemacs\fixit.texi \
	$(MANDIR)\xemacs\frame.texi \
	$(MANDIR)\xemacs\glossary.texi \
	$(MANDIR)\xemacs\gnu.texi \
	$(MANDIR)\xemacs\help.texi \
	$(MANDIR)\xemacs\indent.texi \
	$(MANDIR)\xemacs\keystrokes.texi \
	$(MANDIR)\xemacs\killing.texi \
	$(MANDIR)\xemacs\m-x.texi \
	$(MANDIR)\xemacs\major.texi \
	$(MANDIR)\xemacs\mark.texi \
	$(MANDIR)\xemacs\menus.texi \
	$(MANDIR)\xemacs\mini.texi \
	$(MANDIR)\xemacs\misc.texi \
	$(MANDIR)\xemacs\mouse.texi \
	$(MANDIR)\xemacs\mule.texi \
	$(MANDIR)\xemacs\new.texi \
	$(MANDIR)\xemacs\packages.texi \
	$(MANDIR)\xemacs\picture.texi \
	$(MANDIR)\xemacs\programs.texi \
	$(MANDIR)\xemacs\reading.texi \
	$(MANDIR)\xemacs\regs.texi \
	$(MANDIR)\xemacs\search.texi \
	$(MANDIR)\xemacs\sending.texi \
	$(MANDIR)\xemacs\startup.texi \
	$(MANDIR)\xemacs\text.texi \
	$(MANDIR)\xemacs\trouble.texi \
	$(MANDIR)\xemacs\undo.texi \
	$(MANDIR)\xemacs\windows.texi \
	$(MANDIR)\xemacs\xemacs.texi

LISPREF_SRCS = \
	$(MANDIR)\lispref\abbrevs.texi \
	$(MANDIR)\lispref\annotations.texi \
	$(MANDIR)\lispref\back.texi \
	$(MANDIR)\lispref\backups.texi \
	$(MANDIR)\lispref\buffers.texi \
	$(MANDIR)\lispref\building.texi \
	$(MANDIR)\lispref\commands.texi \
	$(MANDIR)\lispref\compile.texi \
	$(MANDIR)\lispref\consoles-devices.texi \
	$(MANDIR)\lispref\control.texi \
	$(MANDIR)\lispref\customize.texi \
	$(MANDIR)\lispref\databases.texi \
	$(MANDIR)\lispref\debugging.texi \
	$(MANDIR)\lispref\dialog.texi \
	$(MANDIR)\lispref\display.texi \
	$(MANDIR)\lispref\dragndrop.texi \
	$(MANDIR)\lispref\edebug-inc.texi \
	$(MANDIR)\lispref\edebug.texi \
	$(MANDIR)\lispref\errors.texi \
	$(MANDIR)\lispref\eval.texi \
	$(MANDIR)\lispref\extents.texi \
	$(MANDIR)\lispref\faces.texi \
	$(MANDIR)\lispref\files.texi \
	$(MANDIR)\lispref\frames.texi \
	$(MANDIR)\lispref\functions.texi \
	$(MANDIR)\lispref\glyphs.texi \
	$(MANDIR)\lispref\hash-tables.texi \
	$(MANDIR)\lispref\help.texi \
	$(MANDIR)\lispref\hooks.texi \
	$(MANDIR)\lispref\index.texi \
	$(MANDIR)\lispref\internationalization.texi \
	$(MANDIR)\lispref\intro.texi \
	$(MANDIR)\lispref\keymaps.texi \
	$(MANDIR)\lispref\ldap.texi \
	$(MANDIR)\lispref\lispref.texi \
	$(MANDIR)\lispref\lists.texi \
	$(MANDIR)\lispref\loading.texi \
	$(MANDIR)\lispref\locals.texi \
	$(MANDIR)\lispref\macros.texi \
	$(MANDIR)\lispref\maps.texi \
	$(MANDIR)\lispref\markers.texi \
	$(MANDIR)\lispref\menus.texi \
	$(MANDIR)\lispref\minibuf.texi \
	$(MANDIR)\lispref\modes.texi \
	$(MANDIR)\lispref\mouse.texi \
	$(MANDIR)\lispref\mule.texi \
	$(MANDIR)\lispref\numbers.texi \
	$(MANDIR)\lispref\objects.texi \
	$(MANDIR)\lispref\os.texi \
	$(MANDIR)\lispref\positions.texi \
	$(MANDIR)\lispref\processes.texi \
	$(MANDIR)\lispref\range-tables.texi \
	$(MANDIR)\lispref\scrollbars.texi \
	$(MANDIR)\lispref\searching.texi \
	$(MANDIR)\lispref\sequences.texi \
	$(MANDIR)\lispref\specifiers.texi \
	$(MANDIR)\lispref\streams.texi \
	$(MANDIR)\lispref\strings.texi \
	$(MANDIR)\lispref\symbols.texi \
	$(MANDIR)\lispref\syntax.texi \
	$(MANDIR)\lispref\text.texi \
	$(MANDIR)\lispref\tips.texi \
	$(MANDIR)\lispref\toolbar.texi \
	$(MANDIR)\lispref\tooltalk.texi \
	$(MANDIR)\lispref\variables.texi \
	$(MANDIR)\lispref\windows.texi \
	$(MANDIR)\lispref\x-windows.texi

INTERNALS_SRCS = \
	$(MANDIR)\internals\internals.texi \
	$(MANDIR)\internals\index.texi

NEW_USERS_GUIDE_SRCS = \
	$(MANDIR)\new-users-guide\custom1.texi \
	$(MANDIR)\new-users-guide\custom2.texi \
	$(MANDIR)\new-users-guide\edit.texi \
	$(MANDIR)\new-users-guide\enter.texi \
	$(MANDIR)\new-users-guide\files.texi \
	$(MANDIR)\new-users-guide\help.texi \
	$(MANDIR)\new-users-guide\modes.texi \
	$(MANDIR)\new-users-guide\new-users-guide.texi \
	$(MANDIR)\new-users-guide\region.texi \
	$(MANDIR)\new-users-guide\search.texi \
	$(MANDIR)\new-users-guide\xmenu.texi

$(INFODIR)\xemacs.info: $(XEMACS_SRCS)
	cd $(MANDIR)\xemacs
	$(MAKEINFO) xemacs.texi
	cd ..


$(INFODIR)\lispref.info: $(LISPREF_SRCS)
	cd $(MANDIR)\lispref
	$(MAKEINFO) lispref.texi
	cd ..

$(INFODIR)\internals.info: $(INTERNALS_SRCS)
	cd $(MANDIR)\internals
	$(MAKEINFO) internals.texi
	cd ..

$(INFODIR)\new-users-guide.info: $(NEW_USERS_GUIDE_SRCS)
	cd $(MANDIR)\new-users-guide
	$(MAKEINFO) new-users-guide.texi
	cd ..

info:	makeinfo-test $(INFO_FILES)

makeinfo-test:
	@<<makeinfo_test.bat
@echo off
if exist "$(MAKEINFO)" goto test_done
@$(XEMACS_BATCH) -eval "(condition-case nil (require (quote texinfo)) (t (kill-emacs 1)))"
@if not errorlevel 1 goto suggest_makeinfo
@echo XEmacs 'info' cannot be built!
@echo Install XEmacs package 'texinfo' (see README.packages).
:suggest_makeinfo
@echo Consider specifying path to makeinfo program: MAKEINFO=path
@echo as this will build info docs faster than XEmacs using 'texinfo'.
@if errorlevel 1 exit 1
:test_done
<<NOKEEP

# Section handling info ends here

#------------------------------------------------------------------------------

# LISP bits 'n bobs

LOADPATH=$(LISP)

# Rebuild docfile target
docfile ::
	if exist $(DOC) del $(DOC)
docfile :: $(DOC)

$(DOC): $(LIB_SRC)\make-docfile.exe $(DOC_SRC1) $(DOC_SRC2) $(DOC_SRC3) $(DOC_SRC4) $(DOC_SRC5) $(DOC_SRC6) $(DOC_SRC7) $(DOC_SRC8) $(DOC_SRC9) $(DOC_SRC10) $(DOC_SRC11)
	if exist $(DOC) del $(DOC)
!if defined(PACKAGE_PATH)
	set EMACSBOOTSTRAPLOADPATH=$(LISP);$(PACKAGE_PATH)
!else
	set EMACSBOOTSTRAPLOADPATH=$(LISP)
!endif
	set EMACSBOOTSTRAPMODULEPATH=$(MODULES)
	$(TEMACS_BATCH) -l $(TEMACS_DIR)\..\lisp\make-docfile.el -- -o $(DOC) -i $(XEMACS)\site-packages
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC1)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC2)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC3)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC4)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC5)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC6)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC7)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC8)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC9)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC10)
	$(LIB_SRC)\make-docfile.exe -a $(DOC) -d $(TEMACS_SRC) $(DOC_SRC11)

update-elc:
!if defined(PACKAGE_PATH)
	set EMACSBOOTSTRAPLOADPATH=$(LISP);$(PACKAGE_PATH)
!else
	set EMACSBOOTSTRAPLOADPATH=$(LISP)
!endif
	set EMACSBOOTSTRAPMODULEPATH=$(MODULES)
	$(TEMACS_BATCH) -l $(TEMACS_DIR)\..\lisp\update-elc.el

# This file is touched by update-elc.el when redumping is necessary.
$(TEMACS_DIR)\NEEDTODUMP :
	@echo >$(TEMACS_DIR)\NEEDTODUMP

# This rule dumps xemacs and then possibly spawns sub-make if PURESPACE
# requirements have changed.

$(PROGNAME) : $(TEMACS) $(TEMACS_DIR)\NEEDTODUMP
	@echo >$(TEMACS_DIR)\SATISFIED
	cd $(TEMACS_DIR)
!if defined(PACKAGE_PATH)
	set EMACSBOOTSTRAPLOADPATH=$(LISP);$(PACKAGE_PATH)
!else
	set EMACSBOOTSTRAPLOADPATH=$(LISP)
!endif
	set EMACSBOOTSTRAPMODULEPATH=$(MODULES)
	$(TEMACS_BATCH) -l $(TEMACS_DIR)\..\lisp\loadup.el dump
!if $(USE_PORTABLE_DUMPER)
	rc -d INCLUDE_DUMP -Fo $(OUTDIR)\xemacs.res $(NT)\xemacs.rc
	link.exe @<<
  $(TEMACS_LFLAGS) -out:xemacs.exe $(TEMACS_OBJS) $(OUTDIR)\xemacs.res $(TEMACS_LIBS) $(OUTDIR)\dump-id.obj
<<
# Make the resource section read/write since almost all of it is the dump
# data which needs to be writable.  This avoids having to copy it.
	editbin -nologo -stack:0x800000 -section:.rsrc,rw xemacs.exe
	$(DEL) $(TEMACS_DIR)\xemacs.dmp
!else
	editbin -nologo -stack:0x800000 xemacs.exe
!endif
	cd $(NT)
	@if not exist $(TEMACS_DIR)\SATISFIED nmake -nologo -f xemacs.mak $@
#------------------------------------------------------------------------------

# use this rule to build the complete system
all:	installation $(OUTDIR)\nul $(LASTFILE) $(LWLIB) \
	$(LIB_SRC_TOOLS) $(TEMACS) update-elc $(DOC) $(PROGNAME) \
	update-elc-2 update-auto-and-custom info

temacs: $(LASTFILE) $(TEMACS)

# use this rule to install the system
install:	all
	cd $(NT)
	set COPYCMD=$(COPYCMD)
	@echo Installing in $(INSTALL_DIR) ...
	@echo PlaceHolder > PlaceHolder
	@xcopy /q PROBLEMS "$(INSTALL_DIR)\"
	@xcopy /q PlaceHolder "$(INSTALL_DIR)\lock\"
	$(DEL) "$(INSTALL_DIR)\lock\PlaceHolder"
	@xcopy /q $(LIB_SRC)\*.exe "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)\"
	@copy $(LIB_SRC)\DOC "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)"
	@copy $(CONFIG_VALUES) "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)"
	@copy $(SRC)\xemacs.exe "$(INSTALL_DIR)\$(EMACS_CONFIGURATION)"
	@xcopy /e /q $(XEMACS)\etc  "$(INSTALL_DIR)\etc\"
	@xcopy /e /q $(XEMACS)\info "$(INSTALL_DIR)\info\"
	@xcopy /e /q $(XEMACS)\lisp "$(INSTALL_DIR)\lisp\"
!if defined(PACKAGE_PREFIX)
	@echo Making skeleton package tree in $(PACKAGE_PREFIX) ...
	@xcopy /q PlaceHolder "$(PACKAGE_PREFIX)\site-packages\"
	$(DEL) "$(PACKAGE_PREFIX)\site-packages\PlaceHolder"
	@xcopy /q PlaceHolder "$(PACKAGE_PREFIX)\mule-packages\"
	$(DEL) "$(PACKAGE_PREFIX)\mule-packages\PlaceHolder"
	@xcopy /q PlaceHolder "$(PACKAGE_PREFIX)\xemacs-packages\"
	$(DEL) "$(PACKAGE_PREFIX)\xemacs-packages\PlaceHolder"
!endif
	$(DEL) PlaceHolder

mostlyclean:
	$(DEL) $(XEMACS)\Installation
	$(DEL) $(OUTDIR)\*.lib
	$(DEL) $(OUTDIR)\*.obj
	$(DEL) $(OUTDIR)\*.pdb
	$(DEL) $(OUTDIR)\*.res
	$(DEL) $(OUTDIR)\*.sbr
	$(DEL) $(SRC)\*.exe
	$(DEL) $(SRC)\*.map
	$(DEL) $(SRC)\*.bsc
	$(DEL) $(SRC)\*.pdb
	$(DEL) $(LIB_SRC)\*.exe
	$(DEL) $(LIB_SRC)\*.obj
	$(DEL) $(LIB_SRC)\*.pdb
	$(DEL) $(LIB_SRC)\*.res

clean: mostlyclean versionclean
	$(DEL) $(XEMACS)\TAGS

nicenclean: clean
	$(DEL) $(NT)\*.bak
	$(DEL) $(NT)\*.orig
	$(DEL) $(NT)\*.rej
	$(DEL) $(NT)\*.tmp
	$(DEL) $(LIB_SRC)\*.bak
	$(DEL) $(LIB_SRC)\*.orig
	$(DEL) $(LIB_SRC)\*.rej
	$(DEL) $(LIB_SRC)\*.tmp
	$(DEL) $(SRC)\*.bak
	$(DEL) $(SRC)\*.orig
	$(DEL) $(SRC)\*.rej
	$(DEL) $(SRC)\*.tmp
	$(DEL) $(LISP)\*.bak
	$(DEL) $(LISP)\*.orig
	$(DEL) $(LISP)\*.rej
	$(DEL) $(LISP)\*.tmp

## This is used in making a distribution.
## Do not use it on development directories!
distclean: nicenclean
	$(DEL) $(SRC)\config.h
	$(DEL) $(SRC)\paths.h
	$(DEL) $(SRC)\Emacs.ad.h
	$(DEL) $(CONFIG_VALUES)
	$(DEL) $(INFODIR)\*.info*
	$(DEL) $(LISP)\*.elc

realclean: distclean

versionclean:
	$(DEL) $(SRC)\xemacs.exe
	$(DEL) $(LIB_SRC)\DOC

#not sure about those wildcards.  DOS wildcards are stupid compared to Unix,
#and could end up deleting *everything* instead of just backup files or
#whatever.
#extraclean: realclean
#	$(DEL) *~ *.*~ #* m\*~ m\#* s\*~ s\#*

depend:
	cd $(SRC)
	perl ./make-src-depend > depend.tmp
	perl -MFile::Compare -e "compare('depend.tmp', 'depend') && rename('depend.tmp', 'depend') or unlink('depend.tmp')"

$(XEMACS)\Installation::	installation

installation::
	@echo OS version:>$(XEMACS)\Installation
	@ver >> $(XEMACS)\Installation
	@type >> $(XEMACS)\Installation <<
!if defined(OS)
OS: $(OS)
!endif

XEmacs $(XEMACS_VERSION_STRING) $(xemacs_codename) configured for `$(EMACS_CONFIGURATION)'.

  Building XEmacs in "$(MAKEDIR:\=\\)".
!if defined(CCV)
  Using compiler "$(CC) $(CFLAGS)".
!endif
  Installing XEmacs in "$(INSTALL_DIR:\=\\)".
!if defined(PATH_PACKAGEPATH)
  Package path is $(PATH_PACKAGEPATH).
!endif
!if $(INFODOCK)
  Building InfoDock.
!endif
!if $(HAVE_MS_WINDOWS)
  Compiling in support for Microsoft Windows native GUI.
!endif
!if $(HAVE_X_WINDOWS)
  Compiling in support for X-Windows.
!endif
!if $(HAVE_MULE)
  Compiling in MULE.
!endif
!if $(HAVE_GTK)
  --------------------------------------------------------------------
  WARNING: You specified HAVE_GTK=1, but we are compiling WITHOUT GTK support.
  WARNING: gtk-xemacs is not currently supported on MSWindows (mingw or msvc).
  WARNING: Yes, we know that gtk has been ported to native MSWindows, but
  WARNING: XEmacs is not yet ready to use that port.
  --------------------------------------------------------------------
!endif
!if $(HAVE_XPM)
  Compiling in support for XPM images.
!else
  --------------------------------------------------------------------
  WARNING: Compiling without XPM support.
  WARNING: You should strongly consider installing XPM.
  WARNING: Otherwise toolbars and other graphics will look suboptimal.
  WARNING: (a copy may be found in ftp://ftp.xemacs.org/pub/xemacs/aux)
  --------------------------------------------------------------------
!endif
!if $(HAVE_GIF)
  Compiling in support for GIF images.
!endif
!if $(HAVE_PNG)
  Compiling in support for PNG images.
!else
  --------------------------------------------------------------------
  WARNING: Compiling without PNG image support.
  WARNING: You should strongly consider installing the PNG libraries.
  WARNING: Otherwise certain images and glyphs may not display.
  WARNING: (a copy may be found in ftp://ftp.xemacs.org/pub/xemacs/aux
  --------------------------------------------------------------------
!endif
!if $(HAVE_TIFF)
  Compiling in support for TIFF images.
!endif
!if $(HAVE_JPEG)
  Compiling in support for JPEG images.
!endif
!if $(HAVE_XFACE)
  Compiling in support for X-Face message headers.
!endif
!if $(HAVE_TOOLBARS)
  Compiling in support for toolbars.
!endif
!if $(HAVE_DIALOGS)
  Compiling in support for dialogs.
!endif
!if $(HAVE_WIDGETS)
  Compiling in support for widgets.
!endif
!if $(HAVE_NATIVE_SOUND)
  Compiling in support for native sounds.
!endif
!if $(HAVE_MSW_C_DIRED)
  Compiling in fast dired implementation.
!else
  --------------------------------------------------------------------
  WARNING: Define HAVE_MSW_C_DIRED to be non-zero if you want XEmacs
  WARNING: to use C primitives to significantly speed up dired, at the
  WARNING: expense of an additional ~4KB of code.
  --------------------------------------------------------------------
!endif
!if $(USE_UNION_TYPE)
  Using union type for Lisp object storage.
!endif
!if $(USE_PORTABLE_DUMPER)
  Using portable dumper.
!endif
!if $(USE_SYSTEM_MALLOC)
  Using system malloc.
!endif
!if $(USE_CRTDLL)
  Using DLL version of C runtime library
!endif
!if $(DEBUG_XEMACS)
  Compiling in extra debug checks. XEmacs will be slow!
!endif
!if $(QUICK_BUILD)
  Disabling non-essential build actions.  Use with care!
!endif
<<NOKEEP
	@echo --------------------------------------------------------------------
	@type $(XEMACS)\Installation
	@echo --------------------------------------------------------------------

# Update out-of-date .elcs, other than needed for dumping.
update-elc-2:
	$(XEMACS_BATCH) -l update-elc-2.el -f batch-update-elc-2 $(LISP)

# Update auto-autoloads.el and custom-load.el, similar to what
# XEmacs.rules does for xemacs-packages.  This used to delete
# auto-autoloads.el first, but that's a bad idea, because it forces
# rebuilding from scratch, which is time-consuming; and the autoload
# code is specifically written to do in-place updating.  However, if
# your auto-autoload file is messed up and you want it rebuilt from
# scratch, delete it from the command line and then nmake with this
# target.
update-auto-and-custom:
#       Combine into one invocation to avoid repeated startup penalty.
	$(XEMACS_BATCH) -l autoload -f batch-update-one-directory $(LISP) -f batch-byte-compile-one-file $(LISP)\auto-autoloads.el -l cus-dep -f Custom-make-one-dependency $(LISP) -f batch-byte-compile-one-file $(LISP)\custom-load.el
	$(DEL) $(LISP)\auto-autoloads.el~
	$(DEL) $(LISP)\custom-load.el~

# DO NOT DELETE THIS LINE -- make depend depends on it.

