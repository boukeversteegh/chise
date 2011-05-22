;;; close-cdb.el --- Update and/or setup character attribute database

;; Copyright (C) 2002,2003 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: Character, Database, UTF-2000, Unicode, UCS-4, MULE.

;; This file is part of XEmacs UTF-2000.

;; XEmacs UTF-2000 is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs UTF-2000 is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs UTF-2000; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(require 'chise) ; to check external-database feature is available

(dolist (attribute (char-attribute-list))
  (close-char-attribute-table attribute))

(close-char-data-source)

(garbage-collect)

(setq char-db-stingy-mode nil)

;;; close-cdb.el ends here
