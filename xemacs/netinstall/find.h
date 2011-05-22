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

/* The for_each function is called once for each file found in the
   starting_dir or any subdir (recursively), passing the relative path
   (i.e. it doesn't include "starting_dir") and the size of the file
   (bytes).  find() returns the number of files found.  Directories
   are scanned but not included in the "found" files. */

extern int find (char *starting_dir, void (*for_each)(char *, unsigned int));
