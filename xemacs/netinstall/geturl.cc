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

/* The purpose of this file is to act as a pretty interface to
   netio.cc.  We add a progress dialog and some convenience functions
   (like collect to string or file */

#include "win32.h"
#include "commctrl.h"

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include "dialog.h"
#include "geturl.h"
#include "resource.h"
#include "netio.h"
#include "msg.h"
#include "log.h"

static int is_showing = 0;
static HWND gw_dialog = 0;
static HWND gw_url = 0;
static HWND gw_rate = 0;
static HWND gw_progress = 0;
static HANDLE init_event;
static int max_bytes = 0;

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {
    case IDCANCEL:
      exit_setup (0);
    }
  return FALSE;
}

static BOOL CALLBACK
dialog_proc (HWND h, UINT message, WPARAM wParam, LPARAM lParam)
{
  switch (message)
    {
    case WM_INITDIALOG:
      gw_dialog = h;
      gw_url = GetDlgItem (h, IDC_DLS_URL);
      gw_rate = GetDlgItem (h, IDC_DLS_RATE);
      gw_progress = GetDlgItem (h, IDC_DLS_PROGRESS);
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
  HWND lgw_dialog = CreateDialog (hinstance, MAKEINTRESOURCE (IDD_DLSTATUS),
				   0, dialog_proc);
  ShowWindow (lgw_dialog, SW_SHOWNORMAL);
  UpdateWindow (lgw_dialog);
  while (GetMessage (&m, 0, 0, 0) > 0) {
    TranslateMessage (&m);
    DispatchMessage (&m);
  }
  return FALSE;
}

static DWORD start_tics;

static void
init_dialog (char *url, int length)
{
  if (gw_dialog == 0)
    {
      DWORD tid;
      HANDLE thread;
      init_event = CreateEvent (0, 0, 0, 0);
      thread = CreateThread (0, 0, dialog, 0, 0, &tid);
      WaitForSingleObject (init_event, 1000);
      CloseHandle (init_event);
      SendMessage (gw_progress, PBM_SETRANGE, 0, MAKELPARAM (0, 100));
      is_showing = 0;
    }
  char *sl=url, *cp;
  for (cp=url; *cp; cp++)
    if (*cp == '/' || *cp == '\\' || *cp == ':')
      sl = cp+1;
  max_bytes = length;
  SetWindowText (gw_url, sl);
  SetWindowText (gw_rate, "Connecting...");
  SendMessage (gw_progress, PBM_SETPOS, (WPARAM) 0, 0);
  ShowWindow (gw_progress, (length > 0) ? SW_SHOW : SW_HIDE);
  ShowWindow (gw_dialog, SW_SHOWNORMAL);
  if (!is_showing)
    {
      SetForegroundWindow (gw_dialog);
      is_showing = 1;
    }
  start_tics = GetTickCount ();
}


static void
progress (int bytes)
{
  static char buf[100];
  int kbps;
  static DWORD last_tics = 0;
  DWORD tics = GetTickCount ();
  if (tics == start_tics) // to prevent division by zero
    return;
  if (tics < last_tics + 200) // to prevent flickering updates
    return;
  last_tics = tics;

  kbps = bytes / (tics - start_tics);
  ShowWindow (gw_progress, (max_bytes > 0) ? SW_SHOW : SW_HIDE);
  if (max_bytes > 100)
    {
      int perc = bytes / (max_bytes / 100);
      SendMessage (gw_progress, PBM_SETPOS, (WPARAM) perc, 0);
      sprintf (buf, "%3d %%  (%dk/%dk)  %d kb/s\n",
	       perc, bytes/1000, max_bytes/1000, kbps);
    }
  else
    sprintf (buf, "%d  %d kb/s\n", bytes, kbps);

  SetWindowText (gw_rate, buf);
}

struct GUBuf {
  GUBuf *next;
  int count;
  char buf[2000];
};

char *
get_url_to_string (char *_url)
{
  log (LOG_BABBLE, "get_url_to_string %s", _url);
  init_dialog (_url, 0);
  NetIO *n = NetIO::open (_url);
  if (!n || !n->ok ())
    {
      delete n;
      log (LOG_BABBLE, "get_url_to_string failed!");
      return 0;
    }

  if (n->file_size)
    max_bytes = n->file_size;

  GUBuf *bufs = 0;
  GUBuf **nextp = &bufs;
  int total_bytes = 1; /* for the NUL */
  progress (0);
  while (1)
    {
      GUBuf *b = new GUBuf;
      *nextp = b;
      b->next = 0;
      nextp = &(b->next);

      b->count = n->read (b->buf, sizeof (b->buf));
      if (b->count <= 0)
	break;
      total_bytes += b->count;
      progress (total_bytes);
    }

  char *rv = (char *) malloc (total_bytes);
  char *rvp = rv;
  while (bufs && bufs->count > 0)
    {
      GUBuf *tmp = bufs->next;
      memcpy (rvp, bufs->buf, bufs->count);
      rvp += bufs->count;
      delete bufs;
      bufs = tmp;
    }
  *rvp = 0;

  if (n)
    delete n;

  return rv;
}

int
get_url_to_file (char *_url, char *_filename, int expected_length)
{
  log (LOG_BABBLE, "get_url_to_file %s %s", _url, _filename);
  init_dialog (_url, expected_length);

  remove (_filename); /* but ignore errors */

  NetIO *n = NetIO::open (_url);
  if (!n || !n->ok ())
    {
      delete n;
      log (LOG_BABBLE, "get_url_to_file failed!");
      return 1;
    }

  FILE *f = fopen (_filename, "wb");
  if (!f)
    {
      char *err = strerror (errno);
      if (!err)
	err = "(unknown error)";
      fatal (IDS_ERR_OPEN_WRITE, _filename, err);
    }

  if (n->file_size)
    max_bytes = n->file_size;

  int total_bytes = 0;
  progress (0);
  while (1)
    {
      char buf[8192];
      int count;
      count = n->read (buf, sizeof (buf));
      if (count <= 0)
	break;
      fwrite (buf, 1, count, f);
      total_bytes += count;
      progress (total_bytes);
    }

  fclose (f);

  if (n)
    delete n;

  return 0;
}

void
dismiss_url_status_dialog ()
{
  ShowWindow (gw_dialog, SW_HIDE);
  is_showing = 0;
}
