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

#include <string.h>
#include <stdlib.h>
#include "concord-name.h"

struct CONCORD_HASH_TABLE_ENTRY
{
  void *key;
  void *value;
};

struct CONCORD_HASH_TABLE
{
  size_t size;
  CONCORD_HASH_TABLE_ENTRY *data;
};

CONCORD_HASH_TABLE* concord_make_hash_table (size_t size);
void concord_destroy_hash_table (CONCORD_HASH_TABLE* hash);
int concord_hash_c_string (const unsigned char *ptr);

CONCORD_HASH_TABLE*
concord_make_hash_table (size_t size)
{
  CONCORD_HASH_TABLE* hash
    = (CONCORD_HASH_TABLE*)malloc (sizeof (CONCORD_HASH_TABLE));

  if (hash == NULL)
    return NULL;

  hash->data
    = (CONCORD_HASH_TABLE_ENTRY*) malloc (sizeof (CONCORD_HASH_TABLE_ENTRY)
					  * size);
  if (hash->data == NULL)
    {
      free (hash);
      return NULL;
    }

  hash->size = size;
  memset (hash->data, 0, sizeof (CONCORD_HASH_TABLE_ENTRY) * size);
  return hash;
}

void
concord_destroy_hash_table (CONCORD_HASH_TABLE* table)
{
  if (table == NULL)
    return;
  free (table->data);
  free (table);
}


/* derived from hashpjw, Dragon Book P436. */
int
concord_hash_c_string (const unsigned char *ptr)
{
  int hash = 0;

  while (*ptr != '\0')
    {
      int g;
      hash = (hash << 4) + *ptr++;
      g = hash & 0xf0000000;
      if (g)
	hash = (hash ^ (g >> 24)) ^ g;
    }
  return hash & 07777777777;
}


CONCORD_NAME_TABLE*
concord_make_name_table ()
{
  return concord_make_hash_table (256);
}

void
concord_destroy_name_table (CONCORD_NAME_TABLE* table)
{
  int i;

  for (i = 0; i < table->size; i++)
    {
      CONCORD_NAME_TABLE_ENTRY entry = table->data[i];

      if (entry.key != NULL)
	{
	  if (entry.value != NULL)
	    free (entry.value);
	  free (entry.key);
	}
    }
  concord_destroy_hash_table (table);
}

int
concord_name_table_put (CONCORD_NAME_TABLE* table,
			const char *key, void *value)
{
  int i, index;
  CONCORD_NAME_TABLE_ENTRY* entry;

  if (table == NULL)
    return -1;

  index = concord_hash_c_string ((unsigned char*)key) % table->size;
  for (i = index; i < table->size; i++)
    {
      entry = &table->data[i];
      if (entry->key == NULL)
	{
	  size_t len = strlen (key);

	  entry->key = (unsigned char*)malloc (len + 1);
	  if (entry->key == NULL)
	    return -1;
	  strcpy (entry->key, key);
	  entry->value = value;
	  return 0;
	}
      else if (strcmp (entry->key, key) == 0)
	{
	  entry->value = value;
	  return 0;
	}
    }
  if (concord_name_table_grow (table) == 0)
    return concord_name_table_put (table, key, value);
  return -1;
}

void *
concord_name_table_get (CONCORD_NAME_TABLE* table, const char *key)
{
  int i, index;
  CONCORD_NAME_TABLE_ENTRY entry;

  if (table == NULL)
    return NULL;

  index = concord_hash_c_string ((unsigned char*)key) % table->size;
  for (i = index; i < table->size; i++)
    {
      entry = table->data[i];
      if (entry.key == NULL)
	return NULL;
      else if (strcmp (entry.key, key) == 0)
	return entry.value;
    }
  return NULL;
}

int
concord_name_table_grow (CONCORD_NAME_TABLE* table)
{
  CONCORD_NAME_TABLE *new_table
    = concord_make_hash_table ( table->size * 2
				/* - (table->size * 4 / 5) */ );
  int i;

  if (new_table == NULL)
    return -1;

  for (i = 0; i < table->size; i++)
    {
      CONCORD_NAME_TABLE_ENTRY entry = table->data[i];
      if ( (entry.key != NULL) && (entry.value != NULL) )
	{
	  int status
	    = concord_name_table_put (new_table, entry.key, entry.value);
	  if (status != 0)
	    {
	      concord_destroy_hash_table (new_table);
	      return -1;
	    }
	}
    }
  table->size = new_table->size;
  table->data = new_table->data;
  free (new_table);
  return 0;
}
