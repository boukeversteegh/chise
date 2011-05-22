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

/* Download files from the Internet.  These pop up a progress dialog;
   don't forget to dismiss it when you're done downloading for a while */

char  *get_url_to_string (char *_url);
int    get_url_to_file (char *_url, char *_filename, int expected_size);
void   dismiss_url_status_dialog ();
