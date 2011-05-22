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

/* This file is responsible for implementing all direct HTTP protocol
   channels.  It is intentionally simplistic. */

#include "win32.h"
#include "winsock.h"
#include <stdio.h>
#include <stdlib.h>

#include "resource.h"
#include "state.h"
#include "simpsock.h"
#include "msg.h"

#include "netio.h"
#include "nio-http.h"

static char six2pr[64] = {
    'A','B','C','D','E','F','G','H','I','J','K','L','M',
    'N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
    'a','b','c','d','e','f','g','h','i','j','k','l','m',
    'n','o','p','q','r','s','t','u','v','w','x','y','z',
    '0','1','2','3','4','5','6','7','8','9','+','/'
};

static char *
base64_encode (char *username, char *password)
{
  unsigned char *ep;
  char *rp;
  static char *rv = 0;
  if (rv)
    free (rv);
  rv = (char *) malloc (2 * (strlen (username) + strlen (password)) + 5);

  char *up = (char *) malloc (strlen (username) + strlen (password) + 6);
  strcpy (up, username);
  strcat (up, ":");
  strcat (up, password);
  ep = (unsigned char *)up + strlen (up);
  *ep++ = 0;
  *ep++ = 0;
  *ep++ = 0;

  char block[4];

  rp = rv;

  for (ep = (unsigned char *)up; *ep; ep += 3)
    {
      block[0] = six2pr[ep[0] >> 2];
      block[1] = six2pr[((ep[0] << 4) & 0x30) | ((ep[1] >> 4) & 0x0f)];
      block[2] = six2pr[((ep[1] << 2) & 0x3c) | ((ep[2] >> 6) & 0x03)];
      block[3] = six2pr[ep[2] & 0x3f];

      if (ep[1] == 0)
	block[2] = block[3] = '=';
      if (ep[2] == 0)
	block[3] = '=';
      memcpy (rp, block, 4);
      rp += 4;
    }
  *rp = 0;

  free (up);

  return rv;
}

NetIO_HTTP::NetIO_HTTP (char *Purl)
  : NetIO (Purl)
{
 retry_get:
  if (port == 0)
    port = 80;

  if (net_method == IDC_NET_PROXY)
    s = new SimpleSocket (net_proxy_host, net_proxy_port);
  else
    s = new SimpleSocket (host, port);

  if (!s->ok())
    {
      s = 0;
      return;
    }

  if (net_method == IDC_NET_PROXY)
    s->printf ("GET %s HTTP/1.0\r\n", url);
  else
    s->printf ("GET %s HTTP/1.0\r\n", path);
  s->printf ("Host: %s:%d\r\n", host, port);

  if (net_user && net_passwd)
    s->printf ("Authorization: Basic %s\r\n",
	       base64_encode (net_user, net_passwd));

  if (net_proxy_user && net_proxy_passwd)
    s->printf ("Proxy-Authorization: Basic %s\r\n",
	       base64_encode (net_proxy_user, net_proxy_passwd));

  s->printf ("\r\n");

  char *l = s->gets ();
  int code;
  sscanf (l, "%*s %d", &code);
  if (code >= 300 && code < 400)
    {
      do {
	l = s->gets ();
	if (_strnicmp (l, "Location:", 9) == 0)
	  {
	    char *u = l + 9;
	    while (*u == ' ' || *u == '\t')
	      u++;
	    set_url (u);
	    delete s;
	    goto retry_get;
	  }
      } while (*l);
    }
  if (code == 401) /* authorization required */
    {
      get_auth ();
      delete s;
      goto retry_get;
    }
  if (code == 407) /* proxy authorization required */
    {
      get_proxy_auth ();
      delete s;
      goto retry_get;
    }
  if (code >= 300)
    {
      delete s;
      s = 0;
      return;
    }
  do {
    l = s->gets ();
    if (_strnicmp (l, "Content-Length:", 15) == 0)
      sscanf (l, "%*s %d", &file_size);
  } while (*l);
}

NetIO_HTTP::~NetIO_HTTP ()
{
  if (s)
    delete s;
}

int
NetIO_HTTP::ok ()
{
  if (s)
    return 1;
  return 0;
}

int
NetIO_HTTP::read (char *buf, int nbytes)
{
  return s->read (buf, nbytes);
}
