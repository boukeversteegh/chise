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

/* Direct HTTP (with or without proxy) */

class SimpleSocket;

class NetIO_HTTP : public NetIO {
  SimpleSocket *s;

public:
  NetIO_HTTP (char *url);
  virtual ~NetIO_HTTP ();

  /* If !ok() that means the transfer isn't happening. */
  virtual int ok ();

  /* Read `nbytes' bytes from the file.  Returns zero when the file
     is complete. */
  virtual int read (char *buf, int nbytes);
};
