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

/* see nio-file.cc */

class NetIO_File : public NetIO {
public:
  NetIO_File (char *url);
  void *fd;
  ~NetIO_File ();
  virtual int ok ();
  virtual int read (char *buf, int nbytes);
};
