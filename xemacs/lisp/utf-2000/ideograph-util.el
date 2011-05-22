;;; ideograph-util.el --- Ideographic Character Database utility

;; Copyright (C) 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2007, 2008,
;;   2009, 2010 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: CHISE, Chaon model, ISO/IEC 10646, Unicode, UCS-4, MULE.

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

(require 'chise-subr)
(require 'ideograph-subr)
(require 'char-db-util)


(defvar ideograph-radical-chars-vector
  (make-vector 215 nil))


;;;###autoload
(defun update-ideograph-radical-table ()
  (interactive)
  (let (ret rret radical script dest)
    (dolist (feature
	     (cons 'ideographic-radical
		   (progn
		     (dolist (feature (char-attribute-list))
		       (if (string-match "^ideographic-radical@[^@*]+$"
					 (symbol-name feature))
			   (setq dest (cons feature dest))))
		     dest)))
      (map-char-attribute
       (lambda (chr radical)
	 (dolist (char (append
			(if (setq ret
				  (get-char-attribute chr '<-subsumptive))
			    (progn
			      (setq dest nil)
			      (dolist (pc ret)
				(unless (eq (get-char-attribute
					     pc 'ideographic-radical)
					    radical)
				  (if (setq rret
					    (get-char-attribute
					     pc '<-subsumptive))
				      (setq ret (append ret rret))
				    (setq dest (cons pc dest)))))
			      dest)
			  (list chr))
			(let ((rest (append
				     (get-char-attribute chr '<-identical)
				     (get-char-attribute chr '->denotational)))
			      pc)
			  (setq dest nil)
			  (while rest
			    (setq pc (car rest))
			    (if (memq pc dest)
				(setq rest (cdr rest))
			      (setq dest (cons pc dest))
			      (setq rest
				    (append (cdr rest)
					    (get-char-attribute
					     pc '<-identical)
					    (get-char-attribute
					     pc '->denotational)))))
			  dest)))
	   (when (and radical
		      (or (eq radical
			      (or (get-char-attribute
				   char 'ideographic-radical)
				  (char-ideographic-radical char radical)))
			  (null (char-ideographic-radical char)))
		      (or (null (setq script
				      (get-char-attribute char 'script)))
			  (memq 'Ideograph script)))
	     (unless (memq char
			   (setq ret
				 (aref ideograph-radical-chars-vector
				       radical)))
	       (char-ideographic-strokes char)
	       (aset ideograph-radical-chars-vector radical
		     (cons char ret)))))
	 nil)
       feature))
    (map-char-attribute
     (lambda (char data)
       (dolist (cell data)
	 (setq radical (plist-get cell :radical))
	 (when (and radical
		    (or (null (setq script (get-char-attribute char 'script)))
			(memq 'Ideograph script)))
	   (unless (memq char
			 (setq ret
			       (aref ideograph-radical-chars-vector radical)))
	     (char-ideographic-strokes char)
	     (aset ideograph-radical-chars-vector radical
		   (cons char ret))))))
     'ideographic-)))


(defun int-list< (a b)
  (if (numberp (car a))
      (if (numberp (car b))
	  (if (= (car a) (car b))
	      (int-list< (cdr a)(cdr b))
	    (< (car a) (car b)))
	(if (= (car a) 0)
	    nil
	  (< (car a) 0)))
    (if (numberp (car b))
	(if (= (car b) 0)
	    t
	  (< 0 (car b)))
      )))

(defun morohashi-daikanwa< (a b)
  (if (integerp a)
      (setq a (list a)))
  (if (integerp b)
      (setq b (list b)))
  (cond ((eq (car-safe a) 'ho)
	 (if (eq (car-safe b) 'ho)
	     (int-list< (cdr-safe a)(cdr-safe b))
	   nil))
	((or (integerp a)
	     (integerp (car a)))
	 (if (eq (car b) 'ho)
	     t
	   (int-list< a b)))
	(t
	 (if (eq (car-safe b) 'ho)
	     t
	   (int-list< a b)))))

;; (defun nil=-int< (a b)
;;   (cond ((null a) nil)
;;         ((null b) nil)
;;         (t (< a b))))

;; (defun nil>-int< (a b)
;;   (cond ((null a) nil)
;;         ((null b) t)
;;         (t (< a b))))

(defvar ideographic-radical nil)

;;;###autoload
(defun char-representative-of-daikanwa (char &optional radical
					     ignore-default checked)
  (unless radical
    (setq radical ideographic-radical))
  (if (or (null radical)
          (eq (or (get-char-attribute char 'ideographic-radical)
                  (char-ideographic-radical char radical t))
              radical))
      (let ((ret (or (encode-char char 'ideograph-daikanwa 'defined-only)
                     (encode-char char '=daikanwa-rev2 'defined-only))))
	(or (and ret char)
	    (if (setq ret (get-char-attribute char 'morohashi-daikanwa))
		(let ((m-m (car ret))
		      (m-s (nth 1 ret))
		      pat)
		  (if (= m-s 0)
		      (or (decode-char '=daikanwa-rev2 m-m 'defined-only)
			  (decode-char 'ideograph-daikanwa m-m))
		    (setq pat (list m-m m-s))
		    (map-char-attribute (lambda (c v)
					  (if (equal pat v)
					      c))
					'morohashi-daikanwa))))
            (and (setq ret (get-char-attribute char '=>daikanwa))
		 (if (numberp ret)
		     (or (decode-char '=daikanwa-rev2 ret 'defined-only)
			 (decode-char 'ideograph-daikanwa ret))
		   (map-char-attribute (lambda (c v)
					 (if (equal ret v)
					     char))
				       'morohashi-daikanwa)))
	    (unless (memq char checked)
	      (catch 'tag
		(let ((rest
		       (append (get-char-attribute char '->subsumptive)
			       (get-char-attribute char '->denotational)))
		      (i 0)
		      sc)
		  (setq checked (cons char checked))
		  (while rest
		    (setq sc (car rest))
		    (if (setq ret (char-representative-of-daikanwa
				   sc radical t checked))
			(throw 'tag ret))
		    (setq checked (cons sc checked)
			  rest (cdr rest)
			  i (1+ i)))
		  (setq rest (get-char-attribute char '->identical))
		  (while rest
		    (setq sc (car rest))
		    (when (setq ret (char-representative-of-daikanwa
				     sc radical t checked))
		      (throw 'tag ret))
		    (setq checked (cons sc checked)
			  rest (cdr rest)))
		  (setq rest
			(append (get-char-attribute char '<-subsumptive)
				(get-char-attribute char '<-denotational)))
		  (while rest
		    (setq sc (car rest))
		    (when (setq ret (char-representative-of-daikanwa
				     sc radical t checked))
		      (throw 'tag ret))
		    (setq checked (cons sc checked)
			  rest (cdr rest))))))
	    (unless ignore-default
	      char)))))

(defun char-attributes-poly< (c1 c2 accessors testers defaulters)
  (catch 'tag
    (let (a1 a2 accessor tester dm)
      (while (and accessors testers)
	(setq accessor (car accessors)
	      tester (car testers)
	      dm (car defaulters))
	(when (and accessor tester)
	  (setq a1 (funcall accessor c1)
		a2 (funcall accessor c2))
	  (cond ((null a1)
		 (if a2
		     (cond ((eq dm '<)
			    (throw 'tag t))
			   ((eq dm '>)
			    (throw 'tag nil)))))
		((null a2)
		 (cond ((eq dm '<)
			(throw 'tag nil))
		       ((eq dm '>)
			(throw 'tag t))))
		(t
		 (cond ((funcall tester a1 a2)
			(throw 'tag t))
		       ((funcall tester a2 a1)
			(throw 'tag nil))))))
	(setq accessors (cdr accessors)
	      testers (cdr testers)
	      defaulters (cdr defaulters))))))

(defun char-daikanwa-strokes (char &optional radical)
  (unless radical
    (setq radical ideographic-radical))
  (let ((drc (char-representative-of-daikanwa char radical))
	(r (char-ideographic-radical char radical)))
    (if (and drc
	     (or (null r)
		 (= (char-ideographic-radical drc radical) r)))
	(setq char drc)))
  (char-ideographic-strokes char radical '(daikanwa)))

;;;###autoload
(defun char-daikanwa (char &optional radical checked depth)
  (unless radical
    (setq radical ideographic-radical))
  (if (or (null radical)
          (eq (or (get-char-attribute char 'ideographic-radical)
                  (char-ideographic-radical char radical t))
              radical))
      (let ((ret (or (encode-char char 'ideograph-daikanwa 'defined-only)
                     (encode-char char '=daikanwa-rev2 'defined-only)
                     (get-char-attribute char 'morohashi-daikanwa))))
        (or (if ret
		(if depth
		    (if (integerp ret)
			(list ret depth)
		      (append ret (list depth)))
		  ret))
	    (and (setq ret (get-char-attribute char '=>daikanwa))
		 (if (numberp ret)
		     (list ret -10)
		   (append ret '(-10))))
	    (unless (memq char checked)
	      (unless depth
		(setq depth 0))
	      (catch 'tag
		(let ((rest
		       (append (get-char-attribute char '->subsumptive)
			       (get-char-attribute char '->denotational)))
		      (i 0)
		      sc lnum)
		  (setq checked (cons char checked))
		  (while rest
		    (setq sc (car rest))
		    (if (setq ret (char-daikanwa sc radical checked
						 (1- depth)))
			(throw 'tag ret))
		    (setq checked (cons sc checked)
			  rest (cdr rest)
			  i (1+ i)))
		  (setq rest (get-char-attribute char '->identical))
		  (while rest
		    (setq sc (car rest))
		    (when (setq ret (char-daikanwa sc radical checked depth))
		      (throw 'tag
			     (if (numberp ret)
				 (list ret 0)
			       (append ret (list i)))))
		    (setq checked (cons sc checked)
			  rest (cdr rest)))
		  (setq rest
			(append (get-char-attribute char '<-subsumptive)
				(get-char-attribute char '<-denotational)))
		  (while rest
		    (setq sc (car rest))
		    (when (setq ret (char-daikanwa sc radical checked depth))
		      (throw 'tag
			     (if (numberp ret)
				 (list ret 0 i)
			       (if (>= (setq lnum (car (last ret))) 0)
				   (append ret (list i))
				 (nconc (butlast ret)
					(list 0 (- lnum) i))))))
		    (setq checked (cons sc checked)
			  rest (cdr rest))))))))))

(defun char-ideographic-strokes-diff (char &optional radical)
  (if (or (get-char-attribute char '<-subsumptive)
	  (get-char-attribute char '<-denotational))
      (let (s ds)
	(when (and (setq s (char-ideographic-strokes char radical))
		   (setq ds (char-daikanwa-strokes char radical)))
	  (abs (- s ds))))
    0))

;;;###autoload
(defun ideograph-char< (a b &optional radical)
  (let ((ideographic-radical (or radical
				 ideographic-radical)))
    (char-attributes-poly<
     a b
     '(char-daikanwa-strokes char-daikanwa char-ucs
			     char-ideographic-strokes-diff char-id)
     '(< morohashi-daikanwa< < < <)
     '(> > > > >))))

(defun insert-ideograph-radical-char-data (radical)
  (let ((chars
	 (sort (copy-list (aref ideograph-radical-chars-vector radical))
	       (lambda (a b)
		 (ideograph-char< a b radical))))
	attributes ; ccss
	)
    (dolist (name (char-attribute-list))
      (unless (memq name char-db-ignored-attributes)
        ;; (if (find-charset name)
        ;;     (push name ccss)
	(push name attributes)
	;; )
	))
    (setq attributes (sort attributes #'char-attribute-name<)
	  ;; ccss (sort ccss #'char-attribute-name<)
	  )
    (aset ideograph-radical-chars-vector radical chars)
    (dolist (char chars)
      (when ;;(or
	  (not (some (lambda (atr)
		       (get-char-attribute char atr))
		     char-db-ignored-attributes))
	;; (some (lambda (ccs)
	;;         (encode-char char ccs 'defined-only))
	;;       ccss)
	;;)
	(insert-char-data char nil attributes ;ccss
			  )))))

(defun write-ideograph-radical-char-data (radical file)
  (if (file-directory-p file)
      (let ((name (char-feature (decode-char 'ucs (+ #x2EFF radical))
				'name)))
	(if (string-match "KANGXI RADICAL " name)
	    (setq name (capitalize (substring name (match-end 0)))))
	(setq name (mapconcat (lambda (char)
				(if (eq char ? )
				    "-"
				  (char-to-string char))) name ""))
	(setq file
	      (expand-file-name
	       (format "Ideograph-R%03d-%s.el" radical name)
	       file))))
  (with-temp-buffer
    (insert (format ";; -*- coding: %s -*-\n"
		    char-db-file-coding-system))
    (insert-ideograph-radical-char-data radical)
    (let ((coding-system-for-write char-db-file-coding-system))
      (write-region (point-min)(point-max) file))))

(defun ideographic-structure= (char1 char2)
  (if (char-ref-p char1)
      (setq char1 (plist-get char1 :char)))
  (if (char-ref-p char2)
      (setq char2 (plist-get char2 :char)))
  (let ((s1 (if (characterp char1)
		(get-char-attribute char1 'ideographic-structure)
	      (cdr (assq 'ideographic-structure char1))))
	(s2 (if (characterp char2)
		(get-char-attribute char2 'ideographic-structure)
	      (cdr (assq 'ideographic-structure char2))))
	e1 e2)
    (if (or (null s1)(null s2))
	(char-spec= char1 char2)
      (catch 'tag
	(while (and s1 s2)
	  (setq e1 (car s1)
		e2 (car s2))
	  (unless (ideographic-structure= e1 e2)
	    (throw 'tag nil))
	  (setq s1 (cdr s1)
		s2 (cdr s2)))
	(and (null s1)(null s2))))))

;;;###autoload
(defun ideographic-structure-find-char (structure)
  (let (rest)
    (map-char-attribute (lambda (char value)
			  (setq rest structure)
			  (catch 'tag
			    (while (and rest value)
			      (unless (ideographic-structure=
				       (car rest)(car value))
				(throw 'tag nil))
			      (setq rest (cdr rest)
				    value (cdr value)))
			    (unless (or rest value)
			      char)))
			'ideographic-structure)))


(provide 'ideograph-util)

;;; ideograph-util.el ends here
