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

/* This is for "printf"-like debugging.  Messages go to
   OutputDebugString, which can be seen while debugging under GDB or
   via a debug message monitor. */

void msg(char *fmt, ...);

/* This pops up a dialog with text from the string table ("id"), which
   is interpreted like printf.  The program exits when the user
   presses OK. */

void fatal (int id, ...);

/* Similar, but the program continues when the user presses OK */

void note (int id, ...);

/* returns IDYES or IDNO, otherwise same as note() */
int yesno (int id, ...);
