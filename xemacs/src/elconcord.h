/* Definitions for the CONCORD interface for XEmacs.
   Copyright (C) 2005,2006,2008,2010 MORIOKA Tomohiko

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

/* Synched up with: Not in FSF. */

/* Written by MORIOKA Tomohiko */

#ifndef INCLUDED_elconcord_h_
#define INCLUDED_elconcord_h_

#include <concord.h>

/*
 * data source
 */

typedef struct Lisp_CONCORD_DS Lisp_CONCORD_DS;
DECLARE_LRECORD (concord_ds, Lisp_CONCORD_DS);

struct Lisp_CONCORD_DS
{
  struct lcrecord_header header;
  CONCORD_DS ds;
};

#define XCONCORD_DS(x) XRECORD (x, concord_ds, Lisp_CONCORD_DS)
#define XSET_CONCORD_DS(x, p) XSETRECORD (x, p, concord_ds)
#define CONCORD_DS_P(x) RECORDP (x, concord_ds)
#define CHECK_CONCORD_DS(x) CHECK_RECORD (x, concord_ds)
#define CONCHECK_CONCORD_DS(x) CONCHECK_RECORD (x, concord_ds)


/*
 * Concord-object
 */

EXFUN (Fconcord_decode_object, 4);
EXFUN (Fconcord_object_put, 3);
EXFUN (Fconcord_object_get, 2);

typedef struct Lisp_CONCORD_Object Lisp_CONCORD_Object;
DECLARE_LRECORD (concord_object, Lisp_CONCORD_Object);

struct Lisp_CONCORD_Object
{
  struct lcrecord_header header;
  CONCORD_Genre genre;
  Lisp_Object id;
};

#define XCONCORD_OBJECT(x) XRECORD (x, concord_object, Lisp_CONCORD_Object)
#define XSET_CONCORD_OBJECT(x, p) XSETRECORD (x, p, concord_object)
#define CONCORD_OBJECT_P(x) RECORDP (x, concord_object)
#define CHECK_CONCORD_OBJECT(x) CHECK_RECORD (x, concord_object)
#define CONCHECK_CONCORD_OBJECT(x) CONCHECK_RECORD (x, concord_object)
#define CONCORD_OBJECT_GENRE(x)	((x)->genre)
#define CONCORD_OBJECT_ID(x)	((x)->id)
#define XCONCORD_OBJECT_ID(x)	CONCORD_OBJECT_ID (XCONCORD_OBJECT(x))
#define XCONCORD_OBJECT_GENRE(x) CONCORD_OBJECT_GENRE (XCONCORD_OBJECT(x))

#endif /* INCLUDED_elconcord_h_ */
