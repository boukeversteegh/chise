#
# Compface Makefile for Microsoft NMAKE
# Based on xpm.mak
#

!if !defined(DEBUG_XEMACS)
DEBUG_XEMACS=0
!endif

!if $(DEBUG_XEMACS)
OPT=-Od -Zi
!else
OPT=-O2 -G5 -Zi
!endif

WARN_CPP_FLAGS = -W3

#MSVC uses string.h, not strings.h
DEFINES=-DSYSV32

CC=cl
CFLAGS=-nologo -DFOR_MSW $(WARN_CPP_FLAGS) $(OPT) $(INCLUDES) $(DEFINES) -Fo$@ -c

OBJS= arith.obj file.obj compress.obj gen.obj uncompface.obj

# nmake rule

.SUFFIXES:
.SUFFIXES:	.c

.c.obj:
	$(CC) $(CFLAGS) $< -Fo$@


# targets

all: libcompface.lib

libcompface.lib: $(OBJS)
	link.exe -lib -nologo -out:$@ $(OBJS)

clean: $(OBJS)
	-rm -f $(OBJS) libcompface.lib
