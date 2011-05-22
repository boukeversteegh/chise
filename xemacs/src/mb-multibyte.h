/* Header for generic multibyte string representation.
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

#ifndef _XEMACS_MB_MULTIBYTE_H
#define _XEMACS_MB_MULTIBYTE_H

/************************************************************************/
/*                     Operations on individual bytes                   */
/*                             of any format                            */
/************************************************************************/

/* These are carefully designed to work if BYTE is signed or unsigned. */
/* Note that SPC and DEL are considered ASCII, not control. */

#define BYTE_ASCII_P(byte) (((byte) & ~0x7f) == 0)
#define BYTE_C0_P(byte)    (((byte) & ~0x1f) == 0)
#define BYTE_C1_P(byte)    (((byte) & ~0x1f) == 0x80)


/************************************************************************/
/*                        Dealing with characters                       */
/************************************************************************/

/* Is this character represented by more than one byte in a string? */

#define CHAR_MULTIBYTE_P(c) ((c) >= 0x80)


/* ---------------------------------------------------------------------- */
/* (A) For working with charptr's (pointers to internally-formatted text) */
/* ---------------------------------------------------------------------- */

# define VALID_CHARPTR_P(ptr) BUFBYTE_FIRST_BYTE_P (* (unsigned char *) ptr)

#define VALIDATE_CHARPTR_BACKWARD(ptr) do {	\
  while (!VALID_CHARPTR_P (ptr)) ptr--;		\
} while (0)

/* This needs to be trickier to avoid the possibility of running off
   the end of the string. */

#define VALIDATE_CHARPTR_FORWARD(ptr) do {	\
  Bufbyte *vcf_ptr = (ptr);			\
  VALIDATE_CHARPTR_BACKWARD (vcf_ptr);		\
  if (vcf_ptr != (ptr))				\
    {						\
      (ptr) = vcf_ptr;				\
      INC_CHARPTR (ptr);			\
    }						\
} while (0)

/* -------------------------------------------------------------------- */
/* (C) For retrieving or changing the character pointed to by a charptr */
/* -------------------------------------------------------------------- */

#define simple_charptr_emchar(ptr)		((Emchar) (ptr)[0])
#define simple_set_charptr_emchar(ptr, x)	((ptr)[0] = (Bufbyte) (x), 1)
#define simple_charptr_copy_char(ptr, ptr2)	((ptr2)[0] = *(ptr), 1)

Emchar non_ascii_charptr_emchar (const Bufbyte *ptr);
Bytecount non_ascii_set_charptr_emchar (Bufbyte *ptr, Emchar c);
Bytecount non_ascii_charptr_copy_char (const Bufbyte *src, Bufbyte *dst);

INLINE_HEADER Emchar charptr_emchar (const Bufbyte *ptr);
INLINE_HEADER Emchar
charptr_emchar (const Bufbyte *ptr)
{
  return BYTE_ASCII_P (*ptr) ?
    simple_charptr_emchar (ptr) :
    non_ascii_charptr_emchar (ptr);
}

INLINE_HEADER Bytecount set_charptr_emchar (Bufbyte *ptr, Emchar x);
INLINE_HEADER Bytecount
set_charptr_emchar (Bufbyte *ptr, Emchar x)
{
  return !CHAR_MULTIBYTE_P (x) ?
    simple_set_charptr_emchar (ptr, x) :
    non_ascii_set_charptr_emchar (ptr, x);
}

/* Copy the character pointed to by SRC into DST.
   Return the number of bytes copied.  */
INLINE_HEADER Bytecount
charptr_copy_char (const Bufbyte *src, Bufbyte *dst);
INLINE_HEADER Bytecount
charptr_copy_char (const Bufbyte *src, Bufbyte *dst)
{
  return BYTE_ASCII_P (*src) ?
    simple_charptr_copy_char (src, dst) :
    non_ascii_charptr_copy_char (src, dst);
}


/************************************************************************/
/*                            Exported functions                        */
/************************************************************************/

Emchar Lstream_get_emchar_1 (Lstream *stream, int first_char);
int Lstream_fput_emchar (Lstream *stream, Emchar ch);
void Lstream_funget_emchar (Lstream *stream, Emchar ch);

int copy_internal_to_external (const Bufbyte *internal, Bytecount len,
			       unsigned char *external);
Bytecount copy_external_to_internal (const unsigned char *external,
				     int len, Bufbyte *internal);

#endif /* _XEMACS_MB_MULTIBYTE_H */
