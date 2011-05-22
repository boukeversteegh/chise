# Microsoft Developer Studio Project File - Name="xemacs" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 5.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) External Target" 0x0106

CFG=xemacs - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "xemacs.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "xemacs.mak" CFG="xemacs - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "xemacs - Win32 Release" (based on "Win32 (x86) External Target")
!MESSAGE "xemacs - Win32 Debug" (based on "Win32 (x86) External Target")
!MESSAGE 

# Begin Project
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""

!IF  "$(CFG)" == "xemacs - Win32 Release"

# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Cmd_Line "NMAKE /f xemacs.mak"
# PROP BASE Rebuild_Opt "/a"
# PROP BASE Target_File "xemacs.exe"
# PROP BASE Bsc_Name "xemacs.bsc"
# PROP BASE Target_Dir ""
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "..\src"
# PROP Intermediate_Dir "obj"
# PROP Cmd_Line "NMAKE /f xemacs.mak"
# PROP Rebuild_Opt "/a"
# PROP Target_File "xemacs.exe"
# PROP Bsc_Name "xemacs.bsc"
# PROP Target_Dir ""

!ELSEIF  "$(CFG)" == "xemacs - Win32 Debug"

# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "Debug"
# PROP BASE Intermediate_Dir "Debug"
# PROP BASE Cmd_Line "NMAKE /f xemacs.mak"
# PROP BASE Rebuild_Opt "/a"
# PROP BASE Target_File "xemacs.exe"
# PROP BASE Bsc_Name "xemacs.bsc"
# PROP BASE Target_Dir ""
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "..\src"
# PROP Intermediate_Dir "obj"
# PROP Cmd_Line "NMAKE /f xemacs.mak"
# PROP Rebuild_Opt "/a"
# PROP Target_File "..\src\xemacs.exe"
# PROP Bsc_Name "..\src\temacs.bsc"
# PROP Target_Dir ""

!ENDIF 

# Begin Target

# Name "xemacs - Win32 Release"
# Name "xemacs - Win32 Debug"

!IF  "$(CFG)" == "xemacs - Win32 Release"

!ELSEIF  "$(CFG)" == "xemacs - Win32 Debug"

!ENDIF 

# Begin Source File

SOURCE=..\src\abbrev.c
# End Source File
# Begin Source File

SOURCE=..\src\alloc.c
# End Source File
# Begin Source File

SOURCE=..\src\alloca.c
# End Source File
# Begin Source File

SOURCE=..\src\backtrace.h
# End Source File
# Begin Source File

SOURCE="..\src\balloon-x.c"
# End Source File
# Begin Source File

SOURCE=..\src\balloon_help.c
# End Source File
# Begin Source File

SOURCE=..\src\balloon_help.h
# End Source File
# Begin Source File

SOURCE=..\src\bitmaps.h
# End Source File
# Begin Source File

SOURCE=..\src\blocktype.c
# End Source File
# Begin Source File

SOURCE=..\src\blocktype.h
# End Source File
# Begin Source File

SOURCE="..\src\broken-sun.h"
# End Source File
# Begin Source File

SOURCE=..\src\buffer.c
# End Source File
# Begin Source File

SOURCE=..\src\buffer.h
# End Source File
# Begin Source File

SOURCE=..\src\bufslots.h
# End Source File
# Begin Source File

SOURCE=..\src\bytecode.c
# End Source File
# Begin Source File

SOURCE=..\src\bytecode.h
# End Source File
# Begin Source File

SOURCE=..\src\callint.c
# End Source File
# Begin Source File

SOURCE=..\src\callproc.c
# End Source File
# Begin Source File

SOURCE=..\src\casefiddle.c
# End Source File
# Begin Source File

SOURCE=..\src\casetab.c
# End Source File
# Begin Source File

SOURCE=..\src\chartab.c
# End Source File
# Begin Source File

SOURCE=..\src\chartab.h
# End Source File
# Begin Source File

SOURCE=..\src\cm.c
# End Source File
# Begin Source File

SOURCE=..\src\cm.h
# End Source File
# Begin Source File

SOURCE=..\src\cmdloop.c
# End Source File
# Begin Source File

SOURCE=..\src\cmds.c
# End Source File
# Begin Source File

SOURCE=..\src\commands.h
# End Source File
# Begin Source File

SOURCE=..\src\config.h
# End Source File
# Begin Source File

SOURCE=..\src\conslots.h
# End Source File
# Begin Source File

SOURCE="..\src\console-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\console-msw.h"
# End Source File
# Begin Source File

SOURCE="..\src\console-stream.c"
# End Source File
# Begin Source File

SOURCE="..\src\console-stream.h"
# End Source File
# Begin Source File

SOURCE="..\src\console-tty.c"
# End Source File
# Begin Source File

SOURCE="..\src\console-tty.h"
# End Source File
# Begin Source File

SOURCE="..\src\console-x.c"
# End Source File
# Begin Source File

SOURCE="..\src\console-x.h"
# End Source File
# Begin Source File

SOURCE=..\src\console.c
# End Source File
# Begin Source File

SOURCE=..\src\console.h
# End Source File
# Begin Source File

SOURCE=..\src\data.c
# End Source File
# Begin Source File

SOURCE=..\src\database.c
# End Source File
# Begin Source File

SOURCE=..\src\database.h
# End Source File
# Begin Source File

SOURCE=..\src\debug.c
# End Source File
# Begin Source File

SOURCE=..\src\debug.h
# End Source File
# Begin Source File

SOURCE="..\src\device-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\device-tty.c"
# End Source File
# Begin Source File

SOURCE="..\src\device-x.c"
# End Source File
# Begin Source File

SOURCE=..\src\device.c
# End Source File
# Begin Source File

SOURCE=..\src\device.h
# End Source File
# Begin Source File

SOURCE=..\src\dgif_lib.c
# End Source File
# Begin Source File

SOURCE="..\src\dialog-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\dialog-x.c"
# End Source File
# Begin Source File

SOURCE=..\src\dialog.c
# End Source File
# Begin Source File

SOURCE="..\src\dired-msw.c"
# End Source File
# Begin Source File

SOURCE=..\src\dired.c
# End Source File
# Begin Source File

SOURCE=..\src\doc.c
# End Source File
# Begin Source File

SOURCE=..\src\doprnt.c
# End Source File
# Begin Source File

SOURCE=..\src\dragdrop.c
# End Source File
# Begin Source File

SOURCE=..\src\dragdrop.h
# End Source File
# Begin Source File

SOURCE=..\src\dynarr.c
# End Source File
# Begin Source File

SOURCE=..\src\ecrt0.c
# End Source File
# Begin Source File

SOURCE=..\src\editfns.c
# End Source File
# Begin Source File

SOURCE=..\src\eldap.c
# End Source File
# Begin Source File

SOURCE=..\src\eldap.h
# End Source File
# Begin Source File

SOURCE=..\src\elhash.c
# End Source File
# Begin Source File

SOURCE=..\src\elhash.h
# End Source File
# Begin Source File

SOURCE=..\src\Emacs.ad.h
# End Source File
# Begin Source File

SOURCE=..\src\emacs.c
# End Source File
# Begin Source File

SOURCE=..\src\EmacsFrame.c
# End Source File
# Begin Source File

SOURCE=..\src\EmacsFrame.h
# End Source File
# Begin Source File

SOURCE=..\src\EmacsFrameP.h
# End Source File
# Begin Source File

SOURCE=..\src\EmacsManager.c
# End Source File
# Begin Source File

SOURCE=..\src\EmacsManager.h
# End Source File
# Begin Source File

SOURCE=..\src\EmacsManagerP.h
# End Source File
# Begin Source File

SOURCE="..\src\EmacsShell-sub.c"
# End Source File
# Begin Source File

SOURCE=..\src\EmacsShell.c
# End Source File
# Begin Source File

SOURCE=..\src\EmacsShell.h
# End Source File
# Begin Source File

SOURCE=..\src\EmacsShellP.h
# End Source File
# Begin Source File

SOURCE=..\src\emodules.c
# End Source File
# Begin Source File

SOURCE=..\src\emodules.h
# End Source File
# Begin Source File

SOURCE=..\src\esd.c
# End Source File
# Begin Source File

SOURCE=..\src\eval.c
# End Source File
# Begin Source File

SOURCE="..\src\event-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\event-stream.c"
# End Source File
# Begin Source File

SOURCE="..\src\event-tty.c"
# End Source File
# Begin Source File

SOURCE="..\src\event-unixoid.c"
# End Source File
# Begin Source File

SOURCE="..\src\event-Xt.c"
# End Source File
# Begin Source File

SOURCE="..\src\events-mod.h"
# End Source File
# Begin Source File

SOURCE=..\src\events.c
# End Source File
# Begin Source File

SOURCE=..\src\events.h
# End Source File
# Begin Source File

SOURCE=..\src\extents.c
# End Source File
# Begin Source File

SOURCE=..\src\extents.h
# End Source File
# Begin Source File

SOURCE="..\src\ExternalClient-Xlib.c"
# End Source File
# Begin Source File

SOURCE=..\src\ExternalClient.c
# End Source File
# Begin Source File

SOURCE=..\src\ExternalClient.h
# End Source File
# Begin Source File

SOURCE=..\src\ExternalClientP.h
# End Source File
# Begin Source File

SOURCE=..\src\ExternalShell.c
# End Source File
# Begin Source File

SOURCE=..\src\ExternalShell.h
# End Source File
# Begin Source File

SOURCE=..\src\ExternalShellP.h
# End Source File
# Begin Source File

SOURCE="..\src\extw-Xlib.c"
# End Source File
# Begin Source File

SOURCE="..\src\extw-Xlib.h"
# End Source File
# Begin Source File

SOURCE="..\src\extw-Xt.c"
# End Source File
# Begin Source File

SOURCE="..\src\extw-Xt.h"
# End Source File
# Begin Source File

SOURCE=..\src\faces.c
# End Source File
# Begin Source File

SOURCE=..\src\faces.h
# End Source File
# Begin Source File

SOURCE="..\src\file-coding.c"
# End Source File
# Begin Source File

SOURCE="..\src\file-coding.h"
# End Source File
# Begin Source File

SOURCE=..\src\fileio.c
# End Source File
# Begin Source File

SOURCE=..\src\filelock.c
# End Source File
# Begin Source File

SOURCE=..\src\filemode.c
# End Source File
# Begin Source File

SOURCE=..\src\floatfns.c
# End Source File
# Begin Source File

SOURCE=..\src\fns.c
# End Source File
# Begin Source File

SOURCE="..\src\font-lock.c"
# End Source File
# Begin Source File

SOURCE="..\src\frame-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\frame-tty.c"
# End Source File
# Begin Source File

SOURCE="..\src\frame-x.c"
# End Source File
# Begin Source File

SOURCE=..\src\frame.c
# End Source File
# Begin Source File

SOURCE=..\src\frame.h
# End Source File
# Begin Source File

SOURCE=..\src\frameslots.h
# End Source File
# Begin Source File

SOURCE="..\src\free-hook.c"
# End Source File
# Begin Source File

SOURCE=..\src\general.c
# End Source File
# Begin Source File

SOURCE=..\src\getloadavg.c
# End Source File
# Begin Source File

SOURCE=..\src\getpagesize.h
# End Source File
# Begin Source File

SOURCE=..\src\gif_io.c
# End Source File
# Begin Source File

SOURCE=..\src\gifrlib.h
# End Source File
# Begin Source File

SOURCE="..\src\glyphs-eimage.c"
# End Source File
# Begin Source File

SOURCE="..\src\glyphs-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\glyphs-msw.h"
# End Source File
# Begin Source File

SOURCE="..\src\glyphs-widget.c"
# End Source File
# Begin Source File

SOURCE="..\src\glyphs-x.c"
# End Source File
# Begin Source File

SOURCE="..\src\glyphs-x.h"
# End Source File
# Begin Source File

SOURCE=..\src\glyphs.c
# End Source File
# Begin Source File

SOURCE=..\src\glyphs.h
# End Source File
# Begin Source File

SOURCE=..\src\gmalloc.c
# End Source File
# Begin Source File

SOURCE=..\src\gpmevent.c
# End Source File
# Begin Source File

SOURCE=..\src\gpmevent.h
# End Source File
# Begin Source File

SOURCE="..\src\gui-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\gui-x.c"
# End Source File
# Begin Source File

SOURCE="..\src\gui-x.h"
# End Source File
# Begin Source File

SOURCE=..\src\gui.c
# End Source File
# Begin Source File

SOURCE=..\src\gui.h
# End Source File
# Begin Source File

SOURCE=..\src\gutter.c
# End Source File
# Begin Source File

SOURCE=..\src\gutter.h
# End Source File
# Begin Source File

SOURCE=..\src\hash.c
# End Source File
# Begin Source File

SOURCE=..\src\hash.h
# End Source File
# Begin Source File

SOURCE=..\src\hftctl.c
# End Source File
# Begin Source File

SOURCE=..\src\hpplay.c
# End Source File
# Begin Source File

SOURCE=..\src\imgproc.c
# End Source File
# Begin Source File

SOURCE=..\src\imgproc.h
# End Source File
# Begin Source File

SOURCE=..\src\indent.c
# End Source File
# Begin Source File

SOURCE=..\src\inline.c
# End Source File
# Begin Source File

SOURCE="..\src\input-method-motif.c"
# End Source File
# Begin Source File

SOURCE="..\src\input-method-xfs.c"
# End Source File
# Begin Source File

SOURCE="..\src\input-method-xlib.c"
# End Source File
# Begin Source File

SOURCE=..\src\insdel.c
# End Source File
# Begin Source File

SOURCE=..\src\insdel.h
# End Source File
# Begin Source File

SOURCE=..\src\intl.c
# End Source File
# Begin Source File

SOURCE="..\src\iso-wide.h"
# End Source File
# Begin Source File

SOURCE=..\src\keymap.c
# End Source File
# Begin Source File

SOURCE=..\src\keymap.h
# End Source File
# Begin Source File

SOURCE=..\src\lastfile.c
# End Source File
# Begin Source File

SOURCE=..\src\libsst.c
# End Source File
# Begin Source File

SOURCE=..\src\libsst.h
# End Source File
# Begin Source File

SOURCE=..\src\libst.h
# End Source File
# Begin Source File

SOURCE="..\src\line-number.c"
# End Source File
# Begin Source File

SOURCE="..\src\line-number.h"
# End Source File
# Begin Source File

SOURCE=..\src\linuxplay.c
# End Source File
# Begin Source File

SOURCE="..\src\lisp-disunion.h"
# End Source File
# Begin Source File

SOURCE="..\src\lisp-union.h"
# End Source File
# Begin Source File

SOURCE=..\src\lisp.h
# End Source File
# Begin Source File

SOURCE=..\src\lread.c
# End Source File
# Begin Source File

SOURCE=..\src\lrecord.h
# End Source File
# Begin Source File

SOURCE=..\src\lstream.c
# End Source File
# Begin Source File

SOURCE=..\src\lstream.h
# End Source File
# Begin Source File

SOURCE=..\src\macros.c
# End Source File
# Begin Source File

SOURCE=..\src\macros.h
# End Source File
# Begin Source File

SOURCE=..\src\malloc.c
# End Source File
# Begin Source File

SOURCE=..\src\marker.c
# End Source File
# Begin Source File

SOURCE=..\src\md5.c
# End Source File
# Begin Source File

SOURCE="..\src\mem-limits.h"
# End Source File
# Begin Source File

SOURCE="..\src\menubar-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\menubar-msw.h"
# End Source File
# Begin Source File

SOURCE="..\src\menubar-x.c"
# End Source File
# Begin Source File

SOURCE=..\src\menubar.c
# End Source File
# Begin Source File

SOURCE=..\src\menubar.h
# End Source File
# Begin Source File

SOURCE=..\src\minibuf.c
# End Source File
# Begin Source File

SOURCE=..\src\miscplay.c
# End Source File
# Begin Source File

SOURCE=..\src\miscplay.h
# End Source File
# Begin Source File

SOURCE="..\src\mule-canna.c"
# End Source File
# Begin Source File

SOURCE="..\src\mule-ccl.c"
# End Source File
# Begin Source File

SOURCE="..\src\mule-ccl.h"
# End Source File
# Begin Source File

SOURCE="..\src\mule-charset.c"
# End Source File
# Begin Source File

SOURCE="..\src\mule-charset.h"
# End Source File
# Begin Source File

SOURCE="..\src\mule-mcpath.c"
# End Source File
# Begin Source File

SOURCE="..\src\mule-mcpath.h"
# End Source File
# Begin Source File

SOURCE="..\src\mule-wnnfns.c"
# End Source File
# Begin Source File

SOURCE=..\src\mule.c
# End Source File
# Begin Source File

SOURCE=..\src\nas.c
# End Source File
# Begin Source File

SOURCE=..\src\ndir.h
# End Source File
# Begin Source File

SOURCE=..\src\nt.c
# End Source File
# Begin Source File

SOURCE=..\src\nt.h
# End Source File
# Begin Source File

SOURCE=..\src\ntheap.c
# End Source File
# Begin Source File

SOURCE=..\src\ntheap.h
# End Source File
# Begin Source File

SOURCE=..\src\ntplay.c
# End Source File
# Begin Source File

SOURCE=..\src\ntproc.c
# End Source File
# Begin Source File

SOURCE="..\src\objects-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\objects-msw.h"
# End Source File
# Begin Source File

SOURCE="..\src\objects-tty.c"
# End Source File
# Begin Source File

SOURCE="..\src\objects-tty.h"
# End Source File
# Begin Source File

SOURCE="..\src\objects-x.c"
# End Source File
# Begin Source File

SOURCE="..\src\objects-x.h"
# End Source File
# Begin Source File

SOURCE=..\src\objects.c
# End Source File
# Begin Source File

SOURCE=..\src\objects.h
# End Source File
# Begin Source File

SOURCE="..\src\offix-cursors.h"
# End Source File
# Begin Source File

SOURCE="..\src\offix-types.h"
# End Source File
# Begin Source File

SOURCE=..\src\offix.c
# End Source File
# Begin Source File

SOURCE=..\src\offix.h
# End Source File
# Begin Source File

SOURCE=..\src\opaque.c
# End Source File
# Begin Source File

SOURCE=..\src\opaque.h
# End Source File
# Begin Source File

SOURCE=..\src\paths.h
# End Source File
# Begin Source File

SOURCE="..\src\pre-crt0.c"
# End Source File
# Begin Source File

SOURCE=..\src\print.c
# End Source File
# Begin Source File

SOURCE="..\src\process-nt.c"
# End Source File
# Begin Source File

SOURCE="..\src\process-unix.c"
# End Source File
# Begin Source File

SOURCE=..\src\process.c
# End Source File
# Begin Source File

SOURCE=..\src\process.h
# End Source File
# Begin Source File

SOURCE=..\src\procimpl.h
# End Source File
# Begin Source File

SOURCE=..\src\profile.c
# End Source File
# Begin Source File

SOURCE=..\src\ralloc.c
# End Source File
# Begin Source File

SOURCE=..\src\rangetab.c
# End Source File
# Begin Source File

SOURCE=..\src\rangetab.h
# End Source File
# Begin Source File

SOURCE=..\src\realpath.c
# End Source File
# Begin Source File

SOURCE="..\src\redisplay-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\redisplay-output.c"
# End Source File
# Begin Source File

SOURCE="..\src\redisplay-tty.c"
# End Source File
# Begin Source File

SOURCE="..\src\redisplay-x.c"
# End Source File
# Begin Source File

SOURCE=..\src\redisplay.c
# End Source File
# Begin Source File

SOURCE=..\src\redisplay.h
# End Source File
# Begin Source File

SOURCE=..\src\regex.c
# End Source File
# Begin Source File

SOURCE=..\src\regex.h
# End Source File
# Begin Source File

SOURCE="..\src\scrollbar-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\scrollbar-msw.h"
# End Source File
# Begin Source File

SOURCE="..\src\scrollbar-x.c"
# End Source File
# Begin Source File

SOURCE="..\src\scrollbar-x.h"
# End Source File
# Begin Source File

SOURCE=..\src\scrollbar.c
# End Source File
# Begin Source File

SOURCE=..\src\scrollbar.h
# End Source File
# Begin Source File

SOURCE=..\src\search.c
# End Source File
# Begin Source File

SOURCE="..\src\select-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\select-x.c"
# End Source File
# Begin Source File

SOURCE=..\src\select.c
# End Source File
# Begin Source File

SOURCE=..\src\select.h
# End Source File
# Begin Source File

SOURCE=..\src\sgiplay.c
# End Source File
# Begin Source File

SOURCE=..\src\sheap.c
# End Source File
# Begin Source File

SOURCE=..\src\signal.c
# End Source File
# Begin Source File

SOURCE=..\src\sound.c
# End Source File
# Begin Source File

SOURCE=..\src\specifier.c
# End Source File
# Begin Source File

SOURCE=..\src\specifier.h
# End Source File
# Begin Source File

SOURCE=..\src\strcat.c
# End Source File
# Begin Source File

SOURCE=..\src\strcmp.c
# End Source File
# Begin Source File

SOURCE=..\src\strcpy.c
# End Source File
# Begin Source File

SOURCE=..\src\strftime.c
# End Source File
# Begin Source File

SOURCE="..\src\sunOS-fix.c"
# End Source File
# Begin Source File

SOURCE=..\src\sunplay.c
# End Source File
# Begin Source File

SOURCE=..\src\sunpro.c
# End Source File
# Begin Source File

SOURCE=..\src\symbols.c
# End Source File
# Begin Source File

SOURCE=..\src\symeval.h
# End Source File
# Begin Source File

SOURCE=..\src\symsinit.h
# End Source File
# Begin Source File

SOURCE=..\src\syntax.c
# End Source File
# Begin Source File

SOURCE=..\src\syntax.h
# End Source File
# Begin Source File

SOURCE=..\src\sysdep.c
# End Source File
# Begin Source File

SOURCE=..\src\sysdep.h
# End Source File
# Begin Source File

SOURCE=..\src\sysdir.h
# End Source File
# Begin Source File

SOURCE=..\src\sysdll.c
# End Source File
# Begin Source File

SOURCE=..\src\sysdll.h
# End Source File
# Begin Source File

SOURCE=..\src\sysfile.h
# End Source File
# Begin Source File

SOURCE=..\src\sysfloat.h
# End Source File
# Begin Source File

SOURCE=..\src\sysproc.h
# End Source File
# Begin Source File

SOURCE=..\src\syspwd.h
# End Source File
# Begin Source File

SOURCE=..\src\syssignal.h
# End Source File
# Begin Source File

SOURCE=..\src\systime.h
# End Source File
# Begin Source File

SOURCE=..\src\systty.h
# End Source File
# Begin Source File

SOURCE=..\src\syswait.h
# End Source File
# Begin Source File

SOURCE=..\src\termcap.c
# End Source File
# Begin Source File

SOURCE=..\src\terminfo.c
# End Source File
# Begin Source File

SOURCE="..\src\toolbar-msw.c"
# End Source File
# Begin Source File

SOURCE="..\src\toolbar-x.c"
# End Source File
# Begin Source File

SOURCE=..\src\toolbar.c
# End Source File
# Begin Source File

SOURCE=..\src\toolbar.h
# End Source File
# Begin Source File

SOURCE=..\src\tooltalk.c
# End Source File
# Begin Source File

SOURCE=..\src\tooltalk.h
# End Source File
# Begin Source File

SOURCE=..\src\tparam.c
# End Source File
# Begin Source File

SOURCE=..\src\undo.c
# End Source File
# Begin Source File

SOURCE=..\src\unexaix.c
# End Source File
# Begin Source File

SOURCE=..\src\unexalpha.c
# End Source File
# Begin Source File

SOURCE=..\src\unexapollo.c
# End Source File
# Begin Source File

SOURCE=..\src\unexconvex.c
# End Source File
# Begin Source File

SOURCE=..\src\unexcw.c
# End Source File
# Begin Source File

SOURCE=..\src\unexec.c
# End Source File
# Begin Source File

SOURCE=..\src\unexelf.c
# End Source File
# Begin Source File

SOURCE=..\src\unexelfsgi.c
# End Source File
# Begin Source File

SOURCE=..\src\unexencap.c
# End Source File
# Begin Source File

SOURCE=..\src\unexenix.c
# End Source File
# Begin Source File

SOURCE=..\src\unexfreebsd.c
# End Source File
# Begin Source File

SOURCE=..\src\unexfx2800.c
# End Source File
# Begin Source File

SOURCE=..\src\unexhp9k3.c
# End Source File
# Begin Source File

SOURCE=..\src\unexhp9k800.c
# End Source File
# Begin Source File

SOURCE=..\src\unexmips.c
# End Source File
# Begin Source File

SOURCE=..\src\unexnext.c
# End Source File
# Begin Source File

SOURCE=..\src\unexnt.c
# End Source File
# Begin Source File

SOURCE=..\src\unexsni.c
# End Source File
# Begin Source File

SOURCE="..\src\unexsol2-6.c"
# End Source File
# Begin Source File

SOURCE=..\src\unexsol2.c
# End Source File
# Begin Source File

SOURCE=..\src\unexsunos4.c
# End Source File
# Begin Source File

SOURCE=..\src\universe.h
# End Source File
# Begin Source File

SOURCE="..\src\vm-limit.c"
# End Source File
# Begin Source File

SOURCE=..\src\widget.c
# End Source File
# Begin Source File

SOURCE=..\src\window.c
# End Source File
# Begin Source File

SOURCE=..\src\window.h
# End Source File
# Begin Source File

SOURCE=..\src\winslots.h
# End Source File
# Begin Source File

SOURCE=.\xemacs.mak
# End Source File
# Begin Source File

SOURCE=..\src\xgccache.c
# End Source File
# Begin Source File

SOURCE=..\src\xgccache.h
# End Source File
# Begin Source File

SOURCE=..\src\xintrinsic.h
# End Source File
# Begin Source File

SOURCE=..\src\xintrinsicp.h
# End Source File
# Begin Source File

SOURCE=..\src\xmmanagerp.h
# End Source File
# Begin Source File

SOURCE=..\src\xmprimitivep.h
# End Source File
# Begin Source File

SOURCE=..\src\xmu.c
# End Source File
# Begin Source File

SOURCE=..\src\xmu.h
# End Source File
# End Target
# End Project
