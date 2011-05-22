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

/* This handles the "other URL" option from the mirror site
   selection. */

#include "win32.h"
#include <shlobj.h>
#include <stdio.h>
#include <stdlib.h>
#include "dialog.h"
#include "resource.h"
#include "state.h"
#include "msg.h"
#include "log.h"

/* private shared function, from site.cc */
void save_site_url (void);

static void
check_if_enable_next (HWND h)
{
  EnableWindow (GetDlgItem (h, IDOK), other_url ? 1 : 0);
}

static void
load_dialog (HWND h)
{
  eset (h, IDC_OTHER_URL, other_url);
  check_if_enable_next (h);
}

static void
save_dialog (HWND h)
{
  other_url = eget (h, IDC_OTHER_URL, other_url);
}

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {

    case IDC_OTHER_URL:
      save_dialog (h);
      check_if_enable_next (h);
      break;

    case IDOK:
      save_dialog (h);
      save_site_url ();
      NEXT (IDD_S_LOAD_INI);
      break;

    case IDC_BACK:
      save_dialog (h);
      NEXT (IDD_SITE);
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

void
do_other (HINSTANCE h)
{
  int rv = 0;
  rv = DialogBox (h, MAKEINTRESOURCE (IDD_OTHER_URL), 0, dialog_proc);
  if (rv == -1)
    fatal (IDS_DIALOG_FAILED);

  log (0, "site: %s", other_url);
}

