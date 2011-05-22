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

/* OK, here's how this works.  Each of the steps needed for install -
   dialogs, downloads, installs - are in their own files and have some
   "do_*" function (prototype in dialog.h) and a resource id (IDD_* or
   IDD_S_* in resource.h) for that step.  Each step is responsible for
   selecting the next step!  See the NEXT macro in dialog.h.  Note
   that the IDD_S_* ids are fake; those are for steps that don't
   really have a controlling dialog (some have progress dialogs, but
   those don't count, although they could).  Replace the IDD_S_* with
   IDD_* if you create a real dialog for those steps. */

#include "win32.h"

#include <stdio.h>
#include <stdlib.h>
#include "resource.h"
#include "dialog.h"
#include "state.h"
#include "msg.h"
#include "netio.h"
#include "find.h"
#include "log.h"

#include "port.h"

void netio_test (char *);

int next_dialog;
int exit_msg = 0;

HINSTANCE hinstance;

int WINAPI
WinMain (HINSTANCE h,
	 HINSTANCE hPrevInstance,
	 LPSTR command_line,
	 int cmd_show)
{
  hinstance = h;
  int pos = -1;
  if ((pos = strcspn(command_line, "-")) >= 0
      &&
      command_line[pos+1] == 'u')
    {
      next_dialog = IDD_UNINSTALL;
      log (LOG_TIMESTAMP, "Starting XEmacs uninstall");
      uninstall = 1;
    }
  else
    {
      next_dialog = IDD_SPLASH;
      log (LOG_TIMESTAMP, "Starting XEmacs install");
    }

  do_init(h);

  while (next_dialog)
    {
      switch (next_dialog)
	{
	case IDD_SPLASH:	do_splash (h);	break;
	case IDD_UNINSTALL:	do_uninstall (h);	break;
	case IDD_SOURCE:	do_source (h);	break;
	case IDD_LOCAL_DIR:	do_local_dir (h); break;
	case IDD_ROOT:		do_root (h);	break;
	case IDD_NET:		do_net (h);	break;
	case IDD_SITE:		do_site (h);	break;
	case IDD_OTHER_URL:	do_other (h);	break;
	case IDD_S_LOAD_INI:	do_ini (h);	break;
	case IDD_S_FROM_CWD:	do_fromcwd (h);	break;
	case IDD_CHOOSE:	do_choose (h);	break;
	case IDD_S_DOWNLOAD:	do_download (h); break;
	case IDD_S_INSTALL:	do_install (h);	break;
	case IDD_DESKTOP:	do_desktop (h); break;
	case IDD_S_POSTINSTALL:	do_postinstall (h); break;

	default:
	  next_dialog = 0;
	  break;
	}
    }

  exit_setup (0);

  return EXIT_SUCCESS;
}
