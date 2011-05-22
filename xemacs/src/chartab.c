/* XEmacs routines to deal with char tables.
   Copyright (C) 1992, 1995 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.
   Copyright (C) 1995, 1996 Ben Wing.
   Copyright (C) 1995, 1997, 1999 Electrotechnical Laboratory, JAPAN.
   Licensed to the Free Software Foundation.
   Copyright (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2008,
     2010, 2011 MORIOKA Tomohiko

This file is part of XEmacs.

XEmacs is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by the
Free Software Foundation; either version 2, or (at your option) any
later version.

XEmacs is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with XEmacs; see the file COPYING.  If not, write to
the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
Boston, MA 02111-1307, USA.  */

/* Synched up with: Mule 2.3.  Not synched with FSF.

   This file was written independently of the FSF implementation,
   and is not compatible. */

/* Authorship:

   Ben Wing: wrote, for 19.13 (Mule).  Some category table stuff
             loosely based on the original Mule.
   Jareth Hein: fixed a couple of bugs in the implementation, and
   	     added regex support for categories with check_category_at
   MORIOKA Tomohiko: Rewritten for XEmacs CHISE
 */

#include <config.h>
#include "lisp.h"

#include "buffer.h"
#include "chartab.h"
#include "syntax.h"
#ifdef UTF2000
#include "elhash.h"
#endif /* UTF2000 */

Lisp_Object Qchar_tablep, Qchar_table;

Lisp_Object Vall_syntax_tables;

#ifdef MULE
Lisp_Object Qcategory_table_p;
Lisp_Object Qcategory_designator_p;
Lisp_Object Qcategory_table_value_p;

Lisp_Object Vstandard_category_table;

/* Variables to determine word boundary.  */
Lisp_Object Vword_combining_categories, Vword_separating_categories;
#endif /* MULE */


#ifdef HAVE_LIBCHISE
Lisp_Object Vchise_db_directory;
Lisp_Object Vchise_system_db_directory;

CHISE_DS *default_chise_data_source = NULL;
#endif

#ifdef UTF2000

EXFUN (Fchar_refs_simplify_char_specs, 1);
extern Lisp_Object Qideographic_structure;

Lisp_Object Vnext_defined_char_id;

EXFUN (Fmap_char_attribute, 3);

#ifdef HAVE_LIBCHISE
EXFUN (Fmount_char_attribute_table, 1);
#endif

#ifdef HAVE_CHISE
EXFUN (Fload_char_attribute_table, 1);

Lisp_Object Vchar_db_stingy_mode;
#endif

#define BT_UINT8_MIN		0
#define BT_UINT8_MAX		(UCHAR_MAX - 4)
#define BT_UINT8_t		(UCHAR_MAX - 3)
#define BT_UINT8_nil		(UCHAR_MAX - 2)
#define BT_UINT8_unbound	(UCHAR_MAX - 1)
#define BT_UINT8_unloaded	UCHAR_MAX

INLINE_HEADER int INT_UINT8_P (Lisp_Object obj);
INLINE_HEADER int UINT8_VALUE_P (Lisp_Object obj);
INLINE_HEADER unsigned char UINT8_ENCODE (Lisp_Object obj);
INLINE_HEADER Lisp_Object UINT8_DECODE (unsigned char n);
INLINE_HEADER unsigned short UINT8_TO_UINT16 (unsigned char n);

INLINE_HEADER int
INT_UINT8_P (Lisp_Object obj)
{
  if (INTP (obj))
    {
      int num = XINT (obj);

      return (BT_UINT8_MIN <= num) && (num <= BT_UINT8_MAX);
    }
  else
    return 0;
}

INLINE_HEADER int
UINT8_VALUE_P (Lisp_Object obj)
{
  return EQ (obj, Qunloaded) || EQ (obj, Qunbound)
    || EQ (obj, Qnil) || EQ (obj, Qt) || INT_UINT8_P (obj);
}

INLINE_HEADER unsigned char
UINT8_ENCODE (Lisp_Object obj)
{
  if (EQ (obj, Qunloaded))
    return BT_UINT8_unloaded;
  else if (EQ (obj, Qunbound))
    return BT_UINT8_unbound;
  else if (EQ (obj, Qnil))
    return BT_UINT8_nil;
  else if (EQ (obj, Qt))
    return BT_UINT8_t;
  else
    return XINT (obj);
}

INLINE_HEADER Lisp_Object
UINT8_DECODE (unsigned char n)
{
  if (n == BT_UINT8_unloaded)
    return Qunloaded;
  else if (n == BT_UINT8_unbound)
    return Qunbound;
  else if (n == BT_UINT8_nil)
    return Qnil;
  else if (n == BT_UINT8_t)
    return Qt;
  else
    return make_int (n);
}

static Lisp_Object
mark_uint8_byte_table (Lisp_Object obj)
{
  return Qnil;
}

static void
print_uint8_byte_table (Lisp_Object obj,
			Lisp_Object printcharfun, int escapeflag)
{
  Lisp_Uint8_Byte_Table *bte = XUINT8_BYTE_TABLE (obj);
  int i;
  struct gcpro gcpro1, gcpro2;
  GCPRO2 (obj, printcharfun);

  write_c_string ("\n#<uint8-byte-table", printcharfun);
  for (i = 0; i < 256; i++)
    {
      unsigned char n = bte->property[i];
      if ( (i & 15) == 0 )
	write_c_string ("\n  ", printcharfun);
      write_c_string (" ", printcharfun);
      if (n == BT_UINT8_unbound)
	write_c_string ("void", printcharfun);
      else if (n == BT_UINT8_nil)
	write_c_string ("nil", printcharfun);
      else if (n == BT_UINT8_t)
	write_c_string ("t", printcharfun);
      else
	{
	  char buf[4];

	  sprintf (buf, "%hd", n);
	  write_c_string (buf, printcharfun);
	}
    }
  UNGCPRO;
  write_c_string (">", printcharfun);
}

static int
uint8_byte_table_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  Lisp_Uint8_Byte_Table *te1 = XUINT8_BYTE_TABLE (obj1);
  Lisp_Uint8_Byte_Table *te2 = XUINT8_BYTE_TABLE (obj2);
  int i;

  for (i = 0; i < 256; i++)
    if (te1->property[i] != te2->property[i])
      return 0;
  return 1;
}

static unsigned long
uint8_byte_table_hash (Lisp_Object obj, int depth)
{
  Lisp_Uint8_Byte_Table *te = XUINT8_BYTE_TABLE (obj);
  int i;
  hashcode_t hash = 0;

  for (i = 0; i < 256; i++)
    hash = HASH2 (hash, te->property[i]);
  return hash;
}

static const struct lrecord_description uint8_byte_table_description[] = {
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("uint8-byte-table", uint8_byte_table,
                               mark_uint8_byte_table,
			       print_uint8_byte_table,
			       0, uint8_byte_table_equal,
			       uint8_byte_table_hash,
			       uint8_byte_table_description,
			       Lisp_Uint8_Byte_Table);

static Lisp_Object
make_uint8_byte_table (unsigned char initval)
{
  Lisp_Object obj;
  int i;
  Lisp_Uint8_Byte_Table *cte;

  cte = alloc_lcrecord_type (Lisp_Uint8_Byte_Table,
			     &lrecord_uint8_byte_table);

  for (i = 0; i < 256; i++)
    cte->property[i] = initval;

  XSETUINT8_BYTE_TABLE (obj, cte);
  return obj;
}

static Lisp_Object
copy_uint8_byte_table (Lisp_Object entry)
{
  Lisp_Uint8_Byte_Table *cte = XUINT8_BYTE_TABLE (entry);
  Lisp_Object obj;
  int i;
  Lisp_Uint8_Byte_Table *ctenew
    = alloc_lcrecord_type (Lisp_Uint8_Byte_Table,
			   &lrecord_uint8_byte_table);

  for (i = 0; i < 256; i++)
    {
      ctenew->property[i] = cte->property[i];
    }

  XSETUINT8_BYTE_TABLE (obj, ctenew);
  return obj;
}

static int
uint8_byte_table_same_value_p (Lisp_Object obj)
{
  Lisp_Uint8_Byte_Table *bte = XUINT8_BYTE_TABLE (obj);
  unsigned char v0 = bte->property[0];
  int i;

  for (i = 1; i < 256; i++)
    {
      if (bte->property[i] != v0)
	return 0;
    }
  return -1;
}

static int
map_over_uint8_byte_table (Lisp_Uint8_Byte_Table *ct, Lisp_Char_Table* root,
			   Emchar ofs, int place,
			   int (*fn) (struct chartab_range *range,
				      Lisp_Object val, void *arg),
			   void *arg)
{
  struct chartab_range rainj;
  int i, retval;
  int unit = 1 << (8 * place);
  Emchar c = ofs;
  Emchar c1;

  rainj.type = CHARTAB_RANGE_CHAR;

  for (i = 0, retval = 0; i < 256 && retval == 0; i++)
    {
      if (ct->property[i] == BT_UINT8_unloaded)
	{
#if 0
	  c1 = c + unit;
	  for (; c < c1 && retval == 0; c++)
	    {
	      Lisp_Object ret = get_char_id_table (root, c);

	      if (!UNBOUNDP (ret))
		{
		  rainj.ch = c;
		  retval = (fn) (&rainj, ret, arg);
		}
	    }
#else
	  ct->property[i] = BT_UINT8_unbound;
	  c += unit;
#endif
	}
      else if (ct->property[i] != BT_UINT8_unbound)
	{
	  c1 = c + unit;
	  for (; c < c1 && retval == 0; c++)
	    {
	      rainj.ch = c;
	      retval = (fn) (&rainj, UINT8_DECODE (ct->property[i]), arg);
	    }
	}
      else
	c += unit;
    }
  return retval;
}

#ifdef HAVE_CHISE
static void
save_uint8_byte_table (Lisp_Uint8_Byte_Table *ct, Lisp_Char_Table* root,
#ifdef HAVE_LIBCHISE
		       CHISE_Feature feature,
#else
		       Lisp_Object db,
#endif
		       Emchar ofs, int place,
		       Lisp_Object (*filter)(Lisp_Object value))
{
  struct chartab_range rainj;
  int i, retval;
  int unit = 1 << (8 * place);
  Emchar c = ofs;
  Emchar c1;

  rainj.type = CHARTAB_RANGE_CHAR;

  for (i = 0, retval = 0; i < 256 && retval == 0; i++)
    {
      if (ct->property[i] == BT_UINT8_unloaded)
	{
	  c += unit;
	}
      else if (ct->property[i] != BT_UINT8_unbound)
	{
	  c1 = c + unit;
	  for (; c < c1 && retval == 0; c++)
	    {
#ifdef HAVE_LIBCHISE
	      chise_char_set_feature_value
		(c, feature,
		 XSTRING_DATA
		 (Fprin1_to_string (UINT8_DECODE (ct->property[i]),
				    Qnil)));
#else
	      Fput_database (Fprin1_to_string (make_char (c), Qnil),
			     Fprin1_to_string (UINT8_DECODE (ct->property[i]),
					       Qnil),
			     db, Qt);
#endif
	    }
	}
      else
	c += unit;
    }
}
#endif

#define BT_UINT16_MIN		0
#define BT_UINT16_MAX	 	(USHRT_MAX - 4)
#define BT_UINT16_t	 	(USHRT_MAX - 3)
#define BT_UINT16_nil		(USHRT_MAX - 2)
#define BT_UINT16_unbound	(USHRT_MAX - 1)
#define BT_UINT16_unloaded	USHRT_MAX

INLINE_HEADER int INT_UINT16_P (Lisp_Object obj);
INLINE_HEADER int UINT16_VALUE_P (Lisp_Object obj);
INLINE_HEADER unsigned short UINT16_ENCODE (Lisp_Object obj);
INLINE_HEADER Lisp_Object UINT16_DECODE (unsigned short us);

INLINE_HEADER int
INT_UINT16_P (Lisp_Object obj)
{
  if (INTP (obj))
    {
      int num = XINT (obj);

      return (BT_UINT16_MIN <= num) && (num <= BT_UINT16_MAX);
    }
  else
    return 0;
}

INLINE_HEADER int
UINT16_VALUE_P (Lisp_Object obj)
{
  return EQ (obj, Qunloaded) || EQ (obj, Qunbound)
    || EQ (obj, Qnil) || EQ (obj, Qt) || INT_UINT16_P (obj);
}

INLINE_HEADER unsigned short
UINT16_ENCODE (Lisp_Object obj)
{
  if (EQ (obj, Qunloaded))
    return BT_UINT16_unloaded;
  else if (EQ (obj, Qunbound))
    return BT_UINT16_unbound;
  else if (EQ (obj, Qnil))
    return BT_UINT16_nil;
  else if (EQ (obj, Qt))
    return BT_UINT16_t;
  else
    return XINT (obj);
}

INLINE_HEADER Lisp_Object
UINT16_DECODE (unsigned short n)
{
  if (n == BT_UINT16_unloaded)
    return Qunloaded;
  else if (n == BT_UINT16_unbound)
    return Qunbound;
  else if (n == BT_UINT16_nil)
    return Qnil;
  else if (n == BT_UINT16_t)
    return Qt;
  else
    return make_int (n);
}

INLINE_HEADER unsigned short
UINT8_TO_UINT16 (unsigned char n)
{
  if (n == BT_UINT8_unloaded)
    return BT_UINT16_unloaded;
  else if (n == BT_UINT8_unbound)
    return BT_UINT16_unbound;
  else if (n == BT_UINT8_nil)
    return BT_UINT16_nil;
  else if (n == BT_UINT8_t)
    return BT_UINT16_t;
  else
    return n;
}

static Lisp_Object
mark_uint16_byte_table (Lisp_Object obj)
{
  return Qnil;
}

static void
print_uint16_byte_table (Lisp_Object obj,
			 Lisp_Object printcharfun, int escapeflag)
{
  Lisp_Uint16_Byte_Table *bte = XUINT16_BYTE_TABLE (obj);
  int i;
  struct gcpro gcpro1, gcpro2;
  GCPRO2 (obj, printcharfun);

  write_c_string ("\n#<uint16-byte-table", printcharfun);
  for (i = 0; i < 256; i++)
    {
      unsigned short n = bte->property[i];
      if ( (i & 15) == 0 )
	write_c_string ("\n  ", printcharfun);
      write_c_string (" ", printcharfun);
      if (n == BT_UINT16_unbound)
	write_c_string ("void", printcharfun);
      else if (n == BT_UINT16_nil)
	write_c_string ("nil", printcharfun);
      else if (n == BT_UINT16_t)
	write_c_string ("t", printcharfun);
      else
	{
	  char buf[7];

	  sprintf (buf, "%hd", n);
	  write_c_string (buf, printcharfun);
	}
    }
  UNGCPRO;
  write_c_string (">", printcharfun);
}

static int
uint16_byte_table_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  Lisp_Uint16_Byte_Table *te1 = XUINT16_BYTE_TABLE (obj1);
  Lisp_Uint16_Byte_Table *te2 = XUINT16_BYTE_TABLE (obj2);
  int i;

  for (i = 0; i < 256; i++)
    if (te1->property[i] != te2->property[i])
      return 0;
  return 1;
}

static unsigned long
uint16_byte_table_hash (Lisp_Object obj, int depth)
{
  Lisp_Uint16_Byte_Table *te = XUINT16_BYTE_TABLE (obj);
  int i;
  hashcode_t hash = 0;

  for (i = 0; i < 256; i++)
    hash = HASH2 (hash, te->property[i]);
  return hash;
}

static const struct lrecord_description uint16_byte_table_description[] = {
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("uint16-byte-table", uint16_byte_table,
                               mark_uint16_byte_table,
			       print_uint16_byte_table,
			       0, uint16_byte_table_equal,
			       uint16_byte_table_hash,
			       uint16_byte_table_description,
			       Lisp_Uint16_Byte_Table);

static Lisp_Object
make_uint16_byte_table (unsigned short initval)
{
  Lisp_Object obj;
  int i;
  Lisp_Uint16_Byte_Table *cte;

  cte = alloc_lcrecord_type (Lisp_Uint16_Byte_Table,
			     &lrecord_uint16_byte_table);

  for (i = 0; i < 256; i++)
    cte->property[i] = initval;

  XSETUINT16_BYTE_TABLE (obj, cte);
  return obj;
}

static Lisp_Object
copy_uint16_byte_table (Lisp_Object entry)
{
  Lisp_Uint16_Byte_Table *cte = XUINT16_BYTE_TABLE (entry);
  Lisp_Object obj;
  int i;
  Lisp_Uint16_Byte_Table *ctenew
    = alloc_lcrecord_type (Lisp_Uint16_Byte_Table,
			   &lrecord_uint16_byte_table);

  for (i = 0; i < 256; i++)
    {
      ctenew->property[i] = cte->property[i];
    }

  XSETUINT16_BYTE_TABLE (obj, ctenew);
  return obj;
}

static Lisp_Object
expand_uint8_byte_table_to_uint16 (Lisp_Object table)
{
  Lisp_Object obj;
  int i;
  Lisp_Uint8_Byte_Table* bte = XUINT8_BYTE_TABLE(table);
  Lisp_Uint16_Byte_Table* cte;

  cte = alloc_lcrecord_type (Lisp_Uint16_Byte_Table,
			     &lrecord_uint16_byte_table);
  for (i = 0; i < 256; i++)
    {
      cte->property[i] = UINT8_TO_UINT16 (bte->property[i]);
    }
  XSETUINT16_BYTE_TABLE (obj, cte);
  return obj;
}

static int
uint16_byte_table_same_value_p (Lisp_Object obj)
{
  Lisp_Uint16_Byte_Table *bte = XUINT16_BYTE_TABLE (obj);
  unsigned short v0 = bte->property[0];
  int i;

  for (i = 1; i < 256; i++)
    {
      if (bte->property[i] != v0)
	return 0;
    }
  return -1;
}

static int
map_over_uint16_byte_table (Lisp_Uint16_Byte_Table *ct, Lisp_Char_Table* root,
			    Emchar ofs, int place,
			    int (*fn) (struct chartab_range *range,
				       Lisp_Object val, void *arg),
			    void *arg)
{
  struct chartab_range rainj;
  int i, retval;
  int unit = 1 << (8 * place);
  Emchar c = ofs;
  Emchar c1;

  rainj.type = CHARTAB_RANGE_CHAR;

  for (i = 0, retval = 0; i < 256 && retval == 0; i++)
    {
      if (ct->property[i] == BT_UINT16_unloaded)
	{
#if 0
	  c1 = c + unit;
	  for (; c < c1 && retval == 0; c++)
	    {
	      Lisp_Object ret = get_char_id_table (root, c);

	      if (!UNBOUNDP (ret))
		{
		  rainj.ch = c;
		  retval = (fn) (&rainj, ret, arg);
		}
	    }
#else
	  ct->property[i] = BT_UINT16_unbound;
	  c += unit;
#endif
	}
      else if (ct->property[i] != BT_UINT16_unbound)
	{
	  c1 = c + unit;
	  for (; c < c1 && retval == 0; c++)
	    {
	      rainj.ch = c;
	      retval = (fn) (&rainj, UINT16_DECODE (ct->property[i]), arg);
	    }
	}
      else
	c += unit;
    }
  return retval;
}

#ifdef HAVE_CHISE
static void
save_uint16_byte_table (Lisp_Uint16_Byte_Table *ct, Lisp_Char_Table* root,
#ifdef HAVE_LIBCHISE
			CHISE_Feature feature,
#else
			Lisp_Object db,
#endif
			Emchar ofs, int place,
			Lisp_Object (*filter)(Lisp_Object value))
{
  struct chartab_range rainj;
  int i, retval;
  int unit = 1 << (8 * place);
  Emchar c = ofs;
  Emchar c1;

  rainj.type = CHARTAB_RANGE_CHAR;

  for (i = 0, retval = 0; i < 256 && retval == 0; i++)
    {
      if (ct->property[i] == BT_UINT16_unloaded)
	{
	  c += unit;
	}
      else if (ct->property[i] != BT_UINT16_unbound)
	{
	  c1 = c + unit;
	  for (; c < c1 && retval == 0; c++)
	    {
#ifdef HAVE_LIBCHISE
	      chise_char_set_feature_value
		(c, feature,
		 XSTRING_DATA
		 (Fprin1_to_string (UINT16_DECODE (ct->property[i]),
				    Qnil)));
#else
	      Fput_database (Fprin1_to_string (make_char (c), Qnil),
			     Fprin1_to_string (UINT16_DECODE (ct->property[i]),
					       Qnil),
			     db, Qt);
#endif
	    }
	}
      else
	c += unit;
    }
}
#endif


static Lisp_Object
mark_byte_table (Lisp_Object obj)
{
  Lisp_Byte_Table *cte = XBYTE_TABLE (obj);
  int i;

  for (i = 0; i < 256; i++)
    {
      mark_object (cte->property[i]);
    }
  return Qnil;
}

static void
print_byte_table (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  Lisp_Byte_Table *bte = XBYTE_TABLE (obj);
  int i;
  struct gcpro gcpro1, gcpro2;
  GCPRO2 (obj, printcharfun);

  write_c_string ("\n#<byte-table", printcharfun);
  for (i = 0; i < 256; i++)
    {
      Lisp_Object elt = bte->property[i];
      if ( (i & 15) == 0 )
	write_c_string ("\n  ", printcharfun);
      write_c_string (" ", printcharfun);
      if (EQ (elt, Qunbound))
	write_c_string ("void", printcharfun);
      else
	print_internal (elt, printcharfun, escapeflag);
    }
  UNGCPRO;
  write_c_string (">", printcharfun);
}

static int
byte_table_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  Lisp_Byte_Table *cte1 = XBYTE_TABLE (obj1);
  Lisp_Byte_Table *cte2 = XBYTE_TABLE (obj2);
  int i;

  for (i = 0; i < 256; i++)
    if (BYTE_TABLE_P (cte1->property[i]))
      {
	if (BYTE_TABLE_P (cte2->property[i]))
	  {
	    if (!byte_table_equal (cte1->property[i],
				   cte2->property[i], depth + 1))
	      return 0;
	  }
	else
	  return 0;
      }
    else
      if (!internal_equal (cte1->property[i], cte2->property[i], depth + 1))
	return 0;
  return 1;
}

static unsigned long
byte_table_hash (Lisp_Object obj, int depth)
{
  Lisp_Byte_Table *cte = XBYTE_TABLE (obj);

  return internal_array_hash (cte->property, 256, depth);
}

static const struct lrecord_description byte_table_description[] = {
  { XD_LISP_OBJECT_ARRAY, offsetof(Lisp_Byte_Table, property), 256 },
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("byte-table", byte_table,
                               mark_byte_table,
			       print_byte_table,
			       0, byte_table_equal,
			       byte_table_hash,
			       byte_table_description,
			       Lisp_Byte_Table);

static Lisp_Object
make_byte_table (Lisp_Object initval)
{
  Lisp_Object obj;
  int i;
  Lisp_Byte_Table *cte;

  cte = alloc_lcrecord_type (Lisp_Byte_Table, &lrecord_byte_table);

  for (i = 0; i < 256; i++)
    cte->property[i] = initval;

  XSETBYTE_TABLE (obj, cte);
  return obj;
}

static Lisp_Object
copy_byte_table (Lisp_Object entry)
{
  Lisp_Byte_Table *cte = XBYTE_TABLE (entry);
  Lisp_Object obj;
  int i;
  Lisp_Byte_Table *ctnew
    = alloc_lcrecord_type (Lisp_Byte_Table, &lrecord_byte_table);

  for (i = 0; i < 256; i++)
    {
      if (UINT8_BYTE_TABLE_P (cte->property[i]))
	{
	  ctnew->property[i] = copy_uint8_byte_table (cte->property[i]);
	}
      else if (UINT16_BYTE_TABLE_P (cte->property[i]))
	{
	  ctnew->property[i] = copy_uint16_byte_table (cte->property[i]);
	}
      else if (BYTE_TABLE_P (cte->property[i]))
	{
	  ctnew->property[i] = copy_byte_table (cte->property[i]);
	}
      else
	ctnew->property[i] = cte->property[i];
    }

  XSETBYTE_TABLE (obj, ctnew);
  return obj;
}

static int
byte_table_same_value_p (Lisp_Object obj)
{
  Lisp_Byte_Table *bte = XBYTE_TABLE (obj);
  Lisp_Object v0 = bte->property[0];
  int i;

  for (i = 1; i < 256; i++)
    {
      if (!internal_equal (bte->property[i], v0, 0))
	return 0;
    }
  return -1;
}

static int
map_over_byte_table (Lisp_Byte_Table *ct, Lisp_Char_Table* root,
		     Emchar ofs, int place,
		     int (*fn) (struct chartab_range *range,
				Lisp_Object val, void *arg),
		     void *arg)
{
  int i, retval;
  Lisp_Object v;
  int unit = 1 << (8 * place);
  Emchar c = ofs;

  for (i = 0, retval = 0; i < 256 && retval == 0; i++)
    {
      v = ct->property[i];
      if (UINT8_BYTE_TABLE_P (v))
	{
	  retval
	    = map_over_uint8_byte_table (XUINT8_BYTE_TABLE(v), root,
					 c, place - 1, fn, arg);
	  c += unit;
	}
      else if (UINT16_BYTE_TABLE_P (v))
	{
	  retval
	    = map_over_uint16_byte_table (XUINT16_BYTE_TABLE(v), root,
					  c, place - 1, fn, arg);
	  c += unit;
	}
      else if (BYTE_TABLE_P (v))
	{
	  retval = map_over_byte_table (XBYTE_TABLE(v), root,
					c, place - 1, fn, arg);
	  c += unit;
	}
      else if (EQ (v, Qunloaded))
	{
#if 0
	  struct chartab_range rainj;
	  Emchar c1 = c + unit;

	  rainj.type = CHARTAB_RANGE_CHAR;

	  for (; c < c1 && retval == 0; c++)
	    {
	      Lisp_Object ret = get_char_id_table (root, c);

	      if (!UNBOUNDP (ret))
		{
		  rainj.ch = c;
		  retval = (fn) (&rainj, ret, arg);
		}
	    }
#else
	  ct->property[i] = Qunbound;
	  c += unit;
#endif
	}
      else if (!UNBOUNDP (v))
	{
	  struct chartab_range rainj;
	  Emchar c1 = c + unit;

	  rainj.type = CHARTAB_RANGE_CHAR;

	  for (; c < c1 && retval == 0; c++)
	    {
	      rainj.ch = c;
	      retval = (fn) (&rainj, v, arg);
	    }
	}
      else
	c += unit;
    }
  return retval;
}

#ifdef HAVE_CHISE
static void
save_byte_table (Lisp_Byte_Table *ct, Lisp_Char_Table* root,
#ifdef HAVE_LIBCHISE
		 CHISE_Feature feature,
#else
		 Lisp_Object db,
#endif
		 Emchar ofs, int place,
		 Lisp_Object (*filter)(Lisp_Object value))
{
  int i, retval;
  Lisp_Object v;
  int unit = 1 << (8 * place);
  Emchar c = ofs;

  for (i = 0, retval = 0; i < 256 && retval == 0; i++)
    {
      v = ct->property[i];
      if (UINT8_BYTE_TABLE_P (v))
	{
	  save_uint8_byte_table (XUINT8_BYTE_TABLE(v), root,
#ifdef HAVE_LIBCHISE
				 feature,
#else
				 db,
#endif
				 c, place - 1, filter);
	  c += unit;
	}
      else if (UINT16_BYTE_TABLE_P (v))
	{
	  save_uint16_byte_table (XUINT16_BYTE_TABLE(v), root,
#ifdef HAVE_LIBCHISE
				  feature,
#else
				  db,
#endif
				  c, place - 1, filter);
	  c += unit;
	}
      else if (BYTE_TABLE_P (v))
	{
	  save_byte_table (XBYTE_TABLE(v), root,
#ifdef HAVE_LIBCHISE
			   feature,
#else
			   db,
#endif
			   c, place - 1, filter);
	  c += unit;
	}
      else if (EQ (v, Qunloaded))
	{
	  c += unit;
	}
      else if (!UNBOUNDP (v))
	{
	  struct chartab_range rainj;
	  Emchar c1 = c + unit;

	  if (filter != NULL)
	    v = (*filter)(v);

	  rainj.type = CHARTAB_RANGE_CHAR;

	  for (; c < c1 && retval == 0; c++)
	    {
#ifdef HAVE_LIBCHISE
	      chise_char_set_feature_value
		(c, feature, XSTRING_DATA (Fprin1_to_string (v, Qnil)));
#else
	      Fput_database (Fprin1_to_string (make_char (c), Qnil),
			     Fprin1_to_string (v, Qnil),
			     db, Qt);
#endif
	    }
	}
      else
	c += unit;
    }
}
#endif

Lisp_Object
get_byte_table (Lisp_Object table, unsigned char idx)
{
  if (UINT8_BYTE_TABLE_P (table))
    return UINT8_DECODE (XUINT8_BYTE_TABLE(table)->property[idx]);
  else if (UINT16_BYTE_TABLE_P (table))
    return UINT16_DECODE (XUINT16_BYTE_TABLE(table)->property[idx]);
  else if (BYTE_TABLE_P (table))
    return XBYTE_TABLE(table)->property[idx];
  else
    return table;
}

Lisp_Object
put_byte_table (Lisp_Object table, unsigned char idx, Lisp_Object value)
{
  if (UINT8_BYTE_TABLE_P (table))
    {
      if (UINT8_VALUE_P (value))
	{
	  XUINT8_BYTE_TABLE(table)->property[idx] = UINT8_ENCODE (value);
	  if (!UINT8_BYTE_TABLE_P (value) &&
	      !UINT16_BYTE_TABLE_P (value) && !BYTE_TABLE_P (value)
	      && uint8_byte_table_same_value_p (table))
	    {
	      return value;
	    }
	}
      else if (UINT16_VALUE_P (value))
	{
	  Lisp_Object new = expand_uint8_byte_table_to_uint16 (table);

	  XUINT16_BYTE_TABLE(new)->property[idx] = UINT16_ENCODE (value);
	  return new;
	}
      else
	{
	  Lisp_Object new = make_byte_table (Qnil);
	  int i;

	  for (i = 0; i < 256; i++)
	    {
	      XBYTE_TABLE(new)->property[i]
		= UINT8_DECODE (XUINT8_BYTE_TABLE(table)->property[i]);
	    }
	  XBYTE_TABLE(new)->property[idx] = value;
	  return new;
	}
    }
  else if (UINT16_BYTE_TABLE_P (table))
    {
      if (UINT16_VALUE_P (value))
	{
	  XUINT16_BYTE_TABLE(table)->property[idx] = UINT16_ENCODE (value);
	  if (!UINT8_BYTE_TABLE_P (value) &&
	      !UINT16_BYTE_TABLE_P (value) && !BYTE_TABLE_P (value)
	      && uint16_byte_table_same_value_p (table))
	    {
	      return value;
	    }
	}
      else
	{
	  Lisp_Object new = make_byte_table (Qnil);
	  int i;

	  for (i = 0; i < 256; i++)
	    {
	      XBYTE_TABLE(new)->property[i]
		= UINT16_DECODE (XUINT16_BYTE_TABLE(table)->property[i]);
	    }
	  XBYTE_TABLE(new)->property[idx] = value;
	  return new;
	}
    }
  else if (BYTE_TABLE_P (table))
    {
      XBYTE_TABLE(table)->property[idx] = value;
      if (!UINT8_BYTE_TABLE_P (value) &&
	  !UINT16_BYTE_TABLE_P (value) && !BYTE_TABLE_P (value)
	  && byte_table_same_value_p (table))
	{
	  return value;
	}
    }
  else if (!internal_equal (table, value, 0))
    {
      if (UINT8_VALUE_P (table) && UINT8_VALUE_P (value))
	{
	  table = make_uint8_byte_table (UINT8_ENCODE (table));
	  XUINT8_BYTE_TABLE(table)->property[idx] = UINT8_ENCODE (value);
	}
      else if (UINT16_VALUE_P (table) && UINT16_VALUE_P (value))
	{
	  table = make_uint16_byte_table (UINT16_ENCODE (table));
	  XUINT16_BYTE_TABLE(table)->property[idx] = UINT16_ENCODE (value);
	}
      else
	{
	  table = make_byte_table (table);
	  XBYTE_TABLE(table)->property[idx] = value;
	}
    }
  return table;
}


Lisp_Object
make_char_id_table (Lisp_Object initval)
{
  Lisp_Object obj;
  obj = Fmake_char_table (Qgeneric);
  fill_char_table (XCHAR_TABLE (obj), initval);
  return obj;
}


Lisp_Object Qcomposition;
Lisp_Object Qrep_decomposition;
Lisp_Object Qto_decomposition_at_superscript;
Lisp_Object Qto_decomposition_at_circled;
Lisp_Object Q_canonical;
Lisp_Object Q_halfwidth_of;
Lisp_Object Q_superscript_of;
Lisp_Object Q_subscript_of;
Lisp_Object Q_circled_of;
Lisp_Object Q_decomposition;
Lisp_Object Q_identical;
Lisp_Object Q_identical_from;
Lisp_Object Q_denotational;
Lisp_Object Q_denotational_from;
Lisp_Object Q_subsumptive;
Lisp_Object Q_subsumptive_from;
Lisp_Object Q_component;
Lisp_Object Q_component_of;
Lisp_Object Qto_ucs;
Lisp_Object Q_ucs_unified;
Lisp_Object Qcompat;
Lisp_Object Qisolated;
Lisp_Object Qinitial;
Lisp_Object Qmedial;
Lisp_Object Qfinal;
Lisp_Object Qvertical;
Lisp_Object QnoBreak;
Lisp_Object Qfraction;
Lisp_Object Qsuper;
Lisp_Object Qsub;
Lisp_Object Qcircle;
Lisp_Object Qsquare;
Lisp_Object Qwide;
Lisp_Object Qnarrow;
Lisp_Object Qsmall;
Lisp_Object Qfont;

Emchar to_char_id (Lisp_Object v, char* err_msg, Lisp_Object err_arg);

Emchar
to_char_id (Lisp_Object v, char* err_msg, Lisp_Object err_arg)
{
  if (INTP (v))
    return XINT (v);
  if (CHARP (v))
    return XCHAR (v);
  else if (EQ (v, Qcompat))
    return -1;
  else if (EQ (v, Qisolated))
    return -2;
  else if (EQ (v, Qinitial))
    return -3;
  else if (EQ (v, Qmedial))
    return -4;
  else if (EQ (v, Qfinal))
    return -5;
  else if (EQ (v, Qvertical))
    return -6;
  else if (EQ (v, QnoBreak))
    return -7;
  else if (EQ (v, Qfraction))
    return -8;
  else if (EQ (v, Qsuper))
    return -9;
  else if (EQ (v, Qsub))
    return -10;
  else if (EQ (v, Qcircle))
    return -11;
  else if (EQ (v, Qsquare))
    return -12;
  else if (EQ (v, Qwide))
    return -13;
  else if (EQ (v, Qnarrow))
    return -14;
  else if (EQ (v, Qsmall))
    return -15;
  else if (EQ (v, Qfont))
    return -16;
  else 
    signal_simple_error (err_msg, err_arg);
}

DEFUN ("get-composite-char", Fget_composite_char, 1, 1, 0, /*
Return character corresponding with list.
*/
       (list))
{
  Lisp_Object base, modifier;
  Lisp_Object rest;

  if (!CONSP (list))
    signal_simple_error ("Invalid value for composition", list);
  base = Fcar (list);
  rest = Fcdr (list);
  while (!NILP (rest))
    {
      if (!CHARP (base))
	return Qnil;
      if (!CONSP (rest))
	signal_simple_error ("Invalid value for composition", list);
      modifier = Fcar (rest);
      rest = Fcdr (rest);
      base = Fcdr (Fassq (modifier,
			  Fchar_feature (base, Qcomposition, Qnil,
					 Qnil, Qnil)));
    }
  return base;
}

DEFUN ("char-variants", Fchar_variants, 1, 1, 0, /*
Return variants of CHARACTER.
*/
       (character))
{
  CHECK_CHAR (character);
  return
    nconc2
    (Fcopy_list (Fget_char_attribute (character, Q_subsumptive, Qnil)),
     (nconc2
      (Fcopy_list (Fget_char_attribute (character, Q_denotational, Qnil)),
       (nconc2
	(Fcopy_list (Fget_char_attribute (character, Q_identical, Qnil)),
	 Fcopy_list (Fchar_feature (character, Q_ucs_unified, Qnil,
				    Qnil, Qnil)))))));
}

#endif


/* A char table maps from ranges of characters to values.

   Implementing a general data structure that maps from arbitrary
   ranges of numbers to values is tricky to do efficiently.  As it
   happens, it should suffice (and is usually more convenient, anyway)
   when dealing with characters to restrict the sorts of ranges that
   can be assigned values, as follows:

   1) All characters.
   2) All characters in a charset.
   3) All characters in a particular row of a charset, where a "row"
      means all characters with the same first byte.
   4) A particular character in a charset.

   We use char tables to generalize the 256-element vectors now
   littering the Emacs code.

   Possible uses (all should be converted at some point):

   1) category tables
   2) syntax tables
   3) display tables
   4) case tables
   5) keyboard-translate-table?

   We provide an
   abstract type to generalize the Emacs vectors and Mule
   vectors-of-vectors goo.
   */

/************************************************************************/
/*                         Char Table object                            */
/************************************************************************/

#if defined(MULE)&&!defined(UTF2000)

static Lisp_Object
mark_char_table_entry (Lisp_Object obj)
{
  Lisp_Char_Table_Entry *cte = XCHAR_TABLE_ENTRY (obj);
  int i;

  for (i = 0; i < 96; i++)
    {
      mark_object (cte->level2[i]);
    }
  return Qnil;
}

static int
char_table_entry_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  Lisp_Char_Table_Entry *cte1 = XCHAR_TABLE_ENTRY (obj1);
  Lisp_Char_Table_Entry *cte2 = XCHAR_TABLE_ENTRY (obj2);
  int i;

  for (i = 0; i < 96; i++)
    if (!internal_equal (cte1->level2[i], cte2->level2[i], depth + 1))
      return 0;

  return 1;
}

static unsigned long
char_table_entry_hash (Lisp_Object obj, int depth)
{
  Lisp_Char_Table_Entry *cte = XCHAR_TABLE_ENTRY (obj);

  return internal_array_hash (cte->level2, 96, depth);
}

static const struct lrecord_description char_table_entry_description[] = {
  { XD_LISP_OBJECT_ARRAY, offsetof (Lisp_Char_Table_Entry, level2), 96 },
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("char-table-entry", char_table_entry,
                               mark_char_table_entry, internal_object_printer,
			       0, char_table_entry_equal,
			       char_table_entry_hash,
			       char_table_entry_description,
			       Lisp_Char_Table_Entry);
#endif /* MULE */

static Lisp_Object
mark_char_table (Lisp_Object obj)
{
  Lisp_Char_Table *ct = XCHAR_TABLE (obj);
#ifdef UTF2000

  mark_object (ct->table);
  mark_object (ct->name);
#ifndef HAVE_LIBCHISE
  mark_object (ct->db);
#endif
#else
  int i;

  for (i = 0; i < NUM_ASCII_CHARS; i++)
    mark_object (ct->ascii[i]);
#ifdef MULE
  for (i = 0; i < NUM_LEADING_BYTES; i++)
    mark_object (ct->level1[i]);
#endif
#endif
#ifdef UTF2000
  return ct->default_value;
#else
  return ct->mirror_table;
#endif
}

/* WARNING: All functions of this nature need to be written extremely
   carefully to avoid crashes during GC.  Cf. prune_specifiers()
   and prune_weak_hash_tables(). */

void
prune_syntax_tables (void)
{
  Lisp_Object rest, prev = Qnil;

  for (rest = Vall_syntax_tables;
       !NILP (rest);
       rest = XCHAR_TABLE (rest)->next_table)
    {
      if (! marked_p (rest))
	{
	  /* This table is garbage.  Remove it from the list. */
	  if (NILP (prev))
	    Vall_syntax_tables = XCHAR_TABLE (rest)->next_table;
	  else
	    XCHAR_TABLE (prev)->next_table =
	      XCHAR_TABLE (rest)->next_table;
	}
    }
}

static Lisp_Object
char_table_type_to_symbol (enum char_table_type type)
{
  switch (type)
  {
  default: ABORT();
  case CHAR_TABLE_TYPE_GENERIC:  return Qgeneric;
  case CHAR_TABLE_TYPE_SYNTAX:   return Qsyntax;
  case CHAR_TABLE_TYPE_DISPLAY:  return Qdisplay;
  case CHAR_TABLE_TYPE_CHAR:     return Qchar;
#ifdef MULE
  case CHAR_TABLE_TYPE_CATEGORY: return Qcategory;
#endif
  }
}

static enum char_table_type
symbol_to_char_table_type (Lisp_Object symbol)
{
  CHECK_SYMBOL (symbol);

  if (EQ (symbol, Qgeneric))  return CHAR_TABLE_TYPE_GENERIC;
  if (EQ (symbol, Qsyntax))   return CHAR_TABLE_TYPE_SYNTAX;
  if (EQ (symbol, Qdisplay))  return CHAR_TABLE_TYPE_DISPLAY;
  if (EQ (symbol, Qchar))     return CHAR_TABLE_TYPE_CHAR;
#ifdef MULE
  if (EQ (symbol, Qcategory)) return CHAR_TABLE_TYPE_CATEGORY;
#endif

  signal_simple_error ("Unrecognized char table type", symbol);
  return CHAR_TABLE_TYPE_GENERIC; /* not reached */
}

#ifndef UTF2000
static void
print_chartab_range (Emchar first, Emchar last, Lisp_Object val,
		     Lisp_Object printcharfun)
{
  if (first != last)
    {
      write_c_string (" (", printcharfun);
      print_internal (make_char (first), printcharfun, 0);
      write_c_string (" ", printcharfun);
      print_internal (make_char (last), printcharfun, 0);
      write_c_string (") ", printcharfun);
    }
  else
    {
      write_c_string (" ", printcharfun);
      print_internal (make_char (first), printcharfun, 0);
      write_c_string (" ", printcharfun);
    }
  print_internal (val, printcharfun, 1);
}
#endif

#if defined(MULE)&&!defined(UTF2000)

static void
print_chartab_charset_row (Lisp_Object charset,
			   int row,
			   Lisp_Char_Table_Entry *cte,
			   Lisp_Object printcharfun)
{
  int i;
  Lisp_Object cat = Qunbound;
  int first = -1;

  for (i = 32; i < 128; i++)
    {
      Lisp_Object pam = cte->level2[i - 32];

      if (first == -1)
	{
	  first = i;
	  cat = pam;
	  continue;
	}

      if (!EQ (cat, pam))
	{
	  if (row == -1)
	    print_chartab_range (MAKE_CHAR (charset, first, 0),
				 MAKE_CHAR (charset, i - 1, 0),
				 cat, printcharfun);
	  else
	    print_chartab_range (MAKE_CHAR (charset, row, first),
				 MAKE_CHAR (charset, row, i - 1),
				 cat, printcharfun);
	  first = -1;
	  i--;
	}
    }

  if (first != -1)
    {
      if (row == -1)
	print_chartab_range (MAKE_CHAR (charset, first, 0),
			     MAKE_CHAR (charset, i - 1, 0),
			     cat, printcharfun);
      else
	print_chartab_range (MAKE_CHAR (charset, row, first),
			     MAKE_CHAR (charset, row, i - 1),
			     cat, printcharfun);
    }
}

static void
print_chartab_two_byte_charset (Lisp_Object charset,
				Lisp_Char_Table_Entry *cte,
				Lisp_Object printcharfun)
{
  int i;

  for (i = 32; i < 128; i++)
    {
      Lisp_Object jen = cte->level2[i - 32];

      if (!CHAR_TABLE_ENTRYP (jen))
	{
	  char buf[100];

	  write_c_string (" [", printcharfun);
	  print_internal (XCHARSET_NAME (charset), printcharfun, 0);
	  sprintf (buf, " %d] ", i);
	  write_c_string (buf, printcharfun);
	  print_internal (jen, printcharfun, 0);
	}
      else
	print_chartab_charset_row (charset, i, XCHAR_TABLE_ENTRY (jen),
				   printcharfun);
    }
}

#endif /* MULE */

static void
print_char_table (Lisp_Object obj, Lisp_Object printcharfun, int escapeflag)
{
  Lisp_Char_Table *ct = XCHAR_TABLE (obj);
#ifdef UTF2000
  int i;
  struct gcpro gcpro1, gcpro2;
  GCPRO2 (obj, printcharfun);

  write_c_string ("#s(char-table ", printcharfun);
  write_c_string (" ", printcharfun);
  write_c_string (string_data
		  (symbol_name
		   (XSYMBOL (char_table_type_to_symbol (ct->type)))),
		  printcharfun);
  write_c_string ("\n ", printcharfun);
  print_internal (ct->default_value, printcharfun, escapeflag);
  for (i = 0; i < 256; i++)
    {
      Lisp_Object elt = get_byte_table (ct->table, i);
      if (i != 0) write_c_string ("\n  ", printcharfun);
      if (EQ (elt, Qunbound))
	write_c_string ("void", printcharfun);
      else
	print_internal (elt, printcharfun, escapeflag);
    }
  UNGCPRO;
#else /* non UTF2000 */
  char buf[200];

  sprintf (buf, "#s(char-table type %s data (",
	   string_data (symbol_name (XSYMBOL
				     (char_table_type_to_symbol (ct->type)))));
  write_c_string (buf, printcharfun);

  /* Now write out the ASCII/Control-1 stuff. */
  {
    int i;
    int first = -1;
    Lisp_Object val = Qunbound;

    for (i = 0; i < NUM_ASCII_CHARS; i++)
      {
	if (first == -1)
	  {
	    first = i;
	    val = ct->ascii[i];
	    continue;
	  }

	if (!EQ (ct->ascii[i], val))
	  {
	    print_chartab_range (first, i - 1, val, printcharfun);
	    first = -1;
	    i--;
	  }
      }

    if (first != -1)
      print_chartab_range (first, i - 1, val, printcharfun);
  }

#ifdef MULE
  {
    Charset_ID i;

    for (i = MIN_LEADING_BYTE; i < MIN_LEADING_BYTE + NUM_LEADING_BYTES;
	 i++)
      {
	Lisp_Object ann = ct->level1[i - MIN_LEADING_BYTE];
	Lisp_Object charset = CHARSET_BY_LEADING_BYTE (i);

	if (!CHARSETP (charset) || i == LEADING_BYTE_ASCII
            || i == LEADING_BYTE_CONTROL_1)
	  continue;
	if (!CHAR_TABLE_ENTRYP (ann))
	  {
	    write_c_string (" ", printcharfun);
	    print_internal (XCHARSET_NAME (charset),
			    printcharfun, 0);
	    write_c_string (" ", printcharfun);
	    print_internal (ann, printcharfun, 0);
	  }
	else
	  {
	    Lisp_Char_Table_Entry *cte = XCHAR_TABLE_ENTRY (ann);
	    if (XCHARSET_DIMENSION (charset) == 1)
	      print_chartab_charset_row (charset, -1, cte, printcharfun);
	    else
	      print_chartab_two_byte_charset (charset, cte, printcharfun);
	  }
      }
  }
#endif /* MULE */
#endif /* non UTF2000 */

  write_c_string ("))", printcharfun);
}

static int
char_table_equal (Lisp_Object obj1, Lisp_Object obj2, int depth)
{
  Lisp_Char_Table *ct1 = XCHAR_TABLE (obj1);
  Lisp_Char_Table *ct2 = XCHAR_TABLE (obj2);
  int i;

  if (CHAR_TABLE_TYPE (ct1) != CHAR_TABLE_TYPE (ct2))
    return 0;

#ifdef UTF2000
  for (i = 0; i < 256; i++)
    {
      if (!internal_equal (get_byte_table (ct1->table, i),
			   get_byte_table (ct2->table, i), 0))
	return 0;
    }
#else
  for (i = 0; i < NUM_ASCII_CHARS; i++)
    if (!internal_equal (ct1->ascii[i], ct2->ascii[i], depth + 1))
      return 0;

#ifdef MULE
  for (i = 0; i < NUM_LEADING_BYTES; i++)
    if (!internal_equal (ct1->level1[i], ct2->level1[i], depth + 1))
      return 0;
#endif /* MULE */
#endif /* non UTF2000 */

  return 1;
}

static unsigned long
char_table_hash (Lisp_Object obj, int depth)
{
  Lisp_Char_Table *ct = XCHAR_TABLE (obj);
#ifdef UTF2000
    return byte_table_hash (ct->table, depth + 1);
#else
  unsigned long hashval = internal_array_hash (ct->ascii, NUM_ASCII_CHARS,
					       depth);
#ifdef MULE
  hashval = HASH2 (hashval,
		   internal_array_hash (ct->level1, NUM_LEADING_BYTES, depth));
#endif /* MULE */
  return hashval;
#endif
}

static const struct lrecord_description char_table_description[] = {
#ifdef UTF2000
  { XD_LISP_OBJECT, offsetof(Lisp_Char_Table, table) },
  { XD_LISP_OBJECT, offsetof(Lisp_Char_Table, default_value) },
  { XD_LISP_OBJECT, offsetof(Lisp_Char_Table, name) },
#ifndef HAVE_LIBCHISE
  { XD_LISP_OBJECT, offsetof(Lisp_Char_Table, db) },
#endif
#else
  { XD_LISP_OBJECT_ARRAY, offsetof (Lisp_Char_Table, ascii), NUM_ASCII_CHARS },
#ifdef MULE
  { XD_LISP_OBJECT_ARRAY, offsetof (Lisp_Char_Table, level1), NUM_LEADING_BYTES },
#endif
#endif
#ifndef UTF2000
  { XD_LISP_OBJECT, offsetof (Lisp_Char_Table, mirror_table) },
#endif
  { XD_LO_LINK,     offsetof (Lisp_Char_Table, next_table) },
  { XD_END }
};

DEFINE_LRECORD_IMPLEMENTATION ("char-table", char_table,
                               mark_char_table, print_char_table, 0,
			       char_table_equal, char_table_hash,
			       char_table_description,
			       Lisp_Char_Table);

DEFUN ("char-table-p", Fchar_table_p, 1, 1, 0, /*
Return non-nil if OBJECT is a char table.

A char table is a table that maps characters (or ranges of characters)
to values.  Char tables are specialized for characters, only allowing
particular sorts of ranges to be assigned values.  Although this
loses in generality, it makes for extremely fast (constant-time)
lookups, and thus is feasible for applications that do an extremely
large number of lookups (e.g. scanning a buffer for a character in
a particular syntax, where a lookup in the syntax table must occur
once per character).

When Mule support exists, the types of ranges that can be assigned
values are

-- all characters (represented by t)
-- an entire charset
-- a single row in a two-octet charset (represented by a vector of two
   elements: a two-octet charset and a row number; the row must be an
   integer, not a character)
-- a single character

When Mule support is not present, the types of ranges that can be
assigned values are

-- all characters (represented by t)
-- a single character

To create a char table, use `make-char-table'.
To modify a char table, use `put-char-table' or `remove-char-table'.
To retrieve the value for a particular character, use `get-char-table'.
See also `map-char-table', `clear-char-table', `copy-char-table',
`valid-char-table-type-p', `char-table-type-list',
`valid-char-table-value-p', and `check-char-table-value'.
*/
       (object))
{
  return CHAR_TABLEP (object) ? Qt : Qnil;
}

DEFUN ("char-table-type-list", Fchar_table_type_list, 0, 0, 0, /*
Return a list of the recognized char table types.
See `valid-char-table-type-p'.
*/
       ())
{
#ifdef MULE
  return list5 (Qchar, Qcategory, Qdisplay, Qgeneric, Qsyntax);
#else
  return list4 (Qchar, Qdisplay, Qgeneric, Qsyntax);
#endif
}

DEFUN ("valid-char-table-type-p", Fvalid_char_table_type_p, 1, 1, 0, /*
Return t if TYPE if a recognized char table type.

Each char table type is used for a different purpose and allows different
sorts of values.  The different char table types are

`category'
	Used for category tables, which specify the regexp categories
	that a character is in.  The valid values are nil or a
	bit vector of 95 elements.  Higher-level Lisp functions are
	provided for working with category tables.  Currently categories
	and category tables only exist when Mule support is present.
`char'
	A generalized char table, for mapping from one character to
	another.  Used for case tables, syntax matching tables,
	`keyboard-translate-table', etc.  The valid values are characters.
`generic'
        An even more generalized char table, for mapping from a
	character to anything.
`display'
	Used for display tables, which specify how a particular character
	is to appear when displayed.  #### Not yet implemented.
`syntax'
	Used for syntax tables, which specify the syntax of a particular
	character.  Higher-level Lisp functions are provided for
	working with syntax tables.  The valid values are integers.

*/
       (type))
{
  return (EQ (type, Qchar)     ||
#ifdef MULE
	  EQ (type, Qcategory) ||
#endif
	  EQ (type, Qdisplay)  ||
	  EQ (type, Qgeneric)  ||
	  EQ (type, Qsyntax)) ? Qt : Qnil;
}

DEFUN ("char-table-type", Fchar_table_type, 1, 1, 0, /*
Return the type of CHAR-TABLE.
See `valid-char-table-type-p'.
*/
       (char_table))
{
  CHECK_CHAR_TABLE (char_table);
  return char_table_type_to_symbol (XCHAR_TABLE (char_table)->type);
}

void
fill_char_table (Lisp_Char_Table *ct, Lisp_Object value)
{
#ifdef UTF2000
  ct->table = Qunbound;
  ct->default_value = value;
  ct->unloaded = 0;
#else
  int i;

  for (i = 0; i < NUM_ASCII_CHARS; i++)
    ct->ascii[i] = value;
#ifdef MULE
  for (i = 0; i < NUM_LEADING_BYTES; i++)
    ct->level1[i] = value;
#endif /* MULE */
#endif

#ifndef UTF2000
  if (ct->type == CHAR_TABLE_TYPE_SYNTAX)
    update_syntax_table (ct);
#endif
}

DEFUN ("reset-char-table", Freset_char_table, 1, 1, 0, /*
Reset CHAR-TABLE to its default state.
*/
       (char_table))
{
  Lisp_Char_Table *ct;

  CHECK_CHAR_TABLE (char_table);
  ct = XCHAR_TABLE (char_table);

  switch (ct->type)
    {
    case CHAR_TABLE_TYPE_CHAR:
      fill_char_table (ct, make_char (0));
      break;
    case CHAR_TABLE_TYPE_DISPLAY:
    case CHAR_TABLE_TYPE_GENERIC:
#ifdef MULE
    case CHAR_TABLE_TYPE_CATEGORY:
#endif /* MULE */
      fill_char_table (ct, Qnil);
      break;

    case CHAR_TABLE_TYPE_SYNTAX:
      fill_char_table (ct, make_int (Sinherit));
      break;

    default:
      ABORT ();
    }

  return Qnil;
}

DEFUN ("make-char-table", Fmake_char_table, 1, 1, 0, /*
Return a new, empty char table of type TYPE.
Currently recognized types are 'char, 'category, 'display, 'generic,
and 'syntax.  See `valid-char-table-type-p'.
*/
       (type))
{
  Lisp_Char_Table *ct;
  Lisp_Object obj;
  enum char_table_type ty = symbol_to_char_table_type (type);

  ct = alloc_lcrecord_type (Lisp_Char_Table, &lrecord_char_table);
  ct->type = ty;
#ifndef UTF2000
  if (ty == CHAR_TABLE_TYPE_SYNTAX)
    {
      ct->mirror_table = Fmake_char_table (Qgeneric);
      fill_char_table (XCHAR_TABLE (ct->mirror_table),
                       make_int (Spunct));
    }
  else
    ct->mirror_table = Qnil;
#else
  ct->name = Qnil;
#ifndef HAVE_LIBCHISE
  ct->db = Qnil;
#endif
#endif
  ct->next_table = Qnil;
  XSETCHAR_TABLE (obj, ct);
  if (ty == CHAR_TABLE_TYPE_SYNTAX)
    {
      ct->next_table = Vall_syntax_tables;
      Vall_syntax_tables = obj;
    }
  Freset_char_table (obj);
  return obj;
}

#if defined(MULE)&&!defined(UTF2000)

static Lisp_Object
make_char_table_entry (Lisp_Object initval)
{
  Lisp_Object obj;
  int i;
  Lisp_Char_Table_Entry *cte =
    alloc_lcrecord_type (Lisp_Char_Table_Entry, &lrecord_char_table_entry);

  for (i = 0; i < 96; i++)
    cte->level2[i] = initval;

  XSETCHAR_TABLE_ENTRY (obj, cte);
  return obj;
}

static Lisp_Object
copy_char_table_entry (Lisp_Object entry)
{
  Lisp_Char_Table_Entry *cte = XCHAR_TABLE_ENTRY (entry);
  Lisp_Object obj;
  int i;
  Lisp_Char_Table_Entry *ctenew =
    alloc_lcrecord_type (Lisp_Char_Table_Entry, &lrecord_char_table_entry);

  for (i = 0; i < 96; i++)
    {
      Lisp_Object new = cte->level2[i];
      if (CHAR_TABLE_ENTRYP (new))
	ctenew->level2[i] = copy_char_table_entry (new);
      else
	ctenew->level2[i] = new;
    }

  XSETCHAR_TABLE_ENTRY (obj, ctenew);
  return obj;
}

#endif /* MULE */

DEFUN ("copy-char-table", Fcopy_char_table, 1, 1, 0, /*
Return a new char table which is a copy of CHAR-TABLE.
It will contain the same values for the same characters and ranges
as CHAR-TABLE.  The values will not themselves be copied.
*/
       (char_table))
{
  Lisp_Char_Table *ct, *ctnew;
  Lisp_Object obj;
#ifndef UTF2000
  int i;
#endif

  CHECK_CHAR_TABLE (char_table);
  ct = XCHAR_TABLE (char_table);
  ctnew = alloc_lcrecord_type (Lisp_Char_Table, &lrecord_char_table);
  ctnew->type = ct->type;
#ifdef UTF2000
  ctnew->default_value = ct->default_value;
  /* [tomo:2002-01-21] Perhaps this code seems wrong */
  ctnew->name = ct->name;
#ifndef HAVE_LIBCHISE
  ctnew->db = ct->db;
#endif

  if (UINT8_BYTE_TABLE_P (ct->table))
    {
      ctnew->table = copy_uint8_byte_table (ct->table);
    }
  else if (UINT16_BYTE_TABLE_P (ct->table))
    {
      ctnew->table = copy_uint16_byte_table (ct->table);
    }
  else if (BYTE_TABLE_P (ct->table))
    {
      ctnew->table = copy_byte_table (ct->table);
    }
  else if (!UNBOUNDP (ct->table))
    ctnew->table = ct->table;
#else /* non UTF2000 */

  for (i = 0; i < NUM_ASCII_CHARS; i++)
    {
      Lisp_Object new = ct->ascii[i];
#ifdef MULE
      assert (! (CHAR_TABLE_ENTRYP (new)));
#endif /* MULE */
      ctnew->ascii[i] = new;
    }

#ifdef MULE

  for (i = 0; i < NUM_LEADING_BYTES; i++)
    {
      Lisp_Object new = ct->level1[i];
      if (CHAR_TABLE_ENTRYP (new))
	ctnew->level1[i] = copy_char_table_entry (new);
      else
	ctnew->level1[i] = new;
    }

#endif /* MULE */
#endif /* non UTF2000 */

#ifndef UTF2000
  if (CHAR_TABLEP (ct->mirror_table))
    ctnew->mirror_table = Fcopy_char_table (ct->mirror_table);
  else
    ctnew->mirror_table = ct->mirror_table;
#endif
  ctnew->next_table = Qnil;
  XSETCHAR_TABLE (obj, ctnew);
  if (ctnew->type == CHAR_TABLE_TYPE_SYNTAX)
    {
      ctnew->next_table = Vall_syntax_tables;
      Vall_syntax_tables = obj;
    }
  return obj;
}

INLINE_HEADER int XCHARSET_CELL_RANGE (Lisp_Object ccs);
INLINE_HEADER int
XCHARSET_CELL_RANGE (Lisp_Object ccs)
{
  switch (XCHARSET_CHARS (ccs))
    {
    case 94:
      return (33 << 8) | 126;
    case 96:
      return (32 << 8) | 127;
#ifdef UTF2000
    case 128:
      return (0 << 8) | 127;
    case 256:
      return (0 << 8) | 255;
#endif
    default:
      ABORT ();
      return 0;
    }
}

#ifndef UTF2000
static
#endif
void
decode_char_table_range (Lisp_Object range, struct chartab_range *outrange)
{
  if (EQ (range, Qt))
    outrange->type = CHARTAB_RANGE_ALL;
#ifdef UTF2000
  else if (EQ (range, Qnil))
    outrange->type = CHARTAB_RANGE_DEFAULT;
#endif
  else if (CHAR_OR_CHAR_INTP (range))
    {
      outrange->type = CHARTAB_RANGE_CHAR;
      outrange->ch = XCHAR_OR_CHAR_INT (range);
    }
#ifndef MULE
  else
    signal_simple_error ("Range must be t or a character", range);
#else /* MULE */
  else if (VECTORP (range))
    {
      Lisp_Vector *vec = XVECTOR (range);
      Lisp_Object *elts = vector_data (vec);
      int cell_min, cell_max;

      outrange->type = CHARTAB_RANGE_ROW;
      outrange->charset = Fget_charset (elts[0]);
      CHECK_INT (elts[1]);
      outrange->row = XINT (elts[1]);
      if (XCHARSET_DIMENSION (outrange->charset) < 2)
	signal_simple_error ("Charset in row vector must be multi-byte",
			     outrange->charset);
      else
	{
	  int ret = XCHARSET_CELL_RANGE (outrange->charset);

	  cell_min = ret >> 8;
	  cell_max = ret & 0xFF;
	}
      if (XCHARSET_DIMENSION (outrange->charset) == 2)
	check_int_range (outrange->row, cell_min, cell_max);
#ifdef UTF2000
      else if (XCHARSET_DIMENSION (outrange->charset) == 3)
	{
	  check_int_range (outrange->row >> 8  , cell_min, cell_max);
	  check_int_range (outrange->row & 0xFF, cell_min, cell_max);
	}
      else if (XCHARSET_DIMENSION (outrange->charset) == 4)
	{
	  check_int_range ( outrange->row >> 16       , cell_min, cell_max);
	  check_int_range ((outrange->row >> 8) & 0xFF, cell_min, cell_max);
	  check_int_range ( outrange->row       & 0xFF, cell_min, cell_max);
	}
#endif
      else
	ABORT ();
    }
  else
    {
      if (!CHARSETP (range) && !SYMBOLP (range))
	signal_simple_error
	  ("Char table range must be t, charset, char, or vector", range);
      outrange->type = CHARTAB_RANGE_CHARSET;
      outrange->charset = Fget_charset (range);
    }
#endif /* MULE */
}

#if defined(MULE)&&!defined(UTF2000)

/* called from CHAR_TABLE_VALUE(). */
Lisp_Object
get_non_ascii_char_table_value (Lisp_Char_Table *ct, Charset_ID leading_byte,
			       Emchar c)
{
  Lisp_Object val;
#ifdef UTF2000
  Lisp_Object charset;
#else
  Lisp_Object charset = CHARSET_BY_LEADING_BYTE (leading_byte);
#endif
  int byte1, byte2;

#ifdef UTF2000
  BREAKUP_CHAR (c, charset, byte1, byte2);
#else
  BREAKUP_CHAR_1_UNSAFE (c, charset, byte1, byte2);
#endif
  val = ct->level1[leading_byte - MIN_LEADING_BYTE];
  if (CHAR_TABLE_ENTRYP (val))
    {
      Lisp_Char_Table_Entry *cte = XCHAR_TABLE_ENTRY (val);
      val = cte->level2[byte1 - 32];
      if (CHAR_TABLE_ENTRYP (val))
	{
	  cte = XCHAR_TABLE_ENTRY (val);
	  assert (byte2 >= 32);
	  val = cte->level2[byte2 - 32];
	  assert (!CHAR_TABLE_ENTRYP (val));
	}
    }

  return val;
}

#endif /* MULE */

Lisp_Object
get_char_table (Emchar ch, Lisp_Char_Table *ct)
{
#ifdef UTF2000
  {
    Lisp_Object ret = get_char_id_table (ct, ch);

#ifdef HAVE_CHISE
    if (NILP (ret))
      {
	if (EQ (CHAR_TABLE_NAME (ct), Qdowncase))
	  ret = Fchar_feature (make_char (ch), Q_lowercase, Qnil,
			       Qnil, Qnil);
	else if (EQ (CHAR_TABLE_NAME (ct), Qflippedcase))
	  ret = Fchar_feature (make_char (ch), Q_uppercase, Qnil,
			       Qnil, Qnil);
	if (CONSP (ret))
	  {
	    ret = XCAR (ret);
	    if (CONSP (ret))
	      ret = Ffind_char (ret);
	  }
      }
#endif
    return ret;
  }
#elif defined(MULE)
  {
    Lisp_Object charset;
    int byte1, byte2;
    Lisp_Object val;

    BREAKUP_CHAR (ch, charset, byte1, byte2);

    if (EQ (charset, Vcharset_ascii))
      val = ct->ascii[byte1];
    else if (EQ (charset, Vcharset_control_1))
      val = ct->ascii[byte1 + 128];
    else
      {
	int lb = XCHARSET_LEADING_BYTE (charset) - MIN_LEADING_BYTE;
	val = ct->level1[lb];
	if (CHAR_TABLE_ENTRYP (val))
	  {
	    Lisp_Char_Table_Entry *cte = XCHAR_TABLE_ENTRY (val);
	    val = cte->level2[byte1 - 32];
	    if (CHAR_TABLE_ENTRYP (val))
	      {
		cte = XCHAR_TABLE_ENTRY (val);
		assert (byte2 >= 32);
		val = cte->level2[byte2 - 32];
		assert (!CHAR_TABLE_ENTRYP (val));
	      }
	  }
      }

    return val;
  }
#else /* not MULE */
  return ct->ascii[(unsigned char)ch];
#endif /* not MULE */
}


DEFUN ("get-char-table", Fget_char_table, 2, 2, 0, /*
Find value for CHARACTER in CHAR-TABLE.
*/
       (character, char_table))
{
  CHECK_CHAR_TABLE (char_table);
  CHECK_CHAR_COERCE_INT (character);

  return get_char_table (XCHAR (character), XCHAR_TABLE (char_table));
}

DEFUN ("get-range-char-table", Fget_range_char_table, 2, 3, 0, /*
Find value for RANGE in CHAR-TABLE.
If there is more than one value, return MULTI (defaults to nil).

Valid values for RANGE are single characters, charsets, a row in a
two-octet charset, and all characters.  See `put-char-table'.
*/
       (range, char_table, multi))
{
  Lisp_Char_Table *ct;
  struct chartab_range rainj;

  if (CHAR_OR_CHAR_INTP (range))
    return Fget_char_table (range, char_table);
  CHECK_CHAR_TABLE (char_table);
  ct = XCHAR_TABLE (char_table);

  decode_char_table_range (range, &rainj);
  switch (rainj.type)
    {
    case CHARTAB_RANGE_ALL:
      {
#ifdef UTF2000
	if (UINT8_BYTE_TABLE_P (ct->table))
	  return multi;
	else if (UINT16_BYTE_TABLE_P (ct->table))
	  return multi;
	else if (BYTE_TABLE_P (ct->table))
	  return multi;
	else
	  return ct->table;
#else /* non UTF2000 */
	int i;
	Lisp_Object first = ct->ascii[0];

	for (i = 1; i < NUM_ASCII_CHARS; i++)
	  if (!EQ (first, ct->ascii[i]))
	    return multi;

#ifdef MULE
	for (i = MIN_LEADING_BYTE; i < MIN_LEADING_BYTE + NUM_LEADING_BYTES;
	     i++)
	  {
	    if (!CHARSETP (CHARSET_BY_LEADING_BYTE (i))
		|| i == LEADING_BYTE_ASCII
		|| i == LEADING_BYTE_CONTROL_1)
	      continue;
	    if (!EQ (first, ct->level1[i - MIN_LEADING_BYTE]))
	      return multi;
	  }
#endif /* MULE */

	return first;
#endif /* non UTF2000 */
      }

#ifdef MULE
    case CHARTAB_RANGE_CHARSET:
#ifdef UTF2000
      return multi;
#else
      if (EQ (rainj.charset, Vcharset_ascii))
	{
	  int i;
	  Lisp_Object first = ct->ascii[0];

	  for (i = 1; i < 128; i++)
	    if (!EQ (first, ct->ascii[i]))
	      return multi;
	  return first;
	}

      if (EQ (rainj.charset, Vcharset_control_1))
	{
	  int i;
	  Lisp_Object first = ct->ascii[128];

	  for (i = 129; i < 160; i++)
	    if (!EQ (first, ct->ascii[i]))
	      return multi;
	  return first;
	}

      {
	Lisp_Object val = ct->level1[XCHARSET_LEADING_BYTE (rainj.charset) -
				     MIN_LEADING_BYTE];
	if (CHAR_TABLE_ENTRYP (val))
	  return multi;
	return val;
      }
#endif

    case CHARTAB_RANGE_ROW:
#ifdef UTF2000
      return multi;
#else
      {
	Lisp_Object val = ct->level1[XCHARSET_LEADING_BYTE (rainj.charset) -
				     MIN_LEADING_BYTE];
	if (!CHAR_TABLE_ENTRYP (val))
	  return val;
	val = XCHAR_TABLE_ENTRY (val)->level2[rainj.row - 32];
	if (CHAR_TABLE_ENTRYP (val))
	  return multi;
	return val;
      }
#endif /* not UTF2000 */
#endif /* not MULE */

#ifdef UTF2000
    case CHARTAB_RANGE_DEFAULT:
      return ct->default_value;
#endif /* not UTF2000 */

    default:
      ABORT ();
    }

  return Qnil; /* not reached */
}

static int
check_valid_char_table_value (Lisp_Object value, enum char_table_type type,
			      Error_behavior errb)
{
  switch (type)
    {
    case CHAR_TABLE_TYPE_SYNTAX:
      if (!ERRB_EQ (errb, ERROR_ME))
	return INTP (value) || (CONSP (value) && INTP (XCAR (value))
				&& CHAR_OR_CHAR_INTP (XCDR (value)));
      if (CONSP (value))
        {
	  Lisp_Object cdr = XCDR (value);
          CHECK_INT (XCAR (value));
	  CHECK_CHAR_COERCE_INT (cdr);
         }
      else
        CHECK_INT (value);
      break;

#ifdef MULE
    case CHAR_TABLE_TYPE_CATEGORY:
      if (!ERRB_EQ (errb, ERROR_ME))
	return CATEGORY_TABLE_VALUEP (value);
      CHECK_CATEGORY_TABLE_VALUE (value);
      break;
#endif /* MULE */

    case CHAR_TABLE_TYPE_GENERIC:
      return 1;

    case CHAR_TABLE_TYPE_DISPLAY:
      /* #### fix this */
      maybe_signal_simple_error ("Display char tables not yet implemented",
				 value, Qchar_table, errb);
      return 0;

    case CHAR_TABLE_TYPE_CHAR:
      if (!ERRB_EQ (errb, ERROR_ME))
	return CHAR_OR_CHAR_INTP (value);
      CHECK_CHAR_COERCE_INT (value);
      break;

    default:
      ABORT ();
    }

  return 0; /* not reached */
}

static Lisp_Object
canonicalize_char_table_value (Lisp_Object value, enum char_table_type type)
{
  switch (type)
    {
    case CHAR_TABLE_TYPE_SYNTAX:
      if (CONSP (value))
	{
	  Lisp_Object car = XCAR (value);
	  Lisp_Object cdr = XCDR (value);
	  CHECK_CHAR_COERCE_INT (cdr);
	  return Fcons (car, cdr);
	}
      break;
    case CHAR_TABLE_TYPE_CHAR:
      CHECK_CHAR_COERCE_INT (value);
      break;
    default:
      break;
    }
  return value;
}

DEFUN ("valid-char-table-value-p", Fvalid_char_table_value_p, 2, 2, 0, /*
Return non-nil if VALUE is a valid value for CHAR-TABLE-TYPE.
*/
       (value, char_table_type))
{
  enum char_table_type type = symbol_to_char_table_type (char_table_type);

  return check_valid_char_table_value (value, type, ERROR_ME_NOT) ? Qt : Qnil;
}

DEFUN ("check-valid-char-table-value", Fcheck_valid_char_table_value, 2, 2, 0, /*
Signal an error if VALUE is not a valid value for CHAR-TABLE-TYPE.
*/
       (value, char_table_type))
{
  enum char_table_type type = symbol_to_char_table_type (char_table_type);

  check_valid_char_table_value (value, type, ERROR_ME);
  return Qnil;
}

#ifdef UTF2000
Lisp_Char_Table* char_attribute_table_to_put;
Lisp_Object Qput_char_table_map_function;
Lisp_Object value_to_put;

DEFUN ("put-char-table-map-function",
       Fput_char_table_map_function, 2, 2, 0, /*
For internal use.  Don't use it.
*/
       (c, value))
{
  put_char_id_table_0 (char_attribute_table_to_put,
		       XCHAR (c), value_to_put);
  return Qnil;
}
#endif

/* Assign VAL to all characters in RANGE in char table CT. */

void
put_char_table (Lisp_Char_Table *ct, struct chartab_range *range,
		Lisp_Object val)
{
  switch (range->type)
    {
    case CHARTAB_RANGE_ALL:
      fill_char_table (ct, val);
      return; /* avoid the duplicate call to update_syntax_table() below,
		 since fill_char_table() also did that. */

#ifdef UTF2000
    case CHARTAB_RANGE_DEFAULT:
      ct->default_value = val;
      return;
#endif

#ifdef MULE
    case CHARTAB_RANGE_CHARSET:
#ifdef UTF2000
      {
	Lisp_Object encoding_table = XCHARSET_ENCODING_TABLE (range->charset);

	if ( CHAR_TABLEP (encoding_table) )
	  {
	    Lisp_Object mother = XCHARSET_MOTHER (range->charset);

	    char_attribute_table_to_put = ct;
	    value_to_put = val;
	    Fmap_char_attribute (Qput_char_table_map_function,
				 XCHAR_TABLE_NAME (encoding_table),
				 Qnil);
	    if ( CHARSETP (mother) )
	      {
		struct chartab_range r;

		r.type = CHARTAB_RANGE_CHARSET;
		r.charset = mother;
		put_char_table (ct, &r, val);
	      }
	  }
#if 0
	else
	  {
	    Emchar c;

	    for (c = 0; c < 1 << 24; c++)
	      {
		if ( charset_code_point (range->charset, c) >= 0 )
		  put_char_id_table_0 (ct, c, val);
	      }
	  }
#endif
      }
#else
      if (EQ (range->charset, Vcharset_ascii))
	{
	  int i;
	  for (i = 0; i < 128; i++)
	    ct->ascii[i] = val;
	}
      else if (EQ (range->charset, Vcharset_control_1))
	{
	  int i;
	  for (i = 128; i < 160; i++)
	    ct->ascii[i] = val;
	}
      else
	{
	  int lb = XCHARSET_LEADING_BYTE (range->charset) - MIN_LEADING_BYTE;
	  ct->level1[lb] = val;
	}
#endif
      break;

    case CHARTAB_RANGE_ROW:
#ifdef UTF2000
      {
	int cell_min, cell_max, i;

	i = XCHARSET_CELL_RANGE (range->charset);
	cell_min = i >> 8;
	cell_max = i & 0xFF;
	for (i = cell_min; i <= cell_max; i++)
	  {
	    Emchar ch
	      = DECODE_CHAR (range->charset, (range->row << 8) | i, 0);

	    if ( charset_code_point (range->charset, ch, 0) >= 0 )
	      put_char_id_table_0 (ct, ch, val);
	  }
      }
#else
      {
	Lisp_Char_Table_Entry *cte;
	int lb = XCHARSET_LEADING_BYTE (range->charset) - MIN_LEADING_BYTE;
	/* make sure that there is a separate entry for the row. */
	if (!CHAR_TABLE_ENTRYP (ct->level1[lb]))
	  ct->level1[lb] = make_char_table_entry (ct->level1[lb]);
	cte = XCHAR_TABLE_ENTRY (ct->level1[lb]);
	cte->level2[range->row - 32] = val;
      }
#endif /* not UTF2000 */
      break;
#endif /* MULE */

    case CHARTAB_RANGE_CHAR:
#ifdef UTF2000
      put_char_id_table_0 (ct, range->ch, val);
      break;
#elif defined(MULE)
      {
	Lisp_Object charset;
	int byte1, byte2;

	BREAKUP_CHAR (range->ch, charset, byte1, byte2);
	if (EQ (charset, Vcharset_ascii))
	  ct->ascii[byte1] = val;
	else if (EQ (charset, Vcharset_control_1))
	  ct->ascii[byte1 + 128] = val;
	else
	  {
	    Lisp_Char_Table_Entry *cte;
	    int lb = XCHARSET_LEADING_BYTE (charset) - MIN_LEADING_BYTE;
	    /* make sure that there is a separate entry for the row. */
	    if (!CHAR_TABLE_ENTRYP (ct->level1[lb]))
	      ct->level1[lb] = make_char_table_entry (ct->level1[lb]);
	    cte = XCHAR_TABLE_ENTRY (ct->level1[lb]);
	    /* now CTE is a char table entry for the charset;
	       each entry is for a single row (or character of
	       a one-octet charset). */
	    if (XCHARSET_DIMENSION (charset) == 1)
	      cte->level2[byte1 - 32] = val;
	    else
	      {
		/* assigning to one character in a two-octet charset. */
		/* make sure that the charset row contains a separate
		   entry for each character. */
		if (!CHAR_TABLE_ENTRYP (cte->level2[byte1 - 32]))
		  cte->level2[byte1 - 32] =
		    make_char_table_entry (cte->level2[byte1 - 32]);
		cte = XCHAR_TABLE_ENTRY (cte->level2[byte1 - 32]);
		cte->level2[byte2 - 32] = val;
	      }
	  }
      }
#else /* not MULE */
      ct->ascii[(unsigned char) (range->ch)] = val;
      break;
#endif /* not MULE */
    }

#ifndef UTF2000
  if (ct->type == CHAR_TABLE_TYPE_SYNTAX)
    update_syntax_table (ct);
#endif
}

DEFUN ("put-char-table", Fput_char_table, 3, 3, 0, /*
Set the value for chars in RANGE to be VALUE in CHAR-TABLE.

RANGE specifies one or more characters to be affected and should be
one of the following:

-- t (all characters are affected)
-- A charset (only allowed when Mule support is present)
-- A vector of two elements: a two-octet charset and a row number; the row
   must be an integer, not a character (only allowed when Mule support is
   present)
-- A single character

VALUE must be a value appropriate for the type of CHAR-TABLE.
See `valid-char-table-type-p'.
*/
       (range, value, char_table))
{
  Lisp_Char_Table *ct;
  struct chartab_range rainj;

  CHECK_CHAR_TABLE (char_table);
  ct = XCHAR_TABLE (char_table);
  check_valid_char_table_value (value, ct->type, ERROR_ME);
  decode_char_table_range (range, &rainj);
  value = canonicalize_char_table_value (value, ct->type);
  put_char_table (ct, &rainj, value);
  return Qnil;
}

#ifndef UTF2000
/* Map FN over the ASCII chars in CT. */

static int
map_over_charset_ascii (Lisp_Char_Table *ct,
			int (*fn) (struct chartab_range *range,
				   Lisp_Object val, void *arg),
			void *arg)
{
  struct chartab_range rainj;
  int i, retval;
  int start = 0;
#ifdef MULE
  int stop = 128;
#else
  int stop = 256;
#endif

  rainj.type = CHARTAB_RANGE_CHAR;

  for (i = start, retval = 0; i < stop && retval == 0; i++)
    {
      rainj.ch = (Emchar) i;
      retval = (fn) (&rainj, ct->ascii[i], arg);
    }

  return retval;
}

#ifdef MULE

/* Map FN over the Control-1 chars in CT. */

static int
map_over_charset_control_1 (Lisp_Char_Table *ct,
			    int (*fn) (struct chartab_range *range,
				       Lisp_Object val, void *arg),
			    void *arg)
{
  struct chartab_range rainj;
  int i, retval;
  int start = 128;
  int stop  = start + 32;

  rainj.type = CHARTAB_RANGE_CHAR;

  for (i = start, retval = 0; i < stop && retval == 0; i++)
    {
      rainj.ch = (Emchar) (i);
      retval = (fn) (&rainj, ct->ascii[i], arg);
    }

  return retval;
}

/* Map FN over the row ROW of two-byte charset CHARSET.
   There must be a separate value for that row in the char table.
   CTE specifies the char table entry for CHARSET. */

static int
map_over_charset_row (Lisp_Char_Table_Entry *cte,
		      Lisp_Object charset, int row,
		      int (*fn) (struct chartab_range *range,
				 Lisp_Object val, void *arg),
		      void *arg)
{
  Lisp_Object val = cte->level2[row - 32];

  if (!CHAR_TABLE_ENTRYP (val))
    {
      struct chartab_range rainj;

      rainj.type = CHARTAB_RANGE_ROW;
      rainj.charset = charset;
      rainj.row = row;
      return (fn) (&rainj, val, arg);
    }
  else
    {
      struct chartab_range rainj;
      int i, retval;
      int charset94_p = (XCHARSET_CHARS (charset) == 94);
      int start = charset94_p ?  33 :  32;
      int stop  = charset94_p ? 127 : 128;

      cte = XCHAR_TABLE_ENTRY (val);

      rainj.type = CHARTAB_RANGE_CHAR;

      for (i = start, retval = 0; i < stop && retval == 0; i++)
	{
	  rainj.ch = MAKE_CHAR (charset, row, i);
	  retval = (fn) (&rainj, cte->level2[i - 32], arg);
	}
      return retval;
    }
}


static int
map_over_other_charset (Lisp_Char_Table *ct, Charset_ID lb,
			int (*fn) (struct chartab_range *range,
				   Lisp_Object val, void *arg),
			void *arg)
{
  Lisp_Object val = ct->level1[lb - MIN_LEADING_BYTE];
  Lisp_Object charset = CHARSET_BY_LEADING_BYTE (lb);

  if (!CHARSETP (charset)
      || lb == LEADING_BYTE_ASCII
      || lb == LEADING_BYTE_CONTROL_1)
    return 0;

  if (!CHAR_TABLE_ENTRYP (val))
    {
      struct chartab_range rainj;

      rainj.type = CHARTAB_RANGE_CHARSET;
      rainj.charset = charset;
      return (fn) (&rainj, val, arg);
    }

  {
    Lisp_Char_Table_Entry *cte = XCHAR_TABLE_ENTRY (val);
    int charset94_p = (XCHARSET_CHARS (charset) == 94);
    int start = charset94_p ?  33 :  32;
    int stop  = charset94_p ? 127 : 128;
    int i, retval;

    if (XCHARSET_DIMENSION (charset) == 1)
      {
	struct chartab_range rainj;
	rainj.type = CHARTAB_RANGE_CHAR;

	for (i = start, retval = 0; i < stop && retval == 0; i++)
	  {
	    rainj.ch = MAKE_CHAR (charset, i, 0);
	    retval = (fn) (&rainj, cte->level2[i - 32], arg);
	  }
      }
    else
      {
	for (i = start, retval = 0; i < stop && retval == 0; i++)
	  retval = map_over_charset_row (cte, charset, i, fn, arg);
      }

    return retval;
  }
}

#endif /* MULE */
#endif /* not UTF2000 */

#ifdef UTF2000
struct map_char_table_for_charset_arg
{
  int (*fn) (struct chartab_range *range, Lisp_Object val, void *arg);
  Lisp_Char_Table *ct;
  void *arg;
};

static int
map_char_table_for_charset_fun (struct chartab_range *range,
				Lisp_Object val, void *arg)
{
  struct map_char_table_for_charset_arg *closure =
    (struct map_char_table_for_charset_arg *) arg;
  Lisp_Object ret;

  switch (range->type)
    {
    case CHARTAB_RANGE_ALL:
      break;

    case CHARTAB_RANGE_DEFAULT:
      break;

    case CHARTAB_RANGE_CHARSET:
      break;

    case CHARTAB_RANGE_ROW:
      break;

    case CHARTAB_RANGE_CHAR:
      ret = get_char_table (range->ch, closure->ct);
      if (!UNBOUNDP (ret))
	return (closure->fn) (range, ret, closure->arg);
      break;

    default:
      ABORT ();
    }

  return 0;
}

#endif

/* Map FN (with client data ARG) over range RANGE in char table CT.
   Mapping stops the first time FN returns non-zero, and that value
   becomes the return value of map_char_table(). */

int
map_char_table (Lisp_Char_Table *ct,
		struct chartab_range *range,
		int (*fn) (struct chartab_range *range,
			   Lisp_Object val, void *arg),
		void *arg)
{
  switch (range->type)
    {
    case CHARTAB_RANGE_ALL:
#ifdef UTF2000
      if (!UNBOUNDP (ct->default_value))
	{
	  struct chartab_range rainj;
	  int retval;

	  rainj.type = CHARTAB_RANGE_DEFAULT;
	  retval = (fn) (&rainj, ct->default_value, arg);
	  if (retval != 0)
	    return retval;
	}
      if (UINT8_BYTE_TABLE_P (ct->table))
	return map_over_uint8_byte_table (XUINT8_BYTE_TABLE(ct->table), ct,
					  0, 3, fn, arg);
      else if (UINT16_BYTE_TABLE_P (ct->table))
	return map_over_uint16_byte_table (XUINT16_BYTE_TABLE(ct->table), ct,
					   0, 3, fn, arg);
      else if (BYTE_TABLE_P (ct->table))
	return map_over_byte_table (XBYTE_TABLE(ct->table), ct,
				    0, 3, fn, arg);
      else if (EQ (ct->table, Qunloaded))
	{
#if 0
	  struct chartab_range rainj;
	  int unit = 1 << 30;
	  Emchar c = 0;
	  Emchar c1 = c + unit;
	  int retval;

	  rainj.type = CHARTAB_RANGE_CHAR;

	  for (retval = 0; c < c1 && retval == 0; c++)
	    {
	      Lisp_Object ret = get_char_id_table (ct, c);

	      if (!UNBOUNDP (ret))
		{
		  rainj.ch = c;
		  retval = (fn) (&rainj, ct->table, arg);
		}
	    }
	  return retval;
#else
	  ct->table = Qunbound;
#endif
	}
      else if (!UNBOUNDP (ct->table))
        return (fn) (range, ct->table, arg);
      return 0;
#else
      {
	int retval;

	retval = map_over_charset_ascii (ct, fn, arg);
	if (retval)
	  return retval;
#ifdef MULE
	retval = map_over_charset_control_1 (ct, fn, arg);
	if (retval)
	  return retval;
	{
	  Charset_ID i;
	  Charset_ID start = MIN_LEADING_BYTE;
	  Charset_ID stop  = start + NUM_LEADING_BYTES;

	  for (i = start, retval = 0; i < stop && retval == 0; i++)
	    {
	      retval = map_over_other_charset (ct, i, fn, arg);
	    }
	}
#endif /* MULE */
	return retval;
      }
#endif

#ifdef UTF2000
    case CHARTAB_RANGE_DEFAULT:
      if (!UNBOUNDP (ct->default_value))
	return (fn) (range, ct->default_value, arg);
      return 0;
#endif

#ifdef MULE
    case CHARTAB_RANGE_CHARSET:
#ifdef UTF2000
      {
	Lisp_Object encoding_table
	  = XCHARSET_ENCODING_TABLE (range->charset);

	if (!NILP (encoding_table))
	  {
	    struct chartab_range rainj;
	    struct map_char_table_for_charset_arg mcarg;

#ifdef HAVE_CHISE
	    if (XCHAR_TABLE_UNLOADED(encoding_table))
	      Fload_char_attribute_table (XCHAR_TABLE_NAME (encoding_table));
#endif
	    mcarg.fn = fn;
	    mcarg.ct = ct;
	    mcarg.arg = arg;
	    rainj.type = CHARTAB_RANGE_ALL;
	    return map_char_table (XCHAR_TABLE(encoding_table),
				   &rainj,
				   &map_char_table_for_charset_fun,
				   &mcarg);
	  }
      }
      return 0;
#else
      return map_over_other_charset (ct,
				     XCHARSET_LEADING_BYTE (range->charset),
				     fn, arg);
#endif

    case CHARTAB_RANGE_ROW:
#ifdef UTF2000
      {
	int cell_min, cell_max, i;
	int retval;
	struct chartab_range rainj;

	i = XCHARSET_CELL_RANGE (range->charset);
	cell_min = i >> 8;
	cell_max = i & 0xFF;
	rainj.type = CHARTAB_RANGE_CHAR;
	for (retval =0, i = cell_min; i <= cell_max && retval == 0; i++)
	  {
	    Emchar ch
	      = DECODE_CHAR (range->charset, (range->row << 8) | i, 0);

	    if ( charset_code_point (range->charset, ch, 0) >= 0 )
	      {
		Lisp_Object val
		  = get_byte_table (get_byte_table
				    (get_byte_table
				     (get_byte_table
				      (ct->table,
				       (unsigned char)(ch >> 24)),
				      (unsigned char) (ch >> 16)),
				     (unsigned char)  (ch >> 8)),
				    (unsigned char)    ch);

		if (UNBOUNDP (val))
		  val = ct->default_value;
		rainj.ch = ch;
		retval = (fn) (&rainj, val, arg);
	      }
	  }
	return retval;
      }
#else
      {
	Lisp_Object val = ct->level1[XCHARSET_LEADING_BYTE (range->charset)
				    - MIN_LEADING_BYTE];
	if (!CHAR_TABLE_ENTRYP (val))
	  {
	    struct chartab_range rainj;

	    rainj.type = CHARTAB_RANGE_ROW;
	    rainj.charset = range->charset;
	    rainj.row = range->row;
	    return (fn) (&rainj, val, arg);
	  }
	else
	  return map_over_charset_row (XCHAR_TABLE_ENTRY (val),
				       range->charset, range->row,
				       fn, arg);
      }
#endif /* not UTF2000 */
#endif /* MULE */

    case CHARTAB_RANGE_CHAR:
      {
	Emchar ch = range->ch;
	Lisp_Object val = CHAR_TABLE_VALUE_UNSAFE (ct, ch);

	if (!UNBOUNDP (val))
	  {
	    struct chartab_range rainj;

	    rainj.type = CHARTAB_RANGE_CHAR;
	    rainj.ch = ch;
	    return (fn) (&rainj, val, arg);
	  }
	return 0;
      }

    default:
      ABORT ();
    }

  return 0;
}

struct slow_map_char_table_arg
{
  Lisp_Object function;
  Lisp_Object retval;
};

static int
slow_map_char_table_fun (struct chartab_range *range,
			 Lisp_Object val, void *arg)
{
  Lisp_Object ranjarg = Qnil;
  struct slow_map_char_table_arg *closure =
    (struct slow_map_char_table_arg *) arg;

  switch (range->type)
    {
    case CHARTAB_RANGE_ALL:
      ranjarg = Qt;
      break;

#ifdef UTF2000
    case CHARTAB_RANGE_DEFAULT:
      ranjarg = Qnil;
      break;
#endif

#ifdef MULE
    case CHARTAB_RANGE_CHARSET:
      ranjarg = XCHARSET_NAME (range->charset);
      break;

    case CHARTAB_RANGE_ROW:
      ranjarg = vector2 (XCHARSET_NAME (range->charset),
			 make_int (range->row));
      break;
#endif /* MULE */
    case CHARTAB_RANGE_CHAR:
      ranjarg = make_char (range->ch);
      break;
    default:
      ABORT ();
    }

  closure->retval = call2 (closure->function, ranjarg, val);
  return !NILP (closure->retval);
}

DEFUN ("map-char-table", Fmap_char_table, 2, 3, 0, /*
Map FUNCTION over CHAR-TABLE until it returns non-nil; return that value.
FUNCTION is called with two arguments, each key and entry in the table.

RANGE specifies a subrange to map over and is in the same format as
the RANGE argument to `put-range-table'.  If omitted or t, it defaults to
the entire table.
*/
       (function, char_table, range))
{
  Lisp_Char_Table *ct;
  struct slow_map_char_table_arg slarg;
  struct gcpro gcpro1, gcpro2;
  struct chartab_range rainj;

  CHECK_CHAR_TABLE (char_table);
  ct = XCHAR_TABLE (char_table);
  if (NILP (range))
    range = Qt;
  decode_char_table_range (range, &rainj);
  slarg.function = function;
  slarg.retval = Qnil;
  GCPRO2 (slarg.function, slarg.retval);
  map_char_table (ct, &rainj, slow_map_char_table_fun, &slarg);
  UNGCPRO;

  return slarg.retval;
}


/************************************************************************/
/*                         Character Attributes                         */
/************************************************************************/

#ifdef UTF2000

Lisp_Object Vchar_attribute_hash_table;

/* We store the char-attributes in hash tables with the names as the
   key and the actual char-id-table object as the value.  Occasionally
   we need to use them in a list format.  These routines provide us
   with that. */
struct char_attribute_list_closure
{
  Lisp_Object *char_attribute_list;
};

static int
add_char_attribute_to_list_mapper (Lisp_Object key, Lisp_Object value,
				   void *char_attribute_list_closure)
{
  /* This function can GC */
  struct char_attribute_list_closure *calcl
    = (struct char_attribute_list_closure*) char_attribute_list_closure;
  Lisp_Object *char_attribute_list = calcl->char_attribute_list;

  *char_attribute_list = Fcons (key, *char_attribute_list);
  return 0;
}

#ifdef HAVE_LIBCHISE
static int
char_attribute_list_reset_map_func (CHISE_DS *ds, unsigned char *name)
{
  Fmount_char_attribute_table (intern (name));
  return 0;
}

DEFUN ("char-attribute-list", Fchar_attribute_list, 0, 1, 0, /*
Return the list of all existing character attributes except coded-charsets.
*/
       (rehash))
#else
DEFUN ("char-attribute-list", Fchar_attribute_list, 0, 0, 0, /*
Return the list of all existing character attributes except coded-charsets.
*/
       ())
#endif
{
  Lisp_Object char_attribute_list = Qnil;
  struct gcpro gcpro1;
  struct char_attribute_list_closure char_attribute_list_closure;
  
#ifdef HAVE_LIBCHISE
  if (!NILP (rehash))
    {
      open_chise_data_source_maybe ();
      chise_ds_foreach_char_feature_name
	(default_chise_data_source, &char_attribute_list_reset_map_func);
    }
#endif
  GCPRO1 (char_attribute_list);
  char_attribute_list_closure.char_attribute_list = &char_attribute_list;
  elisp_maphash (add_char_attribute_to_list_mapper,
		 Vchar_attribute_hash_table,
		 &char_attribute_list_closure);
  UNGCPRO;
  return char_attribute_list;
}

DEFUN ("find-char-attribute-table", Ffind_char_attribute_table, 1, 1, 0, /*
Return char-id-table corresponding to ATTRIBUTE.
*/
       (attribute))
{
  return Fgethash (attribute, Vchar_attribute_hash_table, Qnil);
}


/* We store the char-id-tables in hash tables with the attributes as
   the key and the actual char-id-table object as the value.  Each
   char-id-table stores values of an attribute corresponding with
   characters.  Occasionally we need to get attributes of a character
   in a association-list format.  These routines provide us with
   that. */
struct char_attribute_alist_closure
{
  Emchar char_id;
  Lisp_Object *char_attribute_alist;
};

static int
add_char_attribute_alist_mapper (Lisp_Object key, Lisp_Object value,
				 void *char_attribute_alist_closure)
{
  /* This function can GC */
  struct char_attribute_alist_closure *caacl =
    (struct char_attribute_alist_closure*) char_attribute_alist_closure;
  Lisp_Object ret
    = get_char_id_table (XCHAR_TABLE(value), caacl->char_id);
  if (!UNBOUNDP (ret))
    {
      Lisp_Object *char_attribute_alist = caacl->char_attribute_alist;
      *char_attribute_alist
	= Fcons (Fcons (key, ret), *char_attribute_alist);
    }
  return 0;
}

DEFUN ("char-attribute-alist", Fchar_attribute_alist, 1, 1, 0, /*
Return the alist of attributes of CHARACTER.
*/
       (character))
{
  struct gcpro gcpro1;
  struct char_attribute_alist_closure char_attribute_alist_closure;
  Lisp_Object alist = Qnil;

  CHECK_CHAR (character);

  GCPRO1 (alist);
  char_attribute_alist_closure.char_id = XCHAR (character);
  char_attribute_alist_closure.char_attribute_alist = &alist;
  elisp_maphash (add_char_attribute_alist_mapper,
		 Vchar_attribute_hash_table,
		 &char_attribute_alist_closure);
  UNGCPRO;

  return alist;
}

DEFUN ("char-feature-base-name=", Fchar_feature_base_name_eq, 2, 2, 0, /*
Return the alist of attributes of CHARACTER.
*/
       (base_name, feature_name))
{
  Lisp_String *bn, *fn;
  Bytecount len_bn, len_fn, i;
  Bufbyte *ptr_bn, *ptr_fn;

  CHECK_SYMBOL (base_name);
  CHECK_SYMBOL (feature_name);

  bn = XSYMBOL (base_name)->name;
  fn = XSYMBOL (feature_name)->name;
  len_bn = string_length (bn);
  len_fn = string_length (fn);

  if ( len_bn > len_fn )
    return Qnil;

  ptr_bn = string_data (bn);
  ptr_fn = string_data (fn);
  for ( i = len_fn - 1; i >= 0; i-- )
    {
      if ( ptr_fn[i] == '*' )
	return Qnil;
      if ( ptr_fn[i] == '@' )
	break;
    }
  if ( i < 0 )
    i = len_fn;
  if ( (len_bn == i) && (memcmp (ptr_bn, ptr_fn, len_bn) == 0) )
    return Qt;
  else
    return Qnil;
}

DEFUN ("get-char-attribute", Fget_char_attribute, 2, 3, 0, /*
Return the value of CHARACTER's ATTRIBUTE.
Return DEFAULT-VALUE if the value is not exist.
*/
       (character, attribute, default_value))
{
  Lisp_Object table;

  CHECK_CHAR (character);

  if (CHARSETP (attribute))
    attribute = XCHARSET_NAME (attribute);

  table = Fgethash (attribute, Vchar_attribute_hash_table,
		    Qunbound);
  if (!UNBOUNDP (table))
    {
      Lisp_Object ret = get_char_id_table (XCHAR_TABLE(table),
					   XCHAR (character));
      if (!UNBOUNDP (ret))
	return ret;
    }
  return default_value;
}

static Lisp_Object
find_char_feature_in_family (Lisp_Object character,
			     Lisp_Object con_feature,
			     Lisp_Object feature,
			     Lisp_Object feature_rel_max)
{
  Lisp_Object ancestors
    = Fget_char_attribute (character, con_feature, Qnil);

  while (!NILP (ancestors))
    {
      Lisp_Object ancestor = XCAR (ancestors);
      Lisp_Object ret;

      if (EQ (ancestor, character))
	return Qunbound;

      ret = Fchar_feature (ancestor, feature, Qunbound,
			   Qnil, make_int (0));
      if (!UNBOUNDP (ret))
	return ret;

      ancestors = XCDR (ancestors);

      ret = Fget_char_attribute (ancestor, Q_subsumptive_from, Qnil);
      if (!NILP (ret))
	ancestors = nconc2 (Fcopy_sequence (ancestors), ret);

      ret = Fget_char_attribute (ancestor, Q_denotational_from, Qnil);
      if (!NILP (ret))
	ancestors = nconc2 (Fcopy_sequence (ancestors), ret);
    }
  return Qunbound;
}

DEFUN ("char-feature", Fchar_feature, 2, 5, 0, /*
Return the value of CHARACTER's FEATURE.
Return DEFAULT-VALUE if the value is not exist.
*/
       (character, attribute, default_value,
	feature_rel_max, char_rel_max))
{
  Lisp_Object ret
    = Fget_char_attribute (character, attribute, Qunbound);

  if (!UNBOUNDP (ret))
    return ret;

  if (NILP (feature_rel_max)
      || (INTP (feature_rel_max) &&
	  XINT (feature_rel_max) > 0))
    {
      Lisp_String* name = symbol_name (XSYMBOL (attribute));
      Bufbyte *name_str = string_data (name);

      if (name_str[0] == '=' && name_str[1] == '>')
	{
	  Bytecount length = string_length (name) - 1;
	  Lisp_Object map_to = make_uninit_string (length);

	  memcpy (XSTRING_DATA (map_to) + 1, name_str + 2, length - 1);
	  XSTRING_DATA(map_to)[0] = '=';
	  ret = Fchar_feature (character, Fintern (map_to, Qnil),
			       Qunbound,
			       NILP (feature_rel_max)
			       ? feature_rel_max
			       : make_int (XINT (feature_rel_max) - 1),
			       char_rel_max);
	  if (!UNBOUNDP (ret))
	    return ret;
	}
    }

  if ( !(EQ (attribute, Q_identical)) &&
       !(EQ (attribute, Q_subsumptive_from)) &&
       !(EQ (attribute, Q_denotational_from)) &&
       ( (NILP (char_rel_max)
	  || (INTP (char_rel_max) &&
	      XINT (char_rel_max) > 0)) ) )
    {
      Lisp_String* name = symbol_name (XSYMBOL (attribute));
      Bufbyte *name_str = string_data (name);

      if ( (name_str[0] != '=') || (name_str[1] == '>') )
	{
	  ret = find_char_feature_in_family (character, Q_identical,
					     attribute, feature_rel_max);
	  if (!UNBOUNDP (ret))
	    return ret;

	  ret = find_char_feature_in_family (character, Q_subsumptive_from,
					     attribute, feature_rel_max);
	  if (!UNBOUNDP (ret))
	    return ret;

	  ret = find_char_feature_in_family (character, Q_denotational_from,
					     attribute, feature_rel_max);
	  if (!UNBOUNDP (ret))
	    return ret;
	}
    }
  return default_value;
}

Lisp_Object
put_char_composition (Lisp_Object character, Lisp_Object value);
Lisp_Object
put_char_composition (Lisp_Object character, Lisp_Object value)
{
  if (!CONSP (value))
    signal_simple_error ("Invalid value for =decomposition",
			 value);

  if (CONSP (XCDR (value)))
    {
      if (NILP (Fcdr (XCDR (value))))
	{
	  Lisp_Object base = XCAR (value);
	  Lisp_Object modifier = XCAR (XCDR (value));

	  if (INTP (base))
	    {
	      base = make_char (XINT (base));
	      Fsetcar (value, base);
	    }
	  if (INTP (modifier))
	    {
	      modifier = make_char (XINT (modifier));
	      Fsetcar (XCDR (value), modifier);
	    }
	  if (CHARP (base))
	    {
	      Lisp_Object alist
		= Fchar_feature (base, Qcomposition, Qnil,
				 Qnil, Qnil);
	      Lisp_Object ret = Fassq (modifier, alist);

	      if (NILP (ret))
		Fput_char_attribute (base, Qcomposition,
				     Fcons (Fcons (modifier, character),
					    alist));
	      else
		Fsetcdr (ret, character);
	    }
	  else if (EQ (base, Qnarrow))
	    return Q_halfwidth_of;
	  else if (EQ (base, Qsuper))
	    return Q_superscript_of;
	  else if (EQ (base, Qsub))
	    return Q_subscript_of;
	  else if (EQ (base, Qcircle))
	    return Q_circled_of;
	  else if ( EQ (base, Qisolated)||
		    EQ (base, Qinitial)	||
		    EQ (base, Qmedial)	||
		    EQ (base, Qfinal) )
	    return
	      Fintern (concat2 (build_string ("<-formed@"),
				Fsymbol_name (base)),
		       Qnil);
	  else if (SYMBOLP (base))
	    return
	      Fintern (concat2 (build_string ("<-"),
				Fsymbol_name (base)),
		       Qnil);
	}
      else if (EQ (XCAR (value), Qsuper))
	return Qto_decomposition_at_superscript;
      else if (EQ (XCAR (value), Qcircle))
	return Qto_decomposition_at_circled;
      else
	return
	  Fintern (concat2 (build_string ("=>decomposition@"),
			    Fsymbol_name (XCAR (value))),
		   Qnil);
    }
  else
    {
      return Q_canonical;
#if 0
      Lisp_Object v = Fcar (value);

      if (INTP (v))
	{
	  Emchar c = DECODE_CHAR (Vcharset_ucs, XINT (v), 0);
	  Lisp_Object ret
	    = Fchar_feature (make_char (c), Q_ucs_unified, Qnil,
			     Qnil, Qnil);

	  if (!CONSP (ret))
	    {
	      Fput_char_attribute (make_char (c), Q_ucs_unified,
				   Fcons (character, Qnil));
	    }
	  else if (NILP (Fmemq (character, ret)))
	    {
	      Fput_char_attribute (make_char (c), Q_ucs_unified,
				   Fcons (character, ret));
	    }
	}
#endif
    }
  return Qrep_decomposition;
}

static Lisp_Object
put_char_attribute (Lisp_Object character, Lisp_Object attribute,
		    Lisp_Object value)
{
  Lisp_Object table = Fgethash (attribute,
				Vchar_attribute_hash_table,
				Qnil);

  if (NILP (table))
    {
      table = make_char_id_table (Qunbound);
      Fputhash (attribute, table, Vchar_attribute_hash_table);
#ifdef HAVE_CHISE
      XCHAR_TABLE_NAME (table) = attribute;
#endif
    }
  put_char_id_table (XCHAR_TABLE(table), character, value);
  return value;
}

DEFUN ("put-char-attribute", Fput_char_attribute, 3, 3, 0, /*
Store CHARACTER's ATTRIBUTE with VALUE.
*/
       (character, attribute, value))
{
  Lisp_Object ccs = Ffind_charset (attribute);

  CHECK_CHAR (character);

  if (!NILP (ccs))
    {
      value = put_char_ccs_code_point (character, ccs, value);
      attribute = XCHARSET_NAME (ccs);
    }
  else if (
#if 0
	    EQ (attribute, Qrep_decomposition) ||
#else
	    !NILP (Fchar_feature_base_name_eq (Qrep_decomposition,
					       attribute)) ||
#endif
	    EQ (attribute, Q_decomposition) /* || */
#if 0
	    !NILP (Fstring_match (build_string ("^=decomposition@[^*]+$"),
				  Fsymbol_name (attribute),
				  Qnil, Qnil))
#endif
	    )
    {
      Lisp_Object ret;

      value = Fcopy_sequence (Fchar_refs_simplify_char_specs (value));
      ret = put_char_composition (character, value);
      if ( !EQ (ret, Qrep_decomposition) &&
	   SYMBOLP (XCAR (value)) )
	{
	  attribute = ret;
	  value = XCDR (value);
	}
    }
  else if (EQ (attribute, Qto_ucs))
    {
      Lisp_Object ret;
      Emchar c;

      if (!INTP (value))
	signal_simple_error ("Invalid value for =>ucs", value);

      c = DECODE_CHAR (Vcharset_ucs, XINT (value), 0);

      ret = Fchar_feature (make_char (c), Q_ucs_unified, Qnil,
			   Qnil, Qnil);
      if (!CONSP (ret))
	put_char_attribute (make_char (c), Q_ucs_unified,
			    list1 (character));
      else if (NILP (Fmemq (character, ret)))
	Fput_char_attribute (make_char (c), Q_ucs_unified,
			     Fcons (character, ret));
    }
  if ( EQ (attribute, Q_subsumptive)		||
       EQ (attribute, Q_subsumptive_from)	||
       EQ (attribute, Q_denotational)		||
       EQ (attribute, Q_denotational_from)	||
       EQ (attribute, Q_identical)		||
       EQ (attribute, Q_identical_from)		||
       EQ (attribute, Q_canonical)		||
       EQ (attribute, Q_halfwidth_of)		||
       EQ (attribute, Q_superscript_of)		||
       EQ (attribute, Q_subscript_of)		||
       EQ (attribute, Q_circled_of)		||
       EQ (attribute, Q_component)		||
       EQ (attribute, Q_component_of)		||
       ( !EQ (attribute, Q_ucs_unified)
	 && !NILP (Fstring_match
		   (build_string ("^\\(<-\\|->\\)[^*]*$"),
		    Fsymbol_name (attribute),
		    Qnil, Qnil))
	 )
       )
    {
      Lisp_Object rest = value;
      Lisp_Object ret;
      Lisp_Object rev_feature = Qnil;
      struct gcpro gcpro1;
      GCPRO1 (rev_feature);

      if (EQ (attribute, Q_identical))
	rev_feature = Q_identical_from;
      else if (EQ (attribute, Q_identical_from))
	rev_feature = Q_identical;
      else if (EQ (attribute, Q_subsumptive))
	rev_feature = Q_subsumptive_from;
      else if (EQ (attribute, Q_subsumptive_from))
	rev_feature = Q_subsumptive;
      else if (EQ (attribute, Q_denotational))
	rev_feature = Q_denotational_from;
      else if (EQ (attribute, Q_denotational_from))
	rev_feature = Q_denotational;
      else if (EQ (attribute, Q_component))
	rev_feature = Q_component_of;
      else if (EQ (attribute, Q_component_of))
	rev_feature = Q_component;
      else
	{
	  Lisp_String* name = symbol_name (XSYMBOL (attribute));
	  Bufbyte *name_str = string_data (name);

	  if ( (name_str[0] == '<' && name_str[1] == '-') || 
	       (name_str[0] == '-' && name_str[1] == '>') )
	    {
	      Bytecount length = string_length (name);
	      Bufbyte *rev_name_str = alloca (length + 1);

	      memcpy (rev_name_str + 2, name_str + 2, length - 2);
	      if (name_str[0] == '<')
		{
		  rev_name_str[0] = '-';
		  rev_name_str[1] = '>';
		}
	      else
		{
		  rev_name_str[0] = '<';
		  rev_name_str[1] = '-';
		}
	      rev_name_str[length] = 0;
	      rev_feature = intern (rev_name_str);
	    }
	}

      while (CONSP (rest))
	{
	  ret = XCAR (rest);

	  if (CONSP (ret))
	    ret = Fdefine_char (ret);
	  else if (INTP (ret))
	    {
	      int code_point = XINT (ret);
	      Emchar cid = DECODE_CHAR (Vcharset_ucs, code_point, 0);

	      if (cid >= 0)
		ret = make_char (cid);
	      else
		ret = make_char (code_point);
	    }

	  if ( !NILP (ret) && !EQ (ret, character) )
	    {
	      Lisp_Object ffv;

	      ffv = Fget_char_attribute (ret, rev_feature, Qnil);
	      if (!CONSP (ffv))
		put_char_attribute (ret, rev_feature, list1 (character));
	      else if (NILP (Fmemq (character, ffv)))
		put_char_attribute
		  (ret, rev_feature,
		   nconc2 (Fcopy_sequence (ffv), list1 (character)));
	      Fsetcar (rest, ret);
	    }
	  rest = XCDR (rest);
	}
      UNGCPRO;
    }
#if 1
  else if ( EQ (attribute, Qideographic_structure) ||
	    !NILP (Fstring_match
		   (build_string ("^=>decomposition\\(\\|@[^*]+\\)$"),
		    Fsymbol_name (attribute),
		    Qnil, Qnil)) )
    value = Fcopy_sequence (Fchar_refs_simplify_char_specs (value));
#endif
  return put_char_attribute (character, attribute, value);
}
  
DEFUN ("remove-char-attribute", Fremove_char_attribute, 2, 2, 0, /*
Remove CHARACTER's ATTRIBUTE.
*/
       (character, attribute))
{
  Lisp_Object ccs;

  CHECK_CHAR (character);
  ccs = Ffind_charset (attribute);
  if (!NILP (ccs))
    {
      return remove_char_ccs (character, ccs);
    }
  else
    {
      Lisp_Object table = Fgethash (attribute,
				    Vchar_attribute_hash_table,
				    Qunbound);
      if (!UNBOUNDP (table))
	{
	  put_char_id_table (XCHAR_TABLE(table), character, Qunbound);
	  return Qt;
	}
    }
  return Qnil;
}

#ifdef HAVE_CHISE

int char_table_open_db_maybe (Lisp_Char_Table* cit);
void char_table_close_db_maybe (Lisp_Char_Table* cit);
Lisp_Object char_table_get_db (Lisp_Char_Table* cit, Emchar ch);

#ifdef HAVE_LIBCHISE
int
open_chise_data_source_maybe ()
{
  if (default_chise_data_source == NULL)
    {
      Lisp_Object db_dir = Vdata_directory;
      int modemask = 0755;		/* rwxr-xr-x */

      if (NILP (db_dir))
	db_dir = build_string ("../etc");
      db_dir = Fexpand_file_name (build_string ("chise-db"), db_dir);

      default_chise_data_source
	= CHISE_DS_open (CHISE_DS_Berkeley_DB, XSTRING_DATA (db_dir),
			 0 /* DB_HASH */, modemask);
      if (default_chise_data_source == NULL)
	return -1;
#if 0
      chise_ds_set_make_string_function (default_chise_data_source,
					 &make_string);
#endif
    }
  return 0;
}
#endif /* HAVE_LIBCHISE */

DEFUN ("close-char-data-source", Fclose_char_data_source, 0, 0, 0, /*
Close data-source of CHISE.
*/
       ())
{
#ifdef HAVE_LIBCHISE
  int status = CHISE_DS_close (default_chise_data_source);

  default_chise_data_source = NULL;
  if (status)
    return Qt;
#endif /* HAVE_LIBCHISE */
  return Qnil;
}

int
char_table_open_db_maybe (Lisp_Char_Table* cit)
{
  Lisp_Object attribute = CHAR_TABLE_NAME (cit);

  if (!NILP (attribute))
    {
#ifdef HAVE_LIBCHISE
      if ( open_chise_data_source_maybe () )
	return -1;
#else /* HAVE_LIBCHISE */
      if (NILP (Fdatabase_live_p (cit->db)))
	{
	  Lisp_Object db_file
	    = char_attribute_system_db_file (Qsystem_char_id, attribute, 0);

	  cit->db = Fopen_database (db_file, Qnil, Qnil,
				    build_string ("r"), Qnil);
	  if (NILP (cit->db))
	    return -1;
	}
#endif /* not HAVE_LIBCHISE */
      return 0;
    }
  else
    return -1;
}

void
char_table_close_db_maybe (Lisp_Char_Table* cit)
{
#ifndef HAVE_LIBCHISE
  if (!NILP (cit->db))
    {
      if (!NILP (Fdatabase_live_p (cit->db)))
	Fclose_database (cit->db);
      cit->db = Qnil;
    }
#endif /* not HAVE_LIBCHISE */
}

Lisp_Object
char_table_get_db (Lisp_Char_Table* cit, Emchar ch)
{
  Lisp_Object val;
#ifdef HAVE_LIBCHISE
  CHISE_Value value;
  int status
    = chise_ds_load_char_feature_value (default_chise_data_source, ch,
					XSTRING_DATA(Fsymbol_name
						     (cit->name)),
					&value);

  if (!status)
    {
#if 0
      val = Fread (make_string (chise_value_data (&value),
				chise_value_size (&value) ));
#else
      val = read_from_c_string (chise_value_data (&value),
				chise_value_size (&value) );
#endif
    }
  else
    val = Qunbound;
#else /* HAVE_LIBCHISE */
  val = Fget_database (Fprin1_to_string (make_char (ch), Qnil),
		       cit->db, Qunbound);
  if (!UNBOUNDP (val))
    val = Fread (val);
  else
    val = Qunbound;
#endif /* not HAVE_LIBCHISE */
  return val;
}

#ifndef HAVE_LIBCHISE
Lisp_Object
char_attribute_system_db_file (Lisp_Object key_type, Lisp_Object attribute,
			       int writing_mode)
{
  Lisp_Object db_dir = Vdata_directory;

  if (NILP (db_dir))
    db_dir = build_string ("../etc");

  db_dir = Fexpand_file_name (build_string ("chise-db"), db_dir);
  if (writing_mode && NILP (Ffile_exists_p (db_dir)))
    Fmake_directory_internal (db_dir);

  db_dir = Fexpand_file_name (Fsymbol_name (key_type), db_dir);
  if (writing_mode && NILP (Ffile_exists_p (db_dir)))
    Fmake_directory_internal (db_dir);

  {
    Lisp_Object attribute_name = Fsymbol_name (attribute);
    Lisp_Object dest = Qnil, ret;
    int base = 0;
    struct gcpro gcpro1, gcpro2;
    int len = XSTRING_CHAR_LENGTH (attribute_name);
    int i;

    GCPRO2 (dest, ret);
    for (i = 0; i < len; i++)
      {
	Emchar c = string_char (XSTRING (attribute_name), i);

	if ( (c == '/') || (c == '%') )
	  {
	    char str[4];

	    sprintf (str, "%%%02X", c);
	    dest = concat3 (dest,
			    Fsubstring (attribute_name,
					make_int (base), make_int (i)),
			    build_string (str));
	    base = i + 1;
	  }
      }
    ret = Fsubstring (attribute_name, make_int (base), make_int (len));
    dest = concat2 (dest, ret);
    UNGCPRO;
    return Fexpand_file_name (dest, db_dir);
  }
}
#endif /* not HAVE_LIBCHISE */

DEFUN ("save-char-attribute-table", Fsave_char_attribute_table, 1, 1, 0, /*
Save values of ATTRIBUTE into database file.
*/
       (attribute))
{
  Lisp_Object table = Fgethash (attribute,
				Vchar_attribute_hash_table, Qunbound);
  Lisp_Char_Table *ct;
#ifdef HAVE_LIBCHISE
  CHISE_Feature feature;
#else /* HAVE_LIBCHISE */
  Lisp_Object db_file;
  Lisp_Object db;
#endif /* not HAVE_LIBCHISE */

  if (CHAR_TABLEP (table))
    ct = XCHAR_TABLE (table);
  else
    return Qnil;

#ifdef HAVE_LIBCHISE
  if ( open_chise_data_source_maybe () )
    return -1;
  feature
    = chise_ds_get_feature (default_chise_data_source,
			    XSTRING_DATA (Fsymbol_name (attribute)));
#else /* HAVE_LIBCHISE */
  db_file = char_attribute_system_db_file (Qsystem_char_id, attribute, 1);
  db = Fopen_database (db_file, Qnil, Qnil, build_string ("w+"), Qnil);
#endif /* not HAVE_LIBCHISE */
  if (
#ifdef HAVE_LIBCHISE
      feature != NULL
#else /* HAVE_LIBCHISE */
      !NILP (db)
#endif /* not HAVE_LIBCHISE */
      )
    {
      Lisp_Object (*filter)(Lisp_Object value);

      if ( !NILP (Ffind_charset (attribute)) )
	filter = NULL;
      else if ( EQ (attribute, Qideographic_structure)	||
		EQ (attribute, Q_identical)		||
		EQ (attribute, Q_identical_from)	||
		EQ (attribute, Q_canonical)		||
		EQ (attribute, Q_halfwidth_of)		||
		EQ (attribute, Q_superscript_of)	||
		EQ (attribute, Q_subscript_of)		||
		EQ (attribute, Q_circled_of)		||
		!NILP (Fstring_match
		       (build_string ("^\\(<-\\|->\\)\\(simplified"
				      "\\|same\\|vulgar\\|wrong"
				      "\\|original\\|ancient"
				      "\\|Oracle-Bones\\)[^*]*$"),
			Fsymbol_name (attribute),
			Qnil, Qnil)) )
	filter = &Fchar_refs_simplify_char_specs;
      else
	filter = NULL;

      if (UINT8_BYTE_TABLE_P (ct->table))
	save_uint8_byte_table (XUINT8_BYTE_TABLE(ct->table), ct,
#ifdef HAVE_LIBCHISE
			       feature,
#else /* HAVE_LIBCHISE */
			       db,
#endif /* not HAVE_LIBCHISE */
			       0, 3, filter);
      else if (UINT16_BYTE_TABLE_P (ct->table))
	save_uint16_byte_table (XUINT16_BYTE_TABLE(ct->table), ct,
#ifdef HAVE_LIBCHISE
				feature,
#else /* HAVE_LIBCHISE */
				db,
#endif /* not HAVE_LIBCHISE */
				0, 3, filter);
      else if (BYTE_TABLE_P (ct->table))
	save_byte_table (XBYTE_TABLE(ct->table), ct,
#ifdef HAVE_LIBCHISE
			 feature,
#else /* HAVE_LIBCHISE */
			 db,
#endif /* not HAVE_LIBCHISE */
			 0, 3, filter);
#ifdef HAVE_LIBCHISE
      chise_feature_sync (feature);
#else /* HAVE_LIBCHISE */
      Fclose_database (db);
#endif /* not HAVE_LIBCHISE */
      return Qt;
    }
  else
    return Qnil;
}

DEFUN ("mount-char-attribute-table", Fmount_char_attribute_table, 1, 1, 0, /*
Mount database file on char-attribute-table ATTRIBUTE.
*/
       (attribute))
{
  Lisp_Object table = Fgethash (attribute,
				Vchar_attribute_hash_table, Qunbound);

  if (UNBOUNDP (table))
    {
      Lisp_Char_Table *ct;

      table = make_char_id_table (Qunbound);
      Fputhash (attribute, table, Vchar_attribute_hash_table);
      XCHAR_TABLE_NAME(table) = attribute;
      ct = XCHAR_TABLE (table);
      ct->table = Qunloaded;
      XCHAR_TABLE_UNLOADED(table) = 1;
#ifndef HAVE_LIBCHISE
      ct->db = Qnil;
#endif /* not HAVE_LIBCHISE */
      return Qt;
    }
  return Qnil;
}

DEFUN ("close-char-attribute-table", Fclose_char_attribute_table, 1, 1, 0, /*
Close database of ATTRIBUTE.
*/
       (attribute))
{
  Lisp_Object table = Fgethash (attribute,
				Vchar_attribute_hash_table, Qunbound);
  Lisp_Char_Table *ct;

  if (CHAR_TABLEP (table))
    ct = XCHAR_TABLE (table);
  else
    return Qnil;
  char_table_close_db_maybe (ct);
  return Qnil;
}

DEFUN ("reset-char-attribute-table", Freset_char_attribute_table, 1, 1, 0, /*
Reset values of ATTRIBUTE with database file.
*/
       (attribute))
{
#ifdef HAVE_LIBCHISE
  CHISE_Feature feature
    = chise_ds_get_feature (default_chise_data_source,
			    XSTRING_DATA (Fsymbol_name
					  (attribute)));

  if (feature == NULL)
    return Qnil;

  if (chise_feature_setup_db (feature, 0) == 0)
    {
      Lisp_Object table = Fgethash (attribute,
				    Vchar_attribute_hash_table, Qunbound);
      Lisp_Char_Table *ct;

      chise_feature_sync (feature);
      if (UNBOUNDP (table))
	{
	  table = make_char_id_table (Qunbound);
	  Fputhash (attribute, table, Vchar_attribute_hash_table);
	  XCHAR_TABLE_NAME(table) = attribute;
	}
      ct = XCHAR_TABLE (table);
      ct->table = Qunloaded;
      char_table_close_db_maybe (ct);
      XCHAR_TABLE_UNLOADED(table) = 1;
      return Qt;
    }
#else
  Lisp_Object table = Fgethash (attribute,
				Vchar_attribute_hash_table, Qunbound);
  Lisp_Char_Table *ct;
  Lisp_Object db_file
    = char_attribute_system_db_file (Qsystem_char_id, attribute, 0);

  if (!NILP (Ffile_exists_p (db_file)))
    {
      if (UNBOUNDP (table))
	{
	  table = make_char_id_table (Qunbound);
	  Fputhash (attribute, table, Vchar_attribute_hash_table);
	  XCHAR_TABLE_NAME(table) = attribute;
	}
      ct = XCHAR_TABLE (table);
      ct->table = Qunloaded;
      char_table_close_db_maybe (ct);
      XCHAR_TABLE_UNLOADED(table) = 1;
      return Qt;
    }
#endif
  return Qnil;
}

Lisp_Object
load_char_attribute_maybe (Lisp_Char_Table* cit, Emchar ch)
{
  Lisp_Object attribute = CHAR_TABLE_NAME (cit);

  if (!NILP (attribute))
    {
      Lisp_Object val;

      if (char_table_open_db_maybe (cit))
	return Qunbound;

      val = char_table_get_db (cit, ch);

      if (!NILP (Vchar_db_stingy_mode))
	char_table_close_db_maybe (cit);

      return val;
    }
  return Qunbound;
}

Lisp_Char_Table* char_attribute_table_to_load;

#ifdef HAVE_LIBCHISE
int
load_char_attribute_table_map_func (CHISE_Char_ID cid,
				    CHISE_Feature feature,
				    CHISE_Value *value);
int
load_char_attribute_table_map_func (CHISE_Char_ID cid,
				    CHISE_Feature feature,
				    CHISE_Value *value)
{
  Emchar code = cid;
  Lisp_Object ret = get_char_id_table_0 (char_attribute_table_to_load, code);

  if (EQ (ret, Qunloaded))
    put_char_id_table_0 (char_attribute_table_to_load, code,
			 Fread (make_string ((Bufbyte *) value->data,
					     value->size)));
  return 0;
}
#else /* HAVE_LIBCHISE */
Lisp_Object Qload_char_attribute_table_map_function;

DEFUN ("load-char-attribute-table-map-function",
       Fload_char_attribute_table_map_function, 2, 2, 0, /*
For internal use.  Don't use it.
*/
       (key, value))
{
  Lisp_Object c = Fread (key);
  Emchar code = XCHAR (c);
  Lisp_Object ret = get_char_id_table_0 (char_attribute_table_to_load, code);

  if (EQ (ret, Qunloaded))
    put_char_id_table_0 (char_attribute_table_to_load, code, Fread (value));
  return Qnil;
}
#endif /* not HAVE_LIBCHISE */

DEFUN ("load-char-attribute-table", Fload_char_attribute_table, 1, 1, 0, /*
Load values of ATTRIBUTE into database file.
*/
       (attribute))
{
  Lisp_Object table = Fgethash (attribute,
				Vchar_attribute_hash_table,
				Qunbound);
  if (CHAR_TABLEP (table))
    {
      Lisp_Char_Table *cit = XCHAR_TABLE (table);

      if (char_table_open_db_maybe (cit))
	return Qnil;

      char_attribute_table_to_load = XCHAR_TABLE (table);
      {
	struct gcpro gcpro1;

	GCPRO1 (table);
#ifdef HAVE_LIBCHISE
	chise_feature_foreach_char_with_value
	  (chise_ds_get_feature (default_chise_data_source,
				 XSTRING_DATA (Fsymbol_name (cit->name))),
	   &load_char_attribute_table_map_func);
#else /* HAVE_LIBCHISE */
	Fmap_database (Qload_char_attribute_table_map_function, cit->db);
#endif /* not HAVE_LIBCHISE */
	UNGCPRO;
      }
      char_table_close_db_maybe (cit);
      XCHAR_TABLE_UNLOADED(table) = 0;
      return Qt;
    }
  return Qnil;
}
#endif /* HAVE_CHISE */

DEFUN ("map-char-attribute", Fmap_char_attribute, 2, 3, 0, /*
Map FUNCTION over ATTRIBUTE until it returns non-nil; return that value.
FUNCTION is called with two arguments, each key and entry in the table.

RANGE specifies a subrange to map over.  If omitted or t, it defaults to
the entire table.

Both RANGE and the keys passed to FUNCTION are in the same format as the
RANGE argument to `put-char-table'.  N.B. This function does NOT map over
all characters in RANGE, but over the subranges that have been assigned to.
Thus this function is most suitable for searching a char-table, or for
populating one char-table based on the contents of another.  The current
implementation does not coalesce ranges all of whose values are the same.
*/
       (function, attribute, range))
{
  Lisp_Object ccs;
  Lisp_Char_Table *ct;
  struct slow_map_char_table_arg slarg;
  struct gcpro gcpro1, gcpro2;
  struct chartab_range rainj;

  if (!NILP (ccs = Ffind_charset (attribute)))
    {
      Lisp_Object encoding_table = XCHARSET_ENCODING_TABLE (ccs);

      if (CHAR_TABLEP (encoding_table))
	ct = XCHAR_TABLE (encoding_table);
      else
	return Qnil;
    }
  else
    {
      Lisp_Object table = Fgethash (attribute,
				    Vchar_attribute_hash_table,
				    Qunbound);
      if (CHAR_TABLEP (table))
	ct = XCHAR_TABLE (table);
      else
	return Qnil;
    }
  if (NILP (range))
    range = Qt;
  decode_char_table_range (range, &rainj);
#ifdef HAVE_CHISE
  if (CHAR_TABLE_UNLOADED(ct))
    Fload_char_attribute_table (attribute);
#endif
  slarg.function = function;
  slarg.retval = Qnil;
  GCPRO2 (slarg.function, slarg.retval);
  map_char_table (ct, &rainj, slow_map_char_table_fun, &slarg);
  UNGCPRO;

  return slarg.retval;
}

static Lisp_Object
allocate_character ()
{
  int cid = XINT (Vnext_defined_char_id);

  if (cid <= 0xE00000)
    {
      Vnext_defined_char_id = make_int (cid + 1);
      return make_char (cid);
    }
  else
    return Qnil;
}

DEFUN ("define-char", Fdefine_char, 1, 1, 0, /*
Store character's ATTRIBUTES.
*/
       (attributes))
{
  Lisp_Object rest;
  Lisp_Object code = Fcdr (Fassq (Qrep_ucs, attributes));
  Lisp_Object character;

  if (NILP (code))
    code = Fcdr (Fassq (Qucs, attributes));

  if (NILP (code))
    {
      rest = attributes;
      while (CONSP (rest))
	{
	  Lisp_Object cell = Fcar (rest);
	  Lisp_Object ccs;

	  if ( !LISTP (cell) )
	    signal_simple_error ("Invalid argument", attributes);

	  ccs = Ffind_charset (Fcar (cell));
	  if (!NILP (ccs))
	    {
	      cell = Fcdr (cell);
	      if (INTP (cell))
		{
		  character = Fdecode_char (ccs, cell, Qt, Qt);
		  if (!NILP (character))
		    goto setup_attributes;
		}
	      if ( (XCHARSET_FINAL (ccs) != 0) ||
		   (XCHARSET_MAX_CODE (ccs) > 0) ||
		   (EQ (ccs, Vcharset_chinese_big5)) )
		{
		  if (CONSP (cell))
		    character
		      = Fmake_char (ccs, Fcar (cell), Fcar (Fcdr (cell)));
		  else
		    character = Fdecode_char (ccs, cell, Qnil, Qt);
		  if (!NILP (character))
		    goto setup_attributes;
		}
	    }
	  rest = Fcdr (rest);
	}
#if 0
      {
	int cid = XINT (Vnext_defined_char_id);

	if (cid <= 0xE00000)
	  {
	    character = make_char (cid);
	    Vnext_defined_char_id = make_int (cid + 1);
	    goto setup_attributes;
	  }
      }
#else
      if ( NILP (character = allocate_character ()) )
#endif
	return Qnil;
    }
  else if (!INTP (code))
    signal_simple_error ("Invalid argument", attributes);
  else
    character = make_char (XINT (code));

 setup_attributes:
  rest = attributes;
  while (CONSP (rest))
    {
      Lisp_Object cell = Fcar (rest);

      if (!LISTP (cell))
	signal_simple_error ("Invalid argument", attributes);

      Fput_char_attribute (character, Fcar (cell), Fcdr (cell));
      rest = Fcdr (rest);
    }
  return character;
}

DEFUN ("find-char", Ffind_char, 1, 1, 0, /*
Retrieve the character of the given ATTRIBUTES.
*/
       (attributes))
{
  Lisp_Object rest = attributes;
  Lisp_Object code;

  while (CONSP (rest))
    {
      Lisp_Object cell = Fcar (rest);
      Lisp_Object ccs;

      if (!LISTP (cell))
	signal_simple_error ("Invalid argument", attributes);
      if (!NILP (ccs = Ffind_charset (Fcar (cell))))
	{
	  cell = Fcdr (cell);
	  if (CONSP (cell))
	    return Fmake_char (ccs, Fcar (cell), Fcar (Fcdr (cell)));
	  else
	    return Fdecode_char (ccs, cell, Qnil, Qnil);
	}
      rest = Fcdr (rest);
    }
  if ( (!NILP (code = Fcdr (Fassq (Qto_ucs, attributes)))) )
    {
      if (!INTP (code))
	signal_simple_error ("Invalid argument", attributes);
      else
	return make_char (XINT (code) + 0x100000);
    }
  return Qnil;
}

#endif


/************************************************************************/
/*                      Character Feature Property                      */
/************************************************************************/

#ifdef HAVE_LIBCHISE
DEFUN ("char-feature-property", Fchar_feature_property, 2, 3, 0, /*
Return the value of FEATURE's PROPERTY.
Return DEFAULT-VALUE if the value is not exist.
*/
       (feature, property, default_value))
{
  unsigned char* feature_name;
  unsigned char* property_name;
  CHISE_Value value;
  int status;

  feature_name = XSTRING_DATA (Fsymbol_name (feature));
  property_name = XSTRING_DATA (Fsymbol_name (property));
  status
    = chise_feature_load_property_value (chise_ds_get_feature
					 (default_chise_data_source,
					  feature_name),
					 chise_ds_get_property
					 (default_chise_data_source,
					  property_name),
					 &value);
  if (!status)
    return read_from_c_string (chise_value_data (&value),
			       chise_value_size (&value) );
  else
    return default_value;
}

DEFUN ("put-char-feature-property", Fput_char_feature_property, 3, 3, 0, /*
Store FEATURE's PROPERTY with VALUE.
*/
       (feature, property, value))
{
  unsigned char* feature_name;
  unsigned char* property_name;
  CHISE_Property prop;

  feature_name = XSTRING_DATA (Fsymbol_name (feature));
  property_name = XSTRING_DATA (Fsymbol_name (property));
  prop = chise_ds_get_property (default_chise_data_source,
				property_name);
  chise_feature_set_property_value
    (chise_ds_get_feature (default_chise_data_source, feature_name),
     prop, XSTRING_DATA (Fprin1_to_string
			 (value, Qnil)));
  chise_property_sync (prop);
  return Qnil;
}
#endif


/************************************************************************/
/*                         Char table read syntax                       */
/************************************************************************/

static int
chartab_type_validate (Lisp_Object keyword, Lisp_Object value,
		       Error_behavior errb)
{
  /* #### should deal with ERRB */
  symbol_to_char_table_type (value);
  return 1;
}

static int
chartab_data_validate (Lisp_Object keyword, Lisp_Object value,
		       Error_behavior errb)
{
  Lisp_Object rest;

  /* #### should deal with ERRB */
  EXTERNAL_LIST_LOOP (rest, value)
    {
      Lisp_Object range = XCAR (rest);
      struct chartab_range dummy;

      rest = XCDR (rest);
      if (!CONSP (rest))
	signal_simple_error ("Invalid list format", value);
      if (CONSP (range))
	{
	  if (!CONSP (XCDR (range))
	      || !NILP (XCDR (XCDR (range))))
	    signal_simple_error ("Invalid range format", range);
	  decode_char_table_range (XCAR (range), &dummy);
	  decode_char_table_range (XCAR (XCDR (range)), &dummy);
	}
      else
	decode_char_table_range (range, &dummy);
    }

  return 1;
}

static Lisp_Object
chartab_instantiate (Lisp_Object data)
{
  Lisp_Object chartab;
  Lisp_Object type = Qgeneric;
  Lisp_Object dataval = Qnil;

  while (!NILP (data))
    {
      Lisp_Object keyw = Fcar (data);
      Lisp_Object valw;

      data = Fcdr (data);
      valw = Fcar (data);
      data = Fcdr (data);
      if (EQ (keyw, Qtype))
	type = valw;
      else if (EQ (keyw, Qdata))
	dataval = valw;
    }

  chartab = Fmake_char_table (type);

  data = dataval;
  while (!NILP (data))
    {
      Lisp_Object range = Fcar (data);
      Lisp_Object val = Fcar (Fcdr (data));

      data = Fcdr (Fcdr (data));
      if (CONSP (range))
        {
	  if (CHAR_OR_CHAR_INTP (XCAR (range)))
	    {
	      Emchar first = XCHAR_OR_CHAR_INT (Fcar (range));
	      Emchar last = XCHAR_OR_CHAR_INT (Fcar (Fcdr (range)));
	      Emchar i;

	      for (i = first; i <= last; i++)
		 Fput_char_table (make_char (i), val, chartab);
	    }
	  else
	    ABORT ();
	}
      else
	Fput_char_table (range, val, chartab);
    }

  return chartab;
}

#ifdef MULE


/************************************************************************/
/*                     Category Tables, specifically                    */
/************************************************************************/

DEFUN ("category-table-p", Fcategory_table_p, 1, 1, 0, /*
Return t if OBJECT is a category table.
A category table is a type of char table used for keeping track of
categories.  Categories are used for classifying characters for use
in regexps -- you can refer to a category rather than having to use
a complicated [] expression (and category lookups are significantly
faster).

There are 95 different categories available, one for each printable
character (including space) in the ASCII charset.  Each category
is designated by one such character, called a "category designator".
They are specified in a regexp using the syntax "\\cX", where X is
a category designator.

A category table specifies, for each character, the categories that
the character is in.  Note that a character can be in more than one
category.  More specifically, a category table maps from a character
to either the value nil (meaning the character is in no categories)
or a 95-element bit vector, specifying for each of the 95 categories
whether the character is in that category.

Special Lisp functions are provided that abstract this, so you do not
have to directly manipulate bit vectors.
*/
       (object))
{
  return (CHAR_TABLEP (object) &&
	  XCHAR_TABLE_TYPE (object) == CHAR_TABLE_TYPE_CATEGORY) ?
    Qt : Qnil;
}

static Lisp_Object
check_category_table (Lisp_Object object, Lisp_Object default_)
{
  if (NILP (object))
    object = default_;
  while (NILP (Fcategory_table_p (object)))
    object = wrong_type_argument (Qcategory_table_p, object);
  return object;
}

int
check_category_char (Emchar ch, Lisp_Object table,
		     unsigned int designator, unsigned int not_p)
{
  REGISTER Lisp_Object temp;
  Lisp_Char_Table *ctbl;
#ifdef ERROR_CHECK_TYPECHECK
  if (NILP (Fcategory_table_p (table)))
    signal_simple_error ("Expected category table", table);
#endif
  ctbl = XCHAR_TABLE (table);
  temp = get_char_table (ch, ctbl);
  if (NILP (temp))
    return not_p;

  designator -= ' ';
  return bit_vector_bit (XBIT_VECTOR (temp), designator) ? !not_p : not_p;
}

DEFUN ("check-category-at", Fcheck_category_at, 2, 4, 0, /*
Return t if category of the character at POSITION includes DESIGNATOR.
Optional third arg BUFFER specifies which buffer to use, and defaults
to the current buffer.
Optional fourth arg CATEGORY-TABLE specifies the category table to
use, and defaults to BUFFER's category table.
*/
       (position, designator, buffer, category_table))
{
  Lisp_Object ctbl;
  Emchar ch;
  unsigned int des;
  struct buffer *buf = decode_buffer (buffer, 0);

  CHECK_INT (position);
  CHECK_CATEGORY_DESIGNATOR (designator);
  des = XCHAR (designator);
  ctbl = check_category_table (category_table, Vstandard_category_table);
  ch = BUF_FETCH_CHAR (buf, XINT (position));
  return check_category_char (ch, ctbl, des, 0) ? Qt : Qnil;
}

DEFUN ("char-in-category-p", Fchar_in_category_p, 2, 3, 0, /*
Return t if category of CHARACTER includes DESIGNATOR, else nil.
Optional third arg CATEGORY-TABLE specifies the category table to use,
and defaults to the standard category table.
*/
       (character, designator, category_table))
{
  Lisp_Object ctbl;
  Emchar ch;
  unsigned int des;

  CHECK_CATEGORY_DESIGNATOR (designator);
  des = XCHAR (designator);
  CHECK_CHAR (character);
  ch = XCHAR (character);
  ctbl = check_category_table (category_table, Vstandard_category_table);
  return check_category_char (ch, ctbl, des, 0) ? Qt : Qnil;
}

DEFUN ("category-table", Fcategory_table, 0, 1, 0, /*
Return BUFFER's current category table.
BUFFER defaults to the current buffer.
*/
       (buffer))
{
  return decode_buffer (buffer, 0)->category_table;
}

DEFUN ("standard-category-table", Fstandard_category_table, 0, 0, 0, /*
Return the standard category table.
This is the one used for new buffers.
*/
       ())
{
  return Vstandard_category_table;
}

DEFUN ("copy-category-table", Fcopy_category_table, 0, 1, 0, /*
Return a new category table which is a copy of CATEGORY-TABLE.
CATEGORY-TABLE defaults to the standard category table.
*/
       (category_table))
{
  if (NILP (Vstandard_category_table))
    return Fmake_char_table (Qcategory);

  category_table =
    check_category_table (category_table, Vstandard_category_table);
  return Fcopy_char_table (category_table);
}

DEFUN ("set-category-table", Fset_category_table, 1, 2, 0, /*
Select CATEGORY-TABLE as the new category table for BUFFER.
BUFFER defaults to the current buffer if omitted.
*/
       (category_table, buffer))
{
  struct buffer *buf = decode_buffer (buffer, 0);
  category_table = check_category_table (category_table, Qnil);
  buf->category_table = category_table;
  /* Indicate that this buffer now has a specified category table.  */
  buf->local_var_flags |= XINT (buffer_local_flags.category_table);
  return category_table;
}

DEFUN ("category-designator-p", Fcategory_designator_p, 1, 1, 0, /*
Return t if OBJECT is a category designator (a char in the range ' ' to '~').
*/
       (object))
{
  return CATEGORY_DESIGNATORP (object) ? Qt : Qnil;
}

DEFUN ("category-table-value-p", Fcategory_table_value_p, 1, 1, 0, /*
Return t if OBJECT is a category table value.
Valid values are nil or a bit vector of size 95.
*/
       (object))
{
  return CATEGORY_TABLE_VALUEP (object) ? Qt : Qnil;
}


#define CATEGORYP(x) \
  (CHARP (x) && XCHAR (x) >= 0x20 && XCHAR (x) <= 0x7E)

#define CATEGORY_SET(c)						\
  (get_char_table(c, XCHAR_TABLE(current_buffer->category_table)))

/* Return 1 if CATEGORY_SET contains CATEGORY, else return 0.
   The faster version of `!NILP (Faref (category_set, category))'.  */
#define CATEGORY_MEMBER(category, category_set)		 	\
  (bit_vector_bit(XBIT_VECTOR (category_set), category - 32))

/* Return 1 if there is a word boundary between two word-constituent
   characters C1 and C2 if they appear in this order, else return 0.
   Use the macro WORD_BOUNDARY_P instead of calling this function
   directly.  */

int word_boundary_p (Emchar c1, Emchar c2);
int
word_boundary_p (Emchar c1, Emchar c2)
{
  Lisp_Object category_set1, category_set2;
  Lisp_Object tail;
  int default_result;

#if 0
  if (COMPOSITE_CHAR_P (c1))
    c1 = cmpchar_component (c1, 0, 1);
  if (COMPOSITE_CHAR_P (c2))
    c2 = cmpchar_component (c2, 0, 1);
#endif

#ifndef UTF2000
  if (EQ (CHAR_CHARSET (c1), CHAR_CHARSET (c2)))
#endif
    {
      tail = Vword_separating_categories;
      default_result = 0;
    }
#ifndef UTF2000
  else
    {
      tail = Vword_combining_categories;
      default_result = 1;
    }
#endif

  category_set1 = CATEGORY_SET (c1);
  if (NILP (category_set1))
    return default_result;
  category_set2 = CATEGORY_SET (c2);
  if (NILP (category_set2))
    return default_result;

  for (; CONSP (tail); tail = XCONS (tail)->cdr)
    {
      Lisp_Object elt = XCONS(tail)->car;

      if (CONSP (elt)
	  && CATEGORYP (XCONS (elt)->car)
	  && CATEGORYP (XCONS (elt)->cdr)
	  && CATEGORY_MEMBER (XCHAR (XCONS (elt)->car), category_set1)
	  && CATEGORY_MEMBER (XCHAR (XCONS (elt)->cdr), category_set2))
	return !default_result;
    }
  return default_result;
}
#endif /* MULE */


void
syms_of_chartab (void)
{
#if defined(UTF2000) || defined(HAVE_CONCORD)
  defsymbol (&Q_subsumptive,		"->subsumptive");
  defsymbol (&Q_subsumptive_from,	"<-subsumptive");
  defsymbol (&Q_denotational,		"->denotational");
  defsymbol (&Q_denotational_from,	"<-denotational");
#endif
#ifdef UTF2000
  INIT_LRECORD_IMPLEMENTATION (uint8_byte_table);
  INIT_LRECORD_IMPLEMENTATION (uint16_byte_table);
  INIT_LRECORD_IMPLEMENTATION (byte_table);

  defsymbol (&Qto_ucs,			"=>ucs");
  defsymbol (&Q_ucs_unified,		"->ucs-unified");
  defsymbol (&Q_identical,		"->identical");
  defsymbol (&Q_identical_from,		"<-identical");
  defsymbol (&Q_component,		"->ideographic-component-forms");
  defsymbol (&Q_component_of,		"<-ideographic-component-forms");
  defsymbol (&Qcomposition,		"composition");
  defsymbol (&Qrep_decomposition,	"=decomposition");
  defsymbol (&Qto_decomposition_at_superscript,
	     "=>decomposition@superscript");
  defsymbol (&Qto_decomposition_at_circled, "=>decomposition@circled");
  defsymbol (&Q_canonical,		"->canonical");
  defsymbol (&Q_halfwidth_of,		"<-halfwidth");
  defsymbol (&Q_superscript_of,		"<-superscript");
  defsymbol (&Q_subscript_of,		"<-subscript");
  defsymbol (&Q_circled_of,		"<-circled");
  defsymbol (&Q_decomposition,		"->decomposition");
  defsymbol (&Qcompat,			"compat");
  defsymbol (&Qisolated,		"isolated");
  defsymbol (&Qinitial,			"initial");
  defsymbol (&Qmedial,			"medial");
  defsymbol (&Qfinal,			"final");
  defsymbol (&Qvertical,		"vertical");
  defsymbol (&QnoBreak,			"noBreak");
  defsymbol (&Qfraction,		"fraction");
  defsymbol (&Qsuper,			"super");
  defsymbol (&Qsub,			"sub");
  defsymbol (&Qcircle,			"circle");
  defsymbol (&Qsquare,			"square");
  defsymbol (&Qwide,			"wide");
  defsymbol (&Qnarrow,			"narrow");
  defsymbol (&Qsmall,			"small");
  defsymbol (&Qfont,			"font");

  DEFSUBR (Fchar_attribute_list);
  DEFSUBR (Ffind_char_attribute_table);
  defsymbol (&Qput_char_table_map_function, "put-char-table-map-function");
  DEFSUBR (Fput_char_table_map_function);
#ifdef HAVE_CHISE
  DEFSUBR (Fsave_char_attribute_table);
  DEFSUBR (Fmount_char_attribute_table);
  DEFSUBR (Freset_char_attribute_table);
  DEFSUBR (Fclose_char_attribute_table);
  DEFSUBR (Fclose_char_data_source);
#ifndef HAVE_LIBCHISE
  defsymbol (&Qload_char_attribute_table_map_function,
	     "load-char-attribute-table-map-function");
  DEFSUBR (Fload_char_attribute_table_map_function);
#endif
  DEFSUBR (Fload_char_attribute_table);
#endif
  DEFSUBR (Fchar_feature_base_name_eq);
  DEFSUBR (Fchar_feature);
  DEFSUBR (Fchar_attribute_alist);
  DEFSUBR (Fget_char_attribute);
  DEFSUBR (Fput_char_attribute);
  DEFSUBR (Fremove_char_attribute);
  DEFSUBR (Fmap_char_attribute);
  DEFSUBR (Fdefine_char);
  DEFSUBR (Ffind_char);
  DEFSUBR (Fchar_variants);

  DEFSUBR (Fget_composite_char);
#ifdef HAVE_LIBCHISE
  DEFSUBR (Fchar_feature_property);
  DEFSUBR (Fput_char_feature_property);
#endif /* HAVE_LIBCHISE */
#endif

  INIT_LRECORD_IMPLEMENTATION (char_table);

#ifdef MULE
#ifndef UTF2000
  INIT_LRECORD_IMPLEMENTATION (char_table_entry);
#endif

  defsymbol (&Qcategory_table_p, "category-table-p");
  defsymbol (&Qcategory_designator_p, "category-designator-p");
  defsymbol (&Qcategory_table_value_p, "category-table-value-p");
#endif /* MULE */

  defsymbol (&Qchar_table, "char-table");
  defsymbol (&Qchar_tablep, "char-table-p");

  DEFSUBR (Fchar_table_p);
  DEFSUBR (Fchar_table_type_list);
  DEFSUBR (Fvalid_char_table_type_p);
  DEFSUBR (Fchar_table_type);
  DEFSUBR (Freset_char_table);
  DEFSUBR (Fmake_char_table);
  DEFSUBR (Fcopy_char_table);
  DEFSUBR (Fget_char_table);
  DEFSUBR (Fget_range_char_table);
  DEFSUBR (Fvalid_char_table_value_p);
  DEFSUBR (Fcheck_valid_char_table_value);
  DEFSUBR (Fput_char_table);
  DEFSUBR (Fmap_char_table);

#ifdef MULE
  DEFSUBR (Fcategory_table_p);
  DEFSUBR (Fcategory_table);
  DEFSUBR (Fstandard_category_table);
  DEFSUBR (Fcopy_category_table);
  DEFSUBR (Fset_category_table);
  DEFSUBR (Fcheck_category_at);
  DEFSUBR (Fchar_in_category_p);
  DEFSUBR (Fcategory_designator_p);
  DEFSUBR (Fcategory_table_value_p);
#endif /* MULE */

}

void
vars_of_chartab (void)
{
#ifdef UTF2000
  DEFVAR_LISP ("next-defined-char-id", &Vnext_defined_char_id /*
*/ );
  Vnext_defined_char_id = make_int (0x0F0000);
#endif

#ifdef HAVE_CHISE
  DEFVAR_LISP ("char-db-stingy-mode", &Vchar_db_stingy_mode /*
*/ );
  Vchar_db_stingy_mode = Qt;

#ifdef HAVE_LIBCHISE
  Vchise_db_directory = build_string(chise_db_dir);
  DEFVAR_LISP ("chise-db-directory", &Vchise_db_directory /*
Directory of CHISE character databases.
*/ );

  Vchise_system_db_directory = build_string(chise_system_db_dir);
  DEFVAR_LISP ("chise-system-db-directory", &Vchise_system_db_directory /*
Directory of system character database of CHISE.
*/ );
#endif

#endif /* HAVE_CHISE */
  /* DO NOT staticpro this.  It works just like Vweak_hash_tables. */
  Vall_syntax_tables = Qnil;
  dump_add_weak_object_chain (&Vall_syntax_tables);
}

void
structure_type_create_chartab (void)
{
  struct structure_type *st;

  st = define_structure_type (Qchar_table, 0, chartab_instantiate);

  define_structure_type_keyword (st, Qtype, chartab_type_validate);
  define_structure_type_keyword (st, Qdata, chartab_data_validate);
}

void
complex_vars_of_chartab (void)
{
#ifdef UTF2000
  staticpro (&Vchar_attribute_hash_table);
  Vchar_attribute_hash_table
    = make_lisp_hash_table (16, HASH_TABLE_NON_WEAK, HASH_TABLE_EQ);
#endif /* UTF2000 */
#ifdef MULE
  /* Set this now, so first buffer creation can refer to it. */
  /* Make it nil before calling copy-category-table
     so that copy-category-table will know not to try to copy from garbage */
  Vstandard_category_table = Qnil;
  Vstandard_category_table = Fcopy_category_table (Qnil);
  staticpro (&Vstandard_category_table);

  DEFVAR_LISP ("word-combining-categories", &Vword_combining_categories /*
List of pair (cons) of categories to determine word boundary.

Emacs treats a sequence of word constituent characters as a single
word (i.e. finds no word boundary between them) iff they belongs to
the same charset.  But, exceptions are allowed in the following cases.

\(1) The case that characters are in different charsets is controlled
by the variable `word-combining-categories'.

Emacs finds no word boundary between characters of different charsets
if they have categories matching some element of this list.

More precisely, if an element of this list is a cons of category CAT1
and CAT2, and a multibyte character C1 which has CAT1 is followed by
C2 which has CAT2, there's no word boundary between C1 and C2.

For instance, to tell that ASCII characters and Latin-1 characters can
form a single word, the element `(?l . ?l)' should be in this list
because both characters have the category `l' (Latin characters).

\(2) The case that character are in the same charset is controlled by
the variable `word-separating-categories'.

Emacs find a word boundary between characters of the same charset
if they have categories matching some element of this list.

More precisely, if an element of this list is a cons of category CAT1
and CAT2, and a multibyte character C1 which has CAT1 is followed by
C2 which has CAT2, there's a word boundary between C1 and C2.

For instance, to tell that there's a word boundary between Japanese
Hiragana and Japanese Kanji (both are in the same charset), the
element `(?H . ?C) should be in this list.
*/ );

  Vword_combining_categories = Qnil;

  DEFVAR_LISP ("word-separating-categories", &Vword_separating_categories /*
List of pair (cons) of categories to determine word boundary.
See the documentation of the variable `word-combining-categories'.
*/ );

  Vword_separating_categories = Qnil;
#endif /* MULE */
}
