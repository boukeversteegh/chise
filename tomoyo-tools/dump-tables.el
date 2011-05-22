;;; dump-tables.el --- Dump utility of mapping tables

;; Copyright (C) 2002,2003,2004,2005 MORIOKA Tomohiko

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: Ideographs, Character Database, CHISE, UCS, Unicode

;; This file is a part of tomoyo-tools.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(defun dump-94x94-ccs-to-ucs-table (filename default-file-name
					     ccs ccs-prefix
					     ucs-domain ucs-ccs-prefix)
  (if (file-directory-p filename)
      (setq filename (expand-file-name default-file-name filename)))
  (with-temp-buffer
    (let ((ucs-ccs (intern (format "=ucs@%s" ucs-domain)))
	  (ucs-ccs-map (intern (format "=>ucs@%s" ucs-domain)))
	  (ccs-format (concat ccs-prefix "%02X%02X"))
	  (ucs-ccs-format (concat "\t" ucs-ccs-prefix "%04X\t"))
	  (row 33)
	  cell chr ucs ucs-l)
      (while (< row 127)
	(setq cell 33)
	(while (< cell 127)
	  (when (and (setq chr (make-char ccs row cell))
		     (setq ucs (or (encode-char chr 'ucs 'defined-only)
				   (char-feature chr '=>ucs))))
	    (setq ucs-l (or (encode-char chr ucs-ccs 'defined-only)
			    (char-feature chr ucs-ccs-map)))
	    (insert (format ccs-format row cell))
	    (if (and ucs-l (/= ucs-l ucs))
		(insert (format ucs-ccs-format ucs-l))
	      (insert "\t "))
	    (insert (format (if (<= ucs #xFFFF)
				"U+%04X\n"
			      "U-%08X\n")
			    ucs)))
	  (setq cell (1+ cell)))
	(setq row (1+ row))))
    (write-region (point-min)(point-max) filename)))

;;;###autoload
(defun dump-jis-x0208-1990-to-ucs-table (filename)
  (interactive "Fdump J90-to-UCS : ")
  (dump-94x94-ccs-to-ucs-table
   filename "J90-to-UCS.txt"
   'japanese-jisx0208-1990 "J90-" 'jis "JU+"))

;;;###autoload
(defun dump-jis-x0212-to-ucs-table (filename)
  (interactive "Fdump JSP-to-UCS : ")
  (dump-94x94-ccs-to-ucs-table
   filename "JSP-to-UCS.txt"
   'japanese-jisx0212 "JSP-" 'jis "JU+"))

;;;###autoload
(defun dump-jis-x0213-1-to-ucs-table (filename)
  (interactive "Fdump JX1-to-UCS : ")
  (if (file-directory-p filename)
      (setq filename (expand-file-name "JX1-to-UCS.txt" filename)))
  (with-temp-buffer
    (let ((row 33)
	  cell chr ucs ucs-j)
      (while (< row 127)
	(setq cell 33)
	(while (< cell 127)
	  (when (and (setq chr (make-char 'japanese-jisx0213-1 row cell))
		     (not (encode-char chr 'japanese-jisx0208-1990
				       'defined-only))
		     (setq ucs (or (encode-char chr 'ucs 'defined-only)
				   (get-char-attribute chr '=>ucs))))
	    (when (setq ucs-j
			(or (encode-char chr '=ucs-jis-2000 'defined-only)
			    (get-char-attribute chr '=>ucs@jis)))
	      (if (eq ucs-j ucs)
		  (setq ucs-j nil)))
	    (insert (format "JX1-%02X%02X" row cell))
	    (if ucs-j
		(insert (format "\tJU+%04X\t" ucs-j))
	      (insert "\t "))
	    (insert (format (if (<= ucs #xFFFF)
				"U+%04X\n"
			      "U-%08X\n")
			    ucs)))
	  (setq cell (1+ cell)))
	(setq row (1+ row))))
    (write-region (point-min)(point-max) filename)))

;;;###autoload
(defun dump-jis-x0213-2-to-ucs-table (filename)
  (interactive "Fdump JX2-to-UCS : ")
  (dump-94x94-ccs-to-ucs-table
   filename "JX2-to-UCS.txt"
   'japanese-jisx0213-2 "JX2-" 'jis "JU+"))

;;;###autoload
(defun dump-ks-x1001-to-ucs-table (filename)
  (interactive "Fdump K0-to-UCS : ")
  (dump-94x94-ccs-to-ucs-table
   filename "K0-to-UCS.txt"
   '=ks-x1001 "K0-" 'ks "KU+"))

;;;###autoload
(defun dump-cns-11643-1-to-ucs-table (filename)
  (interactive "Fdump C1-to-UCS : ")
  (dump-94x94-ccs-to-ucs-table
   filename "C1-to-UCS.txt"
   'chinese-cns11643-1 "C1-" 'cns "CU+"))

;;;###autoload
(defun dump-cns-11643-2-to-ucs-table (filename)
  (interactive "Fdump C2-to-UCS : ")
  (dump-94x94-ccs-to-ucs-table
   filename "C2-to-UCS.txt"
   'chinese-cns11643-2 "C2-" 'cns "CU+"))

;;;###autoload
(defun dump-cns-11643-3-to-ucs-table (filename)
  (interactive "Fdump C3-to-UCS : ")
  (dump-94x94-ccs-to-ucs-table
   filename "C3-to-UCS.txt"
   'chinese-cns11643-3 "C3-" 'cns "CU+"))

;;;###autoload
(defun dump-cns-11643-4-to-ucs-table (filename)
  (interactive "Fdump C4-to-UCS : ")
  (dump-94x94-ccs-to-ucs-table
   filename "C4-to-UCS.txt"
   'chinese-cns11643-4 "C4-" 'cns "CU+"))

;;;###autoload
(defun dump-big5-to-ucs-table (filename)
  (interactive "Fdump B-to-UCS : ")
  (if (file-directory-p filename)
      (setq filename (expand-file-name "B-to-UCS.txt" filename)))
  (with-temp-buffer
    (let ((row #xA1)
	  cell chr ucs ucs-big5)
      (while (<= row #xFE)
	(setq cell #x40)
	(while (< cell #xFE)
	  (when (and (setq chr (make-char 'chinese-big5 row cell))
		     (setq ucs (or (encode-char chr 'ucs 'defined-only)
				   (get-char-attribute chr '=>ucs))))
	    (setq ucs-big5 (or (encode-char chr 'ucs-big5 'defined-only)
			       (get-char-attribute chr '=>ucs@big5)))
	    (insert (format "B-%02X%02X" row cell))
	    (if ucs-big5
		(insert (format "\tBU+%04X\t" ucs-big5))
	      (insert "\t "))
	    (insert (format (if (<= ucs #xFFFF)
				"U+%04X\n"
			      "U-%08X\n")
			    ucs)))
	  (setq cell (1+ cell)))
	(setq row (1+ row))))
    (write-region (point-min)(point-max) filename)))

;;;###autoload
(defun dump-jef-china3-to-ucs-table (filename)
  (interactive "Fdump JC3-to-UCS : ")
  (if (file-directory-p filename)
      (setq filename (expand-file-name "JC3-to-UCS.txt" filename)))
  (with-temp-buffer
    (let ((row #x41)
	  cell chr ucs)
      (while (<= row #x9F)
	(setq cell #xA1)
	(while (<= cell #xFE)
	  (when (and (setq chr (make-char 'china3-jef row cell))
		     (setq ucs (or (encode-char chr 'ucs 'defined-only)
				   (get-char-attribute chr '=>ucs))))
	    (insert (format "JC3-%02X%02X\t" row cell))
	    (insert (format (if (<= ucs #xFFFF)
				"U+%04X\n"
			      "U-%08X\n")
			    ucs)))
	  (setq cell (1+ cell)))
	(setq row (1+ row))))
    (write-region (point-min)(point-max) filename)))

;;;###autoload
(defun dump-cbeta-to-ucs-table (filename)
  (interactive "Fdump CBETA-to-UCS : ")
  (if (file-directory-p filename)
      (setq filename (expand-file-name "CBETA-to-UCS.txt" filename)))
  (with-temp-buffer
    (let ((i 1)
	  chr ucs)
      (while (<= i 20000)
	(when (and (setq chr (decode-char 'ideograph-cbeta i))
		   (setq ucs (or (encode-char chr 'ucs 'defined-only)
				 (get-char-attribute chr '=>ucs))))
	  (insert (format "CB%05d\t" i))
	  (insert (format (if (<= ucs #xFFFF)
			      "U+%04X\n"
			    "U-%08X\n")
			  ucs)))
	(setq i (1+ i))))
    (write-region (point-min)(point-max) filename)))

;;;###autoload
(defun dump-jis2ucsdkw (filename)
  (interactive "Fdump jis2ucsdkw : ")
  (if (file-directory-p filename)
      (setq filename (expand-file-name "jis2ucsdkw.txt" filename)))
  (with-temp-buffer
    (let ((row 33)
	  cell chr ucs-j md)
      (while (< row 127)
	(setq cell 33)
	(while (< cell 127)
	  (when (and (setq chr (make-char 'japanese-jisx0213-1 row cell))
		     (setq ucs-j
			   (or (encode-char chr '=ucs@jis-2000 'defined-only)
			       (get-char-attribute chr '=>ucs@jis-2000)
			       (get-char-attribute chr '=>ucs@jis)
			       (get-char-attribute chr '=>ucs)))
		     (or (and (<= #x3400 ucs-j) (<= ucs-j #x9FA5))
			 (and (<= #xF900 ucs-j) (<= ucs-j #xFA6F))
			 (<= #x20000 ucs-j)))
	    (insert (format "J1-%02d%02d" (- row 32)(- cell 32)))
	    (if ucs-j
		(insert (format " U+%05X" ucs-j))
	      (insert "        "))
	    (setq md (char-daikanwa chr))
	    (cond ((integerp md)
		   (insert (format " D%05d.0\n" md)))
		  ((eq (car md) 'ho)
		   (insert (format " DHo%03d\n" (nth 1 md))))
		  (md
		   (insert (format " D%05d.%d\n" (car md)(nth 1 md))))
		  (t
		   (insert "\n")))
	    )
	  (setq cell (1+ cell)))
	(setq row (1+ row)))
      (setq row 33)
      (while (< row 127)
	(setq cell 33)
	(while (< cell 127)
	  (when (and (setq chr (make-char 'japanese-jisx0213-2 row cell))
		     (setq ucs-j
			   (or (encode-char chr '=ucs@jis-2000 'defined-only)
			       (get-char-attribute chr '=>ucs@jis-2000)
			       (get-char-attribute chr '=>ucs@jis)
			       (get-char-attribute chr '=>ucs))))
	    (insert (format "J2-%02d%02d" (- row 32)(- cell 32)))
	    (if ucs-j
		(insert (format " U+%05X" ucs-j))
	      (insert "        "))
	    (setq md (char-daikanwa chr))
	    (cond ((integerp md)
		   (insert (format " D%05d.0\n" md)))
		  ((eq (car md) 'ho)
		   (insert (format " DHo%03d\n" (nth 1 md))))
		  (md
		   (insert (format " D%05d.%d\n" (car md)(nth 1 md))))
		  (t
		   (insert "\n")))
	    )
	  (setq cell (1+ cell)))
	(setq row (1+ row)))
      )
    (write-region (point-min)(point-max) filename)))


;;; @ End.
;;;

(provide 'dump-tables)

;;; dump-tables.el ends here
