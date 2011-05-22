/* Copyright (C) 2003,2004,2005,2006 MORIOKA Tomohiko
   This file is part of the CONCORD Library.

   The CONCORD Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The CONCORD Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the CONCORD Library; if not, write to the Free
   Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
   02111-1307 USA.  */

#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif
#include "sysdep.h"
#include "concord.h"
#include "concord-bdb.h"

DB*
CONCORD_BDB_open (const char* db_dir,
		  const char* genre,
		  const char* key_type,
		  const char* name,
		  DBTYPE real_subtype,
		  u_int32_t accessmask, int modemask)
{
  DB* dbase;
  int status;
  int len, name_len, i;
  int size;
  char *db_file_name, *sp;
  struct stat statbuf;

  status = db_create (&dbase, NULL, 0);
  if (status)
    return NULL;

  if ( (accessmask & DB_CREATE) && stat (db_dir, &statbuf) )
    mkdir (db_dir, modemask);

  len = strlen (db_dir);
  name_len = strlen (name);
  size = len + strlen (genre) + strlen (key_type) + name_len * 3 + 5;
  db_file_name = alloca (size);
  strcpy (db_file_name, db_dir);
  if (db_file_name[len - 1] != '/')
    {
      db_file_name[len++] = '/';
      db_file_name[len] = '\0';
    }

  strcat (db_file_name, genre);
  if ( (accessmask & DB_CREATE) && stat (db_file_name, &statbuf) )
    mkdir (db_file_name, modemask);
  strcat (db_file_name, "/");

  strcat (db_file_name, key_type);
  if ( (accessmask & DB_CREATE) && stat (db_file_name, &statbuf) )
    mkdir (db_file_name, modemask);
  strcat (db_file_name, "/");

  /* strcat (db_file_name, name); */
  sp = &db_file_name[strlen (db_file_name)];
  for (i = 0; i < name_len; i++)
    {
      int c = name[i];

      if ( /* (c == '/') || (c == '%') */
	  strchr ("%/\\:*?\"<>|", c) != NULL )
	{
	  sprintf (sp, "%%%02X", c);
	  sp += 3;
	}
      else
	*sp++ = c;
    }
  *sp = '\0';
#if DB_VERSION_MAJOR < 4 || (DB_VERSION_MAJOR == 4 && DB_VERSION_MINOR < 1)
  status = dbase->open (dbase, db_file_name, NULL,
			real_subtype, accessmask, modemask);
#else /* DB_VERSION >= 4.1 */
  status = dbase->open (dbase, NULL, db_file_name, NULL,
			real_subtype,
			accessmask /* | DB_AUTO_COMMIT */, modemask);
#endif /* DB_VERSION < 4.1 */
  if (status)
    {
      dbase->close (dbase, 0);
      return NULL;
    }
  return dbase;
}

int
CONCORD_BDB_close (DB* db)
{
  if (db)
    {
      db->sync  (db, 0);
      db->close (db, 0);
    }
  return 0;
}

int
CONCORD_BDB_get (DB* db, const char* key, DBT* valdatum)
{
  DBT keydatum;
  int status = 0;

  /* DB Version 2 requires DBT's to be zeroed before use. */
  xzero (keydatum);
  xzero (*valdatum);

  keydatum.data = (char*)key;
  keydatum.size = strlen (key);

  status = db->get (db, NULL, &keydatum, valdatum, 0);
  return status;
}

int
CONCORD_BDB_put (DB* db, const char* key, unsigned char* value)
{
  DBT keydatum, valdatum;
  int status = 0;

  /* DB Version 2 requires DBT's to be zeroed before use. */
  xzero (keydatum);
  xzero (valdatum);

  keydatum.data = (char*)key;
  keydatum.size = strlen (key);

  valdatum.data = value;
  valdatum.size = strlen ((char*)value);

  status = db->put (db, NULL, &keydatum, &valdatum, 0);
  return status;
}
