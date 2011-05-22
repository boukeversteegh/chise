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
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <dirent.h>
#ifdef HAVE_CONFIG_H
#  include "config.h"
#endif
#include "sysdep.h"
#include "concord.h"
#include "concord-name.h"
#include "concord-bdb.h"


int
CONCORD_String_size (const CONCORD_String s)
{
  return s->size;
}

unsigned char*
CONCORD_String_data (const CONCORD_String s)
{
  return s->data;
}

CONCORD_Genre concord_ds_open_genre (CONCORD_DS ds, const char* name);

int concord_close_genre (CONCORD_Genre genre);


CONCORD_Feature
concord_genre_open_feature (CONCORD_Genre genre, const char* name);

int concord_close_feature (CONCORD_Feature feature);


CONCORD_INDEX
concord_genre_open_index (CONCORD_Genre genre, const char* index);

CONCORD_Feature
concord_genre_get_feature_0 (CONCORD_Genre genre, const char* name);

int concord_close_index (CONCORD_INDEX table);


CONCORD_Object
concord_default_read_object (const unsigned char* string, size_t length);


struct CONCORD_DS_Table
{
  CONCORD_Backend_Type type;
  char *location;
  CONCORD_NAME_TABLE* genre_names;
  DBTYPE subtype;
  int modemask;

  CONCORD_Object object_nil;
  CONCORD_Object (*read_object) (const unsigned char* str, size_t length);
};

CONCORD_Object
concord_default_read_object (const unsigned char* str, size_t length)
{
  unsigned char* buf = malloc (length + 1);

  if (buf == NULL)
    return NULL;
  strncpy ((char*)buf, (char*)str, length);
  buf[length] = '\0';
  return buf;
}

CONCORD_DS
concord_open_ds (CONCORD_Backend_Type type, const char* location,
		 int subtype, int modemask)
{
  CONCORD_DS ds = (CONCORD_DS)malloc (sizeof (CONCORD_DS_Table));
  size_t len = strlen (location);

  if (ds == NULL)
    return NULL;

  ds->type = type;
  ds->subtype = ( (subtype != 0) ? subtype : DB_HASH );
  ds->modemask = modemask;
  ds->location = (char*)malloc (len + 1);
  if (ds->location == NULL)
    goto location_failure;

  strcpy (ds->location, location);

  ds->genre_names = concord_make_name_table ();
  if (ds->genre_names == NULL)
    {
      free (ds->location);
    location_failure:
      free (ds);
      return NULL;
    }

  ds->object_nil = NULL;
  ds->read_object = &concord_default_read_object;

  return ds;
}

int
concord_close_ds (CONCORD_DS ds)
{
  if (ds->location != NULL)
    free (ds->location);
  if (ds->genre_names != NULL)
    concord_destroy_name_table (ds->genre_names);
  free (ds);
  return 0;
}

char*
concord_ds_location (CONCORD_DS ds)
{
  return ds->location;
}

int
concord_ds_set_object_failure (CONCORD_DS ds, CONCORD_Object object_nil)
{
  ds->object_nil = object_nil;
  return 0;
}

int
concord_ds_set_read_object_function (CONCORD_DS ds,
				     CONCORD_Object (*read_object)
				     (const unsigned char* str,
				      size_t length))
{
  ds->read_object = read_object;
  return 0;
}

CONCORD_Genre
concord_ds_get_genre (CONCORD_DS ds, const char* name)
{
  CONCORD_Genre genre;

  genre = concord_name_table_get (ds->genre_names, name);
  if (genre != NULL)
    return genre;

  genre = concord_ds_open_genre (ds, name);
  if (genre == NULL)
    return NULL;

  if (concord_name_table_put (ds->genre_names, name, genre))
    {
      concord_close_genre (genre);
      return NULL;
    }
  return genre;
}

int
concord_ds_foreach_genre_name (CONCORD_DS ds,
			       int (*func) (CONCORD_DS ds, char* name))
{
  char* dname = ds->location;
  DIR *dir;
  struct dirent *de;

  if ( (dir = opendir (dname)) == NULL)
    return -1;

  while ( (de = readdir (dir)) != NULL )
    {
      if ( (strcmp (de->d_name, ".") != 0) &&
	   (strcmp (de->d_name, "..") != 0) )
	{
	  int i, need_to_decode = 0;
	  unsigned char *cp;
	  char *name;
	  unsigned char *np;

	  for (cp = (unsigned char*)de->d_name, i = 0; *cp != '\0'; i++)
	    {
	      if (*cp++ == '%')
		need_to_decode = 1;
	    }
	  if (need_to_decode)
	    {
	      int index = -1;
	      int ch, c[2];
	      int hex[2];

	      name = (char*) alloca (i);
	      cp = (unsigned char*)de->d_name;
	      np = (unsigned char*)name;

	      while ( (ch = *cp++) != '\0')
		{
		  if (ch == '%')
		    {
		      if (index >= 0)
			{
			  *np++ = '%';
			  if (index == 1)
			    *np++ = c[0];
			}
		      index = 0;
		    }
		  else if (index >= 0)
		    {
		      c[index] = ch;

		      if ( ('0' <= ch) && (ch <= '9') )
			hex[index++] = ch - '0';
		      else if ( ('A' <= ch) && (ch <= 'F') )
			hex[index++] = ch - 'A' + 10;
		      else if ( ('a' <= ch) && (ch <= 'f') )
			hex[index++] = ch - 'a' + 10;
		      else
			{
			  *np++ = '%';
			  if (index == 1)
			    *np++ = c[0];
			  *np++ = ch;
			  index = -1;
			  continue;
			}
		      if (index == 2)
			{
			  *np++ = (hex[0] << 4) | hex[1];
			  index = -1;
			  continue;
			}
		    }
		  else
		    *np++ = ch;
		}
	      *np = '\0';
	    }  
	  else
	    name = de->d_name;

	  if (func (ds, name))
	    return closedir (dir);
	}
    }
  return closedir (dir);
}


struct CONCORD_Genre_Table
{
  CONCORD_DS ds;
  char *name;
  CONCORD_NAME_TABLE* feature_names;
  CONCORD_NAME_TABLE* index_names;
};

CONCORD_Genre
concord_ds_open_genre (CONCORD_DS ds, const char* name)
{
  CONCORD_Genre genre;
  size_t len = strlen (name);

  if (ds == NULL)
    return NULL;

  genre = (CONCORD_Genre)malloc (sizeof (CONCORD_Genre_Table));
  if (genre == NULL)
    return NULL;

  genre->ds = ds;
  genre->name = (char*)malloc (len + 1);
  if (genre->name == NULL)
    {
      free (genre);
      return NULL;
    }
  strcpy (genre->name, name);

  genre->feature_names = concord_make_name_table ();
  if (genre->feature_names == NULL)
    {
      free (genre->name);
      free (genre);
      return NULL;
    }

  genre->index_names = concord_make_name_table ();
  if (genre->index_names == NULL)
    {
      free (genre->feature_names);
      free (genre->name);
      free (genre);
      return NULL;
    }
  return genre;
}

int
concord_close_genre (CONCORD_Genre genre)
{
  int status;

  if (genre == NULL)
    return -1;

  if (genre->name == NULL)
    status = -1;
  else
    {
      free (genre->name);
      status = 0;
    }

  if (genre->feature_names != NULL)
    concord_destroy_name_table (genre->feature_names);

  if (genre->index_names != NULL)
    concord_destroy_name_table (genre->index_names);

  free (genre);
  return status;
}

char*
concord_genre_get_name (CONCORD_Genre genre)
{
  return genre->name;
}

CONCORD_DS
concord_genre_get_data_source (CONCORD_Genre genre)
{
  return genre->ds;
}

int
concord_genre_foreach_feature_name (CONCORD_Genre genre,
				    int (*func) (CONCORD_Genre genre,
						 char* name))
{
  char *dname
    = alloca (strlen (genre->ds->location)
	      + 1 + strlen (genre->name) + sizeof ("/feature") + 1);
  DIR *dir;
  struct dirent *de;

  strcpy (dname, genre->ds->location);
  strcat (dname, "/");
  strcat (dname, genre->name);
  strcat (dname, "/feature");

  if ( (dir = opendir (dname)) == NULL)
    return -1;

  while ( (de = readdir (dir)) != NULL )
    {
      if ( (strcmp (de->d_name, ".") != 0) &&
	   (strcmp (de->d_name, "..") != 0) )
	{
	  int i, need_to_decode = 0;
	  unsigned char *cp;
	  char *name;
	  unsigned char *np;

	  for (cp = (unsigned char*)de->d_name, i = 0; *cp != '\0'; i++)
	    {
	      if (*cp++ == '%')
		need_to_decode = 1;
	    }
	  if (need_to_decode)
	    {
	      int index = -1;
	      int ch, c[2];
	      int hex[2];

	      name = (char*) alloca (i);
	      cp = (unsigned char*)de->d_name;
	      np = (unsigned char*)name;

	      while ( (ch = *cp++) != '\0')
		{
		  if (ch == '%')
		    {
		      if (index >= 0)
			{
			  *np++ = '%';
			  if (index == 1)
			    *np++ = c[0];
			}
		      index = 0;
		    }
		  else if (index >= 0)
		    {
		      c[index] = ch;

		      if ( ('0' <= ch) && (ch <= '9') )
			hex[index++] = ch - '0';
		      else if ( ('A' <= ch) && (ch <= 'F') )
			hex[index++] = ch - 'A' + 10;
		      else if ( ('a' <= ch) && (ch <= 'f') )
			hex[index++] = ch - 'a' + 10;
		      else
			{
			  *np++ = '%';
			  if (index == 1)
			    *np++ = c[0];
			  *np++ = ch;
			  index = -1;
			  continue;
			}
		      if (index == 2)
			{
			  *np++ = (hex[0] << 4) | hex[1];
			  index = -1;
			  continue;
			}
		    }
		  else
		    *np++ = ch;
		}
	      *np = '\0';
	    }  
	  else
	    name = de->d_name;

	  if (func (genre, name))
	    return closedir (dir);
	}
    }
  return closedir (dir);
}

CONCORD_Feature
concord_genre_get_feature_0 (CONCORD_Genre genre, const char* name)
{
  CONCORD_Feature feature;

  feature = concord_name_table_get (genre->feature_names, name);
  if (feature != NULL)
    return feature;

  feature = concord_genre_open_feature (genre, name);
  if (feature == NULL)
    return NULL;

  if (concord_name_table_put (genre->feature_names, name, feature))
    {
      concord_close_feature (feature);
      return NULL;
    }
  return feature;
}

CONCORD_Feature
concord_genre_get_feature (CONCORD_Genre genre, const char* name)
{
  CONCORD_Genre g_feature
    = concord_ds_get_genre (genre->ds, "feature");

  if (g_feature != NULL)
    {
      CONCORD_Feature p_true_name
	= concord_genre_get_feature_0 (g_feature, "true-name");

      if (g_feature != NULL)
	{
	  CONCORD_String_Tank s_true_name;
	  int status
	    = concord_obj_get_feature_value_string (name,
						    p_true_name,
						    &s_true_name);
	  if (status == 0)
	    {
	      char* t_name = alloca (s_true_name.size + 1);

	      strncpy (t_name, s_true_name.data, s_true_name.size);
	      t_name[s_true_name.size] = '\0';
	      return concord_genre_get_feature_0 (genre, t_name);
	    }
	}
    }
  return concord_genre_get_feature_0 (genre, name);
}

CONCORD_INDEX
concord_genre_get_index (CONCORD_Genre genre, const char* name)
{
  CONCORD_INDEX index;

  index = concord_name_table_get (genre->index_names, name);
  if (index != NULL)
    return index;

  index = concord_genre_open_index (genre, name);
  if (index == NULL)
    return NULL;

  if (concord_name_table_put (genre->index_names, name, index))
    {
      concord_close_index (index);
      return NULL;
    }
  return index;
}


struct CONCORD_Feature_Table
{
  CONCORD_Genre genre;
  char* name;
  DB* db;
  u_int32_t access;
};

CONCORD_Feature
concord_genre_open_feature (CONCORD_Genre genre, const char* feature)
{
  CONCORD_Feature table;
  size_t len = strlen (feature);

  if (genre == NULL)
    return NULL;

  table = (CONCORD_Feature)malloc (sizeof (CONCORD_Feature_Table));
  if (table == NULL)
    return NULL;

  table->genre = genre;
  table->db = NULL;
  table->access = 0;
  table->name = (char*)malloc (len + 1);
  if (table->name == NULL)
    {
      free (table);
      return NULL;
    }
  strcpy (table->name, feature);
  return table;
}

int
concord_close_feature (CONCORD_Feature feature)
{
  int status;

  if (feature == NULL)
    return -1;

  if (feature->db == NULL)
    status = -1;
  else
    status = CONCORD_BDB_close (feature->db);

  if (feature->name == NULL)
    status = -1;
  else
    {
      free (feature->name);
      status = 0;
    }
  free (feature);
  return status;
}

char*
concord_feature_get_name (CONCORD_Feature feature)
{
  return feature->name;
}

CONCORD_Genre
concord_feature_get_genre (CONCORD_Feature feature)
{
  return feature->genre;
}

int
concord_feature_setup_db (CONCORD_Feature feature, int writable)
{
  u_int32_t access;

  if (feature == NULL)
    return -1;

  if (writable)
    {
      if ((feature->access & DB_CREATE) == 0)
	{
	  if (feature->db != NULL)
	    {
	      CONCORD_BDB_close (feature->db);
	      feature->db = NULL;
	    }
	  feature->access = 0;
	}
      access = DB_CREATE;
    }
  else
    access = DB_RDONLY;

  if (feature->db == NULL)
    {
      CONCORD_Genre genre = feature->genre;

      feature->db
	= CONCORD_BDB_open (genre->ds->location, genre->name,
			    "feature", feature->name,
			    genre->ds->subtype,
			    access, genre->ds->modemask);
      if (feature->db == NULL)
	return -1;
      feature->access = access;
    }
  return 0;
}

int
concord_feature_sync (CONCORD_Feature feature)
{
  int status;

  if (feature->db == NULL)
    status = 0;
  else
    status = CONCORD_BDB_close (feature->db);
  feature->db = NULL;
  feature->access = 0;
  return status;
}

int
concord_obj_put_feature_value_str (const char* object_id,
				   CONCORD_Feature feature,
				   unsigned char* value)
{
  if (feature == NULL)
    return -1;
  if (concord_feature_setup_db (feature, 1))
    return -1;
  return CONCORD_BDB_put (feature->db, object_id, value);
}

int
concord_obj_get_feature_value_string (const char* object_id,
				      CONCORD_Feature feature,
				      CONCORD_String value)
{
  int status;

  if (concord_feature_setup_db (feature, 0))
    return -1;
  status = CONCORD_BDB_get (feature->db, object_id, value);
  return status;
}

CONCORD_Object
concord_obj_get_feature_value (const char* object_id,
			       CONCORD_Feature feature)
{
  DBT valdatum;
  int status;

  if (concord_feature_setup_db (feature, 0))
    return feature->genre->ds->object_nil;
  status = CONCORD_BDB_get (feature->db, object_id, &valdatum);
  if (status)
    return feature->genre->ds->object_nil;
  return (*feature->genre->ds->read_object)(valdatum.data, valdatum.size);
}

unsigned char*
concord_obj_gets_feature_value (const char* object_id,
				CONCORD_Feature feature,
				unsigned char* dst, size_t size)
{
  DBT valdatum;
  int status;

  if (concord_feature_setup_db (feature, 0))
    return NULL;
  status = CONCORD_BDB_get (feature->db, object_id, &valdatum);
  if (status)
    return NULL;
  if (size < valdatum.size)
    return NULL;
  strncpy ((char*)dst, valdatum.data, valdatum.size);
  dst[valdatum.size] = '\0';
  return dst;
}

int
concord_feature_foreach_obj_string (CONCORD_Feature feature,
				    int (*func)(CONCORD_String object_id,
						CONCORD_Feature feature,
						CONCORD_String value))
{
  CONCORD_String_Tank key, value;
  DBC *dbcp;
  int status;

  if (concord_feature_setup_db (feature, 0))
    return -1;
  xzero (key);
  xzero (value);

  status = feature->db->cursor (feature->db, NULL, &dbcp, 0);
  for (status = dbcp->c_get (dbcp, &key, &value, DB_FIRST);
       status == 0;
       status = dbcp->c_get (dbcp, &key, &value, DB_NEXT))
    {
      int ret = func (&key, feature, &value);

      if (ret)
	break;
    }
  dbcp->c_close (dbcp);
  return 0;
}


struct CONCORD_INDEX_Table
{
  CONCORD_Genre genre;
  char *name;
  DB* db;
  u_int32_t access;
};

CONCORD_INDEX
concord_genre_open_index (CONCORD_Genre genre, const char* index)
{
  CONCORD_INDEX table;
  size_t len = strlen (index);

  if (genre == NULL)
    return NULL;

  table = (CONCORD_INDEX)malloc (sizeof (CONCORD_INDEX_Table));
  if (table == NULL)
    return NULL;

  table->genre = genre;
  table->db = NULL;
  table->access = 0;
  table->name = (char*)malloc (len + 1);
  if (table->name == NULL)
    {
      free (table);
      return NULL;
    }
  strcpy (table->name, index);
  return table;
}

int
concord_close_index (CONCORD_INDEX table)
{
  int status;

  if (table == NULL)
    return -1;

  if (table->db == NULL)
    status = 0;
  else
    status = CONCORD_BDB_close (table->db);

  if (table->name == NULL)
    status = -1;
  else
    {
      free (table->name);
      status = 0;
    }
  free (table);
  return status;
}

int
concord_index_setup_db (CONCORD_INDEX index, int writable)
{
  u_int32_t access;

  if (index == NULL)
    return -1;

  if (writable)
    {
      if ((index->access & DB_CREATE) == 0)
	{
	  if (index->db != NULL)
	    {
	      CONCORD_BDB_close (index->db);
	      index->db = NULL;
	    }
	  index->access = 0;
	}
      access = DB_CREATE;
    }
  else
    access = DB_RDONLY;

  if (index->db == NULL)
    {
      CONCORD_Genre genre = index->genre;

      index->db
	= CONCORD_BDB_open (genre->ds->location, genre->name,
			    "index", index->name,
			    genre->ds->subtype,
			    access, genre->ds->modemask);
      if (index->db == NULL)
	return -1;
      index->access = access;
    }
  return 0;
}

int
concord_index_sync (CONCORD_INDEX index)
{
  int status;

  if (index->db == NULL)
    status = 0;
  else
    status = CONCORD_BDB_close (index->db);
  index->db = NULL;
  index->access = 0;
  return status;
}

int
concord_index_strid_put_obj (CONCORD_INDEX index,
			     const char* strid, char* object_id)
{
  if (index == NULL)
    return -1;

  if (concord_index_setup_db (index, 1))
    return -1;  

  return CONCORD_BDB_put (index->db, strid, (unsigned char*)object_id);
}

int
concord_index_strid_get_obj_string (CONCORD_INDEX index,
				    const char* strid,
				    CONCORD_String object_id)
{
  if (index == NULL)
    return -1;

  if (concord_index_setup_db (index, 0))
    return -1;  

  return CONCORD_BDB_get (index->db, strid, object_id);
}
