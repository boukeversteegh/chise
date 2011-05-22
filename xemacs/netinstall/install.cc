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

static HWND ins_dialog = 0;
static HWND ins_action = 0;
static HWND ins_pkgname = 0;
static HWND ins_filename = 0;
static HWND ins_pprogress = 0;
static HWND ins_iprogress = 0;
static HWND ins_diskfull = 0;
static HANDLE init_event;

static int total_bytes = 0;
static int total_bytes_sofar = 0;
static int package_bytes = 0;

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {
    case IDCANCEL:
      exit_setup (1);
    }
  return FALSE;
}

static BOOL CALLBACK
dialog_proc (HWND h, UINT message, WPARAM wParam, LPARAM lParam)
{
  switch (message)
    {
    case WM_INITDIALOG:
      ins_dialog = h;
      ins_action = GetDlgItem (h, IDC_INS_ACTION);
      ins_pkgname = GetDlgItem (h, IDC_INS_PKG);
      ins_filename = GetDlgItem (h, IDC_INS_FILE);
      ins_pprogress = GetDlgItem (h, IDC_INS_PPROGRESS);
      ins_iprogress = GetDlgItem (h, IDC_INS_IPROGRESS);
      ins_diskfull = GetDlgItem (h, IDC_INS_DISKFULL);
      SetEvent (init_event);
      return FALSE;
    case WM_COMMAND:
      return HANDLE_WM_COMMAND (h, wParam, lParam, dialog_cmd);
    }
  return FALSE;
}

static DWORD WINAPI
dialog (void *)
{
  MSG m;
  HWND new_dialog = CreateDialog (hinstance, MAKEINTRESOURCE (IDD_INSTATUS),
				   0, dialog_proc);
  if (new_dialog == 0)
    fatal ("create dialog");
  ShowWindow (new_dialog, SW_SHOWNORMAL);
  UpdateWindow (new_dialog);
  while (GetMessage (&m, 0, 0, 0) > 0) {
    TranslateMessage (&m);
    DispatchMessage (&m);
  }
  return FALSE;
}

static void
init_dialog ()
{
  if (ins_dialog == 0)
    {
      DWORD tid;
      HANDLE thread;
      init_event = CreateEvent (0, 0, 0, 0);
      thread = CreateThread (0, 0, dialog, 0, 0, &tid);
      WaitForSingleObject (init_event, 10000);
      CloseHandle (init_event);
      SendMessage (ins_pprogress, PBM_SETRANGE, 0, MAKELPARAM (0, 100));
      SendMessage (ins_iprogress, PBM_SETRANGE, 0, MAKELPARAM (0, 100));
      SendMessage (ins_diskfull, PBM_SETRANGE, 0, MAKELPARAM (0, 100));
    }

  SetWindowText (ins_pkgname, "");
  SetWindowText (ins_filename, "");
  SendMessage (ins_pprogress, PBM_SETPOS, (WPARAM) 0, 0);
  SendMessage (ins_iprogress, PBM_SETPOS, (WPARAM) 0, 0);
  SendMessage (ins_diskfull, PBM_SETPOS, (WPARAM) 0, 0);
  ShowWindow (ins_dialog, SW_SHOWNORMAL);
  SetForegroundWindow (ins_dialog);
}

static void
progress (int bytes)
{
  int perc;

  if (package_bytes > 100)
    {
      perc = bytes / (package_bytes / 100);
      SendMessage (ins_pprogress, PBM_SETPOS, (WPARAM) perc, 0);
    }

  if (total_bytes > 100)
    {
      perc = (total_bytes_sofar + bytes) / (total_bytes / 100);
      SendMessage (ins_iprogress, PBM_SETPOS, (WPARAM) perc, 0);
    }
}

static void
badrename (char *o, char *n)
{
  char *err = strerror (errno);
  if (!err)
    err = "(unknown error)";
  note (IDS_ERR_RENAME, o, n, err);
}

static char *standard_dirs[] = {
  0
};

void
hash::add_subdirs (char *path)
{
  char *nonp, *pp;
  for (nonp = path; *nonp == '\\' || *nonp == '/'; nonp++);
  for (pp = path + strlen(path) - 1; pp>nonp; pp--)
    if (*pp == '/' || *pp == '\\')
      {
	int i, s=0;
	char c = *pp;
	*pp = 0;
	for (i=0; standard_dirs[i]; i++)
	  if (strcmp (standard_dirs[i]+1, path) == 0)
	    {
	      s = 1;
	      break;
	    }
	if (s == 0)
	  add (path);
	*pp = c;
      }
}

char *
map_filename (char *fn, int type)
{
  char *dest_file;
  while (*fn == '/' || *fn == '\\')
    fn++;
  if (type == TY_GENERIC)
    dest_file = concat (root_dir, XEMACS_PACKAGE_DIR, fn, 0);
  else				// TY_CYGWIN | TY_NATIVE
    dest_file = concat (root_dir, "/", fn, 0);
  return dest_file;
}

static int
exists (char *file)
{
  if (_access (file, 0) == 0)
    return 1;
  return 0;
}

	  
static int num_installs, num_uninstalls;

static void
uninstall_one (char *name, int action, int type)
{
  hash dirs;
  char line[_MAX_PATH];
  char* fname = (type == TY_GENERIC ? 
		 concat (root_dir, XEMACS_PACKAGE_DIR, "pkginfo/MANIFEST.",
			 name,  0) :
		 concat (root_dir, XEMACS_SETUP_DIR, "MANIFEST.", name,  0));

  FILE* lst = fopen (fname, "rb");

  if (lst)
    {
      SetWindowText (ins_pkgname, name);
      SetWindowText (ins_action, "Uninstalling...");
      // remove shortcuts and registry entries
      if (type != TY_GENERIC)
	remove_xemacs_setup();

      if (action == ACTION_UPGRADE)
	log (0, "Uninstalling old %s", name);
      else
	log (0, "Uninstalling %s", name);

      while (fgets (line, sizeof (line), lst))
	{
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

	  
static int
install_one (char *name, char *file, int file_size, int action, int type)
{
  int errors = 0;
  char *local = file, *cp, *fn, *base;

  base = local;
  for (cp=local; *cp; cp++)
    if (*cp == '/' || *cp == '\\' || *cp == ':')
      base = cp+1;

  SetWindowText (ins_pkgname, base);

  if (!exists (local) && exists (base))
    local = base;
  if (!exists (local))
    {
      note (IDS_ERR_OPEN_READ, local, "No such file");
      return 1;
    }

  char* fname = (type == TY_GENERIC ? 
		 concat (root_dir, XEMACS_PACKAGE_DIR, "pkginfo/MANIFEST.",
			 name,  0) :
		 concat (root_dir, XEMACS_SETUP_DIR, "MANIFEST.", name,  0));

  FILE* lst = fopen (fname, "wb");

  package_bytes = file_size;

  switch (action)
    {
    case ACTION_NEW:
      SetWindowText (ins_action, "Installing...");
      break;
    case ACTION_UPGRADE:
      SetWindowText (ins_action, "Upgrading...");
      break;
    }

  log (0, "Installing %s", local);
  tar_open (local);
  while ((fn = tar_next_file ()))
    {
      char *dest_file, *disp_file;
      int len;

      if (lst)
	fprintf (lst, "%s\n", fn);

      dest_file = map_filename (fn, type);
      
      // The installer uses a variable width font. Assume roughly 32 chars
      // will fit and munge the file accordingly.
#define MAX_DISP_SIZE 50
      disp_file = strdup(dest_file);
      if ((len = strlen(dest_file)) > MAX_DISP_SIZE) {
	disp_file += (len - MAX_DISP_SIZE);
	disp_file[0] = '.';
	disp_file[1] = '.';
	disp_file[2] = '.';
      }
#undef MAX_DISP_SIZE
      SetWindowText (ins_filename, disp_file);

      log (LOG_BABBLE, "Installing file %s", dest_file);
      if (tar_read_file (dest_file) != 0)
	{
	  log (0, "Unable to install file %s", dest_file);
	  errors ++;
	}

      progress (tar_ftell ());
      num_installs ++;
    }
  tar_close ();

  total_bytes_sofar += file_size;
  progress (0);

  int df = diskfull (root_dir);
  SendMessage (ins_diskfull, PBM_SETPOS, (WPARAM) df, 0);

  if (lst)
    fclose (lst);

  return errors;
}

void
do_install (HINSTANCE h)
{
  int i;
  int errors = 0;

  num_installs = 0, num_uninstalls = 0;

  next_dialog = IDD_DESKTOP;

  mkdir_p (1, root_dir);

  for (i=0; standard_dirs[i]; i++)
    {
      char *p = concat (root_dir, standard_dirs[i], 0);
      mkdir_p (1, p);
      free (p);
    }

  dismiss_url_status_dialog ();

  init_dialog ();

  total_bytes = 0;
  total_bytes_sofar = 0;

  int df = diskfull (root_dir);
  SendMessage (ins_diskfull, PBM_SETPOS, (WPARAM) df, 0);

  LOOP_PACKAGES
    {
      total_bytes += pi.install_size;
    }

  for (i=0; i<npackages; i++)
    {
      if (package[i].action == ACTION_UNINSTALL
	  || (package[i].action == ACTION_UPGRADE && pi.install))
	{
	  uninstall_one (package[i].name, package[i].action,
			 package[i].type);
	  uninstall_one (concat (package[i].name, "-src", 0), package[i].action,
			 package[i].type);
	}

      if ((package[i].action == ACTION_NEW
	   || package[i].action == ACTION_UPGRADE)
	  && pi.install)
	{
	  int e = install_one (package[i].name, pi.install, pi.install_size, package[i].action,
			       package[i].type);
	  if (package[i].srcaction == SRCACTION_YES && pi.source)
	    e += install_one (concat (package[i].name, "-src", 0), pi.source, pi.source_size,
			      package[i].action, package[i].type);
	  if (e)
	    {
	      package[i].action = ACTION_ERROR;
	      errors++;
	    }
	}
    } // end of big package loop

  ShowWindow (ins_dialog, SW_HIDE);

  char *odbn = concat (root_dir, XEMACS_SETUP_DIR, "installed.db", 0);
  char *ndbn = concat (root_dir, XEMACS_SETUP_DIR, "installed.db.new", 0);
  char *sdbn = concat (root_dir, XEMACS_SETUP_DIR, "installed.db.old", 0);

  mkdir_p (0, ndbn);

  FILE *odb = fopen (odbn, "rt");
  FILE *ndb = fopen (ndbn, "wb");

  if (!ndb)
    {
      char *err = strerror (errno);
      if (!err)
	err = "(unknown error)";
      fatal (IDS_ERR_OPEN_WRITE, ndb, err);
    }

  if (odb)
    {
      char line[1000], pkg[1000];
      int printit;
      while (fgets (line, 1000, odb))
	{
	  printit = 1;
	  sscanf (line, "%s", pkg);
	  for (i=0; i<npackages; i++)
	    {
	      if (strcmp (pkg, package[i].name) == 0)
		switch (package[i].action)
		  {
		  case ACTION_NEW:
		  case ACTION_UPGRADE:
		  case ACTION_UNINSTALL:
		    printit = 0;
		    break;
		  }
	    }
	  if (printit)
	    fputs (line, ndb);
	}
      
    }

  LOOP_PACKAGES
    {
      if (package[i].srcaction == SRCACTION_YES)
	fprintf (ndb, "%s %s %d %s %d\n", package[i].name,
		 pi.install, pi.install_size,
		 pi.source, pi.source_size);
      else
	fprintf (ndb, "%s %s %d\n", package[i].name,
		 pi.install, pi.install_size);
    }

  if (odb)
    fclose (odb);
  fclose (ndb);

  remove (sdbn);
  if (odb && rename (odbn, sdbn))
    badrename (odbn, sdbn);

  remove (odbn);
  if (rename (ndbn, odbn))
    badrename (ndbn, odbn);

  if (num_installs == 0 && num_uninstalls == 0)
    {
      exit_msg = IDS_NOTHING_INSTALLED;
      return;
    }
  if (num_installs == 0)
    {
      exit_msg = IDS_UNINSTALL_COMPLETE;
      return;
    }

  if (errors)
    exit_msg = IDS_INSTALL_INCOMPLETE;
  else
    exit_msg = IDS_INSTALL_COMPLETE;
}
