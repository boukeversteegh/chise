/* Copyright (C) 2003,2004,2005 MORIOKA Tomohiko
   This file is part of the CHISE Library.

   The CHISE Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The CHISE Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the CHISE Library; if not, write to the Free
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
#include "chise.h"

const unsigned char chise_db_format_version[] = CHISE_DB_FORMAT_VERSION;
const unsigned char chise_db_dir[] = CHISE_DB_DIR;
const unsigned char chise_system_db_dir[] = CHISE_SI_DB_DIR;


#define xzero(lvalue) ((void) memset (&(lvalue), '\0', sizeof (lvalue)))


int
chise_value_size (const CHISE_Value* s)
{
  return s->size;
}

unsigned char*
chise_value_data (const CHISE_Value* s)
{
  return s->data;
}

unsigned char*
chise_value_to_c_string (const CHISE_Value* s)
{
  return s->data;
}


CHISE_Char_ID
chise_char_id_parse_c_string (unsigned char *str, size_t len);

int
chise_format_char_id (CHISE_Char_ID cid, unsigned char *dest, size_t len);


CHISE_DS*
CHISE_DS_open (CHISE_DS_Type type, const unsigned char* location,
	       int subtype, int modemask)
{
  CONCORD_DS ds = concord_open_ds (type, location, subtype, modemask);

  if (ds == NULL)
    return NULL;

  return concord_ds_get_genre (ds, "character");
}

int
CHISE_DS_close (CHISE_DS* ds)
{
  return concord_close_ds (concord_genre_get_data_source (ds));
}

unsigned char*
chise_ds_location (CHISE_DS* ds)
{
  return concord_ds_location (concord_genre_get_data_source (ds));
}

CHISE_Feature
chise_ds_get_feature (CHISE_DS* ds, const unsigned char* name)
{
  return concord_genre_get_feature (ds, name);
}

CHISE_CCS
chise_ds_get_ccs (CHISE_DS* ds, const unsigned char* name)
{
  return concord_genre_get_index (ds, name);
}

CHISE_Property
chise_ds_get_property (CHISE_DS* ds, const unsigned char* name)
{
  CONCORD_Genre genre
    = concord_ds_get_genre (concord_genre_get_data_source (ds),
			    "feature");

  if (genre == NULL)
    return NULL;

  return concord_genre_get_feature (genre, name);
}

int
chise_ds_foreach_char_feature_name (CHISE_DS* ds,
				    int (*func) (CHISE_DS* ds,
						 unsigned char* name))
{
  return concord_genre_foreach_feature_name (ds, func);
}

int
chise_feature_setup_db (CHISE_Feature feature, int writable)
{
  return concord_feature_setup_db (feature, writable);
}

int
chise_feature_sync (CHISE_Feature feature)
{
  return concord_feature_sync (feature);
}

int
chise_char_set_feature_value (CHISE_Char_ID cid,
			      CHISE_Feature feature,
			      unsigned char* value)
{
  unsigned char key_buf[8];

  chise_format_char_id (cid, key_buf, 8);
  return concord_obj_put_feature_value_str (key_buf, feature, value);
}

int
chise_char_load_feature_value (CHISE_Char_ID cid,
			       CHISE_Feature feature,
			       CHISE_Value* valdatum)
{
  unsigned char key_buf[8];

  chise_format_char_id (cid, key_buf, 8);
  return concord_obj_get_feature_value_string (key_buf, feature, valdatum);
}

unsigned char*
chise_char_gets_feature_value (CHISE_Char_ID cid,
			       CHISE_Feature feature,
			       unsigned char* dst, size_t size)
{
  unsigned char key_buf[8];

  chise_format_char_id (cid, key_buf, 8);
  return concord_obj_gets_feature_value (key_buf, feature, dst, size);
}

static int
(*chise_feature_for_a_char_with_value_func) (CHISE_Char_ID cid,
					     CHISE_Feature feature,
					     CHISE_Value* valdatum);

int
chise_feature_foreach_char_with_value_wrapper (CONCORD_String object_id,
					       CONCORD_Feature feature,
					       CONCORD_String value);
int
chise_feature_foreach_char_with_value_wrapper (CONCORD_String object_id,
					       CONCORD_Feature feature,
					       CONCORD_String value)
{
  unsigned char* cid_str = CONCORD_String_data (object_id);
  int cid_len = strnlen (cid_str, CONCORD_String_size (object_id));
  CHISE_Char_ID cid = chise_char_id_parse_c_string (cid_str, cid_len);

  return chise_feature_for_a_char_with_value_func (cid, feature, value);
}

int
chise_feature_foreach_char_with_value (CHISE_Feature feature,
				       int (*func) (CHISE_Char_ID cid,
						    CHISE_Feature feature,
						    CHISE_Value* valdatum))
{
  chise_feature_for_a_char_with_value_func = func;
  return
    concord_feature_foreach_obj_string
    (feature, &chise_feature_foreach_char_with_value_wrapper);
}


int
chise_ccs_setup_db (CHISE_CCS ccs, int writable)
{
  return concord_index_setup_db (ccs, writable);
}

int
chise_ccs_sync (CHISE_CCS ccs)
{
  return concord_index_sync (ccs);
}

CHISE_Char_ID
chise_ccs_decode (CHISE_CCS ccs, int code_point)
{
  char key_buf[16];
  CONCORD_String_Tank value;
  int status;

  sprintf(key_buf, "%d", code_point);
  status = concord_index_strid_get_obj_string (ccs, key_buf, &value);
  if (!status)
    {
      unsigned char *str
	= (unsigned char *)CONCORD_String_data (&value);
      int len = strnlen (str, CONCORD_String_size (&value));

      return chise_char_id_parse_c_string (str, len);
    }
  return -1;
}

int
chise_ccs_set_decoded_char (CHISE_CCS ccs,
			    int code_point, CHISE_Char_ID cid)
{
  char key_buf[16], val_buf[8];

  sprintf(key_buf, "%d", code_point);
  chise_format_char_id (cid, val_buf, 8);
  return concord_index_strid_put_obj (ccs, key_buf, val_buf);
}


int
chise_property_setup_db (CHISE_Property property, int writable)
{
  return concord_feature_setup_db (property, writable);
}

int
chise_property_sync (CHISE_Property property)
{
  return concord_feature_sync (property);
}

int
chise_feature_set_property_value (CHISE_Feature feature,
				  CHISE_Property property,
				  unsigned char* value)
{
  return
    concord_obj_put_feature_value_str
    (concord_feature_get_name (feature), property, value);
}

int
chise_feature_load_property_value (CHISE_Feature feature,
				   CHISE_Property property,
				   CHISE_Value* valdatum)
{
  return
    concord_obj_get_feature_value_string
    (concord_feature_get_name (feature), property, valdatum);
}

unsigned char*
chise_feature_gets_property_value (CHISE_Feature feature,
				   CHISE_Property property,
				   unsigned char* buf, size_t size)
{
  return
    concord_obj_gets_feature_value (concord_feature_get_name (feature),
				    property, buf, size);
}


CHISE_Char_ID
chise_char_id_parse_c_string (unsigned char *str, size_t len)
{
  int i = 0;

  if ( (len >= 2) && (str[i++] == '?') )
    {
      unsigned char c = str[i++];
      int counter;
      CHISE_Char_ID cid;

      if (c == '\\')
	{
	  if (len < 3)
	    return -1;
	  c = str[i++];
	  if (c == '^')
	    {
	      if (len < 4)
		return -1;
	      c = str[i++];
	      if (c == '?')
		return 0x7F;
	      else
		return c & (0x80 | 0x1F);
	    }
	}
      if ( c < 0xC0 )
	{
	  cid = c;
	  counter = 0;
	}
      else if ( c < 0xE0 )
	{
	  cid = c & 0x1f;
	  counter = 1;
	}
      else if ( c < 0xF0 )
	{
	  cid = c & 0x0f;
	  counter = 2;
	}
      else if ( c < 0xF8 )
	{
	  cid = c & 0x07;
	  counter = 3;
	}
      else if ( c < 0xFC )
	{
	  cid = c & 0x03;
	  counter = 4;
	}
      else
	{
	  cid = c & 0x01;
	  counter = 5;
	}

      if (counter + 2 <= len)
	{
	  int j;

	  for (j = 0; j < counter; j++)
	    cid = (cid << 6) | (str[j + i] & 0x3F);
	  return cid;
	}
    }
  return -1;
}

int
chise_format_char_id (CHISE_Char_ID cid, unsigned char *dest, size_t len)
{
  int i = 0;

  dest[i++] = '?';
  if (cid == '\t')
    {
      dest[i++] = '\\';
      dest[i++] = 't';
      dest[i] = '\0';
      return i;
    }
  else if (cid == '\n')
    {
      dest[i++] = '\\';
      dest[i++] = 'n';
      dest[i] = '\0';
      return i;
    }
  else if (cid == '\r')
    {
      dest[i++] = '\\';
      dest[i++] = 'r';
      dest[i] = '\0';
      return i;
    }
  else if (cid == 0x1C)
    {
      dest[i++] = '\\';
      dest[i++] = '^';
      dest[i++] = '\\';
      dest[i++] = '\\';
      dest[i] = '\0';
      return i;
    }
  else if (cid <= 0x1F)
    {
      dest[i++] = '\\';
      dest[i++] = '^';
      dest[i++] = '@' + cid;
      dest[i] = '\0';
      return i;
    }
  else if ( (cid == ' ') || (cid == '"') ||
	    (cid == '#') || (cid == '\'') ||
	    (cid == '(') || (cid == ')') ||
	    (cid == ',') || (cid == '.') ||
	    (cid == ';') || (cid == '?') ||
	    (cid == '[') || (cid == '\\') ||
	    (cid == ']') || (cid == '`') )
    {
      dest[i++] = '\\';
      dest[i++] = cid;
      dest[i] = '\0';
      return i;
    }
  else if (cid <= 0x7E)
    {
      dest[i++] = cid;
      dest[i] = '\0';
      return i;
    }
  else if (cid == 0x7F)
    {
      dest[i++] = '\\';
      dest[i++] = '^';
      dest[i++] = '?';
      dest[i] = '\0';
      return i;
    }
  else if (cid <= 0x9F)
    {
      dest[i++] = '\\';
      dest[i++] = '^';
      dest[i++] = ((cid + '@') >> 6) | 0xC0;
      dest[i++] = ((cid + '@') & 0x3F) | 0x80;
      dest[i] = '\0';
      return i;
    }
  else if (cid <= 0x7FF)
    {
      dest[i++] = (cid >> 6) | 0xC0;
      dest[i++] = (cid & 0x3F) | 0x80;
      dest[i] = '\0';
      return i;
    }
  else if (cid <= 0xFFFF)
    {
      dest[i++] = (cid >> 12) | 0xE0;
      dest[i++]= ((cid >>  6) & 0x3F) | 0x80;
      dest[i++]=  (cid        & 0x3F) | 0x80;
      dest[i] = '\0';
      return i;
    }
  else if (cid <= 0x1FFFFF)
    {
      dest[i++]=  (cid >> 18) | 0xF0;
      dest[i++]= ((cid >> 12) & 0x3F) | 0x80;
      dest[i++]= ((cid >>  6) & 0x3F) | 0x80;
      dest[i++]=  (cid        & 0x3F) | 0x80;
      dest[i] = '\0';
      return i;
    }
  else if (cid <= 0x3FFFFFF)
    {
      dest[i++]=  (cid >> 24) | 0xF8;
      dest[i++]= ((cid >> 18) & 0x3F) | 0x80;
      dest[i++]= ((cid >> 12) & 0x3F) | 0x80;
      dest[i++]= ((cid >>  6) & 0x3F) | 0x80;
      dest[i++]=  (cid        & 0x3F) | 0x80;
      dest[i] = '\0';
      return i;
    }
  else
    {
      dest[i++]=  (cid >> 30) | 0xFC;
      dest[i++]= ((cid >> 24) & 0x3F) | 0x80;
      dest[i++]= ((cid >> 18) & 0x3F) | 0x80;
      dest[i++]= ((cid >> 12) & 0x3F) | 0x80;
      dest[i++]= ((cid >>  6) & 0x3F) | 0x80;
      dest[i++]=  (cid        & 0x3F) | 0x80;
      dest[i] = '\0';
      return i;
    }
}
