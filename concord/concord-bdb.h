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

#ifndef _CONCORD_BDB_H
#define _CONCORD_BDB_H

#ifdef __cplusplus
extern "C" {
#endif

#include <db.h>
#include <errno.h>

DB* CONCORD_BDB_open (const char* db_dir,
		      const char* genre,
		      const char* key_type,
		      const char* name,
		      DBTYPE real_subtype,
		      u_int32_t accessmask, int modemask);

int CONCORD_BDB_close (DB* db);

int CONCORD_BDB_get (DB* db, const char* key, DBT* valdatum);

int CONCORD_BDB_put (DB* db, const char* key, unsigned char* value);


#ifdef __cplusplus
}
#endif

#endif /* !_CONCORD_BDB_H */
