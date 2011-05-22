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

/* The purpose of this file is to ask the user where they want the
   root of the installation to be, and to ask whether the user prefers
   text or binary mounts. */

#include "win32.h"
#include <shlobj.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include "dialog.h"
#include "resource.h"
#include "state.h"
#include "msg.h"
#include "regedit.h"
#include "reginfo.h"
#include "concat.h"
#include "log.h"

static int rb[] = { IDC_INSTALL_CYGWIN, IDC_INSTALL_NATIVE, 0 };
static int su[] = { IDC_ROOT_SYSTEM, IDC_ROOT_USER, 0 };

static void
check_if_enable_next (HWND h)
{
  EnableWindow (GetDlgItem (h, IDOK), install_type && root_dir && root_scope);
}

static void
load_dialog (HWND h)
{
  rbset (h, rb, install_type);
  rbset (h, su, root_scope);
  eset (h, IDC_ROOT_DIR, root_dir);
  check_if_enable_next (h);
}

static void
save_dialog (HWND h)
{
  install_type = rbget (h, rb);
  root_scope = rbget (h, su);
  char* new_root_dir = eget (h, IDC_ROOT_DIR, root_dir);

  if (!root_dir || strcmp (new_root_dir, root_dir) != 0)
    root_dir_default = 0;

  root_dir = new_root_dir;
}

/*
 * is_admin () determines whether or not the current user is a member of the
 * Administrators group.  On Windows 9X, the current user is considered an
 * Administrator by definition.
 */

static int
is_admin ()
{
  // Windows 9X users are considered Administrators by definition
  OSVERSIONINFO verinfo;
  verinfo.dwOSVersionInfoSize = sizeof (verinfo);
  GetVersionEx (&verinfo);
  if (verinfo.dwPlatformId != VER_PLATFORM_WIN32_NT)
    return 1;

  // Get the process token for the current process
  HANDLE token;
  BOOL status = OpenProcessToken (GetCurrentProcess(), TOKEN_QUERY, &token);
  if (!status)
    return 0;

  // Get the group token information
  UCHAR token_info[1024];
  PTOKEN_GROUPS groups = (PTOKEN_GROUPS) token_info;
  DWORD token_info_len = sizeof (token_info);
  status = GetTokenInformation (token, TokenGroups, token_info, token_info_len, &token_info_len);
  CloseHandle(token);
  if (!status)
    return 0;

  // Create the Administrators group SID
  PSID admin_sid;
  SID_IDENTIFIER_AUTHORITY authority = SECURITY_NT_AUTHORITY;
  status = AllocateAndInitializeSid (&authority, 2, SECURITY_BUILTIN_DOMAIN_RID, DOMAIN_ALIAS_RID_ADMINS, 0, 0, 0, 0, 0, 0, &admin_sid);
  if (!status)
    return 0;

  // Check to see if the user is a member of the Administrators group
  status = 0;
  for (UINT i=0; i<groups->GroupCount; i++) {
    if (EqualSid(groups->Groups[i].Sid, admin_sid)) {
      status = 1;
      break;
    }
  }

  // Destroy the Administrators group SID
  FreeSid (admin_sid);

  // Return whether or not the user is a member of the Administrators group
  return status;
}

static void
change_default_root (int id)
{
  int issystem;
  char* cygroot = find_cygwin_root (&issystem);
  if (id == IDC_INSTALL_CYGWIN && cygroot)
    {
      root_dir = concat (cygroot, XEMACS_CYGWIN_DEFAULT_ROOT, 0);
      install_type = IDC_INSTALL_CYGWIN;
    }
  else if (id == IDC_INSTALL_NATIVE)
    {
      char windir[_MAX_PATH];
      GetWindowsDirectory (windir, sizeof (windir));
      windir[2] = 0;
      root_dir = concat (windir, XEMACS_DEFAULT_ROOT, 0);
      install_type = IDC_INSTALL_NATIVE;
    }
}

static int CALLBACK
browse_cb (HWND h, UINT m, LPARAM lp, LPARAM data)
{
  switch (m)
    {
    case BFFM_INITIALIZED:
      if (root_dir)
	SendMessage (h, BFFM_SETSELECTION, TRUE, (LPARAM)root_dir);
      break;
    }
  return 0;
}

static void
browse (HWND h)
{
  BROWSEINFO bi;
  CHAR name[MAX_PATH];
  LPITEMIDLIST pidl;
  memset (&bi, 0, sizeof (bi));
  bi.hwndOwner = h;
  bi.pszDisplayName = name;
  bi.lpszTitle = "Select an installation root directory";
  bi.ulFlags = BIF_RETURNONLYFSDIRS;
  bi.lpfn = browse_cb;
  pidl = SHBrowseForFolder (&bi);
  if (pidl)
    {
      if (SHGetPathFromIDList (pidl, name))
	eset (h, IDC_ROOT_DIR, name);
    }
}

#define isslash(c) ((c) == '\\' || (c) == '/')

static int
directory_is_absolute ()
{
  if (isalpha (root_dir[0])
      && root_dir[1] == ':'
      && (root_dir[2] == '\\' || root_dir[2] == '/'))
    return 1;
  return 0;
}

static int
directory_is_rootdir ()
{
  char *c;
  for (c = root_dir; *c; c++)
    if (isslash (c[0]) && c[1] && !isslash (c[1]))
      return 0;
  return 1;
}

static int
cygwin_without_cygwin ()
{
  int issystem;
  if (install_type == IDC_INSTALL_CYGWIN
      && !find_cygwin_root (&issystem))
    return 1;
  return 0;
}

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {

    case IDC_ROOT_DIR:
    case IDC_ROOT_SYSTEM:
    case IDC_ROOT_USER:
      save_dialog (h);
      check_if_enable_next (h);
      break;

    case IDC_INSTALL_NATIVE:
    case IDC_INSTALL_CYGWIN:
      if (root_dir_default)
	{
	  change_default_root (id);
	  eset (h, IDC_ROOT_DIR, root_dir);
	}
      save_dialog (h);
      check_if_enable_next (h);
      break;

    case IDC_ROOT_BROWSE:
      browse (h);
      break;

    case IDOK:
      save_dialog (h);

      if (! directory_is_absolute ())
	{
	  note (IDS_ROOT_ABSOLUTE);
	  break;
	}

      if (directory_is_rootdir ())
	if (IDNO == yesno (IDS_ROOT_SLASH))
	  break;

      if (cygwin_without_cygwin ())
	if (IDNO == yesno (IDS_ROOT_NOCYGWIN))
	  break;

      create_xemacs_root (backslash (root_dir),
			  root_scope == IDC_ROOT_SYSTEM ? 1 : 0,
			  install_type == IDC_INSTALL_NATIVE ? 1 : 0);

      switch (source)
	{
	case IDC_SOURCE_NETINST:
	  NEXT (IDD_NET);
	  break;
	case IDC_SOURCE_CWD:
	  NEXT (IDD_S_FROM_CWD);
	  break;
	default:
	  msg ("source is default? %d\n", source);
	  NEXT (0);
	}
      break;

    case IDC_BACK:
      save_dialog (h);
      NEXT (IDD_LOCAL_DIR);
      break;

    case IDCANCEL:
      NEXT (0);
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
      load_dialog (h);
      return FALSE;
    case WM_COMMAND:
      return HANDLE_WM_COMMAND (h, wParam, lParam, dialog_cmd);
    }
  return FALSE;
}

static void
set_default_root ()
{
  change_default_root (IDC_INSTALL_NATIVE);
  root_scope = (is_admin()) ? IDC_ROOT_SYSTEM : IDC_ROOT_USER;
  root_dir_default = 1;
}

void
do_root (HINSTANCE h)
{
  int rv = 0;
  // init will have read a previous root
  if (!root_dir)
    set_default_root ();

  rv = DialogBox (h, MAKEINTRESOURCE (IDD_ROOT), 0, dialog_proc);
  if (rv == -1)
    fatal (IDS_DIALOG_FAILED);

  log (0, "root: %s %s %s", root_dir,
       (install_type == IDC_INSTALL_NATIVE) ? "native" : "cygwin",
       (root_scope == IDC_ROOT_USER) ? "user" : "system");
}

