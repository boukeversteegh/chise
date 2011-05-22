/* Header for UTF-8 string representation.
   Copyright (C) 1999 Electrotechnical Laboratory, JAPAN.
   Licensed to the Free Software Foundation.

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

/* Author: MORIOKA Tomohiko <tomo@m17n.org>. */

#ifndef _XEMACS_MB_UTF_8_H
#define _XEMACS_MB_UTF_8_H

#define MULTIBYTE

/* Maximum number of buffer bytes per Emacs character. */
#define MAX_EMCHAR_LEN 6

/************************************************************************/
/*                     Operations on individual bytes                   */
/*                       in a Mule-formatted string                     */
/************************************************************************/

/* Does BYTE represent the first byte of a character? */

INLINE_HEADER int BUFBYTE_FIRST_BYTE_P(Bufbyte byte);
INLINE_HEADER int
BUFBYTE_FIRST_BYTE_P(Bufbyte byte)
{
  return (byte <= 0x7F) || (0xC0 <= byte);
}


/************************************************************************/
/*                        Dealing with characters                       */
/************************************************************************/

/* Is this character represented by more than one byte in a string? */

#define CHAR_MULTIBYTE_P(c) ((c) >= 0x80)


INLINE_HEADER int REP_BYTES_BY_FIRST_BYTE (Bufbyte fb);
INLINE_HEADER int
REP_BYTES_BY_FIRST_BYTE (Bufbyte fb)
{
  if ( fb < 0xC0 )
    return 1;
  else if ( fb < 0xE0 )
    return 2;
  else if ( fb < 0xF0 )
    return 3;
  else if ( fb < 0xF8 )
    return 4;
  else if ( fb < 0xFC )
    return 5;
  else
    return 6;
}


#include "mb-multibyte.h"

#endif /* _XEMACS_MB_UTF_8_H */
