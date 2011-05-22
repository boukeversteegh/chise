;;; chise-subr.el --- basic lisp subroutines for XEmacs CHISE

;; Copyright (C) 1999, 2001, 2002, 2003, 2004, 2005, 2007, 2008, 2009,
;;   2010, 2011 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: CHISE, Character Database, ISO/IEC 10646, UCS, Unicode, MULE.

;; This file is part of XEmacs CHISE.

;; XEmacs CHISE is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs CHISE is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs CHISE; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(defvar char-db-feature-domains
  '(ucs ucs/compat daikanwa cns gt jis jis/alt jis/a jis/b
	jis-x0212 jis-x0213 cdp shinjigen misc unknown))


;;; @ feature name
;;;

;;;###autoload
(defun expand-char-feature-name (feature domain)
  (if domain
      (intern (format "%s@%s" feature domain))
    feature))

;;;###autoload
(defun char-attribute-name< (ka kb)
  "Return t if symbol KA is less than KB in feature-name sorting order."
  (cond
   ((eq '->denotational kb)
    t)
   ((eq '->subsumptive kb)
    (not (eq '->denotational ka)))
   ((eq '->denotational ka)
    nil)
   ((eq '->subsumptive ka)
    nil)
   ((and (symbolp ka)
	 (string-match "^->" (symbol-name ka)))
    (cond ((and (symbolp kb)
		(string-match "^->" (symbol-name kb)))
	   (string< (symbol-name ka)
		    (symbol-name kb))
	   ))
    )
   ((and (symbolp kb)
	 (string-match "^->" (symbol-name kb)))
    t)
   ((and (symbolp ka)
	 (string-match "^<-" (symbol-name ka)))
    (cond ((symbolp kb)
	   (cond ((string-match "^<-" (symbol-name kb))
		  (string< (symbol-name ka)
			   (symbol-name kb))
		  )
                 ;; ((string-match "^->" (symbol-name kb))
                 ;;  t)
		 )))
    )
   ((and (symbolp kb)
	 (string-match "^<-" (symbol-name kb)))
    t
    ;; (not (string-match "^->" (symbol-name ka)))
    )
   ((find-charset ka)
    (if (find-charset kb)
	(let (a-ir b-ir)
	  (if (setq a-ir (charset-property ka 'iso-ir))
	      (if (setq b-ir (charset-property kb 'iso-ir))
		  (cond
		   ((= a-ir b-ir)
		    (< (charset-id ka)(charset-id kb))
		    )
		   ((= a-ir 177)
		    t)
		   ((= b-ir 177)
		    nil)
		   ((< a-ir
		       b-ir)
		    ))
		t)
	    (if (charset-property kb 'iso-ir)
		nil
	      (< (charset-id ka)(charset-id kb)))))
      nil)
    )
   ((find-charset kb))
   ((symbolp ka)
    (cond ((symbolp kb)
	   (string< (symbol-name ka)
		    (symbol-name kb)))
	  (t)))
   ((symbolp kb)
    nil)))


;;; @ char feature
;;;

;;;###autoload
(defun char-ucs (char)
  "Return code-point of UCS."
  (or (encode-char char '=ucs 'defined-only)
      (char-feature char '=>ucs)))

;;;###autoload
(defun char-id (char)
  (logand (char-int char) #x3FFFFFFF))


;;; @ char hierarchy
;;;

;;;###autoload
(defun map-char-family (function char &optional ignore-sisters)
  (let ((rest (list char))
	ret checked)
    (catch 'tag
      (while rest
	(unless (memq (car rest) checked)
	  (if (setq ret (funcall function (car rest)))
	      (throw 'tag ret))
	  (setq checked (cons (car rest) checked)
		rest (append rest
			     (get-char-attribute (car rest) '->subsumptive)
			     (get-char-attribute (car rest) '->denotational)
			     (get-char-attribute (car rest) '->identical)))
	  (unless ignore-sisters
	    (setq rest (append rest
			       (get-char-attribute (car rest) '<-subsumptive)
			       (get-char-attribute (car rest) '<-denotational)))))
	(setq rest (cdr rest))))))


;;;###autoload
(defun define-char-before (char-spec next-char)
  "Define CHAR-SPEC and insert it before NEXT-CHAR." 
  (let (mother sisters rest)
    (when (and (or (characterp next-char)
		   (setq next-char (find-char next-char)))
	       (setq mother (get-char-attribute next-char '<-subsumptive))
	       (setq mother (car mother))
	       (setq sisters (get-char-attribute mother '->subsumptive)))
      (if (eq (car sisters) next-char)
	  (setq sisters (cons (define-char char-spec) sisters))
	(setq rest sisters)
	(while (and (cdr rest)
		    (not (eq (nth 1 rest) next-char)))
	  (setq rest (cdr rest)))
	(if (null rest)
	    (setq sisters (cons (define-char char-spec) sisters))
	  (setcdr rest (cons (define-char char-spec) (cdr rest)))))
      (put-char-attribute mother '->subsumptive sisters))))

;;;###autoload
(defun define-char-after (prev-char char-spec)
  "Define CHAR-SPEC and insert it after PREV-CHAR." 
  (let (mother sisters rest)
    (when (and (or (characterp prev-char)
		   (setq prev-char (find-char prev-char)))
	       (setq mother (get-char-attribute prev-char '<-subsumptive))
	       (setq mother (car mother))
	       (setq sisters (get-char-attribute mother '->subsumptive)))
      (setq rest sisters)
      (while (and rest
		  (not (eq (car rest) prev-char)))
	(setq rest (cdr rest)))
      (if (null rest)
	  (setq sisters (cons (define-char char-spec) sisters))
	(setcdr rest (cons (define-char char-spec) (cdr rest))))
      (put-char-attribute mother '->subsumptive sisters))))


;;; @ string
;;;

;;;###autoload
(defun chise-string< (string1 string2 accessors)
  (let ((len1 (length string1))
	(len2 (length string2))
	len
	(i 0)
	c1 c2
	rest func
	v1 v2)
    (setq len (min len1 len2))
    (catch 'tag
      (while (< i len)
	(setq c1 (aref string1 i)
	      c2 (aref string2 i))
	(setq rest accessors)
	(while (and rest
		    (setq func (car rest))
		    (setq v1 (funcall func c1)
			  v2 (funcall func c2))
		    (eq v1 v2))
	  (setq rest (cdr rest)))
	(if v1
	    (if v2
		(cond ((< v1 v2)
		       (throw 'tag t))
		      ((> v1 v2)
		       (throw 'tag nil)))
	      (throw 'tag nil))
	  (if v2
	      (throw 'tag t)))
	(setq i (1+ i)))
      (< len1 len2))))


;;; @ end
;;;

(provide 'chise-subr)

;;; chise-subr.el ends here
