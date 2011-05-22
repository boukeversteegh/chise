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

/* The purpose of this file is to run all the post-install scripts
   in their various forms. */

#include "win32.h"

#include <io.h>
#include <stdio.h>
#include <stdlib.h>
#ifndef WIN32_NATIVE
#include <unistd.h>
#endif

#include "state.h"
#include "dialog.h"
#include "find.h"
#include "concat.h"
#include "regedit.h"
#include "reginfo.h"
#include "resource.h"
#include "port.h"

static char *sh = 0;
static char *cmd = 0;
static OSVERSIONINFO verinfo;

static void
run (char *shscript, char *args, char *file)
{
  BOOL b;
  char cmdline [_MAX_PATH];
  STARTUPINFO si;
  PROCESS_INFORMATION pi;

  sprintf (cmdline, "%s %s %s", shscript, args, file);
  memset (&pi, 0, sizeof (pi));
  memset (&si, 0, sizeof (si));
  si.cb = sizeof (si);
  si.lpTitle = "XEmacs Setup Post-Install Script";
  si.dwFlags = STARTF_USEPOSITION;

  b = CreateProcess (0, cmdline, 0, 0, 0,
		     CREATE_NEW_CONSOLE, 0, root_dir, &si, &pi);

  if (b)
    WaitForSingleObject (pi.hProcess, INFINITE);
}

static void
each (char *fname, unsigned int size)
{
  char *ext = strrchr (fname, '.');
  if (!ext)
    return;

  if (sh && strcmp (ext, ".sh") == 0)
    {
      char *f2 = concat (root_dir, XEMACS_SETUP_DIR, "postinstall/", fname, 0);
      run (sh, "-c", f2);
      free (f2);
    }
  else if (cmd && strcmp (ext, ".bat") == 0)
    {
      char *f2 = backslash (concat (root_dir, XEMACS_SETUP_DIR, "postinstall/", 
				    fname, 0));
      run (cmd, "/c", f2);
      free (f2);
    }
  else
    return;

  rename (concat (root_dir, XEMACS_SETUP_DIR, "postinstall/", fname, 0),
	  concat (root_dir, XEMACS_SETUP_DIR, "postinstall/", fname, ".done", 0));
}

static char *shells [] = {
  "/bin/sh.exe",
  "/usr/bin/sh.exe",
  "/bin/bash.exe",
  "/usr/bin/bash.exe",
  0
};

void
do_postinstall (HINSTANCE h)
{
  int issystem;
  next_dialog = 0;
  char* cygroot = find_cygwin_root (&issystem);
  int i;

  sh = 0;

  if (cygroot)
    {
      for (i=0; shells[i]; i++)
	{
	  sh = backslash (concat (cygroot, shells[i], 0));
	  if (_access (sh, 0) == 0)
	    break;
	  free (sh);
	  sh = 0;
	}
    }

  char old_path[_MAX_PATH];
  GetEnvironmentVariable ("PATH", old_path, sizeof (old_path));
#if 0
  SetEnvironmentVariable ("PATH",
			  backslash (concat (root_dir, "/bin;",
					     root_dir, "/usr/bin;",
					     old_path, 0)));

  SetEnvironmentVariable ("CYGWINROOT", root_dir);
#endif
  SetCurrentDirectory (root_dir);

  verinfo.dwOSVersionInfoSize = sizeof (verinfo);
  GetVersionEx (&verinfo);

  switch (verinfo.dwPlatformId)
    {
    case VER_PLATFORM_WIN32_NT:
      cmd = "cmd.exe";
      break;
    case VER_PLATFORM_WIN32_WINDOWS:
      cmd = "command.com";
      break;
    default:
      cmd = "command.com";
      break;
    }

  find (concat (root_dir, XEMACS_SETUP_DIR, "postinstall", 0), each);
}
