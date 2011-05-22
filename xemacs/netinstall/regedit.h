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

/* Finds the existing root point, or returns NULL. */

char *	find_root_location (int *issystem, int *isnative);
char *	find_cygwin_root (int *issystem);

/* Similar to the mount and umount functions, but simplified */

void	create_xemacs_root (char *posix, int issystem, int isnative);
void	remove_xemacs_root ();
void	set_app_path (char *exe, char* path, int issystem);
void 	set_install_path (char* path, int issystem);
void	setup_explorer (char* file_type, char* name, char *exe);
void	remove_app_path (char *exe);
void	remove_uninstall_path ();

