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

/* The purpose of this file is to intall all the packages selected in
   the install list (in ini.h).  Note that we use a separate thread to
   maintain the progress dialog, so we avoid the complexity of
   handling two tasks in one thread.  We also create or update all the
   files in /etc/setup and create the mount points. */

#include <io.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#ifndef WIN32_NATIVE
#include <unistd.h>
#endif
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <zlib.h>

#include "win32.h"
#include "commctrl.h"

#include "resource.h"
#include "ini.h"
#include "dialog.h"
#include "concat.h"
#include "geturl.h"
#include "mkdir.h"
#include "state.h"
#include "tar.h"
#include "diskfull.h"
#include "msg.h"
#include "regedit.h"
#include "reginfo.h"
#include "log.h"
#include "hash.h"
#include "desktop.h"

#include "port.h"

#define XM_DONE (WM_USER + 101)

static HWND unins_dialog = 0;
static HWND unins_action = 0;
static HWND unins_pkgname = 0;
static HWND unins_filename = 0;
static HWND unins_pprogress = 0;
static HWND unins_iprogress = 0;
static HWND unins_diskfull = 0;
static HANDLE init_event;

static int package_bytes = 0;
static int uninstall_started = 0;

extern char * map_filename (char *fn, int type);
static void start_uninstall ();

char *
base (char *s);

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {
    case IDCANCEL:
      exit_setup (1);
    case IDOK:
      if (uninstall_started == 0) {
	uninstall_started = 1;
	start_uninstall();
      }
      else
	exit_setup(0);
      break;
    }
  return FALSE;
}

static BOOL CALLBACK
dialog_proc (HWND h, UINT message, WPARAM wParam, LPARAM lParam)
{
  switch (message)
    {
    case WM_INITDIALOG:
      unins_dialog = h;
      unins_action = GetDlgItem (h, IDC_UNINS_ACTION);
      unins_pkgname = GetDlgItem (h, IDC_UNINS_PKG);
      unins_filename = GetDlgItem (h, IDC_UNINS_FILE);
      unins_pprogress = GetDlgItem (h, IDC_UNINS_PPROGRESS);
      unins_iprogress = GetDlgItem (h, IDC_UNINS_IPROGRESS);
      unins_diskfull = GetDlgItem (h, IDC_UNINS_DISKFULL);
      SendMessage (unins_pprogress, PBM_SETRANGE, 0, MAKELPARAM (0, 100));
      SendMessage (unins_iprogress, PBM_SETRANGE, 0, MAKELPARAM (0, 100));
      SendMessage (unins_diskfull, PBM_SETRANGE, 0, MAKELPARAM (0, 100));
      SetWindowText (unins_pkgname, "");
      SetWindowText (unins_filename, "");
      SendMessage (unins_pprogress, PBM_SETPOS, (WPARAM) 0, 0);
      SendMessage (unins_iprogress, PBM_SETPOS, (WPARAM) 0, 0);
      SendMessage (unins_diskfull, PBM_SETPOS, (WPARAM) 0, 0);
      return FALSE;

    case XM_DONE:
      {
	SetWindowText (GetDlgItem (h, IDOK), "Ok");
	LONG style = GetWindowLong (GetDlgItem (h, IDCANCEL),
				    GWL_STYLE);
	SetWindowLong (GetDlgItem (h, IDCANCEL),
		       GWL_STYLE, style & WS_DISABLED);
      }
      return FALSE;
      
    case WM_COMMAND:
      return HANDLE_WM_COMMAND (h, wParam, lParam, dialog_cmd);
    }
  return DefWindowProc (h, message, wParam, lParam);
}

static DWORD WINAPI uninstall_all (void *);

static void
start_uninstall ()
{
  DWORD tid;
  HANDLE thread;
  init_event = CreateEvent (0, 0, 0, 0);
  thread = CreateThread (0, 0, uninstall_all, 0, 0, &tid);
  WaitForSingleObject (init_event, 10000);
  CloseHandle (init_event);
}

static void
progress (int bytes, int num)
{
  int perc;
  if (package_bytes > 100)
    {
      perc = (bytes * 100) / package_bytes;
      SendMessage (unins_pprogress, PBM_SETPOS, (WPARAM) perc, 0);
    }

  if (npackages > 0)
    {
      perc = (num * 100) / npackages;
      SendMessage (unins_iprogress, PBM_SETPOS, (WPARAM) perc, 0);
    }
}

static int num_installs, num_uninstalls;

static void
uninstall_one (char *name, int type, int num)
{
  hash dirs;
  char line[_MAX_PATH];
  char* fname = (type == TY_GENERIC ? 
		 concat (root_dir, XEMACS_PACKAGE_DIR, "pkginfo/MANIFEST.",
			 name,  0) :
		 concat (root_dir, XEMACS_SETUP_DIR, "MANIFEST.", name,  0));

  FILE* lst = fopen (fname, "rb");
  int pos = 0;

  if (lst)
    {
      fseek (lst, 0, SEEK_END);
      package_bytes = ftell (lst);
      fseek (lst, 0, SEEK_SET);
  
      SetWindowText (unins_pkgname, name);
      SetWindowText (unins_action, "Uninstalling...");
      log (0, "uninstalling %s", name);

      while (fgets (line, sizeof (line), lst))
	{
	  progress (pos, num);
	  pos += strlen(line);
	  if (line[strlen(line)-1] == '\n')
	    line[strlen(line)-1] = 0;

	  dirs.add_subdirs (line);

	  char *d = map_filename (line, type);
	  DWORD dw = GetFileAttributes (d);
	  if (dw != 0xffffffff && !(dw & FILE_ATTRIBUTE_DIRECTORY))
	    {
	      log (LOG_BABBLE, "unlink %s", d);
	      DeleteFile (d);
	    }
	}
      fclose (lst);
      remove (fname);

      dirs.reverse_sort ();
      char *subdir = 0;
      while ((subdir = dirs.enumerate (subdir)) != 0)
	{
	  char *d = map_filename (subdir, type);
	  if (RemoveDirectory (d))
	    log (LOG_BABBLE, "rmdir %s", d);
	}
      num_uninstalls ++;
    }
}

void
do_uninstall (HINSTANCE h)
{
  num_installs = 0, num_uninstalls = 0;

  next_dialog = 0;		// we're done after this

  if (!root_dir)
    fatal ("no installation found");

  int rv = DialogBox (h, MAKEINTRESOURCE (IDD_UNINSTALL), 0, dialog_proc);
  if (rv == -1)
    fatal (IDS_DIALOG_FAILED);
}

static void
read_installed_db ()
{
  if (!root_dir)
    return;

  char line[1000], pkg[1000], inst[1000], src[1000];
  int instsz, srcsz;

  FILE *db = fopen (concat (root_dir, XEMACS_SETUP_DIR, "installed.db", 0), "rt");
  if (!db)
    return;

  while (fgets (line, 1000, db))
    {
      src[0] = 0;
      srcsz = 0;
      sscanf (line, "%s %s %d %s %d", pkg, inst, &instsz, src, &srcsz);

      log (0, "read %s", pkg);
      Package* np = new_package(strdup(pkg));
      pinfo(*np).install = inst;
      pinfo(*np).install_size = instsz;
      // pick up versoin
      char *v, *d;
      for (v=base (inst); *v; v++)
	if (*v == '-' && isdigit(v[1]))
	  {
	    v++;
	    break;
	  }
      if (!v)
	v = inst;
      for (d=v; *d; d++)
	if (strncmp (d, ".tar", 4) == 0
	    || strncmp (d, "-pkg", 4) == 0)
	  {
	    *d = 0;
	    break;
	  }
      if (v[0])
	pinfo(*np).version = strdup (v);
      else
	pinfo(*np).version = "0";
      // Crude but effective
      if (pkg != 0)
	if (strncmp ("xemacs-i686", pkg, 11) == 0
	    || (strncmp ("xemacs-i586", pkg, 11) == 0))
	  {
	    np->type = install_type;
	    xemacs_package = np;
	  }
    }
  fclose (db);
}

static DWORD WINAPI
uninstall_all (void *)
{
  int i;
  SetEvent (init_event);

  int df = diskfull (root_dir);
  SendMessage (unins_diskfull, PBM_SETPOS, (WPARAM) df, 0);

  read_installed_db();

  log (0, "There are %d packages\n", npackages);
  for (i=0; i<npackages; i++)
    {
      log (0, "uninstalling %s\n", package[i].name);
      uninstall_one (package[i].name, package[i].type, i);
    }

  PostMessage (unins_dialog, XM_DONE, 0, 0);

  remove (concat (root_dir, XEMACS_SETUP_DIR, "installed.db.old", 0));
  remove (concat (root_dir, XEMACS_SETUP_DIR, "installed.db", 0));

  remove_desktop_setup();
  remove_xemacs_root();
  remove_uninstall_path();

  if (num_installs == 0)
    {
      //      exit_msg = IDS_UNINSTALL_COMPLETE;
      return FALSE;
    }

  return FALSE;
}
