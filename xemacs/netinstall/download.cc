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

/* The purpose of this file is to download all the files we need to
   do the installation. */

#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>

#include "win32.h"

#include "resource.h"
#include "msg.h"
#include "ini.h"
#include "dialog.h"
#include "concat.h"
#include "geturl.h"
#include "state.h"
#include "mkdir.h"
#include "log.h"

static int
download_one (char *name, int expected_size)
{
  char *local = name;

  struct stat s;
  if (stat (local, &s) >= 0)
    if (s.st_size == expected_size)
      return 0;

  mkdir_p (0, local);

  if (get_url_to_file (concat (MIRROR_SITE, "/", name, 0),
		       concat (local, ".tmp", 0),
		       expected_size))
    {
      note (IDS_DOWNLOAD_FAILED, name);
      return 1;
    }
  else
    {
      stat (concat (local, ".tmp", 0), &s);
      if (s.st_size == expected_size)
	{
	  log (0, "Downloaded %s", local);
	  rename (concat (local, ".tmp", 0), local);
	}
      else
	{
	  log (0, "Download %s wrong size (%d actual vs %d expected)",
	       local, s.st_size, expected_size);
	  note (IDS_DOWNLOAD_SHORT, local, s.st_size, expected_size);
	  return 1;
	}
    }

  return 0;
}

void
do_download (HINSTANCE h)
{
  int i;
  int errors = 0;

  for (i=0; i<npackages; i++)
    if (package[i].action == ACTION_NEW || package[i].action == ACTION_UPGRADE)
      {
	int e = download_one (pi.install, pi.install_size);
	if (package[i].srcaction == SRCACTION_YES && pi.source)
	  e += download_one (pi.source, pi.source_size);
	errors += e;
	if (e)
	  package[i].action = ACTION_ERROR;
      }

  dismiss_url_status_dialog ();

  if (errors)
    {
      if (yesno (IDS_DOWNLOAD_INCOMPLETE) == IDYES)
	{
	  next_dialog = IDD_SITE;
	  return;
	}
    }

  if (source == IDC_SOURCE_DOWNLOAD)
    {
      if (errors)
	exit_msg = IDS_DOWNLOAD_INCOMPLETE;
      else
	exit_msg = IDS_DOWNLOAD_COMPLETE;
      next_dialog = 0;
    }
  else
    next_dialog = IDD_S_INSTALL;
}
