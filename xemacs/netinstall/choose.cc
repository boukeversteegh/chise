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

/* The purpose of this file is to let the user choose which packages
   to install, and which versions of the package when more than one
   version is provided.  The "trust" level serves as an indication as
   to which version should be the default choice.  At the moment, all
   we do is compare with previously installed packages to skip any
   that are already installed (by setting the action to ACTION_SAME).
   While the "trust" stuff is supported, it's not really implemented
   yet.  We always prefer the "current" option.  In the future, this
   file might have a user dialog added to let the user choose to not
   install packages, or to install packages that aren't installed by
   default. */

#include "win32.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include "dialog.h"
#include "resource.h"
#include "state.h"
#include "ini.h"
#include "concat.h"
#include "msg.h"
#include "log.h"
#include "find.h"
#include "reginfo.h"

#define HMARGIN		10
#define ROW_MARGIN	5
#define ICON_MARGIN	4

#define CHECK_SIZE	11

#define TRUST_KEEP	101
#define TRUST_UNINSTALL	102
#define TRUST_NONE	103

static int initialized = 0;

static int full_list = 0;

static int scroll_ulc_x, scroll_ulc_y;

static HWND lv, nextbutton;
static TEXTMETRIC tm;
static int header_height;
static HANDLE sysfont;
static int row_height;
static HANDLE bm_spin, bm_rtarrow, bm_checkyes, bm_checkno, bm_checkna;
static HDC bitmap_dc;

static struct {
  char *text;
  int slen;
  int width;
  int x;
} headers[] = {
  { "Current", 7, 0, 0 },
#define CURRENT_COL 0
  { "New", 3, 0, 0 },
#define NEW_COL 1
  { "Src?", 4, 0, 0 },
#define SRC_COL 2
  { "Package", 7, 0, 0 },
#define PACKAGE_COL 3
  { 0, 0, 0, 0 }
};
#define NUM_COLUMNS (sizeof(headers)/(sizeof(headers[0]))-1)

int *package_indexes, nindexes;

struct ExtraPackageInfo {
  char *installed_file;	/* filename of previous "install" file */
  char *installed_ver;	/* version part */
  int   installed_size; /* ditto, size. */

  int in_partial_list;
  int pick;
  int npick;
  int which_is_installed; /* == TRUST* or -1 */

  struct {
    int src_avail;
    int trust;		/* may be keep or uninstall */
    char *caption;	/* ==0 at EOL */
  } chooser[NTRUST+3];	/* one extra for NULL above */
};

static ExtraPackageInfo *extra;

static void
paint (HWND hwnd)
{
  HDC hdc;
  PAINTSTRUCT ps;
  int x, y, i, ii;

  hdc = BeginPaint (hwnd, &ps);

  SelectObject (hdc, sysfont);

  RECT cr;
  GetClientRect (hwnd, &cr);

  POINT p;

  x = cr.left - scroll_ulc_x;
  y = cr.top - scroll_ulc_y + header_height;


  for (i=0; headers[i].text; i++)
    {
      TextOut (hdc, x+headers[i].x, 3, headers[i].text, headers[i].slen);
      MoveToEx (hdc, x+headers[i].x, header_height-3, &p);
      LineTo (hdc, x+headers[i].x+headers[i].width, header_height-3);
    }

  IntersectClipRect (hdc, cr.left, cr.top+header_height, cr.right, cr.bottom);

  for (ii=0; ii<nindexes; ii++)
    {
      i = package_indexes[ii];
      int r = y + ii * row_height;
      int by = r + tm.tmHeight - 11;
      if (extra[i].installed_ver && extra[i].installed_ver[0])
	{
	  TextOut (hdc, x+headers[CURRENT_COL].x, r,
		   extra[i].installed_ver, strlen (extra[i].installed_ver));
	  SelectObject (bitmap_dc, bm_rtarrow);
	  BitBlt (hdc, x+headers[CURRENT_COL].x+headers[0].width+ICON_MARGIN/2+HMARGIN/2, by,
		  11, 11, bitmap_dc, 0, 0, SRCCOPY);
	}

      char *s = extra[i].chooser[extra[i].pick].caption;
      if (s)
	{
	  TextOut (hdc, x+headers[NEW_COL].x + 11 + ICON_MARGIN, r,
		   s, strlen (s));
	  if (extra[i].npick > 1)
	    {
	      SelectObject (bitmap_dc, bm_spin);
	      BitBlt (hdc, x+headers[NEW_COL].x, by, 11, 11,
		      bitmap_dc, 0, 0, SRCCOPY);
	    }
	}

      HANDLE check_bm = bm_checkna;
      if (extra[i].chooser[extra[i].pick].src_avail)
	{
	  if (package[i].srcaction == SRCACTION_NO)
	    check_bm = bm_checkno;
	  else if (package[i].srcaction == SRCACTION_YES)
	    check_bm = bm_checkyes;
	}
      SelectObject (bitmap_dc, check_bm);
      BitBlt (hdc, x+headers[SRC_COL].x, by, 11, 11,
	      bitmap_dc, 0, 0, SRCCOPY);

      if (package[i].name)
	TextOut (hdc, x+headers[PACKAGE_COL].x, r, package[i].name, strlen(package[i].name));
    }

  if (nindexes == 0)
    {
      static char *m = "Nothing to Install/Update";
      TextOut (hdc, HMARGIN, header_height, m, strlen (m));
    }
  
  EndPaint (hwnd, &ps);
}

static void
scroll_common (HWND hwnd, int which, int *var, int code)
{
  SCROLLINFO si;
  si.cbSize = sizeof (si);
  si.fMask = SIF_ALL;
  GetScrollInfo (hwnd, which, &si);

  switch (code)
    {
    case SB_THUMBTRACK:
      si.nPos = si.nTrackPos;
      break;
    case SB_THUMBPOSITION:
      break;
    case SB_BOTTOM:
      si.nPos = si.nMax;
      break;
    case SB_TOP:
      si.nPos = 0;
      break;
    case SB_LINEDOWN:
      si.nPos += row_height;
      break;
    case SB_LINEUP:
      si.nPos -= row_height;
      break;
    case SB_PAGEDOWN:
      si.nPos += si.nPage * 9/10;
      break;
    case SB_PAGEUP:
      si.nPos -= si.nPage * 9/10;
      break;
    }

  if ((int)si.nPos < 0)
    si.nPos = 0;
  if ((int)(si.nPos + si.nPage) > si.nMax)
    si.nPos = si.nMax - si.nPage;

  si.fMask = SIF_POS;
  SetScrollInfo (hwnd, which, &si, TRUE);

  int ox = scroll_ulc_x;
  int oy = scroll_ulc_y;
  *var = si.nPos;

  RECT cr, sr;
  GetClientRect (hwnd, &cr);
  sr = cr;
  sr.top += header_height;
  ScrollWindow (hwnd, ox - scroll_ulc_x, oy - scroll_ulc_y, &sr, &sr);
  sr.bottom = sr.top;
  sr.top = cr.top;
  ScrollWindow (hwnd, ox - scroll_ulc_x, 0, &sr, &sr);
}

static LRESULT CALLBACK
list_vscroll (HWND hwnd, HWND hctl, UINT code, int pos)
{
  scroll_common (hwnd, SB_VERT, &scroll_ulc_y, code);
  return FALSE;
}

static LRESULT CALLBACK
list_hscroll (HWND hwnd, HWND hctl, UINT code, int pos)
{
  scroll_common (hwnd, SB_HORZ, &scroll_ulc_x, code);
  return FALSE;
}

static LRESULT CALLBACK
list_click (HWND hwnd, BOOL dblclk, int x, int y, UINT hitCode)
{
  int r;

  if (nindexes == 0)
    return 0;

  if (y < header_height)
    return 0;
  x += scroll_ulc_x;
  y += scroll_ulc_y - header_height;

  r = (y + ROW_MARGIN/2) / row_height;

  if (r < 0 || r >= npackages)
    return 0;

  int p = package_indexes[r];

  if (x >= headers[NEW_COL].x - HMARGIN/2 && x <= headers[NEW_COL+1].x - HMARGIN/2)
    {
      extra[p].pick ++;
      if (extra[p].chooser[extra[p].pick].caption == 0)
	extra[p].pick = 0;
    }

  if (x >= headers[SRC_COL].x - HMARGIN/2 && x <= headers[SRC_COL+1].x - HMARGIN/2)
    {
      if (extra[p].chooser[extra[p].pick].src_avail)
	package[p].srcaction ^= (SRCACTION_NO^SRCACTION_YES);
    }

  RECT rect;
  rect.left = headers[NEW_COL].x - scroll_ulc_x;
  rect.right = headers[SRC_COL+1].x - scroll_ulc_x;
  rect.top = header_height + r * row_height - scroll_ulc_y;
  rect.bottom = rect.top + row_height;
  InvalidateRect (hwnd, &rect, TRUE);
  return FALSE;
}

static LRESULT CALLBACK
listview_proc (HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
  switch (message) {
  case WM_HSCROLL:
    return HANDLE_WM_HSCROLL (hwnd, wParam, lParam, list_hscroll);
  case WM_VSCROLL:
    return HANDLE_WM_VSCROLL (hwnd, wParam, lParam, list_vscroll);
  case WM_LBUTTONDOWN:
    return HANDLE_WM_LBUTTONDOWN (hwnd, wParam, lParam, list_click);
  case WM_PAINT:
    paint (hwnd);
    return 0;
  default:
    return DefWindowProc (hwnd, message, wParam, lParam);
  }
}

static void
register_windows (HINSTANCE hinst)
{
  WNDCLASSEX wcex;
  static int done = 0;

  if (done)
    return;
  done = 1;

  memset (&wcex, 0, sizeof (wcex));
  wcex.cbSize = sizeof (WNDCLASSEX);
  wcex.style = CS_HREDRAW | CS_VREDRAW;
  wcex.lpfnWndProc = listview_proc;
  wcex.hInstance = hinst;
  wcex.hIcon = LoadIcon (0, IDI_APPLICATION);
  wcex.hCursor = LoadCursor (0, IDC_ARROW);
  wcex.hbrBackground = (HBRUSH) (COLOR_WINDOW+1);
  wcex.lpszClassName = "listview";

  RegisterClassEx (&wcex);
}

static void
note_width (HDC dc, char *string, int addend, int column)
{
  if (!string)
    return;
  SIZE s;
  GetTextExtentPoint32 (dc, string, strlen (string), &s);
  if (headers[column].width < s.cx + addend)
    headers[column].width = s.cx + addend;
}

static int
best_trust (int p, int trust)
{
  int t;
  for (t=trust; t>=0; t--)
    if (package[p].info[t].install)
      return t;
  for (t=trust+1; t<=NTRUST; t++)
    if (package[p].info[t].install)
      return t;
  if (extra[p].installed_file)
    return TRUST_KEEP;
  return TRUST_NONE;
}

static void
default_trust (HWND h, int trust)
{
  int i, t, c;

  for (i=0; i<npackages; i++)
    {
      t = best_trust (i, trust);
      extra[i].pick = 1;
      for (c=0; c<extra[i].npick; c++)
	if (t == extra[i].chooser[c].trust)
	  extra[i].pick = c;
      if (install_type == IDC_INSTALL_NATIVE 
	  && package[i].type == TY_CYGWIN
	  ||
	  install_type == IDC_INSTALL_CYGWIN 
	  && package[i].type == TY_NATIVE)
	extra[i].pick = extra[i].npick -1;
    }
  RECT r;
  GetClientRect (h, &r);
  InvalidateRect (h, &r, TRUE);
  if (nextbutton)
    SetFocus (nextbutton);
}

static void
set_full_list (HWND h, int isfull)
{
  int i, j;
  full_list = isfull;
  if (package_indexes == 0)
    package_indexes = (int *) malloc (npackages * sizeof (int));
  for (i=j=0; i<npackages; i++)
    {
      if (isfull || extra[i].in_partial_list)
	package_indexes[j++] = i;
    }
  nindexes = j;

  RECT r;
  GetClientRect (h, &r);
  SCROLLINFO si;
  memset (&si, 0, sizeof (si));
  si.cbSize = sizeof (si);
  si.fMask = SIF_ALL;
  si.nMin = 0;
  si.nMax = headers[2].x + headers[2].width + HMARGIN;
  si.nPage = r.right;
  SetScrollInfo (h, SB_HORZ, &si, TRUE);

  si.nMax = nindexes * row_height;
  si.nPage = r.bottom - header_height;
  SetScrollInfo (h, SB_VERT, &si, TRUE);

  scroll_ulc_x = scroll_ulc_y = 0;

  InvalidateRect (h, &r, TRUE);

  if (nextbutton)
    SetFocus (nextbutton);
}

static void
build_labels ()
{
  int i;
  for (i=0; i<npackages; i++)
    {
      int c = 0, t;

#define C extra[i].chooser[c]
      if (extra[i].installed_ver)
	{
	  C.caption = "Uninstall";
	  C.trust = TRUST_UNINSTALL;
	  c++;
	  C.caption = "Keep";
	  C.trust = TRUST_KEEP;
	  c++;
	}

      for (t=TRUST_PREV; t<NTRUST; t++)
	if (package[i].info[t].install)
	  if (t != extra[i].which_is_installed)
	    {
	      C.caption = package[i].info[t].version;
	      if (C.caption == 0 || C.caption[0] == 0)
		C.caption = "0.0";
	      C.trust = t;
	      if (package[i].info[t].source)
		C.src_avail = 1;
	      c++;
	      /* we intentionally skip TRUST_PREV */
	      if (t != TRUST_PREV || !extra[i].installed_ver)
		extra[i].in_partial_list = 1;

	    }

      if (c == 0)
	{
	  C.caption = "N/A";
	  C.trust = TRUST_NONE;
	  c++;
	}

      if (! extra[i].installed_file)
	{
	  C.caption = "Skip";
	  C.trust = TRUST_NONE;
	  c++;
	}

      C.caption = 0;
      extra[i].npick = c;
#undef C
    }
}

static void
create_listview (HWND dlg, RECT *r)
{
  int i, t;
  lv = CreateWindowEx (WS_EX_CLIENTEDGE,
		       "listview",
		       "listviewwindow",
		       WS_CHILD | WS_HSCROLL | WS_VSCROLL | WS_VISIBLE,
		       r->left, r->top,
		       r->right-r->left+1, r->bottom-r->top+1,
		       dlg,
		       NULL, // ??? MAKEINTRESOURCE(IDC_CHOOSE_LIST),
		       hinstance,
		       0);
  ShowWindow (lv, SW_SHOW);

  for (i=0; headers[i].text; i++)
    headers[i].width = 0;

  HDC dc = GetDC (lv);
  sysfont = GetStockObject (DEFAULT_GUI_FONT);
  SelectObject (dc, sysfont);
  GetTextMetrics (dc, &tm);
  header_height = tm.tmHeight + 5 + 3;

  bitmap_dc = CreateCompatibleDC (dc);

  row_height = (tm.tmHeight + tm.tmExternalLeading + ROW_MARGIN);
  int irh = tm.tmExternalLeading + tm.tmDescent + 11 + ROW_MARGIN;
  if (row_height < irh)
    row_height = irh;

  for (i=0; headers[i].text; i++)
    note_width (dc, headers[i].text, 0, i);
  for (i=0; i<npackages; i++)
    {
      note_width (dc, extra[i].installed_ver, 0, CURRENT_COL);
      note_width (dc, extra[i].installed_ver, 11+ICON_MARGIN, NEW_COL);
      for (t=0; t<NTRUST; t++)
	note_width (dc, package[i].info[t].version, 11+ICON_MARGIN, NEW_COL);
      note_width (dc, package[i].name, 0, PACKAGE_COL);
      note_width (dc, package[i].sdesc, 0, PACKAGE_COL);
    }
  note_width (dc, "keep", 11+ICON_MARGIN, NEW_COL);
  note_width (dc, "uninstall", 11+ICON_MARGIN, NEW_COL);

  headers[CURRENT_COL].x = HMARGIN/2;
  headers[NEW_COL].x = (headers[CURRENT_COL].x + headers[CURRENT_COL].width
			+ HMARGIN + 11 + ICON_MARGIN);
  headers[SRC_COL].x = headers[NEW_COL].x + headers[NEW_COL].width + HMARGIN;
  headers[PACKAGE_COL].x = headers[SRC_COL].x + headers[SRC_COL].width + HMARGIN;

  set_full_list (lv, full_list);
  default_trust (lv, TRUST_CURR);

  ReleaseDC (lv, dc);
}

static BOOL
dialog_cmd (HWND h, int id, HWND hwndctl, UINT code)
{
  switch (id)
    {

    case IDC_CHOOSE_PREV:
      default_trust (lv, TRUST_PREV);
      break;
    case IDC_CHOOSE_CURR:
      default_trust (lv, TRUST_CURR);
      break;
    case IDC_CHOOSE_EXP:
      default_trust (lv, TRUST_TEST);
      break;
    case IDC_CHOOSE_FULLPART:
      set_full_list (lv, !full_list);
      break;

    case IDOK:
      if (source == IDC_SOURCE_CWD)
	NEXT (IDD_S_INSTALL);
      else
	NEXT (IDD_S_DOWNLOAD);
      break;

    case IDC_BACK:
      initialized = 0;
      if (source == IDC_SOURCE_CWD)
	NEXT (IDD_ROOT);
      else
	NEXT (IDD_SITE);
      break;

    case IDCANCEL:
      NEXT (0);
      break;
    }
  return FALSE;
}

static void
GetParentRect (HWND parent, HWND child, RECT *r)
{
  POINT p;
  GetWindowRect (child, r);
  p.x = r->left;
  p.y = r->top;
  ScreenToClient (parent, &p);
  r->left = p.x;
  r->top = p.y;
  p.x = r->right;
  p.y = r->bottom;
  ScreenToClient (parent, &p);
  r->right = p.x;
  r->bottom = p.y;
}

static BOOL CALLBACK
dialog_proc (HWND h, UINT message, WPARAM wParam, LPARAM lParam)
{
  HWND frame;
  RECT r;
  switch (message)
    {
    case WM_INITDIALOG:
      nextbutton = GetDlgItem (h, IDOK);
      frame = GetDlgItem (h, IDC_LISTVIEW_POS);
      GetParentRect (h, frame, &r);
      r.top += 2;
      r.bottom -= 2;
      create_listview (h, &r);
#if 0
      load_dialog (h);
#endif
      return FALSE;
    case WM_COMMAND:
      return HANDLE_WM_COMMAND (h, wParam, lParam, dialog_cmd);
    }
  return FALSE;
}

char *
base (char *s)
{
  if (!s)
    return 0;
  char *rv = s;
  while (*s)
    {
      if ((*s == '/' || *s == ':' || *s == '\\') && s[1])
	rv = s+1;
      s++;
    }
  return rv;
}

static void
scan2 (char *path, unsigned int size)
{
  int i, t;
  for (i=0; i<npackages; i++)
    for (t=0; t<NTRUST; t++)
      if (package[i].info[t].install
	  && strcmp (base (package[i].info[t].install), base (path)) == 0
	  && package[i].info[t].install_size == (int)size)
	{
	  extra[i].installed_file = package[i].info[t].install;
	  extra[i].installed_size = size;
	  extra[i].which_is_installed = t;
	  extra[i].installed_ver = package[i].info[t].version;
	  if (!extra[i].installed_ver)
	    extra[i].installed_ver = "0";
	}
}

static void
scan_downloaded_files ()
{
  find (".", scan2);
}

static void
read_installed_db ()
{
  int i;
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

      for (i=0; i<npackages; i++)
	if (strcmp (package[i].name, pkg) == 0)
	  {
	    int t;
	    extra[i].installed_file = inst;
	    extra[i].installed_size = instsz;

	    for (t=0; t<NTRUST; t++)
	      if (package[i].info[t].install
		  && strcmp (base (package[i].info[t].install), base (inst)) == 0)
		{
		  extra[i].which_is_installed = t;
		  extra[i].installed_ver = package[i].info[t].version;
		  break;
		}

	    if (extra[i].installed_ver == 0) /* still */
	      {
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
		  extra[i].installed_ver = strdup (v);
		else
		  extra[i].installed_ver = "0";
	      }
	    break;
	  }
    }
  fclose (db);
}

int CDECL
package_sort (const void *va, const void *vb)
{
  Package *a = (Package *)va;
  Package *b = (Package *)vb;
  return strcmp (a->name, b->name);
}

void
do_choose (HINSTANCE h)
{
  int rv, i;

  qsort (package, npackages, sizeof (package[0]), package_sort);

  nextbutton = 0;
  bm_spin = LoadImage (h, MAKEINTRESOURCE (IDB_SPIN), IMAGE_BITMAP, 0, 0, 0);
  bm_rtarrow = LoadImage (h, MAKEINTRESOURCE (IDB_RTARROW), IMAGE_BITMAP, 0, 0, 0);

  bm_checkyes = LoadImage (h, MAKEINTRESOURCE (IDB_CHECK_YES), IMAGE_BITMAP, 0, 0, 0);
  bm_checkno = LoadImage (h, MAKEINTRESOURCE (IDB_CHECK_NO), IMAGE_BITMAP, 0, 0, 0);
  bm_checkna = LoadImage (h, MAKEINTRESOURCE (IDB_CHECK_NA), IMAGE_BITMAP, 0, 0, 0);

  extra = (ExtraPackageInfo *) malloc (npackages * sizeof (ExtraPackageInfo));
  memset (extra, 0, npackages * sizeof (ExtraPackageInfo));
  for (i=0; i<npackages; i++)
    extra[i].which_is_installed = -1;

  register_windows (h);

  if (source == IDC_SOURCE_DOWNLOAD)
    scan_downloaded_files ();
  else
    read_installed_db ();
  build_labels ();

  rv = DialogBox (h, MAKEINTRESOURCE (IDD_CHOOSE), 0, dialog_proc);
  if (rv == -1)
    fatal (IDS_DIALOG_FAILED);

  for (i=0; i<npackages; i++)
    {
      switch (extra[i].chooser[extra[i].pick].trust)
	{
	case TRUST_PREV:
	case TRUST_CURR:
	case TRUST_TEST:
	  if (extra[i].installed_file)
	    package[i].action = ACTION_UPGRADE;
	  else
	    package[i].action = ACTION_NEW;
	  package[i].trust = extra[i].chooser[extra[i].pick].trust;
	  // pick up the actual core package to install
	  if (package[i].type == TY_CYGWIN || package[i].type == TY_NATIVE
	      && xemacs_package == 0)
	    xemacs_package = &package[i];
	  break;

	case TRUST_UNINSTALL:
	  package[i].action = ACTION_UNINSTALL;
	  break;

	case TRUST_KEEP:
	case TRUST_NONE:
	default:
	  package[i].action = ACTION_SAME;
	  break;
	}
    }

  log (LOG_BABBLE, "Chooser results...");
  for (i=0; i<npackages; i++)
    {
      static char *infos[] = {"prev", "curr", "test"};
      const char *trust = ((package[i].trust == TRUST_PREV) ? "prev"
			   : (package[i].trust == TRUST_CURR) ? "curr"
			   : (package[i].trust == TRUST_TEST) ? "test"
			   : "unknown");
      const char *action = ((package[i].action == ACTION_UNKNOWN) ? "unknown"
			    : (package[i].action == ACTION_SAME) ? "same"
			    : (package[i].action == ACTION_NEW) ? "new"
			    : (package[i].action == ACTION_UPGRADE) ? "upgrade"
			    : (package[i].action == ACTION_UNINSTALL) ? "uninstall"
			    : (package[i].action == ACTION_ERROR) ? "error"
			    : "unknown");

      log (LOG_BABBLE, "[%s] action=%s trust=%s src? %s", package[i].name, action, trust,
	   package[i].srcaction == SRCACTION_NO ? "no" : "yes");
      for (int t=0; t<NTRUST; t++)
	{
	  if (package[i].info[t].install)
	    log (LOG_BABBLE, "[%s] ver %s inst %s %d src %s %d",
		 infos[t],
		 package[i].info[t].version ? package[i].info[t].version : "(none)",
		 package[i].info[t].install ? package[i].info[t].install : "(none)",
		 package[i].info[t].install_size,
		 package[i].info[t].source ? package[i].info[t].source : "(none)",
		 package[i].info[t].source_size);
	}
    }
}
