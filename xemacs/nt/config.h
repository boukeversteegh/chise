/* XEmacs configuration file for Win32                             -*- C -*-
   Copyright (C) 1986, 1991, 1992, 1993, 1994 Free Software Foundation, Inc.

This file is part of XEmacs.

XEmacs is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

XEmacs is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Synched up with: FSF 19.30 (more or less). */

/* No code in XEmacs #includes config.h twice, but some of the code
   intended to work with other packages as well (like gmalloc.c)
   think they can include it as many times as they like.  */
#ifndef _SRC_CONFIG_H_
#define _SRC_CONFIG_H_

#define NTHEAP_PROBE_BASE 1
#undef LOSING_BYTECODE

/* Use this to add code in a structured way to FSF-maintained source
   files so as to make it obvious where XEmacs changes are. */
#define XEMACS 1

/* Allow s&m files to differentiate OS versions without having
   multiple files to maintain. */
#undef OS_RELEASE

/* The configuration name.  This is used as the install directory name
   for the lib-src programs. */
/* #undef EMACS_CONFIGURATION -- defined in xemacs.mak */

/* The configuration options.  This is exported to Lisp. */
#undef EMACS_CONFIG_OPTIONS

/* The version info from xemacs.mak via version.sh. Used in #pragma ident
   in emacs.c */
#if 0
#undef EMACS_MAJOR_VERSION
#undef EMACS_MINOR_VERSION
#undef EMACS_BETA_VERSION
#undef EMACS_VERSION
#undef XEMACS_CODENAME
#endif

/* Make all functions available on AIX.  See AC_AIX. */
#undef _ALL_SOURCE

/* Used to identify the XEmacs version in stack traces. */
#undef STACK_TRACE_EYE_CATCHER

/* Allow the configurer to specify (additional) package directories. */
/* #undef PACKAGE_PATH */

/* Define LISP_FLOAT_TYPE if you want XEmacs to support floating-point
   numbers. */
#undef LISP_FLOAT_TYPE

/* Define HAVE_TTY if you want TTY support compiled in. */
#undef HAVE_TTY

/* Compile in support for the X window system? */
/* #undef HAVE_X_WINDOWS -- defined in xemacs.mak */

/* Defines for building X applications */
#ifdef HAVE_X_WINDOWS
/* The following will be defined if xmkmf thinks they are necessary */
#undef SVR4
#undef SYSV
#undef AIXV3
#undef _POSIX_SOURCE
#undef _BSD_SOURCE
#undef _GNU_SOURCE
#undef X_LOCALE
#undef NARROWPROTO
/* The following should always be defined, no matter what xmkmf thinks. */
#ifndef NeedFunctionPrototypes
#define NeedFunctionPrototypes 1
#endif
#ifndef FUNCPROTO
#define FUNCPROTO 15
#endif

#define HAVE_XREGISTERIMINSTANTIATECALLBACK
#undef XREGISTERIMINSTANTIATECALLBACK_NONSTANDARD_PROTOTYPE

#undef THIS_IS_X11R4
#undef THIS_IS_X11R5
#define THIS_IS_X11R6

/* Define HAVE_XPM if you have the `xpm' library and want XEmacs to use it. */
#undef HAVE_XPM

/* Define HAVE_XFACE if you have the `compface' library and want to use it.
   This will permit X-face pixmaps in mail and news messages to display
   quickly. */
#undef HAVE_XFACE

/* #define HAVE_IMAGEMAGICK */

/* Define HAVE_XMU if you have the Xmu library.  This should always be
   the case except on losing HPUX systems. */
#define HAVE_XMU

/* Define HAVE_XAUTH if the Xauth library is present.  This will add
   some extra functionality to gnuserv. */
#undef HAVE_XAUTH

/* Define HAVE_XLOCALE_H if X11/Xlocale.h is present. */
#define HAVE_XLOCALE_H
#define HAVE_UNIXOID_EVENT_LOOP

#endif /* HAVE_X_WINDOWS */

/* Define HAVE_WINDOW_SYSTEM if any windowing system is available.  */
#if defined (HAVE_X_WINDOWS) || defined (HAVE_NEXTSTEP) || defined (HAVE_MS_WINDOWS)
#define HAVE_WINDOW_SYSTEM
#endif



/* Define USER_FULL_NAME to return a string
   that is the user's full name.
   It can assume that the variable `pw'
   points to the password file entry for this user.

   At some sites, the pw_gecos field contains
   the user's full name.  If neither this nor any other
   field contains the right thing, use pw_name,
   giving the user's login name, since that is better than nothing.  */
#define USER_FULL_NAME pw->pw_gecos

/* Define AMPERSAND_FULL_NAME if you use the convention
   that & in the full name stands for the login id.  */
#undef AMPERSAND_FULL_NAME

/* Some things figured out by the configure script, grouped as they are in
   configure.in.  */
#undef HAVE_MACH_MACH_H
#undef HAVE_SYS_TIMEB_H
#undef HAVE_UNISTD_H
#undef HAVE_SYS_WAIT_H
#undef HAVE_LIBGEN_H
#undef WORDS_BIGENDIAN
#undef TIME_WITH_SYS_TIME

#undef HAVE_SYS_TIME_H
#define HAVE_LOCALE_H
#ifdef HAVE_X_WINDOWS
#define HAVE_X11_LOCALE_H
#endif
#define STDC_HEADERS
#define HAVE_LIMITS_H
#define HAVE_GETCWD

#define HAVE_LONG_FILE_NAMES

#undef HAVE_LIBKSTAT
#undef HAVE_LIBINTL
#undef HAVE_LIBDNET
#undef HAVE_LIBRESOLV

/* Define if `sys_siglist' is declared by <signal.h>. */
#undef SYS_SIGLIST_DECLARED

/* Define if `struct timeval' is declared by <sys/time.h>.  */
#define HAVE_TIMEVAL

#undef TM_IN_SYS_TIME
#undef HAVE_TM_ZONE
#undef HAVE_TZNAME

/* Define if netdb.h declares h_errno.  */
#undef HAVE_H_ERRNO

/* Define if localtime caches TZ */
#undef LOCALTIME_CACHE

/* Define if gettimeofday can't accept two arguments */
#ifdef HAVE_X_WINDOWS
#define GETTIMEOFDAY_ONE_ARGUMENT
#else
#undef GETTIMEOFDAY_ONE_ARGUMENT
#endif

/* Is the timezone variable already declared in system headers? */
#undef HAVE_TIMEZONE_DECL

#undef HAVE_MMAP
#undef HAVE_STRCOLL
#undef HAVE_GETPGRP
#undef GETPGRP_VOID

#undef SIZEOF_SHORT
#undef SIZEOF_INT
#undef SIZEOF_LONG
#undef SIZEOF_LONG_LONG
#undef SIZEOF_VOID_P

#undef HAVE_ACOSH
#undef HAVE_ASINH
#undef HAVE_ATANH

#if defined (HAVE_ACOSH) && defined (HAVE_ASINH) && defined (HAVE_ATANH)
#define HAVE_INVERSE_HYPERBOLIC
#endif

#undef HAVE_CBRT
#define HAVE_CLOSEDIR
#undef HAVE_DUP2
#undef HAVE_EACCESS
#undef HAVE_FMOD
#undef HAVE_FPATHCONF
#undef HAVE_FREXP
#undef HAVE_FTIME
#undef HAVE_GETHOSTNAME

#define HAVE_GETPAGESIZE
#define getpagesize() 4096

#define HAVE_GETTIMEOFDAY
#define HAVE_GETWD
#undef HAVE_LOGB
#undef HAVE_LRAND48
#undef HAVE_MATHERR
#undef HAVE_MKDIR
#undef HAVE_MKTIME
#undef HAVE_PERROR
#undef HAVE_POLL
#undef HAVE_RANDOM
#undef HAVE_REALPATH
#undef HAVE_RENAME
#undef HAVE_RES_INIT
#undef HAVE_RINT
#undef HAVE_RMDIR
#define HAVE_SELECT
#undef HAVE_SETITIMER
#undef HAVE_SETPGID
#undef HAVE_SETSID
#undef HAVE_SIGBLOCK
#undef HAVE_SIGHOLD
#undef HAVE_SIGPROCMASK
#undef HAVE_SIGSETJMP
#define HAVE_STRERROR
#undef HAVE_TZSET
#undef HAVE_UTIME
#undef HAVE_UTIMES
#undef HAVE_WAITPID
#undef HAVE_VSNPRINTF

/* PTY support functions */
#undef HAVE_GETPT	/* glibc's easy pty allocation function */
#undef HAVE__GETPTY	/*   SGI's easy pty allocation function */
#undef HAVE_OPENPTY	/*   BSD's easy pty allocation function */
#undef HAVE_GRANTPT	/* Unix98 */
#undef HAVE_UNLOCKPT	/* Unix98 */
#undef HAVE_PTSNAME	/* Unix98 */
#undef HAVE_KILLPG	/* BSD */
#undef HAVE_TCGETPGRP	/* Posix 1 */
#undef HAVE_ISASTREAM	/* SysV streams */
#undef HAVE_PTY_H	/* Linux, Tru64 openpty */
#undef HAVE_LIBUTIL_H	/* BSD openpty */
#undef HAVE_STROPTS_H	/* SysV streams */
#undef HAVE_STRTIO_H	/* SysV streams TIOCSIGNAL */

#define HAVE_SOCKETS
#undef HAVE_SOCKADDR_SUN_LEN
#undef HAVE_SYSVIPC

#undef SYSV_SYSTEM_DIR
#undef NONSYSTEM_DIR_LIBRARY

#undef HAVE_TERMIOS
#undef HAVE_TERMIO

#undef NLIST_STRUCT

/* Define HAVE_SOCKS if you have the `socks' library and want XEmacs to
   use it.  */
#undef HAVE_SOCKS

/* Define HAVE_TERM if you run the `term' program (e.g. under Linux) and
   want XEmacs to use it.  */
#undef HAVE_TERM

/* Define HAVE_DBM if you want to use the DBM libraries */
#undef HAVE_DBM

/* Define HAVE_BERKELEY_DB if you want to use the BerkDB libraries */
#undef HAVE_BERKELEY_DB
/* Full #include file path for Berkeley DB's db.h */
#undef DB_H_FILE

#if defined (HAVE_DBM) || defined (HAVE_BERKELEY_DB)
# define HAVE_DATABASE
#endif

/* Define HAVE_NCURSES if -lncurses is present. */
#undef HAVE_NCURSES
/* Full #include file paths for ncurses' curses.h and term.h. */
#undef CURSES_H_FILE
#undef TERM_H_FILE

#define LOWTAGS

#ifdef DEBUG_XEMACS

/* Define USE_ASSERTIONS if you want the abort() to be changed to assert()
   If the assertion fails, assert_failed() will be called.  This is
   recommended for general use because it gives more info about the crash
   than just the abort() message.  Too many people "Can't find the corefile"
   or have limited core dumps out of existence. */
#define USE_ASSERTIONS

/* Check the entire extent structure of a buffer each time an extent
   change is done, and do other extent-related checks. */
#define ERROR_CHECK_EXTENTS

/* Make sure that all X... macros are dereferencing the correct type,
   and that all XSET... macros (as much as possible) are setting the
   correct type of structure.  Highly recommended for all
   development work. */
#define ERROR_CHECK_TYPECHECK
/* Make sure valid buffer positions are passed to BUF_* macros. */
#define ERROR_CHECK_BUFPOS
/* Attempt to catch bugs related to garbage collection (e.g.
   insufficient GCPRO'ing). */
#define ERROR_CHECK_GC
/* Attempt to catch freeing of a non-malloc()ed block, heap corruption,
   etc. */
#define ERROR_CHECK_MALLOC

#endif /* DEBUG_XEMACS */

/* Define convenient conditionally defined assertion macros. */
#ifdef ERROR_CHECK_TYPECHECK
#define type_checking_assert(assertion) assert (assertion)
#else
#define type_checking_assert(assertion)
#endif

#ifdef ERROR_CHECK_BUFPOS
#define bufpos_checking_assert(assertion) assert (assertion)
#else
#define bufpos_checking_assert(assertion)
#endif

#ifdef ERROR_CHECK_GC
#define gc_checking_assert(assertion) assert (assertion)
#else
#define gc_checking_assert(assertion)
#endif

/* Define MEMORY_USAGE_STATS if you want extra code compiled in to
   determine where XEmacs's memory is going. */
#undef MEMORY_USAGE_STATS

/* Define QUANTIFY if using Quantify from Pure Software.  This adds
   some additional calls to control data collection.  This is only
   intended for use by the developers. */
#undef QUANTIFY

/* Define EXTERNAL_WIDGET to compile support for using the editor as a
   widget in another program. */
#undef EXTERNAL_WIDGET

/* There are some special-case defines for gcc and lcc. */
#undef USE_GCC
#undef USE_LCC

/* Allow the user to override the default value of PURESIZE at configure
   time.  This must come before we include the sys files in order for
   it to be able to override any changes in them. */
#undef RAW_PURESIZE

/* Define this if you want level 2 internationalization compliance
   (localized collation and formatting).  Generally this should be
   defined, unless your system doesn't have the strcoll() and
   setlocale() library routines.  This really should be (NOT! -mrb)
   defined in the appropriate s/ or m/ file. */
#undef I18N2

/* Define this if you want level 3 internationalization compliance
   (localized messaging).  This will cause a small runtime performance
   penalty, as the strings are read from the message catalog(s).
   For this you need the gettext() and dgetext() library routines.
   WARNING, this code is under construction. */
#undef I18N3

/* Compile in support for CDE (Common Desktop Environment) drag and drop?
   Requires libDtSvc, which typically must be present at runtime.  */
#undef HAVE_CDE

/* Compile in support for OffiX Drag and Drop? */
#undef HAVE_OFFIX_DND

/* Compile in generic Drag'n'Drop API */
#define HAVE_DRAGNDROP

/* Compile in support for proper session-management. */
#undef HAVE_SESSION

/* Define this if you want Mule support (multi-byte character support).
   There may be some performance penalty, although it should be small
   if you're working with ASCII files. */
/* #undef MULE */

#ifdef MULE
/* Do we want to use X window input methods for use with Mule? (requires X11R5)
   If so, use raw Xlib or higher level Motif interface? */
#undef HAVE_XIM
#undef XIM_XLIB
#undef XIM_MOTIF

/* Non-XIM input methods for use with Mule. */
#undef HAVE_CANNA
#undef HAVE_WNN
#undef WNN6

#endif

/* enable special GNU Make features in the Makefiles. */
#undef USE_GNU_MAKE

/* Undocumented debugging option: Don't automatically rebuild the DOC
   file.  This saves a lot of time when you're repeatedly
   compiling-running-crashing. */
#undef NO_DOC_FILE

/* If not defined, use unions instead of ints.  A few systems (DEC Alpha)
   seem to require this, probably because something with the int
   definitions isn't right with 64-bit systems.

   (It's NO_UNION_TYPE instead of USE_UNION_TYPE for historical reasons.)
*/
#undef NO_UNION_TYPE

/* The configuration script defines opsysfile to be the name of the
   s/...h file that describes the system type you are using.  The file
   is chosen based on the configuration name you give.

   See the file ../etc/MACHINES for a list of systems and the
   configuration names to use for them.

   See s/template.h for documentation on writing s/...h files.  */
#include "s/windowsnt.h"

/* The configuration script defines machfile to be the name of the
   m/...h file that describes the machine you are using.  The file is
   chosen based on the configuration name you give.

   See the file ../etc/MACHINES for a list of machines and the
   configuration names to use for them.

   See m/template.h for documentation on writing m/...h files.  */
#include "m/windowsnt.h"

#if defined (USE_SYSTEM_MALLOC) && !defined (SYSTEM_MALLOC)
#define SYSTEM_MALLOC
#endif

/* Define REL_ALLOC if you want to use the relocating allocator for
   buffer space. */
#undef REL_ALLOC

/* Define the return type of signal handlers if the s-xxx file
   did not already do so.  */
#define RETSIGTYPE void

/* SIGTYPE is the macro we actually use.  */
#ifndef SIGTYPE
#define SIGTYPE RETSIGTYPE
#define SIGRETURN return
#endif

/* Allow the source to use standard types */
#undef size_t
#undef pid_t
#undef mode_t
#undef off_t
#undef uid_t
#undef gid_t

/* Define DYNODUMP if it is necessary to properly dump on this system.
   Currently this is only Solaris. */
#undef DYNODUMP

/* Define SUNPRO to compiled in support for Sun Sparcworks. */
#undef SUNPRO

/* Sun SparcStations, SGI machines, and HP9000s700s have support for playing
   different sound files as beeps.  If you are on a SparcStation but do not
   have the sound option installed for some reason, then undefine
   HAVE_NATIVE_SOUND.  (It's usually found in /usr/demo/SOUND/ on SunOS 4
   and Solaris systems; on Solaris, you may need to install the "SUNWaudmo"
   package.)
 */
/* #undef HAVE_NATIVE_SOUND */

/* If you wish to compile with support for the Network Audio System
   system define HAVE_NAS_SOUND.
   NAS_NO_ERROR_JUMP means that the NAS libraries don't include some
   error handling changes.
 */
#undef HAVE_NAS_SOUND
#undef NAS_NO_ERROR_JUMP

/* Compile in support for SunPro usage-tracking code. */
#undef USAGE_TRACKING

/* Define TOOLTALK if your site supports the ToolTalk library. */
#undef TOOLTALK

#ifdef HAVE_X_WINDOWS

#undef LWLIB_USES_MOTIF
#define LWLIB_MENUBARS_LUCID
#undef LWLIB_MENUBARS_MOTIF
#define LWLIB_SCROLLBARS_LUCID
#undef LWLIB_SCROLLBARS_MOTIF
#undef LWLIB_SCROLLBARS_ATHENA
#undef LWLIB_DIALOGS_MOTIF
#define LWLIB_DIALOGS_ATHENA

/* Other things that can be disabled by configure. */
#define HAVE_MENUBARS
#define HAVE_SCROLLBARS
#define HAVE_DIALOGS
#undef HAVE_TOOLBARS

#endif

#if defined (HAVE_MENUBARS) || defined (HAVE_DIALOGS)
#define HAVE_POPUPS
#endif

/* If you are using SunOS 4.1.1 and X11r5, then you need this patch.
   There is a stupid bug in the SunOS libc.a: two functions which X11r5
   uses, mbstowcs() and wcstombs(), are unusable when programs are
   statically linked (as XEmacs must be) because the static version of
   libc.a contains the *dynamic* versions of these functions.  These
   functions don't seem to be called when XEmacs is running, so it's
   enough to define stubs for them.

   This appears to be fixed in SunOS 4.1.2.

   Also, SunOS 4.1.1 contains buggy versions of strcmp and strcpy that
   sometimes reference memory past the end of the string, which can segv.
   I don't know whether this is has been fixed as of 4.1.2 or 4.1.3.
 */
#if defined (sparc) && !defined (USG)
#define OBJECTS_SYSTEM sunOS-fix.o strcmp.o strcpy.o
#endif

/* If you turn this flag on, it forces encapsulation in all
circumstances; this can be used to make sure things compile OK
on various systems. */
#undef DEBUG_ENCAPSULATION

/* System calls that are encapsulated */
#define ENCAPSULATE_RENAME
#define ENCAPSULATE_OPEN
#define ENCAPSULATE_FOPEN
#define ENCAPSULATE_MKDIR
#define ENCAPSULATE_STAT
#define ENCAPSULATE_FSTAT

#if defined (HAVE_SOCKS) && !defined (DO_NOT_SOCKSIFY)
#define accept Raccept
#define bind Rbind
#define connect Rconnect
#define getsockname Rgetsockname
#define listen Rlisten
#endif /* HAVE_SOCKS && !DO_NOT_SOCKSIFY */

#ifndef BITS_PER_CHAR
#define BITS_PER_CHAR 8
#endif
#define SHORTBITS (SIZEOF_SHORT * BITS_PER_CHAR)
#define INTBITS (SIZEOF_INT * BITS_PER_CHAR)
#define LONGBITS (SIZEOF_LONG * BITS_PER_CHAR)
#define LONG_LONG_BITS (SIZEOF_LONG_LONG * BITS_PER_CHAR)
#define VOID_P_BITS (SIZEOF_VOID_P * BITS_PER_CHAR)

/* MSVC version >= 2.x without /Za supports __inline */
#if (_MSC_VER < 900) || defined(__STDC__)
# define inline
#else
# define inline __inline
#endif

#define INLINE_HEADER inline static

/* MSVC warnings no-no crap. When adding one to this section,
   1. Think twice
   2. Insert textual description of the warning.
   3. Think twice. Undo still works  */
#if (_MSC_VER >= 800)

/* 'expression' : signed/unsigned mismatch */
#pragma warning ( disable : 4018 )
/* unnamed type definition in parentheses
  (Martin added a pedantically correct definition of ALIGNOF, which
  generates temporary anonymous structures, and MSVC complains) */
#pragma warning ( disable : 4116 )

#endif /* compiler understands #pragma warning*/

#ifndef NOT_C_CODE /* Actually means C or C++ */
# if defined (__cplusplus)
/* Avoid C++ keywords used as ordinary C identifiers */
#  define class c_class
#  define new   c_new
#  define this  c_this
#  define catch c_catch
#  define not   c_not

#  define EXTERN_C extern "C"
# else /* C code */
#  define EXTERN_C extern
# endif
#endif /* C or C++ */

#define enum_field(enumeration_type) unsigned int

/* We want to avoid saving the signal mask if possible, because
   that necessitates a system call. */
#ifdef HAVE_SIGSETJMP
# define SETJMP(x) sigsetjmp (x, 0)
# define LONGJMP(x, y) siglongjmp (x, y)
# define JMP_BUF sigjmp_buf
#else
# define SETJMP(x) setjmp (x)
# define LONGJMP(x, y) longjmp (x, y)
# define JMP_BUF jmp_buf
#endif

/* movemail options */
/* Should movemail use POP3 for mail access? */
/* #undef MAIL_USE_POP */
/* Should movemail use kerberos for POP authentication? */
#undef KERBEROS
/* Should movemail use hesiod for getting POP server host? */
#undef HESIOD
/* Determine type of mail locking. */
#undef MAIL_LOCK_LOCKF
#undef REAL_LOCK_FLOCK
#undef MAIL_LOCK_DOT

#endif /* _SRC_CONFIG_H_ */
