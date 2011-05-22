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
 * Written by DJ Delorie <dj@redhat.com>
 *
 */

/* The purpose of this file is to centralize all the logging functions. */

#include "win32.h"
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>
#include <time.h>

#include "resource.h"
#include "msg.h"
#include "log.h"
#include "dialog.h"
#include "state.h"
#include "concat.h"
#include "mkdir.h"

struct LogEnt {
  LogEnt *next;
  int flags;
  time_t when;
  char msg[1];
};

static LogEnt *first_logent = 0;
static LogEnt **next_logent = &first_logent;

void
log (int flags, char *fmt, ...)
{
  char buf[1000];
  va_list args;
  va_start (args, fmt);
  vsprintf (buf, fmt, args);

  LogEnt *l = (LogEnt *) malloc (sizeof (LogEnt) + strlen (buf) + 20);
  l->next = 0;
  l->flags = flags;
  time (&(l->when));
  *next_logent = l;
  next_logent = &(l->next);

  char *b = l->msg;
  if (flags & LOG_TIMESTAMP)
    {
      struct tm *tm = localtime (&(l->when));
      strftime (b, 1000, "%Y/%m/%d %H:%M:%S ", tm);
      b += strlen (b);
    }

  strcpy (b, buf);
  msg ("LOG: %d %s", l->flags, l->msg);
}

void
log_save (int babble, char *filename, int append)
{
  static int been_here = 0;
  if (been_here)
    return;
  been_here = 1;

  mkdir_p (0, filename);

  FILE *f = fopen (filename, append ? "at" : "wt");
  if (!f)
    {
      fatal (IDS_NOLOGFILE, filename);
      return;
    }

  LogEnt *l;

  for (l=first_logent; l; l=l->next)
    {
      if (babble || !(l->flags & LOG_BABBLE))
	{
	  fputs (l->msg, f);
	  if (l->msg[strlen(l->msg)-1] != '\n')
	    fputc ('\n', f);
	}
    }

  fclose (f);
  been_here = 0;
}

void
exit_setup (int exit_code)
{
  static int been_here = 0;
  if (been_here)
    ExitProcess (1);
  been_here = 1;

  if (exit_msg)
    note (exit_msg);

  log (LOG_TIMESTAMP, "Ending XEmacs install");

  if (source == IDC_SOURCE_DOWNLOAD || !root_dir)
    {
      log_save (LOG_BABBLE, "setup.log.full", 0);
      log_save (0, "setup.log", 1);
    }
  else
    {
      log_save (LOG_BABBLE, concat (root_dir, "/setup.log.full", 0), 0);
      log_save (0, concat (root_dir, "/setup.log", 0), 1);
    }

  ExitProcess (exit_code);
}
