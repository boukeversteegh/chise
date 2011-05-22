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

#ifndef __TAR_H_
#define __TAR_H_

/* Only one tarfile may be open at a time.  gzipped files handled
   automatically */

/* returns zero on success, nonzero on failure */
int	tar_open (char *pathname);

/* returns pointer to static buf containing name of next file */
char *	tar_next_file ();

/* byte position in [compressed] file */
int	tar_ftell ();

/* pass adjusted path, returns zero on success, nonzero on failure */
int	tar_read_file (char *path);

/* closes the file */
int	tar_close ();

/* pass path to tar file and from/to pairs for path prefix (NULLs at
   end , returns zero if completely successful, nonzero (counts
   errors) on failure */
int	tar_auto (char *pathname, char **map);

int	tar_mkdir_p (int isadir, char *path);

/*
extern int _tar_verbose;
extern FILE * _tar_vfile;
*/

#endif
