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

/* The purpose of this file is to centralize all the message
   functions. */

#include "win32.h"
#include <stdio.h>
#include <stdarg.h>
#include "dialog.h"
#include "log.h"

void
msg (char *fmt, ...)
{
  char buf[1000];
  va_list args;
  va_start (args, fmt);
  vsprintf (buf, fmt, args);
  OutputDebugString (buf);
}

static int
mbox (char *name, int type, int id, va_list args)
{
  char buf[1000], fmt[1000];

  if (LoadString (hinstance, id, fmt, sizeof (fmt)) <= 0)
    ExitProcess (0);

  vsprintf (buf, fmt, args);
  log (0, "mbox %s: %s", name, buf);
  return MessageBox (0, buf, "XEmacs Setup", type | MB_TOPMOST);
}

void
note (int id, ...)
{
  va_list args;
  va_start (args, id);
  mbox ("note", 0, id, args);
}

void
fatal (int id, ...)
{
  va_list args;
  va_start (args, id);
  mbox ("fatal", 0, id, args);
  exit_setup (1);
}

int
yesno (int id, ...)
{
  va_list args;
  va_start (args, id);
  return mbox ("yesno", MB_YESNO, id, args);
}
