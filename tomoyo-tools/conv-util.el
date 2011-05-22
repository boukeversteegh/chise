;;; conv-util.el --- Dump utility of mapping tables

;; Copyright (C) 2004 MORIOKA Tomohiko

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

(require 'ideograph-util)


(defun conv-u-convert-char (c &optional v)
  (setq v (get-char-attribute c '->ucs-unified))
  (let (ufs ifs ucs m ret)
    (when (or (and
	       (setq m (get-char-attribute c 'morohashi-daikanwa))
	       (setq m (if (eq (nth 1 m) 0)
			   (car m)
			 (list (car m)(nth 1 m)))))
	      (setq m (encode-char c '=daikanwa 'defined-only)))
      (setq ufs (char-attribute-alist c)
	    ifs ufs)
      (dolist (vc v)
	(setq ifs (intersection
		   ifs
		   (char-attribute-alist vc)
		   :test #'equal)))
      (if (setq ucs (encode-char c '=ucs 'defined-only))
	  (progn
	    (remove-char-attribute c '=ucs)
	    (if (<= ucs #xFFFF)
		(put-char-attribute c '=ucs@unicode ucs)
	      (put-char-attribute c '=ucs@iso ucs))
	    (remove-char-attribute c '->ucs-unified))
	(setq ucs (char-ucs c)))
      (setq v (sort (cons c v)
		    (function ideograph-char<)))
      (setq ret (define-char
		  (cons (cons '->subsumptive v)
			ifs)))
      (put-char-attribute ret '=ucs ucs)
      (dolist (vc v)
	(dolist (isf ifs)
	  (remove-char-attribute vc (car isf)))
	(when (and (setq m (get-char-attribute vc 'morohashi-daikanwa))
		   (or (eq (nth 1 m) 0)
		       (nth 2 m)))
	  (remove-char-attribute vc 'morohashi-daikanwa))
	(if (eq ucs (get-char-attribute vc '=>ucs))
	    (remove-char-attribute vc '=>ucs)))
      )))

(defun conv-u-convert-char-fullwidth (c &optional v)
  (when (setq v (get-char-attribute c '->ucs-unified))
    (let (ufs ifs ucs name ret)
      (when (get-char-attribute c '->fullwidth)
	(setq ufs (char-attribute-alist c)
	      ifs ufs)
	(dolist (vc v)
	  (setq ifs (intersection
		     ifs
		     (char-attribute-alist vc)
		     :test #'equal)))      
	(dolist (cell ufs)
	  (cond ((eq (car cell) 'name)
		 (setq name (cdr cell)))
		((eq (car cell) '->decomposition))
		((eq (car cell) 'composition))
		((eq (car cell) '->lowercase))
		((eq (car cell) '->uppercase))
		((eq (car cell) '->titlecase))
		((eq (car cell) '->fullwidth))
		((eq (car cell) '=ucs)
		 (setq ucs (cdr cell))
		 (setq ret
		       (cons (cons (if (<= ucs #xFFFF)
				       '=ucs@unicode
				     '=ucs@iso)
				   ucs)
			     ret)))
		((member cell ifs))
		((eq (car cell) '->ucs-unified)
		 (remove-char-attribute c '->ucs-unified))
		(t
		 (remove-char-attribute c (car cell))
		 (setq ret (cons cell ret)))))
	(setq ufs
	      (cons (list '<-halfwidth c)
		    ret))
	(put-char-attribute c '->denotational
			    (cons (define-char ufs) v))
	(dolist (vc v)
	  (dolist (isf ifs)
	    (remove-char-attribute vc (car isf)))
	  (if (eq ucs (get-char-attribute vc '=>ucs))
	      (remove-char-attribute vc '=>ucs))
	  (if (setq ret (get-char-attribute vc '<-fullwidth))
	      (put-char-attribute vc '<-fullwidth
				  (list c) ; (delq c ret)
				  ))
	  (if (and name
		   (string= (concat "fullwidth " (downcase name))
			    (get-char-attribute vc 'name)))
	      (remove-char-attribute vc 'name))
	  )
	))))


;;; @ End.
;;;

(provide 'conv-util)

;;; conv-util.el ends here
