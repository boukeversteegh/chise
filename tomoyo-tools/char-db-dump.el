;;; char-db-dump.el --- Dump utility of char-spec files

;; Copyright (C) 2002,2003,2004,2005,2010 MORIOKA Tomohiko

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

;;;###autoload
(defun char-db-dump-ideographs (directory)
  (interactive "DDump Ideographs : ")
  (update-ideograph-radical-table)
  (let ((i 1))
    (while (<= i 214)
      (write-ideograph-radical-char-data i directory)
      (setq i (1+ i)))))

(defvar char-db-ucs-range-file-list
  '((#x0000 #x001F "u00000-C0.el")
    (#x0020 #x007F "u00020-Basic-Latin.el")
    (#x0080 #x009F "u00080-C1.el")
    (#x00A0 #x00FF "u000A0-Latin-1-Supplement.el")
    (#x0100 #x017F "u00100-Latin-Extended-A.el")
    (#x0180 #x024F "u00180-Latin-Extended-B.el")
    (#x0250 #x02AF "u00250-IPA-Extensions.el")
    (#x02B0 #x02FF "u002B0-Spacing-Modifier-Letters.el")
    (#x0300 #x036F "u00300-Combining-Diacritical-Marks.el")
    (#x0370 #x03FF "u00370-Greek.el")
    (#x0400 #x04FF "u00400-Cyrillic.el")
    (#x0530 #x058F "u00530-Armenian.el")
    (#x0590 #x05FF "u00590-Hebrew.el")
    (#x0600 #x06FF "u00600-Arabic.el")
    (#x0700 #x074F "u00700-Syriac.el")
    (#x0780 #x07BF "u00780-Thaana.el")
    (#x0900 #x097F "u00900-Devanagari.el")
    (#x0980 #x09FF "u00980-Bengali.el")
    (#x0A00 #x0A7F "u00A00-Gurmukhi.el")
    (#x0A80 #x0AFF "u00A80-Gujarati.el")
    (#x0B00 #x0B7F "u00B00-Oriya.el")
    (#x0B80 #x0BFF "u00B80-Tamil.el")
    (#x0C00 #x0C7F "u00C00-Telugu.el")
    (#x0C80 #x0CFF "u00C80-Kannada.el")
    (#x0D00 #x0D7F "u00D00-Malayalam.el")
    (#x0D80 #x0DFF "u00D80-Sinhala.el")
    (#x0E00 #x0E7F "u00E00-Thai.el")
    (#x0E80 #x0EFF "u00E80-Lao.el")
    (#x0F00 #x0FFF "u00F00-Tibetan.el")
    (#x1000 #x109F "u01000-Myanmar.el")
    (#x10A0 #x10FF "u010A0-Georgian.el")
    (#x1100 #x11FF "u01100-Hangul-Jamo.el")
    (#x1200 #x137C "u01200-Ethiopic.el")
    (#x13A0 #x13FF "u013A0-Cherokee.el")
    (#x1400 #x167F "u01400-Canadian.el")
    (#x1680 #x169F "u01680-Ogham.el")
    (#x16A0 #x16FF "u016A0-Runic.el")
    (#x1780 #x17FF "u01780-Khmer.el")
    (#x1800 #x18AF "u01800-Mongolian.el")
    (#x1E00 #x1EFF "u01E00-Latin-Extended-Additional.el")
    (#x1F00 #x1FFF "u01F00-Greek-Extended.el")
    (#x2000 #x206F "u02000-General-Punctuation.el")
    (#x2070 #x207F "u02070-Superscripts.el")
    (#x2080 #x208F "u02080-Subscripts.el")
    (#x20A0 #x20AF "u020A0-Currency-Symbols.el")
    (#x20D0 #x20FF "u020D0-Combining-Diacritical-Marks-for-Symbols.el")
    (#x2100 #x214F "u02100-Letterlike-Symbols.el")
    (#x2150 #x218F "u02150-Number-Forms.el")
    (#x2190 #x21FF "u02190-Arrows.el")
    (#x2200 #x22FF "u02200-Mathematical-Operators.el")
    (#x2300 #x23FF "u02300-Miscellaneous-Technical.el")
    (#x2400 #x243F "u02400-Control-Pictures.el")
    (#x2440 #x244A "u02440-OCR.el")
    (#x2460 #x24FF "u02460-Enclosed-Alphanumerics.el")
    (#x2500 #x257F "u02500-Box-Drawing.el")
    (#x2580 #x259F "u02580-Block-Elements.el")
    (#x25A0 #x25FF "u025A0-Geometric-Shapes.el")
    (#x2600 #x267F "u02600-Miscellaneous-Symbols.el")
    (#x2700 #x27BF "u02700-Dingbats.el")
    (#x2800 #x28FF "u02800-Braille-Patterns.el")
    (#x2900 #x297F "u02900-Supplemental-Arrows-B.el")
    (#x2980 #x29FF "u02980-Miscellaneous-Mathematical-Symbols-B.el")
    (#x2E00 #x2EFF "u02E00-CJK-Radical-Supplement.el")
    (#x2F00 #x2FEF "u02F00-Kangxi-Radicals.el")
    (#x2FF0 #x2FFF "u02FF0-Ideographic-Description-Characters.el")
    (#x3000 #x303F "u03000-CJK-Symbols-and-Punctuation.el" nil Ideograph)
    (#x3040 #x309F "u03040-Hiragana.el")
    (#x30A0 #x30FF "u030A0-Katakana.el")
    (#x3100 #x312F "u03100-Bopomofo.el" 'Bopomofo)
    (#x3130 #x318F "u03130-Hangul-Compatibility-Jamo.el")
    (#x3190 #x319F "u03190-Kanbun.el")
    (#x31A0 #x31BF "u031A0-Bopomofo-Extended.el")
    (#x31F0 #x31FF "u031F0-Katakana-Phonetic-Extensions.el")
    (#x3200 #x32FF "u03200-Enclosed-CJK-Letters-and-Months.el")
    (#x3300 #x33FF "u03300-CJK-Compatibility.el")
    ;; snip CJK Unified Ideographs
    (#xA000 #xA48F "u0A000-Yi-Syllables.el")
    (#xA490 #xA4CF "u0A490-Yi-Radicals.el")
    (#xAC00 #xD7AF "u0AC00-Hangul-Syllables.el")
    (#xE000 #xF8FF "u0E000-Private-Use.el")
    ;; snip CJK Compatibility Ideographs
    (#xFB00 #xFB4F "u0FB00-Alphabetic-Presentation-Forms.el")
    (#xFB50 #xFDFF "u0FB50-Arabic-Presentation-Forms-A.el")
    (#xFE20 #xFE2F "u0FE20-Combining-Half-Marks.el")
    (#xFE30 #xFE4F "u0FE30-CJK-Compatibility-Forms.el")
    (#xFE50 #xFE6F "u0FE50-Small-Form-Variants.el")
    (#xFE70 #xFEFF "u0FE70-Arabic-Presentation-Forms-B.el")
    (#xFF00 #xFFEF "u0FF00-Halfwidth-and-Fullwidth-Forms.el")
    (#xFFF0 #xFFFF "u0FFF0-Specials.el")
    ))

;;;###autoload
(defun char-db-dump-non-ideographs (directory)
  (interactive "DDump Non-Ideographs : ")
  (dolist (range char-db-ucs-range-file-list)
    (write-char-range-data-to-file
     (car range) (nth 1 range)
     (expand-file-name (nth 2 range) directory)
     (nth 3 range)(nth 4 range))))


;;;###autoload
(defun char-db-dump-oracle-bones (directory)
  (interactive "DDump Oracle-Bones : ")
  (let ((coding-system-for-write char-db-file-coding-system)
	(code 1)
	chr a-chr)
    (with-temp-buffer
      (insert (format ";; -*- coding: %s -*-\n"
		      char-db-file-coding-system))
      (while (<= code 8192)
	(when (setq chr (decode-char '=zinbun-oracle code 'defined-only))
	  (setq a-chr (decode-char '=>zinbun-oracle code 'defined-only))
	  (unless (eq a-chr chr)
	    (insert-char-data a-chr))
	  (insert-char-data chr))
	(setq code (1+ code)))
      (write-region (point-min)(point-max)
		    (expand-file-name "Oracle-Bones.el" directory)))))

;;;###autoload
(defun char-db-dump-ruimoku6 (directory)
  (interactive "DDump ruimoku6 : ")
  (let ((coding-system-for-write char-db-file-coding-system)
	(code #xE000)
	chr)
    (with-temp-buffer
      (insert (format ";; -*- coding: %s -*-\n"
		      char-db-file-coding-system))
      (while (<= code #xE8FF)
	(when (setq chr (decode-char '=ruimoku-v6 code 'defined-only))
	  (insert-char-data chr))
	(setq code (1+ code)))
      (write-region (point-min)(point-max)
		    (expand-file-name "ruimoku6.el" directory)))))

;;;###autoload
(defun char-db-dump-additional-precomposed (directory)
  (interactive "DDump additional-precomposed : ")
  (let ((coding-system-for-write char-db-file-coding-system))
    (with-temp-buffer
      (insert (format ";; -*- coding: %s -*-\n"
		      char-db-file-coding-system))
      (map-char-attribute
       (lambda (char value)
	 (unless (char-ucs char)
	   (unless (char-ucs char)
	     (insert-char-data char)))
	 nil)
       '=decomposition)
      (write-region (point-min)(point-max)
		    (expand-file-name
		     "additional-precomposed.el" directory)))))


;;;###autoload
(defun char-db-dump (directory)
  (interactive "DDirectory to dump : ")
  (char-db-dump-ideographs directory)
  (char-db-dump-non-ideographs directory)
  (char-db-dump-oracle-bones directory)
  (char-db-dump-ruimoku6 directory)
  (char-db-dump-additional-precomposed directory))


;;; @ End.
;;;

(provide 'char-db-dump)

;;; char-db-dump.el ends here
