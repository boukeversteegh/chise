;;; ideo-trans.el --- Translation utility for Ideographic Strings

;; Copyright (C) 2003,2004,2005,2008 MORIOKA Tomohiko

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: Ideographs, Character Database, Chaon, CHISE

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

(defun char-cns11643-p (char &optional defined-only)
  (some (lambda (n)
	  (encode-char char
		       (intern (format "=cns11643-%d" n))
		       defined-only))
	'(1 2 3 4 5 6 7)))

(defun char-ks-x1001-p (char &optional defined-only)
  (encode-char char 'korean-ksc5601 defined-only))

(defun find-char-variant (char predicate)
  (if (funcall predicate char)
      char
    (let ((ucs (char-ucs char))
	  variants)
      (if (and ucs
	       (setq variants
		     (char-variants (decode-char 'ucs ucs))))
	  (while (and variants
		      (setq char (car variants))
		      (not (funcall predicate char)))
	    (setq variants (cdr variants))))
      char)))

;;;###autoload
(defun char-representative-of-ucs (char)
  "Convert CHAR into representative character of UCS."
  (let (ret)
    (if (setq ret (char-ucs char))
	(decode-char '=ucs ret)
      char)))

;;;###autoload
(defun char-representative-of-domain (char domain)
  "Convert CHAR into representative character of DOMAIN."
  (let (ret)
    (cond ((eq domain 'daikanwa)
	   (char-representative-of-daikanwa char))
	  ((eq domain 'ucs)
	   (char-representative-of-ucs char))
	  ((eq domain 'cns)
	   (if (setq ret (char-feature char '=>ucs@cns))
	       (decode-char '=ucs@cns ret)
	     (find-char-variant char 'char-cns11643-p)))
	  ((eq domain 'ks)
	   (if (setq ret (char-feature char '=>ucs@ks))
	       (decode-char '=ucs@ks ret)
	     (find-char-variant char 'char-ks-x1001-p)))
	  ((setq ret
		 (or (char-feature char
				   (intern (format "=>ucs@%s" domain)))
		     (char-ucs char)))
	   (decode-char (intern (format "=ucs@%s" domain)) ret))
	  (t char))))

;;;###autoload
(defun ideo-translate-string-into-ucs (string)
  "Convert characters in STRING into UCS-representative characters."
  (mapconcat (lambda (char)
	       (char-to-string (char-representative-of-ucs char)))
	     string ""))

;;;###autoload
(defun chinese-simplify-string (string)
  "Simplify Chinese traditional characters in STRING."
  (let (uchr ret)
    (mapconcat
     (lambda (chr)
       (setq uchr
	     (cond ((setq ret (char-feature chr '=>ucs@gb))
		    (setq chr (decode-char '=ucs@gb ret)))
		   ((setq ret (char-ucs chr))
		    (setq chr (decode-char '=ucs@gb ret))
		    (if (setq ret (char-feature chr '=>ucs*))
			(setq chr (decode-char '=ucs@gb ret))
		      chr))
		   (t chr)))
       (char-to-string
	(if (setq ret (encode-char uchr 'chinese-gb12345))
	    (decode-char 'chinese-gb2312 ret)
	  chr)))
     string "")))

;;;###autoload
(define-obsolete-function-alias
  'ideo-translate-string-into-simplified-chinese
  'chinese-simplify-string)

;;;###autoload
(define-obsolete-function-alias 'ideo-trans-simplify-chinese-string
  'chinese-simplify-string)

;;;###autoload
(defun japanese-simplify-string (string)
  "Simplify traditional Kanji characters in STRING."
  (let (ret)
    (mapconcat
     (lambda (chr)
       (setq uchr
	     (cond ((setq ret (char-feature chr '=>ucs@jis))
		    (setq chr (decode-char '=ucs@jis ret)))
		   ((setq ret (char-ucs chr))
		    (setq chr (decode-char '=ucs@jis ret))
		    (if (setq ret (char-feature chr '=>ucs*))
			(setq chr (decode-char '=ucs@jis ret))
		      chr))
		   (t chr)))
       (setq ret (or (char-feature chr '->simplified@JP/Jouyou)
		     (char-feature chr '->simplified@JP)
		     (char-feature chr '->simplified)))
       (char-to-string
	(cond ((car ret))
	      ((setq ret (char-feature chr '=>ucs@jis))
	       (decode-char '=ucs@jis ret))
	      ((setq ret (char-ucs chr))
	       (decode-char '=ucs@JP ret))
	      (t chr))))
     string "")))

;;;###autoload
(define-obsolete-function-alias
  'ideo-translate-string-into-simplified-japanese
  'japanese-simplify-string)


(defun ideo-trans-select-char (chars &optional prefix)
  (let ((i 0)
	prompt ret)
    (setq prompt
	  (concat
	   prefix
	   (mapconcat (lambda (cell)
			(setq i (1+ i))
			(format "%d. %c" i cell))
		      chars " ")
	   " : "))
    (while (and (setq ret (string-to-int (read-string prompt)))
		(not (and (< 0 ret)
			  (<=  ret (length chars))))))
    (nth (1- ret) chars)))

;;;###autoload
(defun chinese-traditionalize-string (string &optional selector)
  "Convert simplified Chinese characters in STRING to traditional characters."
  (unless selector
    (setq selector
	  (lambda (chars)
	    (ideo-trans-select-char chars (format "%c => " chr)))))
  (let (ret)
    (mapconcat
     (lambda (chr)
       (char-to-string
	(cond ((car (char-feature chr '<-simplified))
	       (if (cdr ret)
		   (funcall selector ret)
		 (car ret)))
	      ((progn
		 (setq ret
		       (cond ((setq ret (char-feature chr '=>ucs@gb))
			      (decode-char '=ucs@gb ret))
			     ((setq ret (char-ucs chr))
			      (decode-char '=ucs@gb ret))
			     (t chr)))
		 (if (setq ret (encode-char ret 'chinese-gb2312))
		     (setq ret (decode-char 'chinese-gb12345 ret))))
	       ret)
	      (t chr))))
     string "")))

;;;###autoload
(define-obsolete-function-alias
  'ideo-translate-chinese-string-into-traditional
  'chinese-traditionalize-string)

;;;###autoload
(defun japanese-traditionalize-string (string &optional selector)
  "Convert simplified Kanji in STRING into traditional characters."
  (unless selector
    (setq selector
	  (lambda (chars)
	    (ideo-trans-select-char chars (format "%c => " chr)))))
  (let (ret)
    (mapconcat
     (lambda (chr)
       (char-to-string
	(cond ((setq ret (or (char-feature chr '<-simplified@JP/Jouyou)
			     (char-feature chr '<-simplified@JP)
			     (char-feature chr '<-simplified)))
	       (if (cdr ret)
		   (funcall selector ret)
		 (car ret)))
	      ((progn
		 (setq ret
		       (cond ((setq ret (char-feature chr '=>ucs@jis))
			      (decode-char '=ucs@jis ret))
			     ((setq ret (char-ucs chr))
			      (decode-char '=ucs@JP ret))
			     (t chr)))
		 (setq ret (or (char-feature ret '<-simplified@JP/Jouyou)
			       (char-feature ret '<-simplified@JP))))
	       (if (cdr ret)
		   (ideo-trans-select-char ret (format "%c => " chr))
		 (car ret)))
	      ((setq ret (char-feature chr '=>ucs@jis))
	       (decode-char '=ucs@jis ret))
	      ((setq ret (char-ucs chr))
	       (decode-char '=ucs@JP ret))
	      (t chr))))
     string "")))
		      
;;;###autoload
(define-obsolete-function-alias
  'ideo-translate-japanese-string-into-traditional
  'japanese-traditionalize-string)

;;;###autoload
(defun japanese-traditionalize-region (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char start)
      (let (chr ret rret)
	(while (and (skip-chars-forward "\x00-\xFF")
		    (not (eobp)))
	  (setq chr (char-after))
	  (if (setq ret (or (char-feature chr '<-simplified@JP/Jouyou)
			    (char-feature chr '<-simplified@jp-jouyou)
			    (char-feature chr '<-simplified@JP)
			    (char-feature chr '<-simplified@jp)
			    (char-feature chr '<-jp-simplified)
			    (char-feature chr '<-simplified)))
	      (progn
		(if (cdr ret)
		    (progn
		      (setq rret (ideo-trans-select-char ret))
		      (delete-char)
		      (insert rret))
		  (delete-char)
		  (insert (car ret))))
	    (or (eobp)
		(forward-char))))))))

;;;###autoload
(defun japanese-simplify-region (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char start)
      (let (chr ret rret)
	(while (and (skip-chars-forward "\x00-\xFF")
		    (not (eobp)))
	  (setq chr (char-after))
	  (if (setq ret (or (char-feature chr '->simplified@JP/Jouyou)
			    (char-feature chr '->simplified@jp-jouyou)
			    (char-feature chr '->simplified@JP)
			    (char-feature chr '->simplified@jp)
			    (char-feature chr '->jp-simplified)
			    (char-feature chr '->simplified)))
	      (progn
		(if (cdr ret)
		    (progn
		      (setq rret (ideo-trans-select-char ret))
		      (delete-char)
		      (insert rret))
		  (delete-char)
		  (insert (car ret))))
	    (or (eobp)
		(forward-char))))))))

;;;###autoload
(define-obsolete-function-alias
  'ideo-translate-japanese-region-into-traditional
  'japanese-traditionalize-region)

;;;###autoload
(define-obsolete-function-alias
  'ideo-translate-region-into-traditional
  'japanese-traditionalize-region)


;;; @ End.
;;;

(provide 'ideo-trans)

;;; ideo-trans.el ends here
