/*
 * Copyright (c) 2000, Red Hat, Inc.
 *
 *     This program is free software; you can redistribute it and/or modify
 *     it under the terms of the GNU General Public License as published by
 *     the Free Software Foundation; either version 2 of the License, or
 *     (at your option) any later version.
 *
 *     A copy of the GNU General Public License can be found at
 *     http://www.gnu.org/
 *
 * Written by DJ Delorie <dj@cygnus.com>
 *
 */

/* The purpose of this file is to limit the number of Win32 headers we
   actually have to parse.  The Setup program only uses a few of them,
   so there's no point in parsing them all (even lean-n-mean).  Doing
   this cuts compile time in half. */

#ifndef _MINI_WIN32_
#define _MINI_WIN32_

#define NOCOMATTRIBUTE

/* Cope with native win32 & mingw differences.  Written by F. Popineau
   <Fabrice.Popineau@supelec.fr> */
#ifdef WIN32_NATIVE
#  pragma warning( disable : 4007 4096 4018 4244 )  
#  define strdup _strdup
#  define stat _stat
#  define strnicmp _strnicmp
#endif

#include <stdarg.h>

#define WIN32_LEAN_AND_MEAN
#include <windows.h>

#include <wininet.h>
#include <windowsx.h>

#ifndef CDECL
#define CDECL __cdecl
#endif

#endif /* _MINI_WIN32_ */
