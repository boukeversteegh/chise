#
# TIFF makefile for Microsoft nmake
#
!if !defined(DEBUG_XEMACS)
DEBUG_XEMACS=0
!endif

!if $(DEBUG_XEMACS)
OPT=-Od -Zi
!else
OPT=-O2 -G5
!endif

WARN_CPP_FLAGS = -W3
CFLAGS=-nologo -DFOR_MSW $(WARN_CPP_FLAGS) $(OPT) -c

OUTDIR=.\WinRel
OBJDIR=.\WinRel
# the following is because fax3sm.c references "tiff.h" and "tif_fax3.h",
# under the assumption that those header files are in the same directory
# as fax3sm.c  But, since we're using a special fax3sm.c file, and we
# can't be sure the user has patch to change "xx" to "..\..\libtiff\xx",
# let's just copy these header files to this directory. (Symbolic links
# would be _so_ nice)
NEED_FOR_COMPILE= tiff.h tif_fax3.h

CPP=cl.exe
CPP_PROJ= /GX /YX /I "." /I ".." /D "WIN32" /D "NDEBUG" /D\
 "_WINDOWS" /FR$(OBJDIR)/ /Fp$(OUTDIR)/"libtiff.pch" $(CFLAGS)

BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o$(OUTDIR)/libtiff.bsc 

LIB32=lib.exe
LIB32_FLAGS=/NOLOGO /OUT:$(OUTDIR)\libtiff.lib 
DEF_FLAGS=
DEF_FILE=

BSC32_SBRS= \
	$(OBJDIR)\tif_jpeg.sbr \
	$(OBJDIR)\tif_dirinfo.sbr \
	$(OBJDIR)\tif_win32.sbr \
	$(OBJDIR)\tif_flush.sbr \
	$(OBJDIR)\tif_thunder.sbr \
	$(OBJDIR)\tif_compress.sbr \
	$(OBJDIR)\tif_print.sbr \
	$(OBJDIR)\tif_dirread.sbr \
	$(OBJDIR)\tif_getimage.sbr \
	$(OBJDIR)\tif_fax3.sbr \
	$(OBJDIR)\tif_version.sbr \
	$(OBJDIR)\tif_codec.sbr \
	$(OBJDIR)\tif_dir.sbr \
	$(OBJDIR)\tif_predict.sbr \
	$(OBJDIR)\tif_close.sbr \
	$(OBJDIR)\tif_dumpmode.sbr \
	$(OBJDIR)\tif_aux.sbr \
	$(OBJDIR)\tif_error.sbr \
	$(OBJDIR)\tif_lzw.sbr \
	$(OBJDIR)\tif_zip.sbr \
	$(OBJDIR)\tif_read.sbr \
	$(OBJDIR)\tif_packbits.sbr \
	$(OBJDIR)\tif_swab.sbr \
	$(OBJDIR)\tif_dirwrite.sbr \
	$(OBJDIR)\tif_open.sbr \
	$(OBJDIR)\tif_warning.sbr \
	$(OBJDIR)\tif_tile.sbr \
	$(OBJDIR)\tif_strip.sbr \
	$(OBJDIR)\tif_next.sbr \
	$(OBJDIR)\tif_write.sbr \
	$(OBJDIR)\fax3sm.sbr

LIB32_OBJS= \
	$(OBJDIR)\tif_jpeg.obj \
	$(OBJDIR)\tif_dirinfo.obj \
	$(OBJDIR)\tif_win32.obj \
	$(OBJDIR)\tif_flush.obj \
	$(OBJDIR)\tif_thunder.obj \
	$(OBJDIR)\tif_compress.obj \
	$(OBJDIR)\tif_print.obj \
	$(OBJDIR)\tif_dirread.obj \
	$(OBJDIR)\tif_getimage.obj \
	$(OBJDIR)\tif_fax3.obj \
	$(OBJDIR)\tif_version.obj \
	$(OBJDIR)\tif_codec.obj \
	$(OBJDIR)\tif_dir.obj \
	$(OBJDIR)\tif_predict.obj \
	$(OBJDIR)\tif_close.obj \
	$(OBJDIR)\tif_dumpmode.obj \
	$(OBJDIR)\tif_aux.obj \
	$(OBJDIR)\tif_error.obj \
	$(OBJDIR)\tif_lzw.obj \
	$(OBJDIR)\tif_zip.obj \
	$(OBJDIR)\tif_read.obj \
	$(OBJDIR)\tif_packbits.obj \
	$(OBJDIR)\tif_swab.obj \
	$(OBJDIR)\tif_dirwrite.obj \
	$(OBJDIR)\tif_open.obj \
	$(OBJDIR)\tif_warning.obj \
	$(OBJDIR)\tif_tile.obj \
	$(OBJDIR)\tif_strip.obj \
	$(OBJDIR)\tif_next.obj \
	$(OBJDIR)\tif_write.obj \
	$(OBJDIR)\fax3sm.obj

# nmake rule

.SUFFIXES:
.SUFFIXES:	.c .obj

{..\..\libtiff}.c{$(OBJDIR)}.obj:
	$(CPP) $(CPP_PROJ) $< -Fo$@


ALL : $(OUTDIR)/libtiff.lib $(OUTDIR)/libtiff.bsc

clean : 
	-del tiff.h
	-del tif_fax3.h
	-del t4.h
	-del tiffcomp.h
	-del tiffconf.h
	-del tiffio.h
	-del ..\..\libtiff\libtiff.lib
	-del *.pdb
	-del $(OBJDIR)\*.obj
	-del $(OBJDIR)\*.sbr
	-del $(OUTDIR)\libtiff.lib
	-del $(OUTDIR)\libtiff.bsc
	-del $(OUTDIR)\libtiff.pch
	-rmdir $(OUTDIR)

tiff.h :
	if not exist ./tiff.h copy ..\..\libtiff\tiff.h .
tif_fax3.h :
	if not exist ./tif_fax3.h copy ..\..\libtiff\tif_fax3.h .

$(OUTDIR) : $(NEED_FOR_COMPILE)
        if not exist $(OUTDIR)/nul mkdir $(OUTDIR)

$(OUTDIR)/libtiff.bsc : $(OUTDIR)  $(BSC32_SBRS)
	$(BSC32) @<< 
	$(BSC32_FLAGS) $(BSC32_SBRS) 
<<

$(OUTDIR)/libtiff.lib : $(OUTDIR)  $(DEF_FILE) $(LIB32_OBJS)
	$(LIB32) @<< 
	$(LIB32_FLAGS) $(DEF_FLAGS) $(LIB32_OBJS) 
<<
	copy $(OUTDIR)\libtiff.lib ..\..\libtiff\libtiff.lib

DEP_FAX3S=\
	..\..\libtiff\tiff.h     \
	..\..\libtiff\tif_fax3.h
$(OBJDIR)/fax3sm.obj :  $(DEP_FAX3S) $(OBJDIR)
	$(CPP) $(CPP_PROJ) .\fax3sm.c -Fo$@

