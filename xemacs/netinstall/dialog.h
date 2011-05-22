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

/* global instance for the application; set in main.cc */
extern HINSTANCE hinstance;

/* used by main.cc to select the next do_* function */
extern int next_dialog;

/* either "nothing to do" or "setup complete" or something like that */
extern int exit_msg;

#define D(x) void x(HINSTANCE _h)

/* prototypes for all the do_* functions (most called by main.cc) */

D(do_choose);
D(do_desktop);
D(do_download);
D(do_fromcwd);
D(do_ini);
D(do_init);
D(do_install);
D(do_local_dir);
D(do_net);
D(do_other);
D(do_postinstall);
D(do_uninstall);
D(do_root);
D(do_site);
D(do_source);
D(do_splash);

#undef D

/* end this dialog and select the next.  Pass 0 to exit the program */
#define NEXT(id) EndDialog((HWND)h, 0), next_dialog = id

/* Get the value of an EditText control.  Pass the previously stored
   value and it will free the memory if needed. */
 
char *eget (HWND h, int id, char *var);

/* Same, but convert the value to an integer */

int   eget (HWND h, int id);

/* Set the EditText control to the given string or integer */

void  eset (HWND h, int id, char *var);
void  eset (HWND h, int id, int var);

/* RadioButtons.  ids is a null-terminated list of IDs.  Get
   returns the selected ID (or zero), pass an ID to set */

int   rbget (HWND h, int *ids);
void  rbset (HWND h, int *ids, int id);

/* *This* version of fatal (compare with msg.h) uses GetLastError() to
   format a suitable error message.  Similar to perror() */

void fatal (char *msg);
