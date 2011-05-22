;;; isolated-char.el --- Set up isolated-characters.

;; Copyright (C) 2001,2002,2003,2005 MORIOKA Tomohiko

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: UTF-2000, UCS-4, character, CCS, multiscript, multilingual

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

;; MULE-VISCII

(let ((i #xA0)
      v)
  (while (<= i #xFF)
    (put-char-attribute (decode-builtin-char 'latin-viscii-lower i)
			'latin-viscii i)
    (setq i (1+ i))))

(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA1)
		    'latin-viscii #x81)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA2)
		    'latin-viscii #x82)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA3)
		    'latin-viscii #x83)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA4)
		    'latin-viscii #x84)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA5)
		    'latin-viscii #x85)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA6)
		    'latin-viscii #x86)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA7)
		    'latin-viscii #x87)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA8)
		    'latin-viscii #x88)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xA9)
		    'latin-viscii #x89)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xAA)
		    'latin-viscii #x8A)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xAB)
		    'latin-viscii #x8B)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xAC)
		    'latin-viscii #x8C)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xAD)
		    'latin-viscii #x8D)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xAE)
		    'latin-viscii #x8E)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xAF)
		    'latin-viscii #x8F)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xB0)
		    'latin-viscii #x90)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xB1)
		    'latin-viscii #x91)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xB2)
		    'latin-viscii #x92)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xB5)
		    'latin-viscii #x93)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xB6)
		    'latin-viscii #x96)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xB7)
		    'latin-viscii #x97)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xB8)
		    'latin-viscii #x98)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xBD)
		    'latin-viscii #xB4)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xBE)
		    'latin-viscii #x95)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xC6)
		    'latin-viscii #x02)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xC7)
		    'latin-viscii #x05)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xCF)
		    'latin-viscii #x9F)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xD1)
		    'latin-viscii #xBA)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xD5)
		    'latin-viscii #x80)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xD6)
		    'latin-viscii #x14)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xD7)
		    'latin-viscii #xBB)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xD8)
		    'latin-viscii #xBC)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xDB)
		    'latin-viscii #x19)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xDC)
		    'latin-viscii #x1E)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xDE)
		    'latin-viscii #xB3)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xDF)
		    'latin-viscii #xBF)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE0)
		    'latin-viscii #xC0)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE1)
		    'latin-viscii #xC1)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE2)
		    'latin-viscii #xC2)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE3)
		    'latin-viscii #xC3)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE4)
		    'latin-viscii #xC4)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE5)
		    'latin-viscii #xC5)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE6)
		    'latin-viscii #xFF)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE7)
		    'latin-viscii #x06)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE8)
		    'latin-viscii #xC8)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xE9)
		    'latin-viscii #xC9)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xEA)
		    'latin-viscii #xCA)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xEB)
		    'latin-viscii #xCB)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xEC)
		    'latin-viscii #xCC)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xED)
		    'latin-viscii #xCD)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xEE)
		    'latin-viscii #xCE)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xEF)
		    'latin-viscii #x9B)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF0)
		    'latin-viscii #xD0)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF1)
		    'latin-viscii #xB9)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF2)
		    'latin-viscii #xD2)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF3)
		    'latin-viscii #xD3)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF4)
		    'latin-viscii #xD4)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF5)
		    'latin-viscii #xA0)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF6)
		    'latin-viscii #x99)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF7)
		    'latin-viscii #x9A)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF8)
		    'latin-viscii #x9E)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xF9)
		    'latin-viscii #xD9)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xFA)
		    'latin-viscii #xDA)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xFB)
		    'latin-viscii #x9D)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xFC)
		    'latin-viscii #x9C)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xFD)
		    'latin-viscii #xDD)
(put-char-attribute (decode-builtin-char 'latin-viscii-upper #xFE)
		    'latin-viscii #x94)


;; GT 2000

(with-temp-buffer
  (buffer-disable-undo)
  (insert-file-contents "../etc/char-data/GT-RS.txt")
    (goto-char (point-min))
    (let (gt-code radical strokes plane code)
      (while (re-search-forward "\\([0-9]+\\),\\([0-9]+\\|---\\)?,\\([0-9]+\\)?,GT\\([0-9]+\\),....,\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)" nil t)
	(setq gt-code (string-to-int (match-string 1))
	      plane (string-to-int (match-string 4))
	      code (string-to-int (match-string 5) 16))
	(put-char-attribute (decode-builtin-char '=gt gt-code)
			    '=gt gt-code)
	(put-char-attribute (decode-builtin-char '=gt gt-code)
			    (intern (format "=gt-pj-%d" plane))
			    code)
	)))

(with-temp-buffer
  (buffer-disable-undo)
  (insert-file-contents "../etc/char-data/GT-fmap-K1.txt")
  (insert-file-contents "../etc/char-data/GT-fmap-K2.txt")
  (insert-file-contents "../etc/char-data/GT-fmap-K3.txt")
  (insert-file-contents "../etc/char-data/GT-fmap-K4.txt")
  (goto-char (point-min))
  (let (plane code gt-code)
    (while (re-search-forward "^GTps-\\([0-9k][0-9]\\)-\\([0-9A-F][0-9A-F][0-9A-F][0-9A-F]\\)\tGT-K\\([0-9]+\\)" nil t)
      (setq plane (match-string 1)
	    code (string-to-int (match-string 2) 16)
	    gt-code (string-to-int (match-string 3)))
      (if (eq (aref plane 0) ?0)
	  (setq plane (substring plane 1)))
      (put-char-attribute (decode-builtin-char '=gt-k gt-code)
			  (intern (format "=gt-pj-%s" plane))
			  (encode-char
			   (decode-shift-jis-char (cons (/ code 256)
							(% code 256)))
			   'japanese-jisx0208))
      )))

;; (define-char
;;   '((=gt-pj-4   . #x3844)
;;     (=gt        . 19655)
;;     ))
;; (define-char
;;   '((=gt-pj-4   . #x3845)
;;     (=gt        . 19656)
;;     ))
;; (define-char
;;   '((=gt-pj-9   . #x4D7B)
;;     (=gt        . 19861)
;;     ))
;; (define-char
;;   '((=gt-pj-4   . #x493C)
;;     (=gt        . 21862)
;;     ))
;; (define-char
;;   '((=gt-pj-4   . #x6D51)
;;     (=gt        . 26606)
;;     ))
;; (define-char
;;   '((=gt-pj-5   . #x4579)
;;     (=gt        . 30254)
;;     ))
;; (define-char
;;   '((=gt-pj-11 . #x5277)
;;     (=gt        . 40268)
;;     ))
;; (define-char
;;   '((=gt-pj-1   . #x3F6B)
;;     (=gt        . 52230)
;;     ))
;; (define-char
;;   '((=gt-pj-7   . #x5821)
;;     (=gt        . 52349)
;;     ))
;; (define-char
;;   '((=gt-pj-9   . #x4C4B)
;;     (=gt        . 56364)
;;     ))
(define-char
  '((=gt-pj-11	. #x5A40)
    (=gt	. 67403)
    ))

;;; isolated-char.el ends here
