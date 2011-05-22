/* Header for character representation.
   Copyright (C) 1999,2000,2003 MORIOKA Tomohiko

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

#ifndef _XEMACS_CHARACTER_H
#define _XEMACS_CHARACTER_H

#if !defined(MULE) /* unibyte representation */
# include "char-1byte.h"
#elif !defined(CHAR_IS_UCS4) /* leading-byte representation */
# include "char-lb.h"
#else /* CHAR_IS_UCS4 */
# include "char-ucs.h"
#endif /* CHAR_IS_UCS4 */

/********************************/
/*                              */
/*   Interface for characters   */
/*                              */
/********************************/
/*
   valid_char_p (ch):
	Return whether the given Emchar is valid.

   CHARP (ch):
	Return whether the given Lisp_Object is a character.

   CHECK_CHAR_COERCE_INT (ch):
	Signal an error if CH is not a valid character or integer
	Lisp_Object.
	If CH is an integer Lisp_Object, convert it to a character
	Lisp_Object, but merely by repackaging, without performing
	tests for char validity.

Functions/macros when MULE is defined:

   CHAR_ASCII_P (ch):
        Return whether the given Emchar is ASCII.

   MAKE_CHAR (CHARSET, B1, B2):
	Return a character whose coded-charset is CHARSET and
	position-codes are B1 and B2.  1 byte character ignores B2.

   BREAKUP_CHAR (ch, charset, B1, B2):
	Break up the given Emchar, and store found coded-charset and
	position-codes to CHARSET, B1 and B2.

   CHAR_CHARSET (CH):
        Return coded-charset object of Emchar CH.

   CHAR_LEADING_BYTE (CH):
        Return Charset-ID of Emchar CH.
*/

#define CHAR_INTP(x) (INTP (x) && valid_char_p (XINT (x)))

#define CHAR_OR_CHAR_INTP(x) (CHARP (x) || CHAR_INTP (x))

INLINE_HEADER Emchar XCHAR_OR_CHAR_INT (Lisp_Object obj);
INLINE_HEADER Emchar
XCHAR_OR_CHAR_INT (Lisp_Object obj)
{
  return CHARP (obj) ? XCHAR (obj) : XINT (obj);
}

#define CHECK_CHAR_COERCE_INT(x) do {		\
  if (CHARP (x))				\
     ;						\
  else if (CHAR_INTP (x))			\
    x = make_char (XINT (x));			\
  else						\
    x = wrong_type_argument (Qcharacterp, x);	\
} while (0)


#define CHARC_CHARSET(cc)	((cc).charset)
#define CHARC_CHARSET_ID(cc)	XCHARSET_ID (CHARC_CHARSET (cc))
#define CHARC_CODE_POINT(cc)	((cc).code_point)
#define CHARC_COLUMNS(cc)	CHARSET_COLUMNS (XCHARSET (CHARC_CHARSET (cc)))

INLINE_HEADER Emchar CHARC_TO_CHAR (Charc cc);
INLINE_HEADER Emchar
CHARC_TO_CHAR (Charc cc)
{
  return DECODE_CHAR (cc.charset, cc.code_point, 0);
}

INLINE_HEADER int CHARC_EQ (Charc cc1, Charc cc2);
INLINE_HEADER int
CHARC_EQ (Charc cc1, Charc cc2)
{
  return EQ (cc1.charset, cc2.charset) && (cc1.code_point == cc2.code_point);
}

INLINE_HEADER int CHARC_ASCII_EQ (Charc cc, int ch);
INLINE_HEADER int
CHARC_ASCII_EQ (Charc cc, int ch)
{
  return EQ (cc.charset, Vcharset_ascii) && (cc.code_point == ch);
}

INLINE_HEADER int CHARC_IS_SPACE (Charc cc);
INLINE_HEADER int
CHARC_IS_SPACE (Charc cc)
{
  return (EQ (cc.charset, Vcharset_ascii) ||
	  EQ (cc.charset, Vcharset_control_1) ||
	  EQ (cc.charset, Vcharset_latin_iso8859_1))
    && isspace (cc.code_point);
}

INLINE_HEADER Charc ASCII_TO_CHARC (int ch);
INLINE_HEADER Charc
ASCII_TO_CHARC (int ch)
{
  Charc cc;

  cc.charset = Vcharset_ascii;
  cc.code_point = ch;
  return cc;
}


typedef struct
{
  Dynarr_declare (Charc);
} Charc_dynarr;

#endif /* _XEMACS_CHARACTER_H */
