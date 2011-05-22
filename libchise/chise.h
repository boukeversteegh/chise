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

#ifndef _CHISE_H
#define _CHISE_H

#ifdef __cplusplus
extern "C" {
#endif
#if 0
}
#endif

#include <concord.h>

extern const unsigned char chise_db_format_version[];
extern const unsigned char chise_db_dir[];
extern const unsigned char chise_system_db_dir[];

typedef CONCORD_Backend_Type CHISE_DS_Type;
#define CHISE_DS_Berkeley_DB CONCORD_Backend_Berkeley_DB

typedef CONCORD_Genre_Table CHISE_DS;

CHISE_DS*
CHISE_DS_open (CHISE_DS_Type type, const unsigned char* location,
	       int subtype, int modemask);

int CHISE_DS_close (CHISE_DS* ds);

unsigned char* chise_ds_location (CHISE_DS* ds);

int
chise_ds_foreach_char_feature_name (CHISE_DS* ds,
				    int (*func) (CHISE_DS* ds,
						 unsigned char* name));


typedef int CHISE_Char_ID;


typedef CONCORD_String_Tank CHISE_Value;
int chise_value_size (const CHISE_Value* s);
unsigned char* chise_value_data (const CHISE_Value* s);
unsigned char* chise_value_to_c_string (const CHISE_Value* s);


typedef CONCORD_Feature CHISE_Feature;

CHISE_Feature
chise_ds_get_feature (CHISE_DS* ds, const unsigned char* name);

static inline int
chise_ds_load_char_feature_value (CHISE_DS* ds,
				  CHISE_Char_ID cid,
				  const unsigned char* name,
				  CHISE_Value* valdatum);

int chise_feature_setup_db (CHISE_Feature feature, int writable);

int chise_feature_sync (CHISE_Feature feature);

int chise_char_set_feature_value (CHISE_Char_ID cid,
				  CHISE_Feature feature,
				  unsigned char* value);

int chise_char_load_feature_value (CHISE_Char_ID cid,
				   CHISE_Feature feature,
				   CHISE_Value* valdatum);

static inline int
chise_ds_load_char_feature_value (CHISE_DS* ds,
				  CHISE_Char_ID cid,
				  const unsigned char* name,
				  CHISE_Value* valdatum)
{
  return
    chise_char_load_feature_value (cid, chise_ds_get_feature (ds, name),
				   valdatum);
}

unsigned char*
chise_char_gets_feature_value (CHISE_Char_ID cid,
			       CHISE_Feature feature,
			       unsigned char* dst, size_t size);

int
chise_feature_foreach_char_with_value (CHISE_Feature feature,
				       int (*func) (CHISE_Char_ID cid,
						    CHISE_Feature feature,
						    CHISE_Value* valdatum));


typedef CONCORD_INDEX CHISE_CCS;

CHISE_CCS chise_ds_get_ccs (CHISE_DS* ds, const unsigned char* name);

static inline CHISE_Char_ID
chise_ds_decode_char (CHISE_DS* ds,
		      const unsigned char* ccs, int code_point);

int chise_ccs_setup_db (CHISE_CCS ccs, int writable);

int chise_ccs_sync (CHISE_CCS ccs);

int chise_ccs_set_decoded_char (CHISE_CCS ccs,
				int code_point, CHISE_Char_ID cid);

CHISE_Char_ID chise_ccs_decode (CHISE_CCS ccs, int code_point);

static inline CHISE_Char_ID
chise_ds_decode_char (CHISE_DS* ds,
		      const unsigned char* name, int code_point)
{
  return
    chise_ccs_decode (chise_ds_get_ccs (ds, name), code_point);
}


typedef CONCORD_Feature CHISE_Property;

CHISE_Property
chise_ds_get_property (CHISE_DS* ds, const unsigned char* name);

int chise_property_setup_db (CHISE_Property property, int writable);

int chise_property_sync (CHISE_Property property);

int chise_feature_set_property_value (CHISE_Feature feature,
				      CHISE_Property property,
				      unsigned char* value);

int chise_feature_load_property_value (CHISE_Feature feature,
				       CHISE_Property property,
				       CHISE_Value* valdatum);

unsigned char*
chise_feature_gets_property_value (CHISE_Feature feature,
				   CHISE_Property property,
				   unsigned char* buf, size_t size);

#if 0
{
#endif
#ifdef __cplusplus
}
#endif

#endif /* !_CHISE_H */
