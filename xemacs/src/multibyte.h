/* Header for multibyte buffer/string representation.
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

/* Authorship:

   Ben Wing: almost completely rewritten for Mule, 19.12 in buffer.h.
   MORIOKA Tomohiko: rewritten for UTF-2000.

 */

#ifndef _XEMACS_MULTIBYTE_H
#define _XEMACS_MULTIBYTE_H

/************************************************************************/
/*									*/
/*		   working with raw internal-format data		*/
/*									*/
/************************************************************************/

/*
   Use the following functions/macros on contiguous strings of data.
   If the text you're operating on is known to come from a buffer, use
   the buffer-level functions in buffer.h -- they know about the gap
   and may be more efficient.


  (A) For working with charptr's (pointers to internally-formatted text):
  -----------------------------------------------------------------------

   VALID_CHARPTR_P (ptr):
	Given a charptr, does it point to the beginning of a character?

   ASSERT_VALID_CHARPTR (ptr):
	If error-checking is enabled, assert that the given charptr
	points to the beginning of a character.	 Otherwise, do nothing.

   INC_CHARPTR (ptr):
	Given a charptr (assumed to point at the beginning of a character),
	modify that pointer so it points to the beginning of the next
	character.

   DEC_CHARPTR (ptr):
	Given a charptr (assumed to point at the beginning of a
	character or at the very end of the text), modify that pointer
	so it points to the beginning of the previous character.

   VALIDATE_CHARPTR_BACKWARD (ptr):
	Make sure that PTR is pointing to the beginning of a character.
	If not, back up until this is the case.	  Note that there are not
	too many places where it is legitimate to do this sort of thing.
	It's an error if you're passed an "invalid" char * pointer.
	NOTE: PTR *must* be pointing to a valid part of the string (i.e.
	not the very end, unless the string is zero-terminated or
	something) in order for this function to not cause crashes.

   VALIDATE_CHARPTR_FORWARD (ptr):
	Make sure that PTR is pointing to the beginning of a character.
	If not, move forward until this is the case.  Note that there
	are not too many places where it is legitimate to do this sort
	of thing.  It's an error if you're passed an "invalid" char *
	pointer.


   (B) For working with the length (in bytes and characters) of a
       section of internally-formatted text:
   --------------------------------------------------------------

   bytecount_to_charcount (ptr, nbi):
	Given a pointer to a text string and a length in bytes,
	return the equivalent length in characters.

   charcount_to_bytecount (ptr, nch):
	Given a pointer to a text string and a length in characters,
	return the equivalent length in bytes.

   charptr_n_addr (ptr, n):
	Return a pointer to the beginning of the character offset N
	(in characters) from PTR.

   MAX_EMCHAR_LEN:
	Maximum number of buffer bytes per Emacs character.


   (C) For retrieving or changing the character pointed to by a charptr:
   ---------------------------------------------------------------------

   charptr_emchar (ptr):
	Retrieve the character pointed to by PTR as an Emchar.

   charptr_emchar_n (ptr, n):
	Retrieve the character at offset N (in characters) from PTR,
	as an Emchar.

   set_charptr_emchar (ptr, ch):
	Store the character CH (an Emchar) as internally-formatted
	text starting at PTR.  Return the number of bytes stored.

   charptr_copy_char (ptr, ptr2):
	Retrieve the character pointed to by PTR and store it as
	internally-formatted text in PTR2.

*/

#ifdef UTF2000
# include "mb-utf-8.h"
#elif defined(MULE)
# include "mb-lb.h"
#else
# include "mb-1byte.h"
#endif

/* ---------------------------------------------------------------------- */
/* (A) For working with charptr's (pointers to internally-formatted text) */
/* ---------------------------------------------------------------------- */

#ifdef ERROR_CHECK_BUFPOS
# define ASSERT_VALID_CHARPTR(ptr) assert (VALID_CHARPTR_P (ptr))
#else
# define ASSERT_VALID_CHARPTR(ptr)
#endif

/* Note that INC_CHARPTR() and DEC_CHARPTR() have to be written in
   completely separate ways.  INC_CHARPTR() cannot use the DEC_CHARPTR()
   trick of looking for a valid first byte because it might run off
   the end of the string.  DEC_CHARPTR() can't use the INC_CHARPTR()
   method because it doesn't have easy access to the first byte of
   the character it's moving over. */

#define REAL_INC_CHARPTR(ptr) \
  ((void) ((ptr) += REP_BYTES_BY_FIRST_BYTE (* (unsigned char *) (ptr))))

#define REAL_INC_CHARBYTIND(ptr, pos) \
  (pos += REP_BYTES_BY_FIRST_BYTE (* (unsigned char *) (ptr)))

#define REAL_DEC_CHARPTR(ptr) do {	\
  (ptr)--;				\
} while (!VALID_CHARPTR_P (ptr))

#ifdef ERROR_CHECK_BUFPOS
#define INC_CHARPTR(ptr) do {		\
  ASSERT_VALID_CHARPTR (ptr);		\
  REAL_INC_CHARPTR (ptr);		\
} while (0)

#define INC_CHARBYTIND(ptr, pos) do {		\
  ASSERT_VALID_CHARPTR (ptr);			\
  REAL_INC_CHARBYTIND (ptr, pos);		\
} while (0)

#define DEC_CHARPTR(ptr) do {			\
  const Bufbyte *dc_ptr1 = (ptr);		\
  const Bufbyte *dc_ptr2 = dc_ptr1;		\
  REAL_DEC_CHARPTR (dc_ptr2);			\
  assert (dc_ptr1 - dc_ptr2 ==			\
	  REP_BYTES_BY_FIRST_BYTE (*dc_ptr2));	\
  (ptr) = (Bufbyte *) dc_ptr2;			\
} while (0)

#else /* ! ERROR_CHECK_BUFPOS */
#define INC_CHARBYTIND(ptr, pos) REAL_INC_CHARBYTIND (ptr, pos)
#define INC_CHARPTR(ptr) REAL_INC_CHARPTR (ptr)
#define DEC_CHARPTR(ptr) REAL_DEC_CHARPTR (ptr)
#endif /* ! ERROR_CHECK_BUFPOS */

/* -------------------------------------------------------------- */
/* (B) For working with the length (in bytes and characters) of a */
/*     section of internally-formatted text 			  */
/* -------------------------------------------------------------- */

INLINE_HEADER const Bufbyte *
charptr_n_addr (const Bufbyte *ptr, Charcount offset);
INLINE_HEADER const Bufbyte *
charptr_n_addr (const Bufbyte *ptr, Charcount offset)
{
  return ptr + charcount_to_bytecount (ptr, offset);
}

/* -------------------------------------------------------------------- */
/* (C) For retrieving or changing the character pointed to by a charptr */
/* -------------------------------------------------------------------- */

#define charptr_emchar_n(ptr, offset) \
  charptr_emchar (charptr_n_addr (ptr, offset))

#endif /* _XEMACS_MULTIBYTE_H */
