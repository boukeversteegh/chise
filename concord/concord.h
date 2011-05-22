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

#ifndef _CONCORD_H
#define _CONCORD_H

#ifdef __cplusplus
extern "C" {
#endif
#if 0
}
#endif

#include <db.h>

typedef DBT CONCORD_String_Tank;
typedef CONCORD_String_Tank* CONCORD_String;

int CONCORD_String_size (const CONCORD_String s);
unsigned char* CONCORD_String_data (const CONCORD_String s);


typedef void* CONCORD_Object;

typedef enum CONCORD_Backend_Type
{
  CONCORD_Backend_NONE,
  CONCORD_Backend_Berkeley_DB
} CONCORD_Backend_Type;


typedef struct CONCORD_DS_Table CONCORD_DS_Table;
typedef CONCORD_DS_Table* CONCORD_DS;

CONCORD_DS
concord_open_ds (CONCORD_Backend_Type type, const char* location,
		 int subtype, int modemask);

int concord_close_ds (CONCORD_DS ds);

char* concord_ds_location (CONCORD_DS ds);

int
concord_ds_set_object_failure (CONCORD_DS ds, CONCORD_Object object_nil);
int
concord_ds_set_read_object_function (CONCORD_DS ds,
				     CONCORD_Object (*read_object)
				     (const unsigned char* str,
				      size_t length));

int
concord_ds_foreach_genre_name (CONCORD_DS ds,
			       int (*func) (CONCORD_DS ds, char* name));


typedef struct CONCORD_Genre_Table CONCORD_Genre_Table;
typedef CONCORD_Genre_Table* CONCORD_Genre;

CONCORD_Genre
concord_ds_get_genre (CONCORD_DS ds, const char* name);

char* concord_genre_get_name (CONCORD_Genre genre);

CONCORD_DS concord_genre_get_data_source (CONCORD_Genre genre);

int
concord_genre_foreach_feature_name (CONCORD_Genre genre,
				    int (*func) (CONCORD_Genre genre,
						 char* name));


typedef struct CONCORD_Feature_Table CONCORD_Feature_Table;
typedef CONCORD_Feature_Table* CONCORD_Feature;

CONCORD_Feature
concord_genre_get_feature (CONCORD_Genre genre, const char* name);

char* concord_feature_get_name (CONCORD_Feature feature);

CONCORD_Genre concord_feature_get_genre (CONCORD_Feature feature);

int concord_feature_setup_db (CONCORD_Feature feature, int writable);

int concord_feature_sync (CONCORD_Feature feature);

int
concord_obj_put_feature_value_str (const char* object_id,
				   CONCORD_Feature feature,
				   unsigned char* value);

CONCORD_Object
concord_obj_get_feature_value (const char* object_id,
			       CONCORD_Feature feature);
int
concord_obj_get_feature_value_string (const char* object_id,
				      CONCORD_Feature feature,
				      CONCORD_String value);
unsigned char*
concord_obj_gets_feature_value (const char* object_id,
				CONCORD_Feature feature,
				unsigned char* dst, size_t size);

int
concord_feature_foreach_obj_string (CONCORD_Feature feature,
				    int (*func)
				    (CONCORD_String object_id,
				     CONCORD_Feature feature,
				     CONCORD_String valdatum));


typedef struct CONCORD_INDEX_Table CONCORD_INDEX_Table;
typedef CONCORD_INDEX_Table* CONCORD_INDEX;

CONCORD_INDEX
concord_genre_get_index (CONCORD_Genre genre, const char* name);

int concord_index_setup_db (CONCORD_INDEX index, int writable);

int concord_index_sync (CONCORD_INDEX index);

int concord_index_strid_put_obj (CONCORD_INDEX index,
				 const char* strid,
				 char* object_id);

int concord_index_strid_get_obj_string (CONCORD_INDEX index,
					const char* strid,
					CONCORD_String object_id);

#if 0
{
#endif
#ifdef __cplusplus
}
#endif

#endif /* !_CONCORD_H */
