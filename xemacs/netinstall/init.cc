/* Initialisation for netinstall.
   Copyright (C) 2001 Andy Piper.

This file is part of XEmacs.

XEmacs is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

XEmacs is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

#include "win32.h"
#include <stdio.h>
#include <stdlib.h>
#include "dialog.h"
#include "log.h"
#include "resource.h"
#include "state.h"
#include "msg.h"
#include "regedit.h"
#include "reginfo.h"
#include "version.h"

static void
init_root ()
{
  int isnative, issystem;
  root_dir = find_root_location (&issystem, &isnative);
  if (root_dir)
    {
      if (isnative)
	install_type = IDC_INSTALL_NATIVE;
      else
	install_type = IDC_INSTALL_CYGWIN;

      if (issystem)
	root_scope = IDC_ROOT_SYSTEM;
      else
	root_scope = IDC_ROOT_USER;
      root_dir_default = 0;
    }
}

void
do_init (HINSTANCE h)
{
  char cwd[_MAX_PATH];
  GetCurrentDirectory (sizeof (cwd), cwd);
  local_dir = strdup (cwd);
  log (0, "Current Directory: %s", cwd);

  HANDLE gnu = LoadImage (h, MAKEINTRESOURCE (IDB_GNU), 
			  IMAGE_BITMAP, 0, 0, 0);
  init_root();
}

