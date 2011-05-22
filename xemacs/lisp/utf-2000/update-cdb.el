;;; update-cdb.el --- Update and/or setup character attribute database

;; Copyright (C) 2002,2003,2004 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: Character, Database, CHISE, Unicode, UCS-4, MULE.

;; This file is part of XEmacs CHISE.

;; XEmacs CHISE is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs CHISE is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs CHISE; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(defun delete-file-with-children (filename)
  (if (file-directory-p filename)
      (let ((files
	     (directory-files filename 'full "^[^.]" 'so-sort)))
	(if files
	    (dolist (file files)
	      (delete-file-with-children file)))
	(remove-directory filename))
    (delete-file filename)))

(cond
 ((featurep 'chise)
  (defvar system-char-database-directory
    (expand-file-name "chise-db"
		      (or data-directory
			  "../etc/")))

  (defun file-name-char-attribute-name (filename)
    (let ((i 0)
	  (base 0)
	  (len (length filename))
	  chr dest)
      (while (< i len)
	(if (eq (setq chr (aref filename i)) ?%)
	    (setq dest (concat dest
			       (substring filename base i)
			       (char-to-string
				(int-char
				 (string-to-int
				  (substring filename (1+ i) (+ i 3)) 16))))
		  i (+ i 3)
		  base i)
	  (setq i (1+ i))))
      (concat dest (substring filename base len))))

  (cond
   ((or load-ignore-elc-files
	(not (file-exists-p system-char-database-directory)))
    (if (file-exists-p system-char-database-directory)
	(delete-file-with-children system-char-database-directory))

    (load "dumped-chars.el")
    (dolist (file system-char-db-source-file-list)
      (pureload file))

    (dolist (attribute (char-attribute-list))
      (save-char-attribute-table attribute))

    (dolist (ccs (charset-list))
      (and (fboundp 'save-charset-properties)
	   (save-charset-properties ccs))
      (save-charset-mapping-table ccs))

    (with-temp-buffer
      (insert
       (format
	"(setq next-defined-char-id #x%X)\n"
	next-defined-char-id))
      (write-region (point-min)(point-max)
		    "../lisp/utf-2000/cid-conf.el"))
    )
   (t
    (if (>= (function-max-args 'char-attribute-list) 1)
	(char-attribute-list 'rehash)
      (mapcar (lambda (file)
		(mount-char-attribute-table
		 (intern (file-name-char-attribute-name file))))
	      (directory-files
	       (expand-file-name "system-char-id" ; "character/feature"
				 system-char-database-directory)
	       nil nil t t)))
    (dolist (ccs (charset-list))
      (reset-charset-mapping-table ccs))
    (load "../lisp/utf-2000/cid-conf.el")
    )))
 (t
  (load "dumped-chars.el")
  (dolist (file system-char-db-source-file-list)
    (pureload file))
  ))

(defun char-ref= (cr1 cr2 &optional tester)
  (cond ((char-ref-p cr1)
	 (if (char-ref-p cr2)
	     (char-spec= (plist-get cr1 :char)
			 (plist-get cr2 :char) tester)
	   (char-spec= (plist-get cr1 :char) cr2 tester)))
	(t
	 (char-spec= cr1
		     (if (char-ref-p cr2)
			 (plist-get cr2 :char)
		       cr2)
		     tester))))

(defun char-spec= (cs1 cs2 &optional tester)
  (unless tester
    (setq tester #'eq))
  (if (characterp cs1)
      (if (characterp cs2)
	  (funcall tester cs1 cs2)
	(funcall tester cs1 (find-char cs2)))
    (if (characterp cs2)
	(funcall tester (find-char cs1) cs2)
      (funcall tester (find-char cs1) (find-char cs2)))))

(let (ret)
  (map-char-attribute
   (lambda (c dc)
     (if (consp dc)
	 (setq dc (car dc)))
     (if (listp dc)
	 (if (setq ret (find-char dc))
	     (setq dc ret)))
     (when (characterp dc)
       (setq ret (get-char-attribute dc '->uppercase))
       (if (if (listp ret)
	       (member* c ret :test #'char-ref=)
	     (char-ref= c ret))
	   (put-case-table-pair c dc (standard-case-table))))
     nil)
   '->lowercase))

(garbage-collect)

;;; update-cdb.el ends here
