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

/* The purpose of this file is to display the program name, version,
   copyright notice, and project URL. */

#include "win32.h"
#include <stdio.h>
#include "dialog.h"
#include "resource.h"
#include "msg.h"
#include "version.h"

static void
load_dialog (HWND h)
{
  char buffer[100];
  HWND v = GetDlgItem (h, IDC_VERSION);
  sprintf (buffer, "Setup.exe version %s",
	   version[0] ? version : "[unknown]");
  SetWindowText (v, buffer);
}

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {

    case IDOK:
      NEXT (IDD_SOURCE);
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
do_splash (HINSTANCE h)
{
  int rv = 0;
  rv = DialogBox (h, MAKEINTRESOURCE (IDD_SPLASH), 0, dialog_proc);
  if (rv == -1)
    fatal (IDS_DIALOG_FAILED);
}

