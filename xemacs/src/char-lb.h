/* Header for leading-byte character representation.
   Copyright (C) 1999,2000 MORIOKA Tomohiko

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

#ifndef _XEMACS_CHAR_LB_H
#define _XEMACS_CHAR_LB_H

#include "mule-charset.h"

int non_ascii_valid_char_p (Emchar ch);

INLINE_HEADER int valid_char_p (Emchar ch);
INLINE_HEADER int
valid_char_p (Emchar ch)
{
  return ((unsigned int) (ch) <= 0xff) || non_ascii_valid_char_p (ch);
}

#define CHAR_COLUMNS(c)     (XCHARSET_COLUMNS(CHAR_CHARSET(c)))


INLINE_HEADER Emchar DECODE_CHAR (Lisp_Object charset, int code_point);
INLINE_HEADER Emchar
DECODE_CHAR (Lisp_Object charset, int code_point)
{
  if (EQ (charset, Vcharset_ascii))
    return code_point;
  else if (EQ (charset, Vcharset_control_1))
    return code_point | 0x80;
  else if (XCHARSET_DIMENSION (charset) == 1)
    return ((XCHARSET_LEADING_BYTE (charset) -
	     FIELD2_TO_OFFICIAL_LEADING_BYTE) << 7) | code_point;
  else if (!XCHARSET_PRIVATE_P (charset))
    return ((XCHARSET_LEADING_BYTE (charset) -
	     FIELD1_TO_OFFICIAL_LEADING_BYTE) << 14)
      | ((code_point >> 1) & 0x3F80) | (code_point & 0x7F);
  else
    return ((XCHARSET_LEADING_BYTE (charset) -
	     FIELD1_TO_PRIVATE_LEADING_BYTE) << 14)
      | ((code_point >> 1) & 0x3F80) | (code_point & 0x7F);
}

INLINE_HEADER int encode_char_1 (Emchar ch, Lisp_Object* charset);
INLINE_HEADER int
encode_char_1 (Emchar ch, Lisp_Object* charset)
{
  *charset = CHAR_CHARSET (ch);
  return  XCHARSET_DIMENSION (*charset) == 1
    ? CHAR_FIELD3 (ch)
    : (CHAR_FIELD2 (ch) << 8) | CHAR_FIELD3 (ch);
}

#define ENCODE_CHAR(ch, charset)	encode_char_1 (ch, &(charset))


typedef struct Charc
{
  Lisp_Object charset;
  unsigned short code_point;
} Charc;

INLINE_HEADER Charc CHAR_TO_CHARC (Emchar ch);
INLINE_HEADER Charc
CHAR_TO_CHARC (Emchar ch)
{
  Charc cc;

  cc.code_point = encode_char_1 (ch, &cc.charset);
  return cc;
}

#endif /* _XEMACS_CHAR_LB_H */
