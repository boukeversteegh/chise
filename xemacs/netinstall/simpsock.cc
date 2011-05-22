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

#include "win32.h"
#include <winsock.h>
#include <stdio.h>
#include <stdarg.h>
#include <stdlib.h>

#include "simpsock.h"
#include "msg.h"

#define SSBUFSZ 1024

SimpleSocket::SimpleSocket (char *hostname, int port)
{
  static int initted = 0;
  if (!initted)
    {
      initted = 1;
      WSADATA d;
      WSAStartup (MAKEWORD (1,1), &d);
    }

  s = INVALID_SOCKET;
  buf = (char *) malloc (SSBUFSZ + 3);
  putp = getp = 0;

  int i1, i2, i3, i4;
  unsigned char ip[4];

  if (sscanf (hostname, "%d.%d.%d.%d", &i1, &i2, &i3, &i4) == 4)
    {
      ip[0] = i1;
      ip[1] = i2;
      ip[2] = i3;
      ip[3] = i4;
    }
  else
    {
      struct hostent *he;
      he = gethostbyname (hostname);
      if (!he)
	{
	  msg ("Can't resolve `%s'\n", hostname);
	  return;
	}
      memcpy (ip, he->h_addr_list[0], 4);
    }

  s = socket (AF_INET, SOCK_STREAM, 0);
  if (s == INVALID_SOCKET)
    {
      msg ("Can't create socket, %d", WSAGetLastError ());
      return;
    }

  struct sockaddr_in name;

  memset (&name, 0, sizeof (name));
  name.sin_family = AF_INET;
  name.sin_port = htons (port);
  memcpy (&name.sin_addr, ip, 4);

  if (connect (s, (sockaddr *)&name, sizeof(name)))
    {
      msg ("Can't connect to %s:%d", hostname, port);
      closesocket (s);
      s = INVALID_SOCKET;
      return;
    }

  return;
}

SimpleSocket::~SimpleSocket ()
{
  if (s != INVALID_SOCKET)
    closesocket (s);
  s = INVALID_SOCKET;
  if (buf)
    free (buf);
  buf = 0;
}

int
SimpleSocket::ok ()
{
  if (s == INVALID_SOCKET)
    return 0;
  return 1;
}

int
SimpleSocket::printf (char *fmt, ...)
{
  char localbuf[SSBUFSZ];
  va_list args;
  va_start (args, fmt);
  vsprintf (localbuf, fmt, args);
  return send (s, localbuf, strlen (localbuf), 0);
}

int
SimpleSocket::write (char *localbuf, int len)
{
  return send (s, localbuf, len, 0);
}

int
SimpleSocket::fill ()
{
  if (putp == getp)
    putp = getp = 0;

  int n = SSBUFSZ - putp;
  if (n == 0)
    return 0;
  int r = recv (s, buf + putp, n, 0);
  if (r > 0)
    {
      putp += r;
      return r;
    }
  return 0;
}

char *
SimpleSocket::gets ()
{
  if (getp > 0 && putp > getp)
    {
      memmove (buf, buf+getp, putp-getp);
      putp -= getp;
      getp = 0;
    }
  if (putp == getp)
    fill();

  // getp is zero, always, here, and putp is the count
  char *nl;
  while ((nl = (char *)memchr (buf, '\n', putp)) == NULL && putp < SSBUFSZ)
    if (fill () <= 0)
      break;

  if (nl)
    {
      getp = nl - buf + 1;
      while ((*nl == '\n' || *nl == '\r') && nl >= buf)
	*nl-- = 0;
    }
  else
    {
      getp = putp;
      nl = buf + putp;
      nl[1] = 0;
    }

  return buf;
}

#define MIN(a,b) ((a) < (b) ? (a) : (b))

int
SimpleSocket::read (char *ubuf, int ulen)
{
  int n, rv=0;
  if (putp > getp)
    {
      n = MIN (ulen, putp-getp);
      memmove (ubuf, buf+getp, n);
      getp += n;
      ubuf += n;
      ulen -= n;
      rv += n;
    }
  while (ulen > 0)
    {
      n = recv (s, ubuf, ulen, 0);
      if (n <= 0)
	return rv;
      ubuf += n;
      ulen -= n;
      rv += n;
    }
  return rv;
}
