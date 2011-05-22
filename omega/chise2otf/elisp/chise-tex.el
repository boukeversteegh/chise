;;; chise-tex.el --- Coding-system based chise2otf like tool

;; Copyright (C) 2004,2005,2006,2007,2008 MORIOKA Tomohiko

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: OTF package, pTeX, CHISE, Multiscript, Multilingual

;; This file is a part of Omega/CHISE.

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

(defvar chise-tex-coded-charset-expression-alist
  '((=ucs-bmp@gb	"UCSgb"		4 X)
    (=ucs-bmp@jis	"UCSjis"	4 X)
    (=ucs-bmp@ks	"UCSks"		4 X)
    (=gt-pj-1		"GTpjA"		4 X)
    (=gt-pj-2		"GTpjB"		4 X)
    (=gt-pj-3		"GTpjC"		4 X)
    (=gt-pj-4		"GTpjD"		4 X)
    (=gt-pj-5		"GTpjE"		4 X)
    (=gt-pj-6		"GTpjF"		4 X)
    (=gt-pj-7		"GTpjG"		4 X)
    (=gt-pj-8		"GTpjH"		4 X)
    (=gt-pj-9		"GTpjI"		4 X)
    (=gt-pj-10		"GTpjJ"		4 X)
    (=gt-pj-11		"GTpjK"		4 X)
    (=ruimoku-v6	"Ruimoku"	4 X)
    (=hanziku-1		"HanzikuA"	4 X)
    (=hanziku-2		"HanzikuB"	4 X)
    (=hanziku-3		"HanzikuC"	4 X)
    (=hanziku-4		"HanzikuD"	4 X)
    (=hanziku-5		"HanzikuE"	4 X)
    (=hanziku-6		"HanzikuF"	4 X)
    (=hanziku-7		"HanzikuG"	4 X)
    (=hanziku-8		"HanzikuH"	4 X)
    (=hanziku-9		"HanzikuI"	4 X)
    (=hanziku-10	"HanzikuJ"	4 X)
    (=hanziku-11	"HanzikuK"	4 X)
    (=hanziku-12	"HanzikuL"	4 X)
    (=ucs-bmp@cns	"UCScns"	4 X)
    (thai-tis620	"ThaiTIS"	2 X)
    ))

(defvar chise-tex-accent-macro-alist
  '((?\u0300 . "`") ; <COMBINING GRAVE ACCENT>
    (?\u0301 . "'") ; <COMBINING ACUTE ACCENT>
    (?\u0302 . "^") ; <COMBINING CIRCUMFLEX ACCENT>
    (?\u0303 . "~") ; <COMBINING TILDE>
    (?\u0304 . "=") ; <COMBINING MACRON>
    (?\u0306 . "u") ; <COMBINING BREVE>
    (?\u0307 . ".") ; <COMBINING DOT ABOVE>
    (?\u0308 . "\"") ; <COMBINING DIAERESIS>
    (?\u0309 . "Hook")
    (?\u030C . "v") ; <COMBINING CARON>
    (?\u0323 . "d") ; <COMBINING DOT BELOW>
    (?\u0327 . "c") ; <COMBINING CEDILLA>
    (?\u032E . "ubreve")
    (?\u0331 . "umacron")
    ))

(defun chise-tex-encode-region-for-gb (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char start)
      (let (chr ret rest spec)
	(while (and (skip-chars-forward "\x00-\xFF")
		    (not (eobp)))
	  (setq chr (char-after))
	  (cond ((memq chr '(?$(O#@(B))
		 (delete-char)
		 (insert (format "\\UCSjis{%04X}"
				 (encode-char chr '=ucs@jis)))
		 )
		((and (setq ret (encode-char chr '=jis-x0208-1983))
		      (< ret #x3021))
		 (forward-char))
                ;; ((setq ret (encode-char chr '=jis-x0208-1990))
                ;;  (delete-char)
                ;;  (insert (decode-char '=jis-x0208-1983 ret)))
		((and (encode-char chr '=ks-x1001)
		      (setq ret (or (encode-char chr '=ucs@ks)
				    (char-ucs chr))))
		 (delete-char)
		 ;; (if (eq (char-before) ?$B!T(B)
		 ;;     (insert " "))
		 (insert (format "\\UCSks{%04X}" ret)))
		((catch 'tag
		   (setq rest chise-tex-coded-charset-expression-alist)
		   (while (setq spec (car rest))
		     (if (setq ret (encode-char chr (car spec)))
			 (throw 'tag ret))
		     (setq rest (cdr rest))))
		 (delete-char)
		 ;; (if (eq (char-before) ?$B!T(B)
		 ;;     (insert " "))
		 (insert (format (format "\\%s{%%0%d%s}"
					 (nth 1 spec)
					 (nth 2 spec)
					 (nth 3 spec))
				 ret)))
		(t
		 (forward-char))))))))

(defun chise-tex-encode-ucs-char-at-point (&optional chr)
  (unless chr
    (setq chr (char-after)))
  (let (ret rest spec)
    (cond
     ((and (encode-char chr '=ks-x1001)
	   (setq ret (or (encode-char chr '=ucs@ks)
			 (char-ucs chr))))
      (delete-char)
      ;; (if (eq (char-before) ?$B!T(B)
      ;;     (insert " "))
      (insert (format "\\UCSks{%04X}" ret))
      t)
     ((setq ret (encode-char chr '=ucs-hangul))
      (delete-char)
      ;; (if (eq (char-before) ?$B!T(B)
      ;;     (insert " "))
      (insert (format "\\UCSks{%04X}" ret))
      t)
     ((eq chr ?\u00B2)
      (delete-char)
      (insert "$^2$")
      t)
     ((eq chr ?\u00B3)
      (delete-char)
      (insert "$^3$")
      t)
     ((eq chr ?\u0111)
      (delete-char)
      (insert "{\\usefont{T1}{pxr}{m}{n}\\dj}")
      t)
     ((eq chr ?\u014B)
      (delete-char)
      (insert "{\\usefont{T1}{pxr}{m}{n}\\ng}")
      t)
     ((eq chr ?\u0282)
      (delete-char)
      (insert "{\\usefont{T1}{pxr}{m}{n}\\k{s}}")
      t)
     ((eq chr ?\u0294)
      (delete-char)
      (insert "\\UCSjis{0294}")
      t)
     ((eq chr ?\u2022)
      (delete-char)
      (insert "\\textbullet{}")
      t)
     ((eq chr ?\u2080)
      (delete-char)
      (insert "$_0$")
      t)
     ((eq chr ?\u2081)
      (delete-char)
      (insert "$_1$")
      t)
     ((eq chr ?\u2082)
      (delete-char)
      (insert "$_2$")
      t)
     ((eq chr ?\u2083)
      (delete-char)
      (insert "$_3$")
      t)
     ((eq chr ?\u2084)
      (delete-char)
      (insert "$_4$")
      t)
     ((eq chr ?\u2085)
      (delete-char)
      (insert "$_5$")
      t)
     ((eq chr ?\u2086)
      (delete-char)
      (insert "$_6$")
      t)
     ((eq chr ?\u2087)
      (delete-char)
      (insert "$_7$")
      t)
     ((eq chr ?\u2088)
      (delete-char)
      (insert "$_8$")
      t)
     ((eq chr ?\u2089)
      (delete-char)
      (insert "$_9$")
      t)
     ((eq chr ?\u208A)
      (delete-char)
      (insert "$_+$")
      t)
     ((eq chr ?\u208B)
      (delete-char)
      (insert "$_-$")
      t)
     ((eq chr ?\u208C)
      (delete-char)
      (insert "$_=$")
      t)
     ((eq chr ?\u208D)
      (delete-char)
      (insert "$_($")
      t)
     ((eq chr ?\u208E)
      (delete-char)
      (insert "$_)$")
      t)
     ((eq chr ?\u2637)
      (delete-char)
      (insert "\\UCSgb{2637}")
      t)
     ((eq (encode-char chr '=ucs@jis) #x8DBC)
      (delete-char)
      (insert "\\GTpjG{4933}")
      t)
     ((and (encode-char chr '=ucs@jp)
	   (setq ret (char-representative-of-domain chr 'gb))
	   (setq ret (encode-char ret '=ucs@gb))
	   (<= ret #xFFFF))
      (delete-char)
      ;; (if (eq (char-before) ?$B!T(B)
      ;;     (insert " "))
      (insert (format "\\UCSgb{%04X}" ret))
      t)
     ((catch 'tag
	(setq rest chise-tex-coded-charset-expression-alist)
	(while (setq spec (car rest))
	  (if (setq ret (encode-char chr (car spec)))
	      (throw 'tag ret))
	  (setq rest (cdr rest))))
      (delete-char)
      ;; (if (eq (char-before) ?$B!T(B)
      ;;     (insert " "))
      (insert (format (format "\\%s{%%0%d%s}"
			      (nth 1 spec)
			      (nth 2 spec)
			      (nth 3 spec))
		      ret))
      t)
     )))

(defun chise-tex-encode-region-for-jis (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char start)
      (let (chr ret
		;; rest spec
		modifier base modifier-1)
	(while (and (skip-chars-forward "\x00-\x7F")
		    (not (eobp)))
	  (setq chr (char-after))
          (cond ((encode-char chr '=jis-x0208-1983)
		 (forward-char))
                ;; ((setq ret (encode-char chr '=jis-x0208-1990))
                ;;  (delete-char)
                ;;  (insert (decode-char '=jis-x0208-1983 ret)))
		((and (not (eq (char-ucs chr) #x0439))
		      (not (eq (char-ucs chr) #x0451))
		      (setq ret (char-feature chr '=decomposition))
		      (setq modifier (assq (nth 1 ret)
					   '((?\u0300 . "`")
					     (?\u0301 . "'")
					     (?\u0302 . "^")
					     (?\u0303 . "~")
					     (?\u0304 . "=")
					     (?\u0306 . "u")
					     (?\u0307 . ".")
					     (?\u0308 . "\"")
					     (?\u0309 . "Hook")
					     (?\u030C . "v")
					     (?\u0323 . "d")
					     (?\u0327 . "c")
					     ))))
		 (delete-char)
		 (setq base (car ret))
		 (if (and (setq ret (char-feature base '=decomposition))
			  (setq modifier-1
				(assq (car modifier)
				      (cdr
				       (assq (nth 1 ret)
					     '((?\u0302
						(?\u0300 . "CircGrave")
						(?\u0301 . "CircAcute")
						(?\u0303 . "CircTilde")
						(?\u0309 . "CircHook")
						)
					       (?\u031B
						(?\u0301 . "HornAcute")
						)
					       (?\u0323
						(?\u0302 . "Circudot")
						)))))))
		     (insert (format "\\%s{%c}" (cdr modifier-1) (car ret)))
		   (insert (format "\\%s{%c}" (cdr modifier) base))))
		((and (or (encode-char chr '=jis-x0213-1-2000)
			  (encode-char chr '=jis-x0213-2-2000))
		      (setq ret (or (encode-char chr '=ucs@jis/2000)
				    (encode-char chr '=ucs@jis/fw)))
		      (<= ret #xFFFF))
		 (delete-char)
		 ;; (if (eq (char-before) ?$B!T(B)
		 ;;     (insert " "))
		 (insert (format "\\UCSjis{%04X}" ret)))
                ((chise-tex-encode-ucs-char-at-point chr))
                (t
		 (forward-char))))))))

(defun chise-tex-encode-region-for-utf-8-jis (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char start)
      (let ((font-encoding 'T1)
	    chr ret
	    ;; rest spec
	    modifier base modifier-1 pos)
	(while (and (skip-chars-forward "\x00-\x7F")
		    (not (eobp)))
	  (setq chr (char-after))
	  (cond
	   ((and (setq ret (encode-char chr '=ucs))
		 (and (<= #x0400 ret)(<= ret #x04F9)))
	    (if (eq font-encoding 'T2A)
		(forward-char)
	      (setq pos (point))
	      (unless (and (prog1
			       (search-backward
				"\\fontencoding{T2A}\\selectfont{}" nil t)
			     (goto-char pos))
			   (eq pos (match-end 0)))
		(insert "\\fontencoding{T2A}\\selectfont{}")
		)
	      (forward-char)
	      (setq font-encoding 'T2A))
	    )
	   ((and (setq ret (encode-char chr '=ucs))
		 (and (<= #x0374 ret)(<= ret #x03F3)))
	    (if (eq font-encoding 'LGR)
		(forward-char)
	      (setq pos (point))
	      (unless (and (prog1
			       (search-backward
				"\\fontencoding{LGR}\\selectfont{}" nil t)
			     (goto-char pos))
			   (eq pos (match-end 0)))
		(insert "\\fontencoding{LGR}\\selectfont{}")
		)
	      (forward-char)
	      (setq font-encoding 'LGR))
	    (skip-chars-forward "\u0374-\u03F3")
	    (unless (eq font-encoding 'T1)
	      (unless (looking-at
		       "\\\\fontencoding{T1}\\\\selectfont{}")
		(insert "\\fontencoding{T1}\\selectfont{}")
		)
	      (setq font-encoding 'T1))
	    )
	   (t
	    (unless (eq font-encoding 'T1)
              (setq pos (point))
	      (unless (and (prog1
			       (search-backward
				"\\fontencoding{T1}\\selectfont{}" nil t)
			     (goto-char pos))
			   (eq pos (match-end 0)))
		(insert "\\fontencoding{T1}\\selectfont{}")
		)
	      (setq font-encoding 'T1))
	    (cond ((eq (char-ucs chr) #x00D7)
		   (delete-char)
		   (insert "\\UCSjis{00D7}"))
		  ((encode-char chr '=jis-x0208-1983)
		   (forward-char))
		  ((and (setq ret (char-ucs chr))
			(or (eq ret #x00C5)
			    (eq ret #x00E5)
			    (eq ret #x1E2B)
			    ))
		   (forward-char))
		  ;; ((setq ret (encode-char chr '=jis-x0208-1990))
		  ;;  (delete-char)
		  ;;  (insert (decode-char '=jis-x0208-1983 ret)))
		  ((eq (char-ucs chr) #x012B)
		   (delete-char)
		   (insert "\\={\\i}")
		   )
		  ((setq ret (encode-char chr 'thai-tis620))
		   (delete-char)
		   (insert (format "\\ThaiTIS{%X}" (logior ret #x80)))
		   )
		  ((and (not (eq (char-ucs chr) #x0439))
			(not (eq (char-ucs chr) #x0451))
			(setq ret (char-feature chr '=decomposition))
			(setq modifier (assq (nth 1 ret)
					     chise-tex-accent-macro-alist)))
		   (delete-char)
		   (setq base (car ret))
		   (if (and (setq ret (char-feature base '=decomposition))
			    (setq modifier-1
				  (assq (car modifier)
					(cdr
					 (assq (nth 1 ret)
					       '((?\u0302
						  (?\u0300 . "\\CircGrave{%c}")
						  (?\u0301 . "\\'{\\^%c}")
						  (?\u0303 . "\\~{\\^%c}")
						  (?\u0309 . "\\CircHook{%c}")
						  )
						 (?\u031B
						  (?\u0301 . "\\HornAcute{%c}")
						  (?\u0303 . "\\HornTilde{%c}")
						  )
						 (?\u0323
						  (?\u0302 . "\\Circudot{%c}")
						  )))))))
		       (insert (format (cdr modifier-1) (car ret)))
		     (insert (format "\\%s{%c}" (cdr modifier) base))))
		  ((and (or (encode-char chr '=jis-x0213-1-2000)
			    (encode-char chr '=jis-x0213-2-2000))
			(setq ret (or (encode-char chr '=ucs@jis/2000)
				      (encode-char chr '=ucs@jis/fw)))
			(<= ret #xFFFF))
		   ;; (delete-char)
		   ;; (if (eq (char-before) ?$B!T(B)
		   ;;     (insert " "))
		   ;; (insert (format "\\UCSjis{%04X}" ret))
		   (forward-char))
                  ((chise-tex-encode-ucs-char-at-point chr))
                  (t
		   (forward-char))))))))))

(defun chise-tex-decode-region (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char start)
      (let (macro code ret me rest spec)
	(while (search-forward "\\={\\i}" nil t)
	  (replace-match ".DNo" t t))
	(goto-char start)
	(while (re-search-forward "\\\\\\(.\\){\\(.\\)}" nil t)
	  (when (and
		 (setq macro
		       (assq
			(aref (match-string 1) 0)
			'((?\` . ?\u0300) ; <COMBINING GRAVE ACCENT>
			  (?\' . ?\u0301) ; <COMBINING ACUTE ACCENT>
			  (?^  . ?\u0302) ; <COMBINING CIRCUMFLEX ACCENT>
			  (?~  . ?\u0303) ; <COMBINING TILDE>
			  (?=  . ?\u0304) ; <COMBINING MACRON>
			  (?u  . ?\u0306) ; <COMBINING BREVE>
			  (?\. . ?\u0307) ; <COMBINING DOT ABOVE>
			  (?\" . ?\u0308) ; <COMBINING DIAERESIS>
			  (?v  . ?\u030C) ; <COMBINING CARON>
			  (?d  . ?\u0323) ; <COMBINING DOT BELOW>
			  (?c  . ?\u0327) ; <COMBINING CEDILLA>
			  )))
		 (setq ret
		       (cdr (assq (cdr macro)
				  (char-feature (aref (match-string 2) 0)
						'composition)))))
	    (delete-region (match-beginning 0)(match-end 0))
	    (insert ret)))
	(goto-char start)
	(while (re-search-forward "\\\\\\([a-zA-Z0-9]+\\){\\([0-9A-Fa-f]+\\)}"
				  nil t)
	  (setq macro (match-string 1)
		code (match-string 2)
		me (match-end 0))
	  (if (and (catch 'tag
		     (setq rest chise-tex-coded-charset-expression-alist)
		     (while (setq spec (car rest))
		       (if (string= (nth 1 spec) macro)
			   (throw 'tag spec))
		       (setq rest (cdr rest))))
		   (setq ret (decode-char (car spec)
					  (string-to-int
					   code
					   (if (eq (nth 3 spec) 'X)
					       16)))))
	      (progn
		(delete-region (match-beginning 0)(match-end 0))
		(insert ret))
	    (goto-char me)))))))

(make-coding-system
 'iso-2022-jp-tex-gb 'iso2022
 "ISO-2022-JP with TeX representation for GB fonts."
 '(charset-g0 ascii
   short t
   seven t
   ;; input-charset-conversion ((latin-jisx0201 ascii)
   ;; 			     (japanese-jisx0208-1978 japanese-jisx0208))
   pre-write-conversion chise-tex-encode-region-for-gb
   post-read-conversion chise-tex-decode-region
   mnemonic "pTeX(GB)/7bit"
   ))

(make-coding-system
 'iso-2022-jp-tex-jis 'iso2022
 "ISO-2022-JP with TeX representation for JIS fonts."
 '(charset-g0 ascii
   short t
   seven t
   ccs-priority-list (ascii
		      =jis-x0208@1983 =jis-x0208@1978
		      latin-jisx0201)
   ;; output-charset-conversion ((=jis-x0208@1990 =jis-x0208@1983))
   pre-write-conversion chise-tex-encode-region-for-jis
   post-read-conversion chise-tex-decode-region
   mnemonic "pTeX(JIS)/7bit"
   ))

(make-coding-system
 'utf-8-jp-tex 'utf-8
 "Coding-system of UTF-8 for common glyphs used in Japan."
 '(pre-write-conversion chise-tex-encode-region-for-utf-8-jis
   post-read-conversion chise-tex-decode-region
   charset-g0 =ucs@jp
   charset-g1 =>ucs-jis
   charset-g2 =>ucs
   mnemonic "upTeX(JP)/UTF8"))


;;; @ End.
;;;

(provide 'chise-tex)

;;; chise-tex.el ends here
