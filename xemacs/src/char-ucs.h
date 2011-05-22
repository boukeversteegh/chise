/* Header for UCS-4 character representation.
   Copyright (C) 1999,2000,2001,2002,2003,2004,2008,2009 MORIOKA Tomohiko

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

#ifndef INCLUDED_char_ucs_h_
#define INCLUDED_char_ucs_h_

#include "chartab.h"
#include "elhash.h"

EXFUN (Fmake_directory_internal, 1);

extern Lisp_Object Vchar_attribute_hash_table;

#define valid_char_p(ch) 1

#define CHAR_ASCII_P(ch) ((ch) <= 0x7F)


/************************************************************************/
/*                            Exported functions                        */
/************************************************************************/

extern Lisp_Object Vcharset_ucs;
extern Lisp_Object Vcharset_latin_jisx0201;
extern Lisp_Object Vcharset_chinese_big5;
extern Lisp_Object Vcharset_chinese_big5_1;
extern Lisp_Object Vcharset_chinese_big5_2;
extern Lisp_Object Vcharset_japanese_jisx0208;
extern Lisp_Object Vcharset_japanese_jisx0208_1990;
extern Lisp_Object Vcharset_japanese_jisx0212;

EXFUN (Fget_charset, 1);

extern Lisp_Object Qsystem_char_id;
extern Lisp_Object Qrep_ucs, Qucs;
extern Lisp_Object Q_subsumptive, Q_denotational;

Lisp_Object put_char_ccs_code_point (Lisp_Object character,
				     Lisp_Object ccs, Lisp_Object value);
Lisp_Object remove_char_ccs (Lisp_Object character, Lisp_Object ccs);


/************************************************************************/
/*                    Definition of leading bytes                       */
/************************************************************************/

typedef short Charset_ID;

/* ISO/IEC 10646 */
#define LEADING_BYTE_UCS		(-177)

/* represent normal 80-9F */
#define LEADING_BYTE_CONTROL_1		(-77)

/* ISO/IEC 10646 BMP */
#define LEADING_BYTE_UCS_BMP		(-176)

#define LEADING_BYTE_SYSTEM_CHAR_ID	0

/* Japanese JIS X0208 Common	2/4 2/{(8),9,10,11} 4/2 (B) */
#define LEADING_BYTE_JIS_X0208 		1

/* Chinese GB 12345-1990 */
#define LEADING_BYTE_CHINESE_GB12345	2

#define LEADING_BYTE_CHINESE_BIG5	3

/* Big5 Level 1			2/4 2/{(8),9,10,11} 4/0 '0' */
#define LEADING_BYTE_CHINESE_BIG5_1	4

/* Big5 Level 2			2/4 2/{(8),9,10,11} 4/0 '1' */
#define LEADING_BYTE_CHINESE_BIG5_2	5

/* VISCII 1.1 */
#define LEADING_BYTE_LATIN_VISCII	6

/* MULE VISCII-LOWER			(CHARSET_ID_OFFSET_96 + '1') */
#define LEADING_BYTE_LATIN_VISCII_LOWER	7

/* MULE VISCII-UPPER			(CHARSET_ID_OFFSET_96 + '2') */
#define LEADING_BYTE_LATIN_VISCII_UPPER	8

#define LEADING_BYTE_ETHIOPIC_UCS	9

/* ISO/IEC 10646 SMP */
#define LEADING_BYTE_UCS_SMP		10

/* ISO/IEC 10646 SIP */
#define LEADING_BYTE_UCS_SIP		11

#define MIN_LEADING_BYTE_PRIVATE	12
#define MAX_LEADING_BYTE_PRIVATE	512


/* ISO 646 IRV */
#define LEADING_BYTE_ASCII		(  -6) /* (CHARSET_ID_OFFSET_94 + 'B') */

/* Right half of JIS X0201-1976 */
#define LEADING_BYTE_KATAKANA_JISX0201	( -13) /* (CHARSET_ID_OFFSET_94 + 'I') */

/* Left  half of JIS X0201-1976 */
#define LEADING_BYTE_LATIN_JISX0201	( -14) /* (CHARSET_ID_OFFSET_94 + 'J') */


/* Right half of ISO 8859-1 */
#define LEADING_BYTE_LATIN_ISO8859_1	(-100) /* (CHARSET_ID_OFFSET_96 + 'A') */

/* Right half of ISO 8859-2 */
#define LEADING_BYTE_LATIN_ISO8859_2	(-101) /* (CHARSET_ID_OFFSET_96 + 'B') */

/* Right half of ISO 8859-3 */
#define LEADING_BYTE_LATIN_ISO8859_3	(-109) /* (CHARSET_ID_OFFSET_96 + 'C') */

/* Right half of ISO 8859-4 */
#define LEADING_BYTE_LATIN_ISO8859_4	(-110) /* (CHARSET_ID_OFFSET_96 + 'D') */

/* Right half of ISO 8859-7 */
#define LEADING_BYTE_GREEK_ISO8859_7	(-126) /* (CHARSET_ID_OFFSET_96 + 'F') */

/* Right half of ISO 8859-6 */
#define LEADING_BYTE_ARABIC_ISO8859_6	(-127) /* (CHARSET_ID_OFFSET_96 + 'G') */

/* Right half of ISO 8859-8 */
#define LEADING_BYTE_HEBREW_ISO8859_8	(-138) /* (CHARSET_ID_OFFSET_96 + 'H') */

/* Right half of ISO 8859-5 */
#define LEADING_BYTE_CYRILLIC_ISO8859_5	(-144) /* (CHARSET_ID_OFFSET_96 + 'L') */

/* Right half of ISO 8859-9 */
#define LEADING_BYTE_LATIN_ISO8859_9	(-148) /* (CHARSET_ID_OFFSET_96 + 'M') */

/* TIS620-2533 */
#define LEADING_BYTE_THAI_TIS620	(-166) /* (CHARSET_ID_OFFSET_96 + 'T') */

/* Right-hand Part of the VSCII-2 (TCVN 5712:1983) */
#define LEADING_BYTE_LATIN_TCVN5712	(-180) /* F = 5/10 0x5A `Z' */


/* Japanese JIS X0208-1978	2/4 2/{(8),9,10,11} 4/0 (@) */
#define LEADING_BYTE_JAPANESE_JISX0208_1978	( -42)

/* Chinese Hanzi GB2312-1980	2/4 2/{(8),9,10,11} 4/1 (A) */
#define LEADING_BYTE_CHINESE_GB2312		( -58)

/* Japanese JIS X0208-1983	2/4 2/{(8),9,10,11} 4/2 (B) */
#define LEADING_BYTE_JAPANESE_JISX0208		( -87)

/* Japanese JIS X0208-1990	2/4 2/{(8),9,10,11} 4/2 (B) */
#define LEADING_BYTE_JAPANESE_JISX0208_1990	(-168)

/* Hangul KS C5601-1987		2/4 2/{8,9,10,11} 4/3 (C) */
#define LEADING_BYTE_KOREAN_KSC5601		(-149)

/* Japanese JIS X0212-1990	2/4 2/{8,9,10,11} 4/4 (D) */
#define LEADING_BYTE_JAPANESE_JISX0212		(-159)

/* CCITT Extended GB		2/4 2/{8,9,10,11} 4/5 (E) */
#define LEADING_BYTE_CHINESE_CCITT_GB		(-165)

/* Chinese CNS11643 Set 1	2/4 2/{8,9,10,11} 4/7 (G) */
#define LEADING_BYTE_CHINESE_CNS11643_1		(-171)

/* Chinese CNS11643 Set 2	2/4 2/{8,9,10,11} 4/8 (H) */
#define LEADING_BYTE_CHINESE_CNS11643_2		(-172)

/* Chinese CNS11643 Set 3	2/4 2/{8,9,10,11} 4/9 (I) */
#define LEADING_BYTE_CHINESE_CNS11643_3		-183

/* Chinese CNS11643 Set 4	2/4 2/{8,9,10,11} 4/10 (J) */
#define LEADING_BYTE_CHINESE_CNS11643_4		-184

/* Chinese CNS11643 Set 5	2/4 2/{8,9,10,11} 4/11 (K) */
#define LEADING_BYTE_CHINESE_CNS11643_5		-185

/* Chinese CNS11643 Set 6	2/4 2/{8,9,10,11} 4/12 (L) */
#define LEADING_BYTE_CHINESE_CNS11643_6		-186

/* Chinese CNS11643 Set 7	2/4 2/{8,9,10,11} 4/13 (M) */
#define LEADING_BYTE_CHINESE_CNS11643_7		-187

/* DPRK Hangul KPS 9566-1997	2/4 2/{8,9,10,11} 4/14 (N) */
#define LEADING_BYTE_KOREAN_KPS9566		-202


#define MIN_LEADING_BYTE	(- 80 * 3)

#define NUM_LEADING_BYTES	(MAX_LEADING_BYTE_PRIVATE - MIN_LEADING_BYTE)


/************************************************************************/
/*            Information about a particular character set              */
/************************************************************************/

struct Lisp_Charset
{
  struct lcrecord_header header;

  int id;
  Lisp_Object name;
  Lisp_Object doc_string;
  Lisp_Object registry;
  Lisp_Object short_name;
  Lisp_Object long_name;

  Lisp_Object reverse_direction_charset;

  Lisp_Object ccl_program;

  int iso_ir;

  /* Final byte of this character set in ISO2022 designating escape sequence */
  Bufbyte final;

  /* Number of columns a character in this charset takes up, on TTY
     devices.  Not used for X devices. */
  unsigned int columns;

  /* Direction of this character set */
  unsigned int direction;

  /* Number of bytes used in encoding of this character set (1 .. 4) */
  unsigned short dimension;

  /* Number of chars in each dimension (94, 96, 128, 256) */
  unsigned short chars;

  /* Which half of font to be used to display this character set */
  unsigned int graphic;

  /* Code-point->character mapping table */
  Lisp_Object decoding_table;

  /* Base CCS */
  Lisp_Object mother;

  /* Range of character code */
  int min_code, max_code;

  /* Offset for external code */
  int code_offset;

  /* Type of conversion from mother CCS */
  unsigned char conversion;

  /* Offset for each byte */
  int byte_offset;
};
typedef struct Lisp_Charset Lisp_Charset;

DECLARE_LRECORD (charset, Lisp_Charset);
#define XCHARSET(x) XRECORD (x, charset, Lisp_Charset)
#define XSETCHARSET(x, p) XSETRECORD (x, p, charset)
#define CHARSETP(x) RECORDP (x, charset)
#define CHECK_CHARSET(x) CHECK_RECORD (x, charset)
#define CONCHECK_CHARSET(x) CONCHECK_RECORD (x, charset)

#define CHARSET_LEFT_TO_RIGHT	0
#define CHARSET_RIGHT_TO_LEFT	1

/* Leading byte and id have been regrouped. -- OG */
#define CHARSET_ID(cs)		 ((cs)->id)
#define CHARSET_LEADING_BYTE(cs) (CHARSET_ID(cs))
#define CHARSET_NAME(cs)	 ((cs)->name)
#define CHARSET_SHORT_NAME(cs)	 ((cs)->short_name)
#define CHARSET_LONG_NAME(cs)	 ((cs)->long_name)
#define CHARSET_COLUMNS(cs)	 ((cs)->columns)
#define CHARSET_GRAPHIC(cs)	 ((cs)->graphic)
#define CHARSET_DIRECTION(cs)	 ((cs)->direction)
#define CHARSET_ISO_IR(cs)	 ((cs)->iso_ir)
#define CHARSET_FINAL(cs)	 ((cs)->final)
#define CHARSET_DOC_STRING(cs)	 ((cs)->doc_string)
#define CHARSET_REGISTRY(cs)	 ((cs)->registry)
#define CHARSET_CCL_PROGRAM(cs)  ((cs)->ccl_program)
#define CHARSET_DIMENSION(cs)	 ((cs)->dimension)
#define CHARSET_CHARS(cs)	 ((cs)->chars)
#define CHARSET_REVERSE_DIRECTION_CHARSET(cs) ((cs)->reverse_direction_charset)
#define CHARSET_DECODING_TABLE(cs) ((cs)->decoding_table)
#define CHARSET_MIN_CODE(cs)	 ((cs)->min_code)
#define CHARSET_MAX_CODE(cs)	 ((cs)->max_code)
#define CHARSET_CODE_OFFSET(cs)	 ((cs)->code_offset)
#define CHARSET_BYTE_OFFSET(cs)	 ((cs)->byte_offset)
#define CHARSET_MOTHER(cs)	 ((cs)->mother)
#define CHARSET_CONVERSION(cs)	 ((cs)->conversion)

INLINE_HEADER int CHARSET_BYTE_SIZE (Lisp_Charset* cs);
INLINE_HEADER int
CHARSET_BYTE_SIZE (Lisp_Charset* cs)
{
  /* ad-hoc method for `ascii' */
  if ((CHARSET_CHARS (cs) == 94) &&
      (CHARSET_BYTE_OFFSET (cs) != 33))
    return 128 - CHARSET_BYTE_OFFSET (cs);
  else
    return CHARSET_CHARS (cs);
}

INLINE_HEADER Lisp_Object CHARSET_ENCODING_TABLE (Lisp_Charset* cs);
INLINE_HEADER Lisp_Object
CHARSET_ENCODING_TABLE (Lisp_Charset* cs)
{
  return Fgethash (CHARSET_NAME(cs),
		   Vchar_attribute_hash_table,
		   Qnil);
}

#define CONVERSION_IDENTICAL	0
#define CONVERSION_94		1
#define CONVERSION_96		2
#define CONVERSION_94x94	3
#define CONVERSION_96x96	4
#define CONVERSION_94x94x94	5
#define CONVERSION_96x96x96	6
#define CONVERSION_94x94x94x94	7
#define CONVERSION_96x96x96x96	8
#define CONVERSION_94x60	9
#define CONVERSION_94x94x60	10
#define CONVERSION_94x94x94x60	11
#define CONVERSION_BIG5_1	12
#define CONVERSION_BIG5_2	13

#define XCHARSET_ID(cs)		  CHARSET_ID           (XCHARSET (cs))
#define XCHARSET_NAME(cs)	  CHARSET_NAME         (XCHARSET (cs))
#define XCHARSET_SHORT_NAME(cs)	  CHARSET_SHORT_NAME   (XCHARSET (cs))
#define XCHARSET_LONG_NAME(cs)	  CHARSET_LONG_NAME    (XCHARSET (cs))
#define XCHARSET_GRAPHIC(cs)      CHARSET_GRAPHIC      (XCHARSET (cs))
#define XCHARSET_DIRECTION(cs)	  CHARSET_DIRECTION    (XCHARSET (cs))
#define XCHARSET_FINAL(cs)	  CHARSET_FINAL        (XCHARSET (cs))
#define XCHARSET_DOC_STRING(cs)	  CHARSET_DOC_STRING   (XCHARSET (cs))
#define XCHARSET_REGISTRY(cs)	  CHARSET_REGISTRY     (XCHARSET (cs))
#define XCHARSET_LEADING_BYTE(cs) CHARSET_LEADING_BYTE (XCHARSET (cs))
#define XCHARSET_CCL_PROGRAM(cs)  CHARSET_CCL_PROGRAM  (XCHARSET (cs))
#define XCHARSET_DIMENSION(cs)	  CHARSET_DIMENSION    (XCHARSET (cs))
#define XCHARSET_CHARS(cs)	  CHARSET_CHARS        (XCHARSET (cs))
#define XCHARSET_BYTE_SIZE(cs)	  CHARSET_BYTE_SIZE    (XCHARSET (cs))
#define XCHARSET_REVERSE_DIRECTION_CHARSET(cs) \
  CHARSET_REVERSE_DIRECTION_CHARSET (XCHARSET (cs))
#define XCHARSET_DECODING_TABLE(cs) CHARSET_DECODING_TABLE(XCHARSET(cs))
#define XCHARSET_ENCODING_TABLE(cs) CHARSET_ENCODING_TABLE(XCHARSET(cs))
#define XCHARSET_MIN_CODE(cs)	  CHARSET_MIN_CODE(XCHARSET(cs))
#define XCHARSET_MAX_CODE(cs)	  CHARSET_MAX_CODE(XCHARSET(cs))
#define XCHARSET_CODE_OFFSET(cs)  CHARSET_CODE_OFFSET(XCHARSET(cs))
#define XCHARSET_BYTE_OFFSET(cs)  CHARSET_BYTE_OFFSET(XCHARSET(cs))
#define XCHARSET_MOTHER(cs)	  CHARSET_MOTHER(XCHARSET(cs))
#define XCHARSET_CONVERSION(cs)	  CHARSET_CONVERSION(XCHARSET(cs))

struct charset_lookup {
  /* Table of charsets indexed by (leading byte - 128). */
  Lisp_Object charset_by_leading_byte[NUM_LEADING_BYTES];
  
  /* Table of charsets indexed by type/final-byte/direction. */
  Lisp_Object charset_by_attributes[4][128];

  Charset_ID next_allocated_leading_byte;
};

extern struct charset_lookup *chlook;

#ifdef ERROR_CHECK_TYPECHECK
/* int not Bufbyte even though that is the actual type of a leading byte.
   This way, out-ot-range values will get caught rather than automatically
   truncated. */
INLINE_HEADER Lisp_Object CHARSET_BY_LEADING_BYTE (Charset_ID lb);
INLINE_HEADER Lisp_Object
CHARSET_BY_LEADING_BYTE (Charset_ID lb)
{
  assert (lb >= MIN_LEADING_BYTE &&
	  lb < (MIN_LEADING_BYTE + NUM_LEADING_BYTES));
  return chlook->charset_by_leading_byte[lb - MIN_LEADING_BYTE];
}

#else

#define CHARSET_BY_LEADING_BYTE(lb) \
  (chlook->charset_by_leading_byte[(lb) - MIN_LEADING_BYTE])

#endif

INLINE_HEADER Lisp_Object
CHARSET_BY_ATTRIBUTES (int chars, int dimension, int final, int dir);
INLINE_HEADER Lisp_Object
CHARSET_BY_ATTRIBUTES (int chars, int dimension, int final, int dir)
{
  int type;

  if (chars == 94)
    type = 0;
  else if (chars == 96)
    type = 1;
  else
    return Qnil;
  type += dimension == 1 ? 0 : 2;
  return chlook->charset_by_attributes[type][final];
}


/************************************************************************/
/*                        Dealing with characters                       */
/************************************************************************/

#define MAX_CHAR_BASIC_LATIN	0x007F

/*
#define MIN_CHAR_HEBREW		0x0590
#define MAX_CHAR_HEBREW		0x05EF
*/

#define MIN_CHAR_THAI		0x0E00
#define MAX_CHAR_THAI		0x0E5F

/*
#define MIN_CHAR_HIRAGANA	0x3041
#define MAX_CHAR_HIRAGANA	0x3093

#define MIN_CHAR_KATAKANA	0x30A1
#define MAX_CHAR_KATAKANA	0x30F6
*/

#define MIN_CHAR_HALFWIDTH_KATAKANA	0xFF61
#define MAX_CHAR_HALFWIDTH_KATAKANA	0xFF9F

#define MAX_CHAR_BMP		0x00FFFF

#define MIN_CHAR_SMP		0x010000
#define MAX_CHAR_SMP		0x01FFFF

#define MIN_CHAR_SIP		0x020000
#define MAX_CHAR_SIP		0x02FFFF

#if 0
#define MIN_CHAR_DAIKANWA	0x00E00000
#define MAX_CHAR_DAIKANWA	(MIN_CHAR_DAIKANWA + 50100) /* 0xE0FFFF */

#define MIN_CHAR_CBETA		0x00E20000
#define MAX_CHAR_CBETA		0x00E2FFFF

#define MIN_CHAR_CHINA3_JEF	0x00E80000
#define MAX_CHAR_CHINA3_JEF	0x00E8FFFF
#endif

#define MIN_CHAR_94		0x00E90940
#define MAX_CHAR_94		(MIN_CHAR_94 + 94 * 80 - 1)
#define MIN_CHAR_96		(MIN_CHAR_94 + 94 * 80)
#define MAX_CHAR_96		(MIN_CHAR_96 + 96 * 80 - 1)

#define MIN_CHAR_94x94		0xE9F6C0
#define MIN_CHAR_JIS_X0208_1990	(MIN_CHAR_94x94 + 94 * 94 * 79)
#define MAX_CHAR_94x94		(MIN_CHAR_94x94 + 94 * 94 * 80 - 1)
#define MAX_CHAR_JIS_X0208_1990	MAX_CHAR_94x94
#define MIN_CHAR_96x96		0xF4C000
#define MAX_CHAR_96x96		(MIN_CHAR_96x96 + 96 * 96 * 80 - 1)

/*
#define MIN_CHAR_GT		0x61000000
#define MAX_CHAR_GT		(MIN_CHAR_GT + 67547)
*/
#define MIN_CHAR_BIG5_CDP	0x62000000
#define MAX_CHAR_BIG5_CDP	0x6200FFFF
/*
#define MIN_CHAR_HANZIKU_1	(0x62000000 + 65536 * 1)
#define MAX_CHAR_HANZIKU_1	(0x62000000 + 65536 * 1 + 65535)
#define MIN_CHAR_HANZIKU_2	(0x62000000 + 65536 * 2)
#define MAX_CHAR_HANZIKU_2	(0x62000000 + 65536 * 2 + 65535)
#define MIN_CHAR_HANZIKU_3	(0x62000000 + 65536 * 3)
#define MAX_CHAR_HANZIKU_3	(0x62000000 + 65536 * 3 + 65535)
#define MIN_CHAR_HANZIKU_4	(0x62000000 + 65536 * 4)
#define MAX_CHAR_HANZIKU_4	(0x62000000 + 65536 * 4 + 65535)
#define MIN_CHAR_HANZIKU_5	(0x62000000 + 65536 * 5)
#define MAX_CHAR_HANZIKU_5	(0x62000000 + 65536 * 5 + 65535)
#define MIN_CHAR_HANZIKU_6	(0x62000000 + 65536 * 6)
#define MAX_CHAR_HANZIKU_6	(0x62000000 + 65536 * 6 + 65535)
#define MIN_CHAR_HANZIKU_7	(0x62000000 + 65536 * 7)
#define MAX_CHAR_HANZIKU_7	(0x62000000 + 65536 * 7 + 65535)
#define MIN_CHAR_HANZIKU_8	(0x62000000 + 65536 * 8)
#define MAX_CHAR_HANZIKU_8	(0x62000000 + 65536 * 8 + 65535)
#define MIN_CHAR_HANZIKU_9	(0x62000000 + 65536 * 9)
#define MAX_CHAR_HANZIKU_9	(0x62000000 + 65536 * 9 + 65535)
#define MIN_CHAR_HANZIKU_10	(0x62000000 + 65536 * 10)
#define MAX_CHAR_HANZIKU_10	(0x62000000 + 65536 * 10 + 65535)
#define MIN_CHAR_HANZIKU_11	(0x62000000 + 65536 * 11)
#define MAX_CHAR_HANZIKU_11	(0x62000000 + 65536 * 11 + 65535)
#define MIN_CHAR_HANZIKU_12	(0x62000000 + 65536 * 12)
#define MAX_CHAR_HANZIKU_12	(0x62000000 + 65536 * 12 + 65535)
*/

Emchar decode_builtin_char (Lisp_Object charset, int code_point);

INLINE_HEADER Lisp_Object
get_ccs_octet_table (Lisp_Object table, Lisp_Object ccs, int code);
INLINE_HEADER Lisp_Object
get_ccs_octet_table (Lisp_Object table, Lisp_Object ccs, int code)
{
  int byte_offset = XCHARSET_BYTE_OFFSET (ccs);

  if (VECTORP (table))
    {
      int idx = code - byte_offset;

      if (idx < XVECTOR_LENGTH(table))
	return XVECTOR_DATA(table)[idx];
      else
	return Qunbound;
    }
  else
    return table;
}

INLINE_HEADER Lisp_Object
put_ccs_octet_table (Lisp_Object table, Lisp_Object ccs, int code,
		     Lisp_Object value);
INLINE_HEADER Lisp_Object
put_ccs_octet_table (Lisp_Object table, Lisp_Object ccs, int code,
		     Lisp_Object value)
{
  int byte_offset = XCHARSET_BYTE_OFFSET (ccs);
  int ccs_len = XCHARSET_BYTE_SIZE (ccs);

  if (VECTORP (table))
    {
      XVECTOR_DATA(table)[code - byte_offset] = value;
      return table;
    }
  else if (EQ (table, value))
    return table;
  else
    {
      table = make_vector (ccs_len, table);
      XVECTOR_DATA(table)[code - byte_offset] = value;
      return table;
    }
}

void
decoding_table_put_char (Lisp_Object ccs,
			 int code_point, Lisp_Object character);

INLINE_HEADER void
decoding_table_remove_char (Lisp_Object ccs, int code_point);
INLINE_HEADER void
decoding_table_remove_char (Lisp_Object ccs, int code_point)
{
  decoding_table_put_char (ccs, code_point, Qunbound);
}

#ifdef HAVE_CHISE
Emchar load_char_decoding_entry_maybe (Lisp_Object ccs, int code_point);
#endif

Emchar decode_defined_char (Lisp_Object charset, int code_point,
			    int without_inheritance);

INLINE_HEADER Emchar
DECODE_CHAR (Lisp_Object charset, int code_point, int without_inheritance);
INLINE_HEADER Emchar
DECODE_CHAR (Lisp_Object charset, int code_point, int without_inheritance)
{
  Emchar char_id
    = decode_defined_char (charset, code_point, without_inheritance);

  if (char_id >= 0)
    return char_id;
  else
    return decode_builtin_char (charset, code_point);
}

/* Return a character whose charset is CHARSET and position-codes
   are C1 and C2.  TYPE9N character ignores C2. */

INLINE_HEADER Emchar MAKE_CHAR (Lisp_Object charset, int c1, int c2);
INLINE_HEADER Emchar
MAKE_CHAR (Lisp_Object charset, int c1, int c2)
{
  if (XCHARSET_DIMENSION (charset) == 1)
    return DECODE_CHAR (charset, c1, 0);
  else
    return DECODE_CHAR (charset, (c1 << 8) | c2, 0);
}

extern Lisp_Object Vcharacter_attribute_table;

int encode_char_2 (Emchar ch, Lisp_Object* charset);
int encode_builtin_char_1 (Emchar c, Lisp_Object* charset);
int charset_code_point (Lisp_Object charset, Emchar ch, int defined_only);
int range_charset_code_point (Lisp_Object charset, Emchar ch);

extern Lisp_Object Vdefault_coded_charset_priority_list;
extern Lisp_Object Vdisplay_coded_charset_priority_use_inheritance;
extern Lisp_Object Vdisplay_coded_charset_priority_use_hierarchy_order;

EXFUN (Ffind_charset, 1);

INLINE_HEADER int encode_char_1 (Emchar ch, Lisp_Object* charset);
INLINE_HEADER int
encode_char_1 (Emchar ch, Lisp_Object* charset)
{
  Lisp_Object charsets = Vdefault_coded_charset_priority_list;

  while (!NILP (charsets))
    {
      *charset = Ffind_charset (Fcar (charsets));
      if (!NILP (*charset))
	{
	  int code_point = charset_code_point (*charset, ch, 0);

	  if (code_point >= 0)
	    return code_point;
	}
      charsets = Fcdr (charsets);	      
    }
  
  /* otherwise --- maybe for bootstrap */
  return encode_builtin_char_1 (ch, charset);
}

INLINE_HEADER int
encode_char_2_search_children (Emchar ch, Lisp_Object* charset);
INLINE_HEADER int
encode_char_2_search_children (Emchar ch, Lisp_Object* charset)
{
  int code_point;
  Lisp_Object rest;

  rest = Fget_char_attribute (make_char (ch), Q_subsumptive, Qnil);
  for ( ; !NILP (rest); rest = XCDR (rest) )
    {
      Lisp_Object c = XCAR (rest);

      code_point = charset_code_point (*charset, XCHAR (c), 0);
      if (code_point >= 0)
	return code_point;
    }
  rest = Fget_char_attribute (make_char (ch), Q_denotational, Qnil);
  for ( ; !NILP (rest); rest = XCDR (rest) )
    {
      Lisp_Object c = XCAR (rest);

      code_point = charset_code_point (*charset, XCHAR (c), 0);
      if (code_point >= 0)
	return code_point;
    }
  return -1;
}

#define ENCODE_CHAR(ch, charset)	encode_char_1 (ch, &(charset))

INLINE_HEADER void
breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2);
INLINE_HEADER void
breakup_char_1 (Emchar c, Lisp_Object *charset, int *c1, int *c2)
{
  int code_point = encode_char_1 (c, charset);

  if (code_point >= 0)
    {
      int dim = XCHARSET_DIMENSION (*charset);

       if (dim == 1)
	 {
	   *c1 = code_point;
	   *c2 = 0;
	 }
       else /* if (dim == 2) */
	 {
	   *c1 = code_point >> 8;
	   *c2 = code_point & 255;
	 }
    }
  else{
    *c1 = *c2 = 0;
  }
}

#define BREAKUP_CHAR(ch, charset, b1, b2) \
  breakup_char_1 (ch, &(charset), &(b1), &(b2))

INLINE_HEADER Lisp_Object CHAR_CHARSET (Emchar ch);
INLINE_HEADER Lisp_Object
CHAR_CHARSET (Emchar ch)
{
  Lisp_Object charset;
 
  ENCODE_CHAR (ch, charset);
  return charset;
}

#define CHAR_CHARSET_ID(c)  (XCHARSET_ID(CHAR_CHARSET(c)))
#define CHAR_COLUMNS(c)     (CHARSET_COLUMNS(XCHARSET(CHAR_CHARSET(c))))


typedef struct Charc
{
  Lisp_Object charset;
  int code_point;
} Charc;

INLINE_HEADER Charc CHAR_TO_CHARC (Emchar ch);
INLINE_HEADER Charc
CHAR_TO_CHARC (Emchar ch)
{
  Charc cc;

  cc.code_point = encode_char_2 (ch, &cc.charset);
  return cc;
}

#endif /* INCLUDED_char_ucs_h_ */
