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

/* This file is responsible for implementing all direct FTP protocol
   channels.  It is intentionally simplistic. */

#include "win32.h"
#include "winsock.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#include "resource.h"
#include "state.h"
#include "simpsock.h"
#include "log.h"

#include "netio.h"
#include "nio-ftp.h"

static SimpleSocket *cmd = 0;
static char *cmd_host = 0;
static int cmd_port = 0;

static char *last_line;

static int
ftp_line (SimpleSocket *s)
{
  do {
    last_line = s->gets ();
    log (LOG_BABBLE, "ftp > %s", last_line);
  } while (last_line && (!isdigit (last_line[0]) || last_line[3] != ' '));
  return atoi (last_line ?: "0");
}

NetIO_FTP::NetIO_FTP (char *Purl)
  : NetIO (Purl)
{
  s = 0;
  int code;

  if (port == 0)
    port = 21;

  if (cmd_host && strcmp (host, cmd_host) != 0 || port != cmd_port)
    {
      if (cmd)
	cmd->printf ("QUIT\r\n");
      delete cmd;
      free (cmd_host);
      cmd = 0;
      cmd_host = 0;
    }

  if (cmd == 0)
    {
      SimpleSocket *c = new SimpleSocket (host, port);
      code = ftp_line (c);
      c->printf ("USER anonymous\r\n");
      code = ftp_line (c);
      if (code == 331)
	{
	  c->printf ("PASS xemacs-setup@\r\n");
	  code = ftp_line (c);
	}

      if (code < 200 || code >= 300)
	{
	  delete c;
	  return;
	}

      cmd = c;
      cmd_host = _strdup (host);
      cmd_port = port;

      cmd->printf ("TYPE I\r\n");
      code = ftp_line (cmd);
    }

  cmd->printf ("PASV\r\n");
  do {
    code = ftp_line (cmd);
  } while (code == 226); /* previous RETR */
  if (code != 227)
    return;

  char *paren = strchr (last_line, '(');
  if (!paren)
    return;

  int i1, i2, i3, i4, p1, p2;
  sscanf (paren+1, "%d,%d,%d,%d,%d,%d", &i1, &i2, &i3, &i4, &p1, &p2);
  char tmp[20];
  sprintf (tmp, "%d.%d.%d.%d", i1, i2, i3, i4);
  s = new SimpleSocket (tmp, p1*256 + p2);

  cmd->printf ("RETR %s\r\n", path);
  code = ftp_line (cmd);
  if (code != 150)
    {
      delete s;
      s = 0;
      return;
    }
}

NetIO_FTP::~NetIO_FTP ()
{
  if (s)
    delete s;
}

int
NetIO_FTP::ok ()
{
  if (s)
    return 1;
  return 0;
}

int
NetIO_FTP::read (char *buf, int nbytes)
{
  if (!s)
    return 0;
  return s->read (buf, nbytes);
}
