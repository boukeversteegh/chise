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

/* Simplified socket access functions */

class SimpleSocket {

  SOCKET s;
  char *buf;
  int putp, getp;
  int fill ();

 public:
  SimpleSocket (char *hostname, int port);
  ~SimpleSocket ();

  int ok ();

  int printf (char *fmt, ...);
  int write (char *buf, int len);

  char *gets ();
  int	read (char *buf, int len);
};
