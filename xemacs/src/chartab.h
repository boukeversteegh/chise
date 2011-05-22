/* Declarations having to do with Mule char tables.
   Copyright (C) 1992 Free Software Foundation, Inc.
   Copyright (C) 1995 Sun Microsystems, Inc.
   Copyright (C) 1999,2000,2001,2002,2003,2004,2006,2010 MORIOKA Tomohiko

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

#ifndef INCLUDED_chartab_h_
#define INCLUDED_chartab_h_


#ifdef UTF2000

#ifdef HAVE_CHISE
#  ifdef HAVE_LIBCHISE
#    include <chise.h>
#  else /* HAVE_LIBCHISE */
#    include "database.h"
#  endif /* not HAVE_LIBCHISE */
#endif

EXFUN (Fmake_char, 3);
EXFUN (Fdecode_char, 4);

EXFUN (Fput_char_attribute, 3);

EXFUN (Fdefine_char, 1);

EXFUN (Ffind_char, 1);

extern Lisp_Object Qdowncase, Qflippedcase, Q_lowercase, Q_uppercase;

#ifdef HAVE_LIBCHISE
extern CHISE_DS *default_chise_data_source;

int open_chise_data_source_maybe (void);
#endif

#if defined(UTF2000) || defined(HAVE_CONCORD)
extern Lisp_Object Q_denotational;
extern Lisp_Object Q_denotational_from;
extern Lisp_Object Q_subsumptive;
extern Lisp_Object Q_subsumptive_from;
#endif

#ifdef HAVE_CONCORD
extern Lisp_Object Vchise_system_db_directory;
#endif

/************************************************************************/
/*			    Char-ID Tables                              */
/************************************************************************/

struct Lisp_Uint8_Byte_Table
{
  struct lcrecord_header header;

  unsigned char property[256];
};
typedef struct Lisp_Uint8_Byte_Table Lisp_Uint8_Byte_Table;

DECLARE_LRECORD (uint8_byte_table, Lisp_Uint8_Byte_Table);
#define XUINT8_BYTE_TABLE(x) \
   XRECORD (x, uint8_byte_table, Lisp_Uint8_Byte_Table)
#define XSETUINT8_BYTE_TABLE(x, p) XSETRECORD (x, p, uint8_byte_table)
#define UINT8_BYTE_TABLE_P(x) RECORDP (x, uint8_byte_table)
#define GC_UINT8_BYTE_TABLE_P(x) GC_RECORDP (x, uint8_byte_table)
/* #define CHECK_UINT8_BYTE_TABLE(x) CHECK_RECORD (x, uint8_byte_table)
   char table entries should never escape to Lisp */


struct Lisp_Uint16_Byte_Table
{
  struct lcrecord_header header;

  unsigned short property[256];
};
typedef struct Lisp_Uint16_Byte_Table Lisp_Uint16_Byte_Table;

DECLARE_LRECORD (uint16_byte_table, Lisp_Uint16_Byte_Table);
#define XUINT16_BYTE_TABLE(x) \
   XRECORD (x, uint16_byte_table, Lisp_Uint16_Byte_Table)
#define XSETUINT16_BYTE_TABLE(x, p) XSETRECORD (x, p, uint16_byte_table)
#define UINT16_BYTE_TABLE_P(x) RECORDP (x, uint16_byte_table)
#define GC_UINT16_BYTE_TABLE_P(x) GC_RECORDP (x, uint16_byte_table)
/* #define CHECK_UINT16_BYTE_TABLE(x) CHECK_RECORD (x, uint16_byte_table)
   char table entries should never escape to Lisp */


struct Lisp_Byte_Table
{
  struct lcrecord_header header;

  Lisp_Object property[256];
};
typedef struct Lisp_Byte_Table Lisp_Byte_Table;

DECLARE_LRECORD (byte_table, Lisp_Byte_Table);
#define XBYTE_TABLE(x) XRECORD (x, byte_table, Lisp_Byte_Table)
#define XSETBYTE_TABLE(x, p) XSETRECORD (x, p, byte_table)
#define BYTE_TABLE_P(x) RECORDP (x, byte_table)
#define GC_BYTE_TABLE_P(x) GC_RECORDP (x, byte_table)
/* #define CHECK_BYTE_TABLE(x) CHECK_RECORD (x, byte_table)
   char table entries should never escape to Lisp */

Lisp_Object get_byte_table (Lisp_Object table, unsigned char idx);

Lisp_Object put_byte_table (Lisp_Object table, unsigned char idx,
			    Lisp_Object value);


Lisp_Object make_char_id_table (Lisp_Object initval);

#endif


/************************************************************************/
/*                               Char Tables                            */
/************************************************************************/

/* Under Mule, we use a complex representation (see below).
   When not under Mule, there are only 256 possible characters
   so we just represent them directly. */

#if defined(MULE)&&!defined(UTF2000)

struct Lisp_Char_Table_Entry
{
  struct lcrecord_header header;

  /* In the interests of simplicity, we just use a fixed 96-entry
     table.  If we felt like being smarter, we could make this
     variable-size and add an offset value into this structure. */
  Lisp_Object level2[96];
};
typedef struct Lisp_Char_Table_Entry Lisp_Char_Table_Entry;

DECLARE_LRECORD (char_table_entry, Lisp_Char_Table_Entry);
#define XCHAR_TABLE_ENTRY(x) \
  XRECORD (x, char_table_entry, Lisp_Char_Table_Entry)
#define XSETCHAR_TABLE_ENTRY(x, p) XSETRECORD (x, p, char_table_entry)
#define CHAR_TABLE_ENTRYP(x) RECORDP (x, char_table_entry)
/* #define CHECK_CHAR_TABLE_ENTRY(x) CHECK_RECORD (x, char_table_entry)
   char table entries should never escape to Lisp */

#endif /* MULE */

enum char_table_type
{
  CHAR_TABLE_TYPE_GENERIC,
#ifdef MULE
  CHAR_TABLE_TYPE_CATEGORY,
#endif
  CHAR_TABLE_TYPE_SYNTAX,
  CHAR_TABLE_TYPE_DISPLAY,
  CHAR_TABLE_TYPE_CHAR
};

#ifndef UTF2000
#ifdef MULE
#define NUM_ASCII_CHARS 160
#else
#define NUM_ASCII_CHARS 256
#endif
#endif

struct Lisp_Char_Table
{
  struct lcrecord_header header;

#ifdef UTF2000
  Lisp_Object table;
  Lisp_Object default_value;
  Lisp_Object name;
#ifndef HAVE_LIBCHISE
  Lisp_Object db;
#endif
  unsigned char unloaded;
#else
  Lisp_Object ascii[NUM_ASCII_CHARS];

#ifdef MULE
  /* We basically duplicate the Mule vectors-of-vectors implementation.
     We can do this because we know a great deal about the sorts of
     things we are going to be indexing.

     The current implementation is as follows:

     ascii[0-159] is used for ASCII and Control-1 characters.

     level1[0 .. (NUM_LEADING_BYTES-1)] indexes charsets by leading
     byte (subtract MIN_LEADING_BYTE from the leading byte).  If the
     value of this is not an opaque, then it specifies a value for all
     characters in the charset.  Otherwise, it will be a
     96-Lisp-Object opaque that we created, specifying a value for
     each row.  If the value of this is not an opaque, then it
     specifies a value for all characters in the row.  Otherwise, it
     will be a 96-Lisp-Object opaque that we created, specifying a
     value for each character.

     NOTE: 1) This will fail if some C routine passes an opaque to
              Fput_char_table().  Currently this is not a problem
	      since all char tables that are created are Lisp-visible
	      and thus no one should ever be putting an opaque in
	      a char table.  Another possibility is to consider
	      adding a type to */

  Lisp_Object level1[NUM_LEADING_BYTES];

#endif /* MULE */
#endif /* non UTF2000 */

  enum char_table_type type;

#ifndef UTF2000
  /* stuff used for syntax tables */
  Lisp_Object mirror_table;
#endif
  Lisp_Object next_table; /* DO NOT mark through this. */
};
typedef struct Lisp_Char_Table Lisp_Char_Table;

DECLARE_LRECORD (char_table, Lisp_Char_Table);
#define XCHAR_TABLE(x) XRECORD (x, char_table, Lisp_Char_Table)
#define XSETCHAR_TABLE(x, p) XSETRECORD (x, p, char_table)
#define CHAR_TABLEP(x) RECORDP (x, char_table)
#define CHECK_CHAR_TABLE(x) CHECK_RECORD (x, char_table)
#define CONCHECK_CHAR_TABLE(x) CONCHECK_RECORD (x, char_table)

#define CHAR_TABLE_TYPE(ct) ((ct)->type)
#define XCHAR_TABLE_TYPE(ct) CHAR_TABLE_TYPE (XCHAR_TABLE (ct))

#ifdef UTF2000

#define CHAR_TABLE_NAME(ct) ((ct)->name)
#define XCHAR_TABLE_NAME(ct) CHAR_TABLE_NAME (XCHAR_TABLE (ct))

#define CHAR_TABLE_UNLOADED(ct) ((ct)->unloaded)
#define XCHAR_TABLE_UNLOADED(ct) CHAR_TABLE_UNLOADED (XCHAR_TABLE (ct))

INLINE_HEADER Lisp_Object
CHAR_TABLE_VALUE_UNSAFE (Lisp_Char_Table *ct, Emchar ch);
INLINE_HEADER Lisp_Object
CHAR_TABLE_VALUE_UNSAFE (Lisp_Char_Table *ct, Emchar ch)
{
  Lisp_Object val = get_byte_table (get_byte_table
				    (get_byte_table
				     (get_byte_table
				      (ct->table,
				       (unsigned char)(ch >> 24)),
				      (unsigned char) (ch >> 16)),
				     (unsigned char)  (ch >> 8)),
				    (unsigned char)    ch);
  if (UNBOUNDP (val))
    return ct->default_value;
  else
    return val;
}

#elif defined(MULE)

Lisp_Object get_non_ascii_char_table_value (Lisp_Char_Table *ct,
					    Charset_ID leading_byte,
					    Emchar c);

INLINE_HEADER Lisp_Object
CHAR_TABLE_NON_ASCII_VALUE_UNSAFE (Lisp_Char_Table *ct, Emchar ch);
INLINE_HEADER Lisp_Object
CHAR_TABLE_NON_ASCII_VALUE_UNSAFE (Lisp_Char_Table *ct, Emchar ch)
{
#ifdef UTF2000
  Charset_ID lb = CHAR_CHARSET_ID (ch);
#else
  Charset_ID lb = CHAR_LEADING_BYTE (ch);
#endif
  if (!CHAR_TABLE_ENTRYP ((ct)->level1[lb - MIN_LEADING_BYTE]))
    return (ct)->level1[lb - MIN_LEADING_BYTE];
  else
    return get_non_ascii_char_table_value (ct, lb, ch);
}

#define CHAR_TABLE_VALUE_UNSAFE(ct, ch)		\
  ((ch) < NUM_ASCII_CHARS			\
   ? (ct)->ascii[ch]				\
   : CHAR_TABLE_NON_ASCII_VALUE_UNSAFE (ct, ch))

#else /* not MULE */

#define CHAR_TABLE_VALUE_UNSAFE(ct, ch)	((ct)->ascii[(unsigned char) (ch)])

#endif /* not MULE */

#define XCHAR_TABLE_VALUE_UNSAFE(ct, ch) \
  CHAR_TABLE_VALUE_UNSAFE (XCHAR_TABLE (ct), ch)

enum chartab_range_type
{
  CHARTAB_RANGE_ALL,
#ifdef UTF2000
  CHARTAB_RANGE_DEFAULT,
#endif
#ifdef MULE
  CHARTAB_RANGE_CHARSET,
  CHARTAB_RANGE_ROW,
#endif
  CHARTAB_RANGE_CHAR
};

struct chartab_range
{
  enum chartab_range_type type;
  Emchar ch;
  Lisp_Object charset;
  int row;
};

void fill_char_table (Lisp_Char_Table *ct, Lisp_Object value);
void put_char_table (Lisp_Char_Table *ct, struct chartab_range *range,
		     Lisp_Object val);
Lisp_Object get_char_table (Emchar, Lisp_Char_Table *);
int map_char_table (Lisp_Char_Table *ct,
		    struct chartab_range *range,
		    int (*fn) (struct chartab_range *range,
			       Lisp_Object val, void *arg),
		    void *arg);
void prune_syntax_tables (void);

EXFUN (Fcopy_char_table, 1);
EXFUN (Fmake_char_table, 1);
EXFUN (Fput_char_table, 3);
EXFUN (Fget_char_table, 2);

extern Lisp_Object Vall_syntax_tables;


#ifdef UTF2000

INLINE_HEADER void
put_char_id_table_0 (Lisp_Char_Table* cit, Emchar code, Lisp_Object value);
INLINE_HEADER void
put_char_id_table_0 (Lisp_Char_Table* cit, Emchar code, Lisp_Object value)
{
  Lisp_Object table1, table2, table3, table4;
	
  table1 = cit->table;
  table2 = get_byte_table (table1, (unsigned char)(code >> 24));
  table3 = get_byte_table (table2, (unsigned char)(code >> 16));
  table4 = get_byte_table (table3, (unsigned char)(code >>  8));

  table4     = put_byte_table (table4, (unsigned char) code, value);
  table3     = put_byte_table (table3, (unsigned char)(code >>  8), table4);
  table2     = put_byte_table (table2, (unsigned char)(code >> 16), table3);
  cit->table = put_byte_table (table1, (unsigned char)(code >> 24), table2);
}

#ifdef HAVE_CHISE
Lisp_Object load_char_attribute_maybe (Lisp_Char_Table* cit, Emchar ch);

#ifndef HAVE_LIBCHISE
extern Lisp_Object Qsystem_char_id;

Lisp_Object
char_attribute_system_db_file (Lisp_Object key_type, Lisp_Object attribute,
			       int writing_mode);
#endif /* not HAVE_LIBCHISE */
#endif /* HAVE_CHISE */

INLINE_HEADER Lisp_Object
get_char_id_table_0 (Lisp_Char_Table* cit, Emchar ch);
INLINE_HEADER Lisp_Object
get_char_id_table_0 (Lisp_Char_Table* cit, Emchar ch)
{
  return get_byte_table (get_byte_table
			 (get_byte_table
			  (get_byte_table
			   (cit->table,
			    (unsigned char)(ch >> 24)),
			   (unsigned char) (ch >> 16)),
			  (unsigned char)  (ch >> 8)),
			 (unsigned char)    ch);
}

INLINE_HEADER Lisp_Object
get_char_id_table (Lisp_Char_Table* cit, Emchar ch);
INLINE_HEADER Lisp_Object
get_char_id_table (Lisp_Char_Table* cit, Emchar ch)
{
  Lisp_Object val = get_char_id_table_0 (cit, ch);

#ifdef HAVE_CHISE
  if (EQ (val, Qunloaded))
    {
      val = load_char_attribute_maybe (cit, ch);
      put_char_id_table_0 (cit, ch, val);
    }
#endif /* HAVE_CHISE */
  if (UNBOUNDP (val))
    return cit->default_value;
  else
    return val;
}

void
decode_char_table_range (Lisp_Object range, struct chartab_range *outrange);

INLINE_HEADER void
put_char_id_table (Lisp_Char_Table* table,
		   Lisp_Object character, Lisp_Object value);
INLINE_HEADER void
put_char_id_table (Lisp_Char_Table* table,
		   Lisp_Object character, Lisp_Object value)
{
  struct chartab_range range;

  decode_char_table_range (character, &range);
  put_char_table (table, &range, value);
}


EXFUN (Fget_char_attribute, 3);
EXFUN (Fchar_feature, 5);

#endif


#ifdef MULE
int check_category_char(Emchar ch, Lisp_Object ctbl,
		        unsigned int designator, unsigned int not_p);

extern Lisp_Object Vstandard_category_table;

#define CATEGORY_DESIGNATORP(x) \
 (CHARP (x) && XCHAR (x) >= 32 && XCHAR (x) <= 126)

#define CHECK_CATEGORY_DESIGNATOR(x) do {			\
  if (!CATEGORY_DESIGNATORP (x))				\
    dead_wrong_type_argument (Qcategory_designator_p, x);	\
} while (0)

#define CONCHECK_CATEGORY_DESIGNATOR(x) do {			\
  if (!CATEGORY_DESIGNATORP (x))				\
    x = wrong_type_argument (Qcategory_designator_p, x);	\
} while (0)

#define CATEGORY_TABLE_VALUEP(x) \
 (NILP (x) || (BIT_VECTORP (x) && (bit_vector_length (XBIT_VECTOR (x)) == 95)))

#define CHECK_CATEGORY_TABLE_VALUE(x) do {			\
  if (!CATEGORY_TABLE_VALUEP (x))				\
    dead_wrong_type_argument (Qcategory_table_value_p, x);	\
} while (0)

#define CONCHECK_CATEGORY_TABLE_VALUE(x) do {			\
  if (!CATEGORY_TABLE_VALUEP (x))				\
    x = wrong_type_argument (Qcategory_table_value_p, x);	\
} while (0)

#endif /* MULE */

#endif /* INCLUDED_chartab_h_ */
