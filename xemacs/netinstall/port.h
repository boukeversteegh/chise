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

/* I prefer building a cygwin version of setup for debugging, as I
   find that gdb can debug those programs (and the exceptions they
   cause) better.  This file handles the slight differences between
   cygwin and mingw. */

#if defined(__CYGWIN__) || defined (__CYGWIN32__)

#define _MAX_PATH MAX_PATH

#define _access access
#define _strdup strdup

#endif
