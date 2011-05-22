;;; read-maps.el --- Read mapping-tables.

;; Copyright (C) 2002,2003,2004,2005,2006,2008 MORIOKA Tomohiko

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: mapping table, character, CCS, multiscript, multilingual

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

(defvar mapping-table-ccs-setting-alist
  '((=jis-x0208@1990
     "^J90-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@jis/1990
     "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=jis-x0212
     "^JSP-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@jis/1990
     "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=jis-x0213-1-2000
     "^JX1-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@jis/2000
     "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=jis-x0213-2-2000
     "^JX2-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@jis/2000
     "\tJU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=gb2312
     "^G0-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@gb
     "\tGU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=cns11643-1
     "^C1-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@cns
     "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=cns11643-2     
     "^C2-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@cns
     "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=cns11643-3
     "^C3-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@cns
     "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=cns11643-4
     "^C4-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@cns
     "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=cns11643-5
     "^C5-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@cns
     "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=cns11643-6
     "^C6-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@cns
     "\tCU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=big5     
     "^B-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@big5
     "\tBU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=ks-x1001
     "^K0-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     =ucs@ks
     "\tKU[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
    (=jef-china3     
     "^JC3-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" 1 16
     nil
     nil)
    )
  "*List of information about mapping table formats.
Elements are of the form
\(CCS CODE-REGEXP PAREN-EXP BASE UCS-CCS UCS-REGEXP).

CCS	is a symbol, which is a name of a target coded-charset.

CODE-REGEXP is a regular expression to match against
	the representation of the target coded-charset.

PAREN-EXP is a number specifies which parenthesized expression
	in the CODE-REGEXP.

BASE	base of code in the string specified by CODE-REGEXP and
	PAREN-EXP.

UCS-CCS is a symbol, which is a name of a UCS-CCS.

UCS-REGEXP is a regular expression to match against
	the representation of the UCS-CCS.")

;;;###autoload
(defun mapping-table-read-file (filename)
  "Read mapping table." 
  (interactive "fMapping table : ")
  (with-temp-buffer
    (buffer-disable-undo)
    (insert-file-contents filename)
    (goto-char (point-min))
    (let (rest setting ccs code ucs ucs-pat ucs-ccs ucs-code chr)
      (while (not (eobp))
	(setq rest mapping-table-ccs-setting-alist)
	(catch 'matched
	  (while rest
	    (setq setting (car rest)
		  ccs (pop setting))
	    (when (looking-at (pop setting))
	      (setq code (string-to-int (match-string (pop setting))
					(pop setting))
		    ucs-ccs (pop setting)
		    ucs-pat (car setting))
	      (goto-char (match-end 0))
	      (throw 'matched t))
	    (setq rest (cdr rest)))
	  (setq ccs nil
		code nil
		ucs-pat nil
		ucs-ccs nil))
	(setq ucs-code
	      (if (and ucs-pat
		       (looking-at ucs-pat))
		  (prog1
		      (string-to-int (match-string 1) 16)
		    (goto-char (match-end 0)))))
	(setq ucs
	      (if (looking-at
		   "[ \t]*U[+-]\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]+\\)")
		  (string-to-int (match-string 1) 16)))
	(if (and ucs-ccs ucs (not ucs-code))
	    (setq ucs-code ucs
		  ucs nil))
	(when (setq chr (decode-char ccs code))
	  (unless (eq (encode-char chr ccs 'defined-only)
		      code)
	    (put-char-attribute chr ccs code))
	  (when (and ucs-code
		     (not
		      (eq (or
			   (encode-char chr ucs-ccs 'defined-only)
			   (cond
			    ((memq ucs-ccs '(=ucs@jis
					     =ucs@jis/1990
					     =ucs@jis/2000))
			     (encode-char chr '=ucs@jis/fw 'defined-only))
			    ((eq ucs-ccs '=ucs@gb)
			     (encode-char chr '=ucs@gb/fw 'defined-only))
                            ;; ((eq ucs-ccs '=ucs@cns)
                            ;;  (encode-char chr '=ucs@cns/fw 'defined-only))
                            ;; ((eq ucs-ccs '=ucs@big5)
                            ;;  nil)
                            ;; ((eq ucs-ccs '=ucs@ks)
                            ;;  (encode-char chr '=ucs@ks/fw 'defined-only))
                            (t
			     (char-feature chr '=>ucs))))
			  ucs-code)))
	    (put-char-attribute chr ucs-ccs ucs-code))
	  (when (and ucs
		     (not (eq (or (encode-char chr '=ucs 'defined-only)
				  (and (not (memq ucs-ccs '(=ucs@jis
							    =ucs@jis/1990
                                                            =ucs@jis/2000
							    =ucs@gb
							    =ucs@cns
							    =ucs@big5
							    =ucs@ks
							    )))
				       (char-feature chr '=>ucs)))
			      ucs)))
	    (if (or ucs-code (null ucs-ccs))
		(unless (eq (char-feature chr '=>ucs) ucs)
		  (put-char-attribute chr '=>ucs ucs))
	      (unless (eq (encode-char chr ucs-ccs 'defined-only)
			  ucs)
		(put-char-attribute chr ucs-ccs ucs)))))
	(forward-line)))))

;;;###autoload
(defun ucs-compat-read-file (filename)
  (interactive "fUCS-compat file : ")
  (with-temp-buffer
    (buffer-disable-undo)
    (insert-file-contents filename)
    (goto-char (point-min))
    (let (ucs ucs*)
      (while (re-search-forward
	      "^ *U[---+]\\([0-9A-F]+\\)\t *U[---+]\\([0-9A-F]+\\)" nil t)
	(setq ucs (string-to-int (match-string 1) 16)
	      ucs* (string-to-int (match-string 2) 16))
	(put-char-attribute (decode-char '=ucs ucs) '=>ucs* ucs*)
	))))

;;;###autoload
(defun jp-jouyou-read-file (filename)
  (interactive "fjp-jouyou file : ")
  (with-temp-buffer
    (buffer-disable-undo)
    (insert-file-contents filename)
    (goto-char (point-min))
    (let (char tchars)
      (while (re-search-forward "^[^\t\n ]+\t\\(.\\)\t*" nil t)
	(setq char (aref (match-string 1) 0)
	      tchars (buffer-substring (match-end 0)
				       (point-at-eol)))
	(when (> (length tchars) 0)
	  (setq tchars
		(mapcar (lambda (c)
			  (aref c 0))
			(split-string tchars " ")))
	  (unless (or (equal (char-feature char '<-simplified@JP/Jouyou)
			     tchars)
		      (and (equal (char-feature char '<-simplified)
				  tchars)
			   (memq 'JP/Jouyou
				 (char-feature char '<-simplified*sources))))
	    (put-char-attribute char
				'<-simplified@JP/Jouyou
				tchars)))
        ;; (put-char-attribute
        ;;  char 'script (adjoin
        ;;                'JP
        ;;                (adjoin
        ;;                 'Jouyou
        ;;                 (adjoin
        ;;                  'Ideograph
        ;;                  (get-char-attribute char 'script)))))
	))))

(provide 'read-maps)

;;; read-maps.el ends here
