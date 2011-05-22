/* Header for 1-byte string representation.
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

/* Rewritten by MORIOKA Tomohiko <tomo@m17n.org>. */

#ifndef _XEMACS_MB_1BYTE_H
#define _XEMACS_MB_1BYTE_H

/* Maximum number of buffer bytes per Emacs character. */
# define MAX_EMCHAR_LEN 1

/************************************************************************/
/*                     Operations on individual bytes                   */
/*                             of any format                            */
/************************************************************************/

/* Argument `c' should be (unsigned int) or (unsigned char). */
/* Note that SP and DEL are not included. */

#define BYTE_ASCII_P(byte) 1


/************************************************************************/
/*                        Dealing with characters                       */
/************************************************************************/

#define REP_BYTES_BY_FIRST_BYTE(fb) 1


/* ---------------------------------------------------------------------- */
/* (A) For working with charptr's (pointers to internally-formatted text) */
/* ---------------------------------------------------------------------- */

#define VALID_CHARPTR_P(ptr) 1
#define VALIDATE_CHARPTR_BACKWARD(ptr)
#define VALIDATE_CHARPTR_FORWARD(ptr)

/* -------------------------------------------------------------------- */
/* (C) For retrieving or changing the character pointed to by a charptr */
/* -------------------------------------------------------------------- */

#define charptr_emchar(ptr)		((Emchar) (ptr)[0])
#define set_charptr_emchar(ptr, x)	((ptr)[0] = (Bufbyte) (x), 1)
#define charptr_copy_char(ptr, ptr2)	((ptr2)[0] = *(ptr), 1)

#endif /* _XEMACS_MB_1BYTE_H */
