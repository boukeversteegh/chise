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

/* See concat.h.  Note that we canonicalize the result, this avoids
   multiple slashes being interpreted as UNCs. */

#include "win32.h"
#include <stdarg.h>
#include <stdlib.h>
#include <string.h>

char * CDECL
concat (char *s, ...)
{
  int len;
  char *rv, *arg;
  va_list v;

  if (!s)
    return 0;

  len = strlen (s);

  va_start (v, s);
  while (1)
    {
      arg = va_arg (v, char *);
      if (arg == 0)
	break;
      len += strlen (arg);
    }
  va_end (v);

  rv = (char *) malloc (len+1);
  strcpy (rv, s);
  va_start (v, s);
  while (1)
  {
    arg = va_arg (v, char *);
    if (arg == 0)
      break;
    strcat (rv, arg);
  }
  va_end (v);

  /* concat is only used for urls and files, so we can safely
     canonicalize the results */
  char *d;
  for (s=rv; *s; s++)
    if (*s == '\\')
      *s = '/';
  for (s=d=rv; *s; s++)
    {
      *d++ = *s;
      /* special case for URLs */
      if (*s == ':' && s[1] == '/' && s[2] == '/' && s > rv+1)
	{
	  *d++ = *++s;
	  *d++ = *++s;
	}
      else if (*s == '/')
	while (s[1] == '/')
	  s++;
    }
  *d = 0;

  return rv;
}

char *
backslash (char *s)
{
  for (char *t = s; *t; t++)
    if (*t == '/')
      *t = '\\';
  return s;
}
