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

/* The purpose of this file is to get the list of mirror sites and ask
   the user which mirror site they want to download from. */

#include "win32.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "dialog.h"
#include "resource.h"
#include "state.h"
#include "geturl.h"
#include "msg.h"
#include "concat.h"
#include "regedit.h"
#include "reginfo.h"
#include "log.h"

#include "port.h"

#define NO_IDX (-1)
#define OTHER_IDX (-2)

typedef struct {
  char *url;
  char *displayed_url;
  char *sort_key;
} site_list_type;

static site_list_type *site_list = 0;
static int list_idx = NO_IDX;
static int mirror_idx = NO_IDX;

static void
check_if_enable_next (HWND h)
{
  EnableWindow (GetDlgItem (h, IDOK), (mirror_idx != NO_IDX) ? 1 : 0);
}

static void
load_dialog (HWND h)
{
  HWND listbox = GetDlgItem (h, IDC_URL_LIST);
  SendMessage (listbox, LB_SETCURSEL, list_idx, 0);
  check_if_enable_next (h);
}

static void
save_dialog (HWND h)
{
  HWND listbox = GetDlgItem (h, IDC_URL_LIST);
  list_idx = SendMessage (listbox, LB_GETCURSEL, 0, 0);
  if (list_idx == LB_ERR)
    {
      mirror_site = 0;
      mirror_idx = NO_IDX;
      list_idx = NO_IDX;
    }
  else
    {
      mirror_idx = SendMessage (listbox, LB_GETITEMDATA, list_idx, 0);
      if (mirror_idx == OTHER_IDX)
	mirror_site = 0;
      else
	mirror_site = site_list[mirror_idx].url;
    }
}

static void
get_root_dir ()
{
  int issystem, isnative;
  if (root_dir)
    return;
  root_dir = find_root_location (&issystem, &isnative);
}

void
save_site_url ()
{
  if (! MIRROR_SITE)
    return;

  get_root_dir ();
  if (! root_dir)
    return;
  
  FILE *f = fopen (concat (root_dir, XEMACS_SETUP_DIR, "last-mirror", 0), "wb");
  if (!f)
    return;
  fprintf (f, "%s\n", MIRROR_SITE);
  fclose (f);
}

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {

    case IDC_URL_LIST:
      save_dialog (h);
      check_if_enable_next (h);
      break;

    case IDOK:
      save_dialog (h);
      if (mirror_idx == OTHER_IDX)
	NEXT (IDD_OTHER_URL);
      else
	{
	  other_url = 0;
	  save_site_url ();
	  NEXT (IDD_S_LOAD_INI);
	}
      break;

    case IDC_BACK:
      save_dialog (h);
      NEXT (IDD_NET);
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
  int i, j;
  HWND listbox;
  switch (message)
    {
    case WM_INITDIALOG:
      listbox = GetDlgItem (h, IDC_URL_LIST);
      for (i=0; site_list[i].url; i++)
	{
	  j = SendMessage (listbox, LB_ADDSTRING, 0, (LPARAM)site_list[i].displayed_url);
	  SendMessage (listbox, LB_SETITEMDATA, j, i);
	}
      j = SendMessage (listbox, LB_ADDSTRING, 0, (LPARAM)"Other URL");
      SendMessage (listbox, LB_SETITEMDATA, j, OTHER_IDX);
      load_dialog (h);
      return FALSE;
    case WM_COMMAND:
      return HANDLE_WM_COMMAND (h, wParam, lParam, dialog_cmd);
    }
  return FALSE;
}

static int CDECL
site_sort (const void *va, const void *vb)
{
  site_list_type *a = (site_list_type *)va;
  site_list_type *b = (site_list_type *)vb;
  return strcmp (a->sort_key, b->sort_key);
}

static int
get_site_list (HINSTANCE h)
{
  char mirror_url[1000];
  if (LoadString (h, IDS_MIRROR_LST, mirror_url, sizeof (mirror_url)) <= 0)
    return 1;
  char *mirrors = get_url_to_string (mirror_url);
  dismiss_url_status_dialog ();
  if (!mirrors)
    return 1;

  char *bol, *eol, *nl;

  
  /* null plus account for possibly missing NL plus account for "Other
    URL" from previous run. */
  int nmirrors = 3;

  for (bol=mirrors; *bol; bol++)
    if (*bol == '\n')
      nmirrors ++;

  site_list = (site_list_type *) malloc (nmirrors * sizeof (site_list_type));
  nmirrors = 0;

  nl = mirrors;
  while (*nl)
    {
      bol = nl;
      for (eol = bol; *eol && *eol != '\n'; eol++) ;
      if (*eol)
	nl = eol+1;
      else
	nl = eol;
      while (eol > bol && eol[-1] == '\r')
	eol--;
      *eol = 0;
      if (bol[0] != '#' && bol[0] > ' ')
	{
	  char *semi = strchr (bol, ';');
	  if (semi)
	    *semi = 0;
	  site_list[nmirrors].url = _strdup (bol);
	  site_list[nmirrors].displayed_url = _strdup (bol);
	  char *dot = strchr (site_list[nmirrors].displayed_url, '.');
	  if (dot)
	    {
	      dot = strchr (dot, '/');
	      if (dot)
		*dot = 0;
	    }
	  site_list[nmirrors].sort_key = (char *) malloc (2*strlen (bol) + 3);

	  dot = site_list[nmirrors].displayed_url;
	  dot += strlen (dot);
	  char *dp = site_list[nmirrors].sort_key;
	  while (dot != site_list[nmirrors].displayed_url)
	    {
	      if (*dot == '.' || *dot == '/')
		{
		  char *sp;
		  if (dot[3] == 0)
		    *dp++ = '~'; /* sort .com/.edu/.org together */
		  for (sp=dot+1; *sp && *sp != '.' && *sp != '/';)
		    *dp++ = *sp++;
		  *dp++ = ' ';
		}
	      dot--;
	    }
	  *dp++ = ' ';
	  strcpy (dp, site_list[nmirrors].displayed_url);

	  nmirrors++;
	}
    }
  site_list[nmirrors].url = 0;

  qsort (site_list, nmirrors, sizeof (site_list_type), site_sort);

  return 0;
}

/* List of machines that should not be used by default when saved
   in "last-mirror". */
#define NOSAVE1 "ftp://ftp.xemacs.org/"
#define NOSAVE1_LEN (sizeof ("ftp://ftp.xemacs.org/") - 1)

static void
get_initial_list_idx ()
{
  get_root_dir ();
  if (! root_dir)
    return;

  FILE *f = fopen (concat (root_dir, XEMACS_SETUP_DIR, "last-mirror", 0), "rt");
  if (!f)
    return;

  char site[1000];
  site[0]='\0';
  char * fg_ret = fgets (site, 1000, f);
  fclose (f);
  if (! fg_ret)
    return;

  char *eos = site + strlen (site) - 1;
  while (eos >= site && (*eos == '\n' || *eos == '\r'))
    *eos-- = '\0';

  if (eos < site)
    return;

  int i;
  for (i = 0; site_list[i].url; i++)
    if (strcmp (site_list[i].url, site) == 0)
      break;

  if (! site_list[i].url)
    {
      /* Don't default to certain machines ever since they suffer
	 from bandwidth limitations. */
      if (strnicmp (site, NOSAVE1, NOSAVE1_LEN) == 0)
	return;
      site_list[i].displayed_url =
      site_list[i].url = _strdup (site);
      site_list[i+1].url = 0;
    }

  mirror_idx = list_idx = i;
}

void
do_site (HINSTANCE h)
{
  int rv = 0;

  if (site_list == 0)
    if (get_site_list (h))
      {
	NEXT (IDD_NET);
	return;
      }

  get_initial_list_idx ();

  rv = DialogBox (h, MAKEINTRESOURCE (IDD_SITE), 0, dialog_proc);
  if (rv == -1)
    fatal (IDS_DIALOG_FAILED);

  if (mirror_idx != OTHER_IDX)
    log (0, "site: %s", mirror_site);
}

