/* Copyright (C) 2003,2005,2006 MORIOKA Tomohiko
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

#ifndef _CONCORD_NAME_H
#define _CONCORD_NAME_H

typedef struct CONCORD_HASH_TABLE_ENTRY CONCORD_HASH_TABLE_ENTRY;
typedef struct CONCORD_HASH_TABLE CONCORD_HASH_TABLE;

typedef CONCORD_HASH_TABLE CONCORD_NAME_TABLE;
typedef CONCORD_HASH_TABLE_ENTRY CONCORD_NAME_TABLE_ENTRY;

CONCORD_NAME_TABLE* concord_make_name_table (void);
void concord_destroy_name_table (CONCORD_NAME_TABLE* table);
int concord_name_table_put (CONCORD_NAME_TABLE* table,
			    const char *key, void *value);
void* concord_name_table_get (CONCORD_NAME_TABLE* table, const char *key);
int concord_name_table_grow (CONCORD_NAME_TABLE* table);

#endif /* !_CONCORD_NAME_H */
