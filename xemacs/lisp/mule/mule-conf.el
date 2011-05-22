;;; mule-conf.el --- configure multilingual environment

;; Copyright (C) 1995,1999 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997, 1999, 2000, 2002, 2003, 2004, 2005, 2006, 2008,
;;   2009, 2010, 2011 MORIOKA Tomohiko

;; Keywords: mule, multilingual, character set, coding system

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(cond
 ((featurep 'utf-2000)
  (make-charset
   '=jis-x0208@1978
   "JIS X 0208:1978, unchanged part."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208
	      =>iso-ir 42
	      final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/-4pr
   "JIS X 0208:1978, 1st - 3rd impressions."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978
	      =>iso-ir 42
	      final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/1pr
   "JIS X 0208:1978, 1st impression."
   '(iso-ir 42
	    registry "jisx0208\\.1978"
	    dimension 2
	    chars 94
	    mother =jis-x0208@1978/-4pr
	    final ?@
	    graphic 0))
  (make-charset
   '=jis-x0208@1978/-4X
   "JIS X 0208:1978, index before the 4th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978
	      =>iso-ir 42
              ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/1er-pr
   "JIS X 0208:1978, fixed by errata [Nov 1978]."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/2-pr
   "JIS X 0208:1978, 2nd impression or later."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978/1er-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/4er
   "JIS X 0208:1978, replaced by errata of 4th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978/2-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/4-pr
   "JIS X 0208:1978, 4th impression or later."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978/2-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (make-charset
   '=jis-x0208@1978/5pr
   "JIS X 0208:1978, 5th impression."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =jis-x0208@1978/4-pr
              =>iso-ir 42
	      ;; final ?@
	      graphic 0
	      partial t))
  (define-charset-alias '=jis-x0208@1978/i1 '=jis-x0208@1978/1pr)
  (define-charset-alias '=jis-x0208@1978/i-4 '=jis-x0208@1978/-4pr)
  (define-charset-alias '=jis-x0208@1978/i4- '=jis-x0208@1978/4-pr)
  )
 (t
  (make-charset
   '=jis-x0208@1978
   "JIS X0208:1978 Japanese Kanji (so called \"old JIS\")."
   '(iso-ir 42
	    registry "jisx0208\\.1978"
	    dimension 2
	    chars 94
	    mother =jis-x0208
	    final ?@
	    graphic 0))
  ))

(define-charset-alias '=jis-x0208-1978		'=jis-x0208@1978)
(define-charset-alias 'japanese-jisx0208-1978	'=jis-x0208@1978)
(define-charset-alias 'chinese-gb2312		'=gb2312)
(define-charset-alias '=jis-x0208-1983		'=jis-x0208@1983)
(define-charset-alias 'japanese-jisx0208	'=jis-x0208@1983)
(define-charset-alias 'korean-ksc5601		'=ks-x1001)
(define-charset-alias 'japanese-jisx0212	'=jis-x0212)
(define-charset-alias 'chinese-cns11643-1	'=cns11643-1)
(define-charset-alias 'chinese-cns11643-2	'=cns11643-2)
(define-charset-alias 'chinese-gb12345		'=gb12345)
(define-charset-alias 'chinese-big5		'=big5)

;; PinYin-ZhuYin
(make-charset 'sisheng "PinYin-ZhuYin"
	      '(registry "sisheng_cwnn\\|OMRON_UDC_ZH"
		dimension 1
		chars 94
		final ?0
		graphic 0
		))

;; Lao script.
;; ISO10646's 0x0E80..0x0EDF are mapped to 0x20..0x7F.
(make-charset 'lao "Lao script"
	      '(registry "MuleLao-1"
		dimension 1
		chars 94
		final ?1
		graphic 1))

;; IPA (International Phonetic Alphabet)
(make-charset 'ipa "International Phonetic Alphabet"
	      '(registry "MuleIPA"
		dimension 1
		chars 96
		final ?0
		graphic 1))

;; Ethiopic
(make-charset 'ethiopic "Ethiopic"
	      '(registry "Ethio"
		dimension 2
		chars 94
		final ?3
		graphic 0
		))

;; ISO-IR-165 (CCITT Extended GB)
;;    It is based on CCITT Recommendation T.101, includes GB 2312-80 +
;;    GB 8565-88 table A4 + 293 characters.
(if (featurep 'utf-2000)
    (progn
      (make-charset '=iso-ir165
		    "ISO-IR-165 (CCITT Extended GB; Chinese simplified)"
		    '(iso-ir 165
			     dimension 2
			     chars 94
			     mother =gb2312
			     final ?E
			     registry "isoir165"
			     graphic 0))
      (define-charset-alias 'chinese-isoir165 '=iso-ir165))
  (make-charset 'chinese-isoir165
		"ISO-IR-165 (CCITT Extended GB; Chinese simplified)"
		'(iso-ir 165
			 dimension 2
			 chars 94
			 final ?E
			 registry "isoir165"
			 graphic 0)))

;; CNS11643 Plane3 thru Plane7
;; These represent more and more obscure Chinese characters.
;; By the time you get to Plane 7, we're talking about characters
;; that appear once in some ancient manuscript and whose meaning
;; is unknown.

(flet
    ((make-chinese-cns11643-charset
      (name iso-ir plane final)
      (make-charset
       name (concat "CNS 11643 Plane " plane " (Chinese traditional)")
       `(iso-ir ,iso-ir
	 registry 
	 ,(concat "CNS11643[.-]\\(.*[.-]\\)?" plane "$")
	 dimension 2
	 chars 94
	 final ,final
	 graphic 0))
      ))
  (make-chinese-cns11643-charset '=cns11643-3 183 "3" ?I)
  (make-chinese-cns11643-charset '=cns11643-4 184 "4" ?J)
  (make-chinese-cns11643-charset '=cns11643-5 185 "5" ?K)
  (make-chinese-cns11643-charset '=cns11643-6 186 "6" ?L)
  (make-chinese-cns11643-charset '=cns11643-7 187 "7" ?M)
  (define-charset-alias 'chinese-cns11643-3	'=cns11643-3)
  (define-charset-alias 'chinese-cns11643-4	'=cns11643-4)
  (define-charset-alias 'chinese-cns11643-5	'=cns11643-5)
  (define-charset-alias 'chinese-cns11643-6	'=cns11643-6)
  (define-charset-alias 'chinese-cns11643-7	'=cns11643-7)
  )

;; JIS X 0213:2000
(cond
 ((featurep 'utf-2000)
  (make-charset
   '=jis-x0213-1
   "JIS X 0213 Plain 1 (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      =>iso-ir 228
	      final ?O
	      graphic 0
	      partial t))

  (make-charset
   '=jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1"
   '(iso-ir 228
	    registry "jisx0213\\(\\.2000\\)-1"
	    dimension 2
	    chars 94
	    mother =jis-x0213-1
	    final ?O
	    graphic 0))
  (make-charset
   '=jis-x0213-2
   "JIS X 0213 Plain 2"
   '(iso-ir 229
	    registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	    dimension 2
	    chars 94
	    final ?P
	    graphic 0))

  (make-charset
   '=jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1"
   '(iso-ir 233
	    registry "jisx0213\\(\\.2004\\)-1"
	    dimension 2
	    chars 94
	    mother =jis-x0213-1
	    final ?Q
	    graphic 0))

  (define-charset-alias 'japanese-jisx0213-1 '=jis-x0213-1@2000)
  (define-charset-alias 'japanese-jisx0213-2 '=jis-x0213-2)
  (define-charset-alias '=jis-x0213-1-2000 '=jis-x0213-1@2000)
  (define-charset-alias '=jis-x0213-2-2000 '=jis-x0213-2)
  )
 (t
  (make-charset
   'japanese-jisx0213-1
   "JIS X 0213:2000 Plain 1"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      final ?O
	      graphic 0))
  (make-charset
   'japanese-jisx0213-2
   "JIS X 0213:2000 Plain 2"
   '(registry "jisx0213\\(\\.2000\\)-2"
	      dimension 2
	      chars 94
	      final ?P
	      graphic 0))
  ))

(when (featurep 'utf-2000)
  (define-charset-alias 'ucs '=ucs)
  (define-charset-alias '=jis-x0208-1990 '=jis-x0208@1990)
  (define-charset-alias 'japanese-jisx0208-1990 '=jis-x0208@1990)

  (make-charset
   '=>>>jis-x0208
   "JIS X 0208 abstract glyph-forms (unchanged part)."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (make-charset
   '=>>>jis-x0208@1978
   "JIS X 0208:1978 abstract glyph-forms."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =>>>jis-x0208
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0))
  (make-charset
   '=>>>jis-x0208@1983
   "JIS X 0208:1983 abstract glyph-forms."
   '(registry "jisx0208\\.1983"
	      dimension 2
	      chars 94
	      mother =>>>jis-x0208
	      =>iso-ir 87
	      graphic 0))
  (make-charset
   '=>>>jis-x0208@1990
   "JIS X 0208:1990 abstract glyph-forms."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>>>jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (make-charset
   '=>>>jis-x0213-1
   "JIS X 0213 Plain 1 abstract glyph-forms (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      mother =jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
              ;; partial t
	      ))
  (make-charset
   '=>>>jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1 abstract glyph-forms"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      mother =>>>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '=>>>jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1 abstract glyph-forms"
   '(mother =>>>jis-x0213-1
	    =>iso-ir 233
	    ;; registry "jisx0213\\(\\.2004\\)-1"
	    dimension 2
	    chars 94
	    graphic 0))
  (make-charset
   '=>>>jis-x0213-2
   "JIS X 0213 Plain 2 abstract glyph-forms"
   '(mother =jis-x0213-2
	    =>iso-ir 229
	    registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	    dimension 2
	    chars 94
	    graphic 0))

  (make-charset
   '=>>jis-x0208
   "JIS X 0208 abstract glyphs (unchanged part)."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>>>jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (make-charset
   '=>>jis-x0208@1978
   "JIS X 0208:1978 abstract glyphs."
   '(registry "jisx0208\\.1978"
	      dimension 2
	      chars 94
	      mother =>>jis-x0208
	      =>iso-ir 42
	      ;; final ?@
	      graphic 0))
  (make-charset
   '=>>jis-x0208@1983
   "JIS X 0208:1983 abstract glyphs."
   '(registry "jisx0208\\.1983"
	      dimension 2
	      chars 94
	      mother =>>jis-x0208
	      =>iso-ir 87
	      graphic 0))
  (make-charset
   '=>>jis-x0208@1990
   "JIS X 0208:1990 abstract glyphs."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>>jis-x0208
	      =>iso-ir 168
	      graphic 0))

  (make-charset
   '=>>jis-x0213-1
   "JIS X 0213 Plain 1 abstract glyphs (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      mother =>>>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
              ;; partial t
	      ))
  (make-charset
   '=>>jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1 abstract glyphs"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      mother =>>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (make-charset
   '=>>jis-x0213-2
   "JIS X 0213 Plain 2 abstract glyphs"
   '(registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	      dimension 2
	      chars 94
	      mother =>>>jis-x0213-2
	      =>iso-ir 229
              ;; final ?P
	      graphic 0))
  (make-charset
   '=>>jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1 abstract glyphs"
   '(registry "jisx0213\\(\\.2004\\)-1"
	      dimension 2
	      chars 94
	      mother =>>jis-x0213-1
	      =>iso-ir 233
              ;; final ?Q
	      graphic 0
              ;; partial t
	      ))

  (make-charset
   '=>jis-x0208@usual
   "JIS X 0208 based on usual unification."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>>jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (make-charset
   '=>jis-x0208
   "JIS X 0208 based on the unchanged unification rules."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>jis-x0208@usual
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (define-charset-alias '<=>jis-x0208 '=>jis-x0208)
  (make-charset
   '=>jis-x0208@1997
   "JIS X 0208 based on the unification rule of 1997 edition."
   '(registry "jisx0208\\.1990"
	      dimension 2
	      chars 94
	      mother =>jis-x0208
	      =>iso-ir 168
	      ;; final ?B
	      graphic 0))
  (define-charset-alias '<=>jis-x0208@1997 '=>jis-x0208@1997)
  (define-charset-alias '  =jis-x0208@1997 '=>jis-x0208@1997)

  (make-charset
   '=>jis-x0213-1
   "JIS X 0213 Plain 1 abstract characters (unchanged part)"
   '(registry "jisx0213\\(\\.[0-9]+\\)?-1"
	      dimension 2
	      chars 94
	      mother =>>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
              ;; partial t
	      ))
  (define-charset-alias '<=>jis-x0213-1 '=>jis-x0213-1)
  (make-charset
   '=>jis-x0213-1@2000
   "JIS X 0213:2000 Plain 1 abstract characters"
   '(registry "jisx0213\\(\\.2000\\)-1"
	      dimension 2
	      chars 94
	      mother =>jis-x0213-1
	      =>iso-ir 228
              ;; final ?O
	      graphic 0
	      ;; partial t
	      ))
  (define-charset-alias '<=>jis-x0213-1@2000 '=>jis-x0213-1@2000)
  (make-charset
   '=>jis-x0213-1@2004
   "JIS X 0213:2004 Plain 1 abstract characters"
   '(registry "jisx0213\\(\\.2004\\)-1"
	      dimension 2
	      chars 94
	      mother =>jis-x0213-1
	      =>iso-ir 233
              ;; final ?Q
	      graphic 0
              ;; partial t
	      ))
  (define-charset-alias '<=>jis-x0213-1@2004 '=>jis-x0213-1@2004)
  (make-charset
   '=>jis-x0213-2@usual
   "JIS X 0213 Plain 2 based on usual unification."
   '(registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	      dimension 2
	      chars 94
	      mother =>>jis-x0213-2
	      =>iso-ir 229
              ;; final ?P
	      graphic 0))
  (make-charset
   '=>jis-x0213-2
   "JIS X 0213 Plain 2 abstract characters"
   '(registry "jisx0213\\(\\.\\(2000\\|2004\\)\\)?-2"
	      dimension 2
	      chars 94
	      mother =>jis-x0213-2@usual
	      =>iso-ir 229
              ;; final ?P
	      graphic 0))

  (make-charset '=big5-cdp
		"Big5 with CDP extension"
		'(long-name	"Big5-CDP"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	chinese-big5
		  min-code	#x8140
		  max-code	#x8DFE))
  (define-charset-alias 'chinese-big5-cdp '=big5-cdp)

  (make-charset '=>>big5-cdp
		"Abstract glyphs of Big5-CDP"
		'(long-name	"Big5-CDP glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=big5-cdp))

  (make-charset '=>big5-cdp
		"Big5-CDP abstract characters"
		'(long-name	"Big5-CDP abstract characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"big5\\.cdp-0"
		  mother	=>>big5-cdp))

  (make-charset '=gt
		"GT 2000"
		`(long-name	"GT"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	""
		  min-code	,(lsh #x6100 16)
		  max-code	,(+ (lsh #x6100 16) 67547)
		  code-offset	,(lsh #x6100 16)))
  (define-charset-alias 'ideograph-gt '=gt)
  (make-charset '=>>>gt
		"GT 2000 abstract glyph-forms"
		'(long-name	"GT abstract glyph-forms"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=gt))
  (make-charset '=>>gt
		"GT 2000 abstract glyphs"
		'(long-name	"GT abstract glyphs"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>>>gt))
  (define-charset-alias '<=>gt '=>>gt)
  (define-charset-alias '<==>gt '=>>gt)
  (make-charset '=>gt
		"GT 2000 abstract characters"
		'(long-name	"abstract GT characters"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>>gt))
  (make-charset '=gt-k
		"Ideographic components of GT"
		`(long-name	"GT components"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	""
		  min-code	,(lsh #x6110 16)
		  max-code	,(+ (lsh #x6110 16) 17090)
		  code-offset	,(lsh #x6110 16)))
  (define-charset-alias 'ideograph-gt-k '=gt-k)
  (make-charset '=>>gt-k
		"abstract glyphs of GT-K"
		'(long-name	"GT-K abstract glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=gt-k))
  (make-charset '=>gt-k
		"GT-K abstract characters"
		'(long-name	"GT-K abstract characters"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=>>gt-k))
  (let ((i 1))
    (while (<= i 11)
      (make-charset
       (intern (format "=gt-pj-%d" i))
       (format "GT 2000 (pseudo JIS encoding) part %d" i)
       `(long-name ,(format "GT PJ %d" i)
		   chars 94
		   dimension 2
		   columns 2
		   graphic 0
		   direction l2r
		   registry ,(format "\\(GTpj-%d\\|jisx0208\\.GT-%d\\)$" i i)))
      (define-charset-alias
	(intern (format "ideograph-gt-pj-%d" i))
	(intern (format "=gt-pj-%d" i)))
      (setq i (1+ i))))
  (make-charset
   '=gt-pj-k1
   "Ideographic parts of GT (pseudo JIS encoding) part 1"
   '(long-name "GT K1"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 0
	       direction l2r
	       registry "\\(GTKpj-1\\|jisx0208\\.GTK-1\\)$"))
  (define-charset-alias 'ideograph-gt-pj-k1 '=gt-pj-k1)
  (make-charset
   '=gt-pj-k2
   "Ideographic parts of GT (pseudo JIS encoding) part 2"
   '(long-name "GT K2"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 0
	       direction l2r
	       registry "\\(GTKpj-2\\|jisx0208\\.GTK-2\\)$"))
  (define-charset-alias 'ideograph-gt-pj-k2 '=gt-pj-k2)

  (make-charset '=daikanwa
		"Daikanwa dictionary (unchanged part)"
		`(long-name	"Daikanwa"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  min-code	#xE00000
		  max-code	,(+ #xE00000 50100)
		  code-offset	#xE00000))
  (define-charset-alias 'ideograph-daikanwa '=daikanwa)

  (make-charset '=daikanwa@rev1
		"Daikanwa dictionary (revised version)"
		`(long-name	"Daikanwa Rev."
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-2"
		  mother	=daikanwa
                  ))
  (define-charset-alias 'ideograph-daikanwa-2 '=daikanwa@rev1)
  (define-charset-alias '=daikanwa-rev1 '=daikanwa@rev1)

  (make-charset '=daikanwa@rev2
		"Daikanwa dictionary (revised version 2)"
		`(long-name	"Daikanwa"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	=daikanwa
		  min-code	1
                  max-code	49964
                  ;; min-code	#xE00000
                  ;; max-code	,(+ #xE00000 50100)
                  ;; code-offset	#xE00000
		  ))
  (define-charset-alias '=daikanwa-rev2 '=daikanwa@rev2)

  (make-charset '=daikanwa/+p
		"Daikanwa dictionary (ddddd')"
		`(long-name	"Daikanwa ddddd'"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))
  (make-charset '=daikanwa/+2p
		"Daikanwa dictionary (ddddd'')"
		`(long-name	"Daikanwa ddddd''"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))
  (make-charset '=daikanwa/ho
		"Daikanwa dictionary (Hokan)"
		`(long-name	"Daikanwa-ho"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))

  (make-charset '=>>daikanwa
		"Daikanwa abstract glyphs"
		'(long-name	"Daikanwa glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	=daikanwa))

  (make-charset '=>daikanwa
		"Daikanwa abstract characters"
		'(long-name	"abstract Daikanwa"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Daikanwa\\(\\.[0-9]+\\)?-3"
		  mother	=>>daikanwa))

  (make-charset '=shinjigen
		"Kadokawa ShinJigen dictionary (common parts)"
		`(long-name	"Shinjigen common parts"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-*"))

  (make-charset '=shinjigen@1ed
		"Kadokawa ShinJigen dictionary (the first edition)"
		`(long-name	"Shinjigen-1"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=shinjigen
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-1"))
  (define-charset-alias 'shinjigen-1 '=shinjigen@1ed)

  (make-charset '=shinjigen@1ed/24pr
		"Kadokawa ShinJigen dictionary (the 24th impression)"
		`(long-name	"Shinjigen-1 24pr"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=shinjigen@1ed))

  (make-charset '=shinjigen@rev
		"Kadokawa ShinJigen dictionary (the revised edition)"
		`(long-name	"Shinjigen-2"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=shinjigen
		  registry	"Shinjigen\\(\\.[0-9]+\\)?-2"))
  (define-charset-alias 'shinjigen-2 '=shinjigen@rev)
  (make-charset '=shinjigen/+p@rev
		"ShinJigen (the second edition) number with '"
		`(long-name	"Shinjigen-2 with '"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r))
  (define-charset-alias 'shinjigen-2-p '=shinjigen/+p@rev)

  (make-charset '=big5-pua
		"Big5 with private used area"
		'(long-name	"Big5-PUA"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	chinese-big5
		  registry	"Big5\\.ETEN"))
  (define-charset-alias 'chinese-big5-pua '=big5-pua)
  (make-charset '=big5-eten
		"Big5 ETEN"
		'(long-name	"Big5-ETEN"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	chinese-big5
		  min-code	#x8140
		  max-code	#xFEFE
		  registry	"Big5\\.ETEN"))
  (define-charset-alias 'chinese-big5-eten '=big5-eten)
  (make-charset 'chinese-big5-eten-a
		"Big5 ETEN (#xF9D6 .. #xF9FE)"
		'(long-name	"Big5-ETEN-a"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	chinese-big5
		  min-code	#xF9D6
		  max-code	#xF9FE
		  registry	"Big5\\.ETEN"))
  (make-charset 'chinese-big5-eten-b
		"Big5 ETEN (#xC6A1 .. #xC8FE)"
		'(long-name	"Big5-ETEN-b"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	chinese-big5
		  min-code	#xC6A1
		  max-code	#xC8FE
		  registry	"Big5\\.ETEN"))

  (let* ((i 1)
	 (hzk-min (+ (lsh #x6200 16) 65536))
	 (hzk-max (+ hzk-min 65535)))
    (while (<= i 12)
      (make-charset
       (intern (format "=hanziku-%d" i))
       (format "HANZIKU (pseudo BIG5 encoding) part %d" i)
       `(long-name ,(format "HANZIKU-%d" i)
		   chars 256
		   dimension 2
		   columns 2
		   graphic 2
		   direction l2r
		   registry ,(format "hanziku-%d$" i i)
		   min-code ,hzk-min
		   max-code ,hzk-max
		   code-offset ,hzk-min))
      (define-charset-alias
	(intern (format "ideograph-hanziku-%d" i))
	(intern (format "=hanziku-%d" i)))
      (setq hzk-min (1+ hzk-max)
	    hzk-max (+ hzk-min 65535))
      (setq i (1+ i))))

  (make-charset '=cbeta "CBETA private characters"
		'(long-name	"CBETA PUA"
		  chars		256
		  dimension	2
		  registry	"cbeta-0"
		  graphic	2
		  min-code	#xE20000
		  max-code	#xE2FFFF
		  code-offset	#xE20000
		  columns	2
		  direction	l2r))
  (define-charset-alias 'ideograph-cbeta '=cbeta)

  (make-charset '=>>cbeta "CBETA abstract glyphs"
		'(long-name	"CBETA glyphs"
		  chars		256
		  dimension	2
		  registry	"cbeta-0"
		  graphic	2
		  columns	2
		  direction	l2r
		  mother	=cbeta))

  (make-charset '=zinbun-oracle
		"Oracle Bones Script"
		`(long-name	"Oracle Bones Script in Zinbun, Kyoto Univ."
		  chars		256
		  dimension	2
		  registry	"zob1968-0"
		  graphic	2
		  min-code	#xE70000
		  max-code	,(+ #xE70000 8192)
		  code-offset	#xE70000
		  columns	2
		  direction	l2r))

  (make-charset '=>zinbun-oracle
		"Abstract Oracle Bones"
		'(long-name	"Abstract characters of Zinbun Oracle Bones."
		  chars		256
		  dimension	2
		  mother	=zinbun-oracle
		  registry	"zob1968-0"
		  graphic	2
		  columns	2
		  direction	l2r))

  (make-charset '=jef-china3
		"JEF + CHINA3 private characters"
		'(long-name	"JEF + CHINA3"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"china3jef-0"
		  min-code	#xE80000
		  max-code	#xE8FFFF
		  code-offset	#xE80000))
  (define-charset-alias 'china3-jef '=jef-china3)

  (make-charset '=ruimoku-v6
		"private characters used in RUIMOKU Version.6"
		`(long-name	"RUI6"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"rui6-0"
                  ;; mother	ucs
		  min-code	#xE90000 ; #xE000
		  max-code	#xE908FF ; #xE8FF
		  code-offset	,(- #xE90000 #xE000)))
  (make-charset '=>>ruimoku-v6
		"RUIMOKU Version.6 glyphs"
		'(long-name	"RUI6 glyphs"
		  chars		256
		  dimension	2
		  columns	2
		  graphic	2
		  direction	l2r
		  registry	"rui6-0"
		  mother	=ruimoku-v6))

  (make-charset '==>ucs@bucs
		"Basic Subset of Coded Character Sets (BUCS)"
		'(long-name	"BUCS abstract characters"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs))

  (make-charset '=>ucs@iso
		"Abstract characters of ISO/IEC 10646 representatives"
		'(long-name	"UCS characters for ISO"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs))
  (make-charset '=>ucs@unicode
		"Abstract characters of Unicode representatives"
		'(long-name	"UCS characters for Unicode"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@iso))
  (make-charset '=>ucs@jis
		"UCS Representative characters for JIS X0208/0212/0213"
		'(long-name	"UCS characters for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@unicode))
  (make-charset '=>ucs@JP
		"UCS Representative characters for Japanese usual unification"
		'(long-name	"UCS characters for JP"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@jis))
  (make-charset '=>ucs@ks
		"UCS Representative characters for Korean Standards"
		'(long-name	"UCS characters for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@unicode))
  (make-charset '=>ucs@cns
		"UCS representatives characters for CNS 11643 sources"
		'(long-name	"UCS characters for CNS 11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@unicode))

  (make-charset '=>>ucs@iso
		"Representative abstract-glyphs of ISO/IEC 10646"
		'(long-name	"UCS abstract glyphs for UCS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>ucs@iso))
  (make-charset '=>>ucs@unicode
		"Representative abstract-glyphs of Unicode"
		'(long-name	"Unicode abstract glyphs"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@iso))
  (make-charset '=>>ucs@jis
		"UCS Representative abstract-glyphs for JIS X0208/0212/0213"
		'(long-name	"UCS abstract glyphs for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@unicode))
  (make-charset '=>>ucs@jis/1990
		"UCS Representative glyphs for JIS X 0208/0212:1990"
		'(long-name	"UCS glyphs for JIS:1990"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@jis))
  (make-charset '=>>ucs@jis/2000
		"UCS Representative glyphs for JIS X 0213:2000"
		'(long-name	"UCS glyphs for JIS:2000"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@jis))
  (make-charset '=>>ucs@jis/2004
		"UCS Representative glyphs for JIS X 0213:2004"
		'(long-name	"UCS glyphs for JIS:2004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@jis))
  (make-charset '=>>ucs@JP
		"UCS abstract-glyphs based on Japanese style glyphs"
		'(long-name	"UCS glyphs for JP"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@jis/2004))
  (make-charset '=>>ucs@ks
		"UCS Representative glyphs for Korean Standards"
		'(long-name	"UCS glyphs for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@unicode))
  (make-charset '=>>ucs@cns
		"UCS Representative glyphs for CNS 11643 sources"
		'(long-name	"UCS glyphs for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@unicode))

  (make-charset '=>>>ucs@iso
		"Representative glyph-forms of ISO/IEC 10646"
		'(long-name	"UCS glyph-forms for UCS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@iso))
  (make-charset '=>>>ucs@unicode
		"Representative glyph-forms of Unicode"
		'(long-name	"UCS glyph-forms for Unicode"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>>ucs@iso))
  (make-charset '=>>>ucs@jis
		"UCS Representative glyph-forms for JIS X0208/0212/0213"
		'(long-name	"UCS glyph-forms for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>>ucs@unicode))
  (make-charset '=>>>ucs@jis/1990
		"UCS Representative glyph-forms for JIS X 0208/0212:1990"
		'(long-name	"UCS glyph-forms for JIS:1990"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>>ucs@jis))
  (make-charset '=>>>ucs@jis/2000
		"UCS Representative glyph-forms for JIS X 0213:2000"
		'(long-name	"UCS glyph-forms for JIS:2000"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>>ucs@jis))
  (make-charset '=>>>ucs@jis/2004
		"UCS Representative glyph-forms for JIS X 0213:2004"
		'(long-name	"UCS glyph-forms for JIS:2004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>>ucs@jis))
  (make-charset '=>>>ucs@ks
		"UCS Representative glyph-forms for Korean Standards"
		'(long-name	"UCS glyph-forms for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>>ucs@unicode))
  (make-charset '=>>>ucs@cns
		"UCS Representative glyph-forms for CNS 11643 sources"
		'(long-name	"UCS glyph-forms for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>>ucs@unicode))

  (make-charset '=ucs@iso
		"ISO/IEC 10646 for its representative glyphs"
		'(long-name	"UCS for ISO"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>>ucs@iso))
  (make-charset '=ucs@unicode
		"Unicode for its representative glyphs"
		'(long-name	"UCS for Unicode"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@iso))
  (make-charset '=ucs@gb
		"ISO/IEC 10646 for GB"
		'(long-name	"UCS for GB"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-gb '=ucs@gb)
  (make-charset '=ucs@gb/fw
		"ISO/IEC 10646 for GB with fullwidth"
		'(long-name	"UCS for GB-fullwidth"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@gb))
  (make-charset '=ucs-bmp@gb
		"ISO/IEC 10646 BMP for GB"
		'(long-name	"BMP for GB"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@gb
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '=ucs@cns
		"ISO/IEC 10646 for CNS 11643"
		'(long-name	"UCS for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-cns '=ucs@cns)
  (make-charset '=ucs@cns/fw
		"ISO/IEC 10646 for CNS 11643 with fullwidth"
		'(long-name	"UCS for CNS-fullwidth"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@cns))
  (make-charset '=ucs-bmp@cns
		"ISO/IEC 10646 BMP for CNS"
		'(long-name	"BMP for CNS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@cns
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '=ucs@jis
		"ISO/IEC 10646 for JIS X0208/0212/0213"
		'(long-name	"UCS for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-jis '=ucs@jis)
  (make-charset '=ucs@jis/fw
		"ISO/IEC 10646 for JIS X0208/0212/0213 with fullwidth"
		'(long-name	"UCS for JIS-fullwidth"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis))
  (make-charset '=ucs-bmp@jis
		"ISO/IEC 10646 BMP for JIS"
		'(long-name	"BMP for JIS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@jis
		  min-code	#x0000
		  max-code	#xFFFF))
  ;; (make-charset '=ucs@jis/1983
  ;;               "ISO/IEC 10646 for JIS X 0208:1983"
  ;;               '(long-name     "UCS for JIS:1983"
  ;;                 chars         256
  ;;                 dimension     3
  ;;                 columns       2
  ;;                 graphic       2
  ;;                 direction     l2r
  ;;                 =>iso-ir      177
  ;;                 mother        =ucs@jis))
  (make-charset '=ucs@jis/1990
		"ISO/IEC 10646 for JIS X 0208/0212:1990"
		'(long-name	"UCS for JIS:1990"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis))
  (define-charset-alias '=ucs@jis-1990 '=ucs@jis/1990)
  (define-charset-alias '=ucs-jis-1990 '=ucs@jis/1990)
  (make-charset '=ucs@jis/2000
		"ISO/IEC 10646 for JIS X 0213:2000"
		'(long-name	"UCS for JIS:2000"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis))
  (define-charset-alias '=ucs@jis-2000 '=ucs@jis/2000)
  (define-charset-alias '=ucs-jis-2000 '=ucs@jis/2000)
  (make-charset '=ucs@jis/2004
		"ISO/IEC 10646 for JIS X 0213:2004"
		'(long-name	"UCS for JIS:2004"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis))
  (make-charset '=ucs@JP
		"UCS for common glyphs used in Japan"
		'(long-name	"UCS for Japan"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@jis/2004))
  (define-charset-alias '=ucs@jp '=ucs@JP)
  (make-charset '=ucs@ks
		"ISO/IEC 10646 for Korean Standards"
		'(long-name	"UCS for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@unicode))
  (define-charset-alias 'ucs-ks '=ucs@ks)
  (make-charset '=ucs-bmp@ks
		"ISO/IEC 10646 BMP for KS"
		'(long-name	"BMP for KS"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  mother	=ucs@ks
		  min-code	#x0000
		  max-code	#xFFFF))
  (make-charset '=ucs@cns11643
		"ISO/IEC 10646 for CNS based on www.cns11643.gov.tw"
		'(long-name	"UCS for CNS11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@cns))
  (make-charset '=ucs@big5
		"ISO/IEC 10646 for Big5"
		'(long-name	"UCS for Big5"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=>>ucs@cns))
  (define-charset-alias 'ucs-big5 '=ucs@big5)
  (make-charset '=ucs@big5/cns11643
		"ISO/IEC 10646 for Big5 based on www.cns11643.gov.tw"
		'(long-name	"UCS for Big5@CNS11643"
		  chars		256
		  dimension	3
		  columns	2
		  graphic	2
		  direction	l2r
		  =>iso-ir	177
		  mother	=ucs@big5))

  (make-charset
   '=ucs-radicals
   "CJK Radicals of UCS"
   '(long-name "UCS-Radicals"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zhRadicals-.*-ucs-0"
	       mother ucs-bmp
	       min-code #x2E00 max-code #x2FFF))
  (make-charset
   '=ucs-radicals@unicode
   "CJK Radicals of UCS"
   '(long-name "UCS-Radicals"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zhRadicals-.*-ucs-0"
	       mother =ucs@unicode
	       min-code #x2E00 max-code #x2FFF))
  (make-charset
   '=ucs-hangul
   "Hangul Syllables of UCS"
   '(long-name "UCS-Hangul-Syllables"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-Hangul-.*-ucs-0"
	       mother =ucs
	       min-code #xAC00 max-code #xD7AF))
  (make-charset
   '=ucs-bmp-cjk
   "CJK Characters in BMP of UCS"
   '(long-name "UCS-BMP-CJK"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother ucs-bmp
	       min-code #x2E00
	       max-code #x9FA5
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=ucs-bmp-cjk@unicode
   "CJK Characters in BMP of Unicode"
   '(long-name "Unicode-BMP-CJK"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother =ucs@unicode
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '==>ucs-bmp-cjk@bucs
   "CJK Characters in BMP of BUCS"
   '(long-name "BUCS-BMP-CJK"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "-zh-.*-ucs-0"
	       mother ==>ucs@bucs
	       min-code #x2E00
               max-code #x9FA5
	       ;; max-code #xA4CF
	       ))
  (make-charset
   '=ucs-sip-ext-b
   "CJK Ideographs Extension B"
   '(long-name "UCS CJK Ext-B"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(iso10646\\|ucs02\\)-2$"
	       mother ucs
	       min-code #x20000 max-code #x2A6D6
	       code-offset #x20000))
  (make-charset
   '=ucs-sip-ext-b@iso
   "CJK Ideographs Extension B (ISO/IEC 10646-2)"
   '(long-name "UCS CJK Ext-B"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "\\(iso10646\\|ucs02\\)-2$"
	       mother =ucs@iso
	       min-code #x20000 max-code #x2A6D6
	       code-offset #x20000))

  (make-charset
   '=adobe-japan1-base
   "Adobe-Japan1 Character Collection for CID-Keyed Fonts"
   `(long-name "Adobe-Japan1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "AdobeJapan1-[0-6]$"
	       min-code	,(lsh #x6300 16)
	       max-code	,(+ (lsh #x6300 16) 23057)
	       code-offset	,(lsh #x6300 16)))
  (make-charset
   '=adobe-japan1-0
   "Adobe-Japan1-0 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-0"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-base
	       min-code 0
	       max-code 8283
	       registry "AdobeJapan1-0$"))
  (make-charset
   '=adobe-japan1-1
   "Adobe-Japan1-1 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-1"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-0
	       min-code 0
	       max-code 8358
	       registry "AdobeJapan1-1$"))
  (make-charset
   '=adobe-japan1-2
   "Adobe-Japan1-2 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-2"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-1
	       min-code 0
	       max-code 8719
	       registry "AdobeJapan1-2$"))
  (make-charset
   '=adobe-japan1-3
   "Adobe-Japan1-3 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-3"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-2
	       min-code 0
	       max-code 9353
	       registry "AdobeJapan1-3$"))
  (make-charset
   '=adobe-japan1-4
   "Adobe-Japan1-4 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-4"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-3
	       min-code 0
	       max-code 15443
	       registry "AdobeJapan1-4$"))
  (make-charset
   '=adobe-japan1-5
   "Adobe-Japan1-5 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-5"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-4
	       min-code 0
	       max-code 20316
	       registry "AdobeJapan1-5$"))
  (make-charset
   '=adobe-japan1-6
   "Adobe-Japan1-6 Character Collection for CID-Keyed Fonts"
   '(long-name "Adobe-Japan1-6"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-5
	       min-code 0
	       max-code 23057
	       registry "AdobeJapan1-6$"))
  (make-charset
   '=>>adobe-japan1
   "Adobe-Japan1 abstract glyphs"
   '(long-name "Adobe-Japan1 abstract glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       mother =adobe-japan1-6
	       registry "AdobeJapan1-6$"))

  (make-charset
   '=hanyo-denshi/ja
   "JA (JIS X0208) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JA"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JA-0$"
	       min-code	,(lsh #x6400 16)
	       max-code	,(+ (lsh #x6400 16) (1- (* 94 94)))
	       code-offset ,(lsh #x6400 16)))
  (make-charset
   '=hanyo-denshi/jb
   "JB (JIS X0212) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JB"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JB-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 2)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94))))
  (make-charset
   '=hanyo-denshi/jc
   "JC (JIS X0213:2000 Plane 1) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JC"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JC-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 2))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 3)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 2))))
  (make-charset
   '=hanyo-denshi/jd
   "JD (JIS X0213:2000 Plane 1) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JD"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JD-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 3))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 4)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 3))))
  (make-charset
   '=hanyo-denshi/ft
   "FT (FDPC additional) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/FT"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.FT-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 4))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 5)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 4))))
  (make-charset
   '=hanyo-denshi/ia
   "IA part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/IA"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IA-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 5))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 6)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 5))))
  (make-charset
   '=hanyo-denshi/ib
   "IB part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/IB"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IB-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 6))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 7)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 6))))
  (make-charset
   '=hanyo-denshi/hg
   "HG (HyouGai Kanji) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/HG"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.HG-0$"
	       min-code	   ,(+ (lsh #x6400 16) (* 94 94 7))
	       max-code	   ,(+ (lsh #x6400 16) (1- (* 94 94 8)))
	       code-offset ,(+ (lsh #x6400 16) (* 94 94 7))))
  (make-charset
   '=hanyo-denshi/ip
   "IP (for IPA) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/IP"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IP-0$"
	       min-code	   ,(+ (lsh #x6402 16) #x4E00)
	       max-code	   ,(+ (lsh #x6402 16) #x9FFF)
	       code-offset ,(+ (lsh #x6402 16))))
  (make-charset
   '=hanyo-denshi/jt
   "JT (Juuki Touitsu Moji) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/JT"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JT-0$"
	       min-code	   ,(+ (lsh #x6402 16) #xAC00)
	       max-code	   ,(+ (lsh #x6402 16) #xD7AF)
	       code-offset ,(+ (lsh #x6402 16))))
  (make-charset
   '=hanyo-denshi/ks
   "KS (KoSeki) part of Han'you-Denshi characters"
   `(long-name "Han'you-Denshi/KS font encoding"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r))
  (make-charset
   '=hanyo-denshi/ks/mf
   "font encoding for KS (KoSeki) characters"
   `(long-name "Han'you-Denshi/KS font encoding"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.KSMF-0$"
	       min-code	      ,(lsh #x6403 16)
	       max-code	   ,(+ (lsh #x6403 16) #xFFFF)
	       code-offset    ,(lsh #x6403 16)))

  (make-charset
   '=>>>hanyo-denshi/jt
   "JT (Juuki Touitsu Moji) abstract glyph-forms"
   '(long-name "Han'you-Denshi/JT glyph-forms"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JT-0$"
	       mother =hanyo-denshi/jt))

  (make-charset
   '=>>hanyo-denshi/ft
   "Han'you-Denshi/FT abstract glyphs"
   '(long-name "Han'you-Denshi/FT glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.FT-0$"
	       mother =hanyo-denshi/ft))
  (make-charset
   '=>>hanyo-denshi/ia
   "Han'you-Denshi/IA abstract glyphs"
   '(long-name "Han'you-Denshi/IA glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IA-0$"
	       mother =hanyo-denshi/ia))
  (make-charset
   '=>>hanyo-denshi/ib
   "Han'you-Denshi/IB abstract glyphs"
   '(long-name "Han'you-Denshi/IB abstract glyphs"
	       chars 94
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.IB-0$"
	       mother =hanyo-denshi/ib))
  (make-charset
   '=>>hanyo-denshi/jt
   "JT (Juuki Touitsu Moji) abstract glyphs"
   '(long-name "Han'you-Denshi/JT glyphs"
	       chars 256
	       dimension 2
	       columns 2
	       graphic 2
	       direction l2r
	       registry "HanyoDenshi\\.JT-0$"
	       mother =>>>hanyo-denshi/jt))
  (make-charset
   '=>>hanyo-denshi/ks
   "Han'you-Denshi/KS abstract glyphs"
   '(long-name "Han'you-Denshi/KS glyphs"
	       chars 256
	       dimension 3
	       columns 2
	       graphic 2
	       direction l2r
	       mother =hanyo-denshi/ks))
  )

;;; mule-conf.el ends here
