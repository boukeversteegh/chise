;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (=ucs		. #x00A0)	;  
    (latin-iso8859-1	. #xA0)	; &I-LATIN1-20;
    (latin-iso8859-2	. #xA0)	; &I-LATIN2-20;
    (latin-iso8859-3	. #xA0)	; &I-LATIN3-20;
    (latin-iso8859-4	. #xA0)	; &I-LATIN4-20;
    (greek-iso8859-7	. #xA0)	; &I-GREEK-20;
    (hebrew-iso8859-8	. #xA0)	; &I-HEBREW-20;
    (cyrillic-iso8859-5 . #xA0)	; &I-CYRILLIC-20;
    (latin-iso8859-9	. #xA0)	; &I-LATIN5-20;
    (latin-tcvn5712	. #xA0)	; &I-VSCII2-20;
    (<-noBreak
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "NO-BREAK SPACE")
      (=ucs		  . #x00A0)	;  
      ))
    (=ucs@jis/fw	. #x00A0)	; &JX1-2922;
    (=jis-x0213-1	. #x2922)	; &JX1-2922; [09-02]
    (<-fullwidth
     ((name		  . "NO-BREAK SPACE")
      (=ucs		  . #x00A0)	;  
      ))
    ))
(define-char
  '((name		. "INVERTED EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00A1)	; ¡
    (latin-iso8859-1	. #xA1)	; &I-LATIN1-21;
    (latin-iso8859-9	. #xA1)	; &I-LATIN5-21;
    ))
(define-char
  '((<-denotational
     ((name		  . "INVERTED EXCLAMATION MARK")
      (=ucs		  . #x00A1)	; ¡
      ))
    (=ucs@jis/fw	. #x00A1)	; &JX1-2923;
    (=ks-x1001		. #x222E)	; &JX1-2923; [02-14]
    (=jis-x0212		. #x2242)	; &I-JSP-2242; [02-34]
    (=jis-x0213-1	. #x2923)	; &I-JX1-2923; [09-03]
    (<-fullwidth
     ((name		  . "INVERTED EXCLAMATION MARK")
      (=ucs		  . #x00A1)	; ¡
      ))
    ))
(define-char
  '((name		. "CENT SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x00A2)	; ¢
    (latin-iso8859-1	. #xA2)	; &I-LATIN1-22;
    (hebrew-iso8859-8	. #xA2)	; &I-HEBREW-22;
    (latin-iso8859-9	. #xA2)	; &I-LATIN5-22;
    (->fullwidth
     ((name		  . "FULLWIDTH CENT SIGN")
      (=ucs		  . #xFFE0)	; ￠
      ))
    ))
(define-char
  '((name		. "POUND SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x00A3)	; £
    (latin-iso8859-1	. #xA3)	; &I-LATIN1-23;
    (latin-iso8859-3	. #xA3)	; &I-LATIN3-23;
    (greek-iso8859-7	. #xA3)	; &I-GREEK-23;
    (hebrew-iso8859-8	. #xA3)	; &I-HEBREW-23;
    (latin-iso8859-9	. #xA3)	; &I-LATIN5-23;
    (->fullwidth
     ((name		  . "FULLWIDTH POUND SIGN")
      (=ucs		  . #xFFE1)	; ￡
      ))
    ))
(define-char
  '((name		. "CURRENCY SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x00A4)	; ¤
    (latin-iso8859-1	. #xA4)	; &I-LATIN1-24;
    (latin-iso8859-2	. #xA4)	; &I-LATIN2-24;
    (latin-iso8859-3	. #xA4)	; &I-LATIN3-24;
    (latin-iso8859-4	. #xA4)	; &I-LATIN4-24;
    (hebrew-iso8859-8	. #xA4)	; &I-HEBREW-24;
    (latin-iso8859-9	. #xA4)	; &I-LATIN5-24;
    ))
(define-char
  '((<-denotational
     ((name		  . "CURRENCY SIGN")
      (=ucs		  . #x00A4)	; ¤
      ))
    (=ucs@gb		. #x00A4)	; &JX1-2924;
    (=ucs@jis		. #x00A4)	; &JX1-2924;
    (=gb2312		. #x2168)	; &JX1-2924; [01-72]
    (=ks-x1001		. #x2234)	; &I-K0-2234; [02-20]
    (=jis-x0212		. #x2270)	; &I-JSP-2270; [02-80]
    (=jis-x0213-1	. #x2924)	; &I-JX1-2924; [09-04]
    (<-fullwidth
     ((name		  . "CURRENCY SIGN")
      (=ucs		  . #x00A4)	; ¤
      ))
    ))
(define-char
  '((name		. "YEN SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x00A5)	; ¥
    (latin-jisx0201	. #x5C)	; &I-LATINJ-5C;
    (latin-iso8859-1	. #xA5)	; &I-LATIN1-25;
    (hebrew-iso8859-8	. #xA5)	; &I-HEBREW-25;
    (latin-iso8859-9	. #xA5)	; &I-LATIN5-25;
    (->fullwidth
     ((name		  . "FULLWIDTH YEN SIGN")
      (=ucs		  . #xFFE5)	; ￥
      ))
    ))
(define-char
  '((name		. "BROKEN BAR")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00A6)	; ¦
    (latin-iso8859-1	. #xA6)	; &I-LATIN1-26;
    (greek-iso8859-7	. #xA6)	; &I-GREEK-26;
    (hebrew-iso8859-8	. #xA6)	; &I-HEBREW-26;
    (latin-iso8859-9	. #xA6)	; &I-LATIN5-26;
    (->fullwidth
     ((name		  . "FULLWIDTH BROKEN BAR")
      (=ucs		  . #xFFE4)	; ￤
      ))
    ))
(define-char
  '((name		. "SECTION SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00A7)	; §
    (latin-iso8859-1	. #xA7)	; &I-LATIN1-27;
    (latin-iso8859-2	. #xA7)	; &I-LATIN2-27;
    (latin-iso8859-3	. #xA7)	; &I-LATIN3-27;
    (latin-iso8859-4	. #xA7)	; &I-LATIN4-27;
    (greek-iso8859-7	. #xA7)	; &I-GREEK-27;
    (hebrew-iso8859-8	. #xA7)	; &I-HEBREW-27;
    (cyrillic-iso8859-5 . #xFD)	; &I-CYRILLIC-7D;
    (latin-iso8859-9	. #xA7)	; &I-LATIN5-27;
    ))
(define-char
  '((<-denotational
     ((name		  . "SECTION SIGN")
      (=ucs		  . #x00A7)	; §
      ))
    (=ucs@gb		. #x00A7)	; &J90-2178;
    (=ucs@jis		. #x00A7)	; &J90-2178;
    (=jis-x0208		. #x2178)	; &J90-2178; [01-88]
    (=gb2312		. #x216C)	; &I-G0-216C; [01-76]
    (=ks-x1001		. #x2157)	; &I-K0-2157; [01-55]
    (=cns11643-1	. #x2170)	; &I-C1-2170; [01-80]
    (=jis-x0213-1	. #x2178)	; &I-JX1-2178; [01-88]
    (=big5		. #xA1B1)	; &I-B-A1B1;
    (<-fullwidth
     ((name		  . "SECTION SIGN")
      (=ucs		  . #x00A7)	; §
      ))
    ))
(define-char
  '((name		. "DIAERESIS")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00A8)	; ¨
    (latin-iso8859-1	. #xA8)	; &I-LATIN1-28;
    (latin-iso8859-2	. #xA8)	; &I-LATIN2-28;
    (latin-iso8859-3	. #xA8)	; &I-LATIN3-28;
    (latin-iso8859-4	. #xA8)	; &I-LATIN4-28;
    (greek-iso8859-7	. #xA8)	; &I-GREEK-28;
    (hebrew-iso8859-8	. #xA8)	; &I-HEBREW-28;
    (latin-iso8859-9	. #xA8)	; &I-LATIN5-28;
    ))
(define-char
  '((<-denotational
     ((name		  . "DIAERESIS")
      (=ucs		  . #x00A8)	; ¨
      ))
    (=ucs@gb		. #x00A8)	; &J90-212F;
    (=ucs@jis		. #x00A8)	; &J90-212F;
    (=jis-x0208		. #x212F)	; &J90-212F; [01-15]
    (=gb2312		. #x2127)	; &I-G0-2127; [01-07]
    (=ks-x1001		. #x2127)	; &I-K0-2127; [01-07]
    (=jis-x0213-1	. #x212F)	; &I-JX1-212F; [01-15]
    (=big5-eten		. #xC6D8)	; &I-B-C6D8;
    (=jef-china3	. #x81AA)	; &I-JC3-81AA;
    (<-fullwidth
     ((name		  . "DIAERESIS")
      (=ucs		  . #x00A8)	; ¨
      ))
    ))
(define-char
  '((name		. "COPYRIGHT SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00A9)	; ©
    (latin-iso8859-1	. #xA9)	; &I-LATIN1-29;
    (greek-iso8859-7	. #xA9)	; &I-GREEK-29;
    (hebrew-iso8859-8	. #xA9)	; &I-HEBREW-29;
    (latin-iso8859-9	. #xA9)	; &I-LATIN5-29;
    ))
(define-char
  '((<-denotational
     ((name		  . "COPYRIGHT SIGN")
      (=ucs		  . #x00A9)	; ©
      ))
    (=ucs@jis		. #x00A9)	; &JX1-2926;
    (=jis-x0212		. #x226D)	; &JX1-2926; [02-77]
    (=jis-x0213-1	. #x2926)	; &I-JX1-2926; [09-06]
    (<-fullwidth
     ((name		  . "COPYRIGHT SIGN")
      (=ucs		  . #x00A9)	; ©
      ))
    ))
(define-char
  '((name		. "FEMININE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x00AA)	; ª
    (latin-iso8859-1	. #xAA)	; &I-LATIN1-2A;
    (latin-iso8859-9	. #xAA)	; &I-LATIN5-2A;
    (<-superscript
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "FEMININE ORDINAL INDICATOR")
      (=ucs		  . #x00AA)	; ª
      ))
    (=ucs@jis/fw	. #x00AA)	; &JX1-2927;
    (=ks-x1001		. #x2823)	; &JX1-2927; [08-03]
    (=jis-x0212		. #x226C)	; &I-JSP-226C; [02-76]
    (=jis-x0213-1	. #x2927)	; &I-JX1-2927; [09-07]
    (<-fullwidth
     ((name		  . "FEMININE ORDINAL INDICATOR")
      (=ucs		  . #x00AA)	; ª
      ))
    ))
(define-char
  '((name		. "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x00AB)	; «
    (latin-iso8859-1	. #xAB)	; &I-LATIN1-2B;
    (greek-iso8859-7	. #xAB)	; &I-GREEK-2B;
    (hebrew-iso8859-8	. #xAB)	; &I-HEBREW-2B;
    (latin-iso8859-9	. #xAB)	; &I-LATIN5-2B;
    (arabic-1-column	. #x2A)	; &I-MULE-ARB1-2A;
    ))
(define-char
  '((<-denotational
     ((name		  . "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
      (=ucs		  . #x00AB)	; «
      ))
    (=ucs@jis/fw	. #x00AB)	; &JX1-2928;
    (=jis-x0213-1	. #x2928)	; &JX1-2928; [09-08]
    (<-fullwidth
     ((name		  . "LEFT-POINTING DOUBLE ANGLE QUOTATION MARK")
      (=ucs		  . #x00AB)	; «
      ))
    ))
(define-char
  '((name		. "NOT SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00AC)	; ¬
    (latin-iso8859-1	. #xAC)	; &I-LATIN1-2C;
    (greek-iso8859-7	. #xAC)	; &I-GREEK-2C;
    (hebrew-iso8859-8	. #xAC)	; &I-HEBREW-2C;
    (latin-iso8859-9	. #xAC)	; &I-LATIN5-2C;
    (->fullwidth
     ((name		  . "FULLWIDTH NOT SIGN")
      (=ucs		  . #xFFE2)	; ￢
      ))
    ))
(define-char
  '((name		. "SOFT HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00AD)	; ­
    (latin-iso8859-1	. #xAD)	; &I-LATIN1-2D;
    (latin-iso8859-2	. #xAD)	; &I-LATIN2-2D;
    (latin-iso8859-3	. #xAD)	; &I-LATIN3-2D;
    (latin-iso8859-4	. #xAD)	; &I-LATIN4-2D;
    (greek-iso8859-7	. #xAD)	; &I-GREEK-2D;
    (hebrew-iso8859-8	. #xAD)	; &I-HEBREW-2D;
    (cyrillic-iso8859-5 . #xAD)	; &I-CYRILLIC-2D;
    (latin-iso8859-9	. #xAD)	; &I-LATIN5-2D;
    ))
(define-char
  '((<-denotational
     ((name		  . "SOFT HYPHEN")
      (=ucs		  . #x00AD)	; ­
      ))
    (=ucs@jis/fw	. #x00AD)	; &JX1-2929;
    (=ks-x1001		. #x2129)	; &JX1-2929; [01-09]
    (=jis-x0213-1	. #x2929)	; &I-JX1-2929; [09-09]
    (<-fullwidth
     ((name		  . "SOFT HYPHEN")
      (=ucs		  . #x00AD)	; ­
      ))
    ))
(define-char
  '((name		. "REGISTERED SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00AE)	; ®
    (latin-iso8859-1	. #xAE)	; &I-LATIN1-2E;
    (hebrew-iso8859-8	. #xAE)	; &I-HEBREW-2E;
    (latin-iso8859-9	. #xAE)	; &I-LATIN5-2E;
    ))
(define-char
  '((<-denotational
     ((name		  . "REGISTERED SIGN")
      (=ucs		  . #x00AE)	; ®
      ))
    (=ucs@jis		. #x00AE)	; &JX1-292A;
    (=jis-x0212		. #x226E)	; &JX1-292A; [02-78]
    (=jis-x0213-1	. #x292A)	; &I-JX1-292A; [09-10]
    (=jef-china3	. #x81A1)	; &I-JC3-81A1;
    (<-fullwidth
     ((name		  . "REGISTERED SIGN")
      (=ucs		  . #x00AE)	; ®
      ))
    ))
(define-char
  '((name		. "MACRON")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x00AF)	; ¯
    (latin-iso8859-1	. #xAF)	; &I-LATIN1-2F;
    (latin-iso8859-4	. #xAF)	; &I-LATIN4-2F;
    (latin-iso8859-9	. #xAF)	; &I-LATIN5-2F;
    (->fullwidth
     ((name		  . "FULLWIDTH MACRON")
      (=ucs		  . #xFFE3)	; ￣
      ))
    ))
(define-char
  '((name		. "DEGREE SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x00B0)	; °
    (latin-iso8859-1	. #xB0)	; &I-LATIN1-30;
    (latin-iso8859-2	. #xB0)	; &I-LATIN2-30;
    (latin-iso8859-3	. #xB0)	; &I-LATIN3-30;
    (latin-iso8859-4	. #xB0)	; &I-LATIN4-30;
    (greek-iso8859-7	. #xB0)	; &I-GREEK-30;
    (hebrew-iso8859-8	. #xB0)	; &I-HEBREW-30;
    (latin-iso8859-9	. #xB0)	; &I-LATIN5-30;
    ))
(define-char
  '((<-denotational
     ((name		  . "DEGREE SIGN")
      (=ucs		  . #x00B0)	; °
      ))
    (=ucs@gb		. #x00B0)	; &J90-216B;
    (=ucs@jis		. #x00B0)	; &J90-216B;
    (=jis-x0208		. #x216B)	; &J90-216B; [01-75]
    (=gb2312		. #x2163)	; &I-G0-2163; [01-67]
    (=ks-x1001		. #x2146)	; &I-K0-2146; [01-38]
    (=cns11643-1	. #x2278)	; &I-C1-2278; [02-88]
    (=jis-x0213-1	. #x216B)	; &I-JX1-216B; [01-75]
    (=big5		. #xA258)	; &I-B-A258;
    (<-fullwidth
     ((name		  . "DEGREE SIGN")
      (=ucs		  . #x00B0)	; °
      ))
    ))
(define-char
  '((name		. "PLUS-MINUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x00B1)	; ±
    (latin-iso8859-1	. #xB1)	; &I-LATIN1-31;
    (greek-iso8859-7	. #xB1)	; &I-GREEK-31;
    (hebrew-iso8859-8	. #xB1)	; &I-HEBREW-31;
    (latin-iso8859-9	. #xB1)	; &I-LATIN5-31;
    ))
(define-char
  '((<-denotational
     ((name		  . "PLUS-MINUS SIGN")
      (=ucs		  . #x00B1)	; ±
      ))
    (=ucs@gb		. #x00B1)	; &J90-215E;
    (=ucs@jis		. #x00B1)	; &J90-215E;
    (=jis-x0208		. #x215E)	; &J90-215E; [01-62]
    (=gb2312		. #x2140)	; &I-G0-2140; [01-32]
    (=ks-x1001		. #x213E)	; &I-K0-213E; [01-30]
    (=cns11643-1	. #x2234)	; &I-C1-2234; [02-20]
    (=jis-x0213-1	. #x215E)	; &I-JX1-215E; [01-62]
    (=big5		. #xA1D3)	; &I-B-A1D3;
    (<-fullwidth
     ((name		  . "PLUS-MINUS SIGN")
      (=ucs		  . #x00B1)	; ±
      ))
    ))
(define-char
  '((name		. "SUPERSCRIPT TWO")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (=ucs		. #x00B2)	; ²
    (latin-iso8859-1	. #xB2)	; &I-LATIN1-32;
    (latin-iso8859-3	. #xB2)	; &I-LATIN3-32;
    (greek-iso8859-7	. #xB2)	; &I-GREEK-32;
    (hebrew-iso8859-8	. #xB2)	; &I-HEBREW-32;
    (latin-iso8859-9	. #xB2)	; &I-LATIN5-32;
    (<-superscript
     ((name		  . "DIGIT TWO")
      (=ucs		  . #x0032)	; 2
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "SUPERSCRIPT TWO")
      (=ucs		  . #x00B2)	; ²
      ))
    (=ucs@jis/fw	. #x00B2)	; &JX1-292C;
    (=ks-x1001		. #x2977)	; &JX1-292C; [09-87]
    (=jis-x0213-1	. #x292C)	; &I-JX1-292C; [09-12]
    (<-fullwidth
     ((name		  . "SUPERSCRIPT TWO")
      (=ucs		  . #x00B2)	; ²
      ))
    ))
(define-char
  '((name		. "SUPERSCRIPT THREE")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (=ucs		. #x00B3)	; ³
    (latin-iso8859-1	. #xB3)	; &I-LATIN1-33;
    (latin-iso8859-3	. #xB3)	; &I-LATIN3-33;
    (greek-iso8859-7	. #xB3)	; &I-GREEK-33;
    (hebrew-iso8859-8	. #xB3)	; &I-HEBREW-33;
    (latin-iso8859-9	. #xB3)	; &I-LATIN5-33;
    (<-superscript
     ((name		  . "DIGIT THREE")
      (=ucs		  . #x0033)	; 3
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "SUPERSCRIPT THREE")
      (=ucs		  . #x00B3)	; ³
      ))
    (=ucs@jis/fw	. #x00B3)	; &JX1-292D;
    (=ks-x1001		. #x2978)	; &JX1-292D; [09-88]
    (=jis-x0213-1	. #x292D)	; &I-JX1-292D; [09-13]
    (<-fullwidth
     ((name		  . "SUPERSCRIPT THREE")
      (=ucs		  . #x00B3)	; ³
      ))
    ))
(define-char
  '((name		. "ACUTE ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00B4)	; ´
    (latin-iso8859-1	. #xB4)	; &I-LATIN1-34;
    (latin-iso8859-2	. #xB4)	; &I-LATIN2-34;
    (latin-iso8859-3	. #xB4)	; &I-LATIN3-34;
    (latin-iso8859-4	. #xB4)	; &I-LATIN4-34;
    (hebrew-iso8859-8	. #xB4)	; &I-HEBREW-34;
    (latin-iso8859-9	. #xB4)	; &I-LATIN5-34;
    ))
(define-char
  '((<-denotational
     ((name		  . "ACUTE ACCENT")
      (=ucs		  . #x00B4)	; ´
      ))
    (=ucs@jis		. #x00B4)	; &J90-212D;
    (=jis-x0208		. #x212D)	; &J90-212D; [01-13]
    (=ks-x1001		. #x2225)	; &I-K0-2225; [02-05]
    (=jis-x0213-1	. #x212D)	; &I-JX1-212D; [01-13]
    (=jef-china3	. #x81A4)	; &I-JC3-81A4;
    (<-fullwidth
     ((name		  . "ACUTE ACCENT")
      (=ucs		  . #x00B4)	; ´
      ))
    ))
(define-char
  '((name		. "MICRO SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x00B5)	; µ
    (latin-iso8859-1	. #xB5)	; &I-LATIN1-35;
    (latin-iso8859-3	. #xB5)	; &I-LATIN3-35;
    (hebrew-iso8859-8	. #xB5)	; &I-HEBREW-35;
    (latin-iso8859-9	. #xB5)	; &I-LATIN5-35;
    (<-compat/unit
     ((name		  . "GREEK SMALL LETTER MU")
      (=ucs		  . #x03BC)	; μ
      ))
    ))
(define-char
  '((name		. "PILCROW SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00B6)	; ¶
    (latin-iso8859-1	. #xB6)	; &I-LATIN1-36;
    (hebrew-iso8859-8	. #xB6)	; &I-HEBREW-36;
    (latin-iso8859-9	. #xB6)	; &I-LATIN5-36;
    ))
(define-char
  '((<-denotational
     ((name		  . "PILCROW SIGN")
      (=ucs		  . #x00B6)	; ¶
      ))
    (=ucs@jis		. #x00B6)	; &J90-2279;
    (=jis-x0208@1983	. #x2279)	; &J90-2279; [02-89]
    (=ks-x1001		. #x2252)	; &I-K0-2252; [02-50]
    (=jis-x0208@1990	. #x2279)	; &I-J90-2279; [02-89]
    (=jis-x0213-1	. #x2279)	; &I-JX1-2279; [02-89]
    (<-fullwidth
     ((name		  . "PILCROW SIGN")
      (=ucs		  . #x00B6)	; ¶
      ))
    ))
(define-char
  '((name		. "MIDDLE DOT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00B7)	; ·
    (latin-iso8859-1	. #xB7)	; &I-LATIN1-37;
    (latin-iso8859-3	. #xB7)	; &I-LATIN3-37;
    (greek-iso8859-7	. #xB7)	; &I-GREEK-37;
    (hebrew-iso8859-8	. #xB7)	; &I-HEBREW-37;
    (latin-iso8859-9	. #xB7)	; &I-LATIN5-37;
    ))
(define-char
  '((<-denotational
     ((name		  . "MIDDLE DOT")
      (=ucs		  . #x00B7)	; ·
      ))
    (=ucs@jis/fw	. #x00B7)	; &JX1-292E;
    (=ks-x1001		. #x2124)	; &JX1-292E; [01-04]
    (=cns11643-1	. #x2131)	; &I-C1-2131; [01-17]
    (=jis-x0213-1	. #x292E)	; &I-JX1-292E; [09-14]
    (=big5		. #xA150)	; &I-B-A150;
    (<-fullwidth
     ((name		  . "MIDDLE DOT")
      (=ucs		  . #x00B7)	; ·
      ))
    ))
(define-char
  '((name		. "CEDILLA")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x00B8)	; ¸
    (latin-iso8859-1	. #xB8)	; &I-LATIN1-38;
    (latin-iso8859-2	. #xB8)	; &I-LATIN2-38;
    (latin-iso8859-3	. #xB8)	; &I-LATIN3-38;
    (latin-iso8859-4	. #xB8)	; &I-LATIN4-38;
    (hebrew-iso8859-8	. #xB8)	; &I-HEBREW-38;
    (latin-iso8859-9	. #xB8)	; &I-LATIN5-38;
    ))
(define-char
  '((<-denotational
     ((name		  . "CEDILLA")
      (=ucs		  . #x00B8)	; ¸
      ))
    (=ucs@jis/fw	. #x00B8)	; &JX1-292F;
    (=ks-x1001		. #x222C)	; &JX1-292F; [02-12]
    (=jis-x0212		. #x2231)	; &I-JSP-2231; [02-17]
    (=jis-x0213-1	. #x292F)	; &I-JX1-292F; [09-15]
    (=jef-china3	. #x81B2)	; &I-JC3-81B2;
    (<-fullwidth
     ((name		  . "CEDILLA")
      (=ucs		  . #x00B8)	; ¸
      ))
    ))
(define-char
  '((name		. "SUPERSCRIPT ONE")
    (general-category	number other) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (=ucs		. #x00B9)	; ¹
    (latin-iso8859-1	. #xB9)	; &I-LATIN1-39;
    (hebrew-iso8859-8	. #xB9)	; &I-HEBREW-39;
    (latin-iso8859-9	. #xB9)	; &I-LATIN5-39;
    (<-superscript
     ((name		  . "DIGIT ONE")
      (=ucs		  . #x0031)	; 1
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "SUPERSCRIPT ONE")
      (=ucs		  . #x00B9)	; ¹
      ))
    (=ucs@jis/fw	. #x00B9)	; &JX1-2930;
    (=ks-x1001		. #x2976)	; &JX1-2930; [09-86]
    (=jis-x0213-1	. #x2930)	; &I-JX1-2930; [09-16]
    (<-fullwidth
     ((name		  . "SUPERSCRIPT ONE")
      (=ucs		  . #x00B9)	; ¹
      ))
    ))
(define-char
  '((name		. "MASCULINE ORDINAL INDICATOR")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x00BA)	; º
    (latin-iso8859-1	. #xBA)	; &I-LATIN1-3A;
    (latin-iso8859-9	. #xBA)	; &I-LATIN5-3A;
    (<-superscript
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "MASCULINE ORDINAL INDICATOR")
      (=ucs		  . #x00BA)	; º
      ))
    (=ucs@jis/fw	. #x00BA)	; &JX1-2931;
    (=ks-x1001		. #x282C)	; &JX1-2931; [08-12]
    (=jis-x0212		. #x226B)	; &I-JSP-226B; [02-75]
    (=jis-x0213-1	. #x2931)	; &I-JX1-2931; [09-17]
    (<-fullwidth
     ((name		  . "MASCULINE ORDINAL INDICATOR")
      (=ucs		  . #x00BA)	; º
      ))
    ))
(define-char
  '((name		. "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x00BB)	; »
    (latin-iso8859-1	. #xBB)	; &I-LATIN1-3B;
    (greek-iso8859-7	. #xBB)	; &I-GREEK-3B;
    (hebrew-iso8859-8	. #xBB)	; &I-HEBREW-3B;
    (latin-iso8859-9	. #xBB)	; &I-LATIN5-3B;
    (arabic-1-column	. #x2B)	; &I-MULE-ARB1-2B;
    ))
(define-char
  '((<-denotational
     ((name		  . "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
      (=ucs		  . #x00BB)	; »
      ))
    (=ucs@jis/fw	. #x00BB)	; &JX1-2932;
    (=jis-x0213-1	. #x2932)	; &JX1-2932; [09-18]
    (<-fullwidth
     ((name		  . "RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK")
      (=ucs		  . #x00BB)	; »
      ))
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE QUARTER")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/4)
    (=>decomposition@fraction
     ((name		  . "DIGIT ONE")
      (=ucs		  . #x0031)	; 1
      )
     ((name		  . "FRACTION SLASH")
      (=ucs		  . #x2044)	; ⁄
      )
     ((name		  . "DIGIT FOUR")
      (=ucs		  . #x0034)	; 4
      ))
    (=ucs		. #x00BC)	; ¼
    (latin-iso8859-1	. #xBC)	; &I-LATIN1-3C;
    (hebrew-iso8859-8	. #xBC)	; &I-HEBREW-3C;
    (latin-iso8859-9	. #xBC)	; &I-LATIN5-3C;
    ))
(define-char
  '((<-denotational
     ((name		  . "VULGAR FRACTION ONE QUARTER")
      (=ucs		  . #x00BC)	; ¼
      ))
    (=ucs@jis		. #x00BC)	; &JX1-2933;
    (=ks-x1001		. #x2879)	; &JX1-2933; [08-89]
    (=jis-x0213-1	. #x2933)	; &I-JX1-2933; [09-19]
    (<-fullwidth
     ((name		  . "VULGAR FRACTION ONE QUARTER")
      (=ucs		  . #x00BC)	; ¼
      ))
    ))
(define-char
  '((name		. "VULGAR FRACTION ONE HALF")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 1/2)
    (=>decomposition@fraction
     ((name		  . "DIGIT ONE")
      (=ucs		  . #x0031)	; 1
      )
     ((name		  . "FRACTION SLASH")
      (=ucs		  . #x2044)	; ⁄
      )
     ((name		  . "DIGIT TWO")
      (=ucs		  . #x0032)	; 2
      ))
    (=ucs		. #x00BD)	; ½
    (latin-iso8859-1	. #xBD)	; &I-LATIN1-3D;
    (latin-iso8859-3	. #xBD)	; &I-LATIN3-3D;
    (greek-iso8859-7	. #xBD)	; &I-GREEK-3D;
    (hebrew-iso8859-8	. #xBD)	; &I-HEBREW-3D;
    (latin-iso8859-9	. #xBD)	; &I-LATIN5-3D;
    ))
(define-char
  '((<-denotational
     ((name		  . "VULGAR FRACTION ONE HALF")
      (=ucs		  . #x00BD)	; ½
      ))
    (=ucs@jis		. #x00BD)	; &JX1-2934;
    (=ks-x1001		. #x2876)	; &JX1-2934; [08-86]
    (=jis-x0213-1	. #x2934)	; &I-JX1-2934; [09-20]
    (<-fullwidth
     ((name		  . "VULGAR FRACTION ONE HALF")
      (=ucs		  . #x00BD)	; ½
      ))
    ))
(define-char
  '((name		. "VULGAR FRACTION THREE QUARTERS")
    (general-category	number other) ; Normative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (numeric-value	. 3/4)
    (=>decomposition@fraction
     ((name		  . "DIGIT THREE")
      (=ucs		  . #x0033)	; 3
      )
     ((name		  . "FRACTION SLASH")
      (=ucs		  . #x2044)	; ⁄
      )
     ((name		  . "DIGIT FOUR")
      (=ucs		  . #x0034)	; 4
      ))
    (=ucs		. #x00BE)	; ¾
    (latin-iso8859-1	. #xBE)	; &I-LATIN1-3E;
    (hebrew-iso8859-8	. #xBE)	; &I-HEBREW-3E;
    (latin-iso8859-9	. #xBE)	; &I-LATIN5-3E;
    ))
(define-char
  '((<-denotational
     ((name		  . "VULGAR FRACTION THREE QUARTERS")
      (=ucs		  . #x00BE)	; ¾
      ))
    (=ucs@jis		. #x00BE)	; &JX1-2935;
    (=ks-x1001		. #x287A)	; &JX1-2935; [08-90]
    (=jis-x0213-1	. #x2935)	; &I-JX1-2935; [09-21]
    (<-fullwidth
     ((name		  . "VULGAR FRACTION THREE QUARTERS")
      (=ucs		  . #x00BE)	; ¾
      ))
    ))
(define-char
  '((name		. "INVERTED QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00BF)	; ¿
    (latin-iso8859-1	. #xBF)	; &I-LATIN1-3F;
    (latin-iso8859-9	. #xBF)	; &I-LATIN5-3F;
    ))
(define-char
  '((<-denotational
     ((name		  . "INVERTED QUESTION MARK")
      (=ucs		  . #x00BF)	; ¿
      ))
    (=ucs@jis/fw	. #x00BF)	; &JX1-2936;
    (=ks-x1001		. #x222F)	; &JX1-2936; [02-15]
    (=jis-x0212		. #x2244)	; &I-JSP-2244; [02-36]
    (=jis-x0213-1	. #x2936)	; &I-JX1-2936; [09-22]
    (<-fullwidth
     ((name		  . "INVERTED QUESTION MARK")
      (=ucs		  . #x00BF)	; ¿
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00C0)	; À
    (latin-iso8859-1	. #xC0)	; &I-LATIN1-40;
    (latin-iso8859-3	. #xC0)	; &I-LATIN3-40;
    (latin-iso8859-9	. #xC0)	; &I-LATIN5-40;
    (latin-viscii	. #xC0)	; &I-MULE-VIET-U-60;
    (latin-viscii-upper . #xE0)	; &I-MULE-VIET-U-60;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH GRAVE")
      (=ucs		  . #x00E0)	; à
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH GRAVE")
      (=ucs		  . #x00C0)	; À
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@jis/fw	. #x00C0)	; Ａ̀
    (=jis-x0212		. #x2A22)	; Ａ̀ [10-02]
    (=jis-x0213-1	. #x2937)	; &I-JX1-2937; [09-23]
    (=jef-china3	. #x85B9)	; &I-JC3-85B9;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH GRAVE")
      (=ucs		  . #x00C0)	; À
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00E0)	; ａ̀
      (=ucs@jis/fw	  . #x00E0)	; ａ̀
      (=gb2312		  . #x2824)	; ａ̀ [08-04]
      (=jis-x0212	  . #x2B22)	; &I-JSP-2B22; [11-02]
      (=jis-x0213-1	  . #x2956)	; &I-JX1-2956; [09-54]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00C1)	; Á
    (latin-iso8859-1	. #xC1)	; &I-LATIN1-41;
    (latin-iso8859-2	. #xC1)	; &I-LATIN2-41;
    (latin-iso8859-3	. #xC1)	; &I-LATIN3-41;
    (latin-iso8859-4	. #xC1)	; &I-LATIN4-41;
    (latin-iso8859-9	. #xC1)	; &I-LATIN5-41;
    (latin-viscii	. #xC1)	; &I-MULE-VIET-U-61;
    (latin-viscii-upper . #xE1)	; &I-MULE-VIET-U-61;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH ACUTE")
      (=ucs		  . #x00E1)	; á
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH ACUTE")
      (=ucs		  . #x00C1)	; Á
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x00C1)	; Ａ́
    (=jis-x0212		. #x2A21)	; Ａ́ [10-01]
    (=jis-x0213-1	. #x2938)	; &I-JX1-2938; [09-24]
    (=jef-china3	. #x85D5)	; &I-JC3-85D5;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH ACUTE")
      (=ucs		  . #x00C1)	; Á
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00E1)	; ａ́
      (=ucs@jis/fw	  . #x00E1)	; ａ́
      (=gb2312		  . #x2822)	; ａ́ [08-02]
      (=jis-x0212	  . #x2B21)	; &I-JSP-2B21; [11-01]
      (=jis-x0213-1	  . #x2957)	; &I-JX1-2957; [09-55]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00C2)	; Â
    (latin-iso8859-1	. #xC2)	; &I-LATIN1-42;
    (latin-iso8859-2	. #xC2)	; &I-LATIN2-42;
    (latin-iso8859-3	. #xC2)	; &I-LATIN3-42;
    (latin-iso8859-4	. #xC2)	; &I-LATIN4-42;
    (latin-iso8859-9	. #xC2)	; &I-LATIN5-42;
    (latin-tcvn5712	. #xA2)	; &I-VSCII2-22;
    (latin-viscii	. #xC2)	; &I-MULE-VIET-U-62;
    (latin-viscii-upper . #xE2)	; &I-MULE-VIET-U-62;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH CIRCUMFLEX")
      (=ucs		  . #x00E2)	; â
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
      (=ucs		  . #x00C2)	; Â
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00C2)	; Ａ̂
    (=jis-x0212		. #x2A24)	; Ａ̂ [10-04]
    (=jis-x0213-1	. #x2939)	; &I-JX1-2939; [09-25]
    (=jef-china3	. #x86B7)	; &I-JC3-86B7;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
      (=ucs		  . #x00C2)	; Â
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00E2)	; ａ̂
      (=jis-x0212	  . #x2B24)	; ａ̂ [11-04]
      (=jis-x0213-1	  . #x2958)	; &I-JX1-2958; [09-56]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x00C3)	; Ã
    (latin-iso8859-1	. #xC3)	; &I-LATIN1-43;
    (latin-iso8859-4	. #xC3)	; &I-LATIN4-43;
    (latin-iso8859-9	. #xC3)	; &I-LATIN5-43;
    (latin-viscii	. #xC3)	; &I-MULE-VIET-U-63;
    (latin-viscii-upper . #xE3)	; &I-MULE-VIET-U-63;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH TILDE")
      (=ucs		  . #x00E3)	; ã
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH TILDE")
      (=ucs		  . #x00C3)	; Ã
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x00C3)	; Ａ̃
    (=jis-x0212		. #x2A2A)	; Ａ̃ [10-10]
    (=jis-x0213-1	. #x293A)	; &I-JX1-293A; [09-26]
    (=jef-china3	. #x86E2)	; &I-JC3-86E2;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH TILDE")
      (=ucs		  . #x00C3)	; Ã
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00E3)	; ａ̃
      (=jis-x0212	  . #x2B2A)	; ａ̃ [11-10]
      (=jis-x0213-1	  . #x2959)	; &I-JX1-2959; [09-57]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00C4)	; Ä
    (latin-iso8859-1	. #xC4)	; &I-LATIN1-44;
    (latin-iso8859-2	. #xC4)	; &I-LATIN2-44;
    (latin-iso8859-3	. #xC4)	; &I-LATIN3-44;
    (latin-iso8859-4	. #xC4)	; &I-LATIN4-44;
    (latin-iso8859-9	. #xC4)	; &I-LATIN5-44;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH DIAERESIS")
      (=ucs		  . #x00E4)	; ä
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH DIAERESIS")
      (=ucs		  . #x00C4)	; Ä
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00C4)	; Ａ̈
    (=jis-x0212		. #x2A23)	; Ａ̈ [10-03]
    (=jis-x0213-1	. #x293B)	; &I-JX1-293B; [09-27]
    (=jef-china3	. #x88C5)	; &I-JC3-88C5;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH DIAERESIS")
      (=ucs		  . #x00C4)	; Ä
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00E4)	; ａ̈
      (=jis-x0212	  . #x2B23)	; ａ̈ [11-03]
      (=jis-x0213-1	  . #x295A)	; &I-JX1-295A; [09-58]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING RING ABOVE")
      (=ucs		  . #x030A)	; ̊
      ))
    (=ucs		. #x00C5)	; Å
    (latin-iso8859-1	. #xC5)	; &I-LATIN1-45;
    (latin-iso8859-4	. #xC5)	; &I-LATIN4-45;
    (latin-iso8859-9	. #xC5)	; &I-LATIN5-45;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH RING ABOVE")
      (=ucs		  . #x00E5)	; å
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH RING ABOVE")
      (=ucs		  . #x00C5)	; Å
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING RING ABOVE")
      (=ucs		  . #x030A)	; ̊
      ))
    (=ucs@jis/fw	. #x00C5)	; Ａ̊
    (=jis-x0212		. #x2A29)	; Ａ̊ [10-09]
    (=jis-x0213-1	. #x293C)	; &I-JX1-293C; [09-28]
    (=jef-china3	. #x88FD)	; &I-JC3-88FD;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH RING ABOVE")
      (=ucs		  . #x00C5)	; Å
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00E5)	; ａ̊
      (=jis-x0212	  . #x2B29)	; ａ̊ [11-09]
      (=jis-x0213-1	  . #x295B)	; &I-JX1-295B; [09-59]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER AE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (=ucs		. #x00C6)	; Æ
    (latin-iso8859-1	. #xC6)	; &I-LATIN1-46;
    (latin-iso8859-4	. #xC6)	; &I-LATIN4-46;
    (latin-iso8859-9	. #xC6)	; &I-LATIN5-46;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER AE")
      (=ucs		  . #x00E6)	; æ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER AE")
      (=ucs		  . #x00C6)	; Æ
      ))
    (=ucs@jis/fw	. #x00C6)	; &JX1-293D;
    (=ks-x1001		. #x2821)	; &JX1-293D; [08-01]
    (=jis-x0212		. #x2921)	; &I-JSP-2921; [09-01]
    (=jis-x0213-1	. #x293D)	; &I-JX1-293D; [09-29]
    (=jef-china3	. #x83A5)	; &I-JC3-83A5;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER AE")
      (=ucs		  . #x00C6)	; Æ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00E6)	; &JX1-295C;
      (=ks-x1001	  . #x2921)	; &JX1-295C; [09-01]
      (=jis-x0212	  . #x2941)	; &I-JSP-2941; [09-33]
      (=jis-x0213-1	  . #x295C)	; &I-JX1-295C; [09-60]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x00C7)	; Ç
    (latin-iso8859-1	. #xC7)	; &I-LATIN1-47;
    (latin-iso8859-2	. #xC7)	; &I-LATIN2-47;
    (latin-iso8859-3	. #xC7)	; &I-LATIN3-47;
    (latin-iso8859-9	. #xC7)	; &I-LATIN5-47;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CEDILLA")
      (=ucs		  . #x00E7)	; ç
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH CEDILLA")
      (=ucs		  . #x00C7)	; Ç
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (=ucs		  . #xFF23)	; Ｃ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x00C7)	; Ｃ̧
    (=jis-x0212		. #x2A2E)	; Ｃ̧ [10-14]
    (=jis-x0213-1	. #x293E)	; &I-JX1-293E; [09-30]
    (=jef-china3	. #x89F5)	; &I-JC3-89F5;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CEDILLA")
      (=ucs		  . #x00C7)	; Ç
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00E7)	; ｃ̧
      (=jis-x0212	  . #x2B2E)	; ｃ̧ [11-14]
      (=jis-x0213-1	  . #x295D)	; &I-JX1-295D; [09-61]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00C8)	; È
    (latin-iso8859-1	. #xC8)	; &I-LATIN1-48;
    (latin-iso8859-3	. #xC8)	; &I-LATIN3-48;
    (latin-iso8859-9	. #xC8)	; &I-LATIN5-48;
    (latin-viscii	. #xC8)	; &I-MULE-VIET-U-68;
    (latin-viscii-upper . #xE8)	; &I-MULE-VIET-U-68;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH GRAVE")
      (=ucs		  . #x00E8)	; è
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH GRAVE")
      (=ucs		  . #x00C8)	; È
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@jis/fw	. #x00C8)	; Ｅ̀
    (=jis-x0212		. #x2A32)	; Ｅ̀ [10-18]
    (=jis-x0213-1	. #x293F)	; &I-JX1-293F; [09-31]
    (=jef-china3	. #x85BA)	; &I-JC3-85BA;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH GRAVE")
      (=ucs		  . #x00C8)	; È
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00E8)	; ｅ̀
      (=ucs@jis/fw	  . #x00E8)	; ｅ̀
      (=gb2312		  . #x2828)	; ｅ̀ [08-08]
      (=jis-x0212	  . #x2B32)	; &I-JSP-2B32; [11-18]
      (=jis-x0213-1	  . #x295E)	; &I-JX1-295E; [09-62]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00C9)	; É
    (latin-iso8859-1	. #xC9)	; &I-LATIN1-49;
    (latin-iso8859-2	. #xC9)	; &I-LATIN2-49;
    (latin-iso8859-3	. #xC9)	; &I-LATIN3-49;
    (latin-iso8859-4	. #xC9)	; &I-LATIN4-49;
    (latin-iso8859-9	. #xC9)	; &I-LATIN5-49;
    (latin-viscii	. #xC9)	; &I-MULE-VIET-U-69;
    (latin-viscii-upper . #xE9)	; &I-MULE-VIET-U-69;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH ACUTE")
      (=ucs		  . #x00E9)	; é
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH ACUTE")
      (=ucs		  . #x00C9)	; É
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x00C9)	; Ｅ́
    (=jis-x0212		. #x2A31)	; Ｅ́ [10-17]
    (=jis-x0213-1	. #x2940)	; &I-JX1-2940; [09-32]
    (=jef-china3	. #x85D8)	; &I-JC3-85D8;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH ACUTE")
      (=ucs		  . #x00C9)	; É
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00E9)	; ｅ́
      (=ucs@jis/fw	  . #x00E9)	; ｅ́
      (=gb2312		  . #x2826)	; ｅ́ [08-06]
      (=jis-x0212	  . #x2B31)	; &I-JSP-2B31; [11-17]
      (=jis-x0213-1	  . #x295F)	; &I-JX1-295F; [09-63]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00CA)	; Ê
    (latin-iso8859-1	. #xCA)	; &I-LATIN1-4A;
    (latin-iso8859-3	. #xCA)	; &I-LATIN3-4A;
    (latin-iso8859-9	. #xCA)	; &I-LATIN5-4A;
    (latin-tcvn5712	. #xA3)	; &I-VSCII2-23;
    (latin-viscii	. #xCA)	; &I-MULE-VIET-U-6A;
    (latin-viscii-upper . #xEA)	; &I-MULE-VIET-U-6A;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CIRCUMFLEX")
      (=ucs		  . #x00EA)	; ê
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
      (=ucs		  . #x00CA)	; Ê
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00CA)	; Ｅ̂
    (=jis-x0212		. #x2A34)	; Ｅ̂ [10-20]
    (=jis-x0213-1	. #x2941)	; &I-JX1-2941; [09-33]
    (=jef-china3	. #x86B9)	; &I-JC3-86B9;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
      (=ucs		  . #x00CA)	; Ê
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00EA)	; ｅ̂
      (=ucs@jis/fw	  . #x00EA)	; ｅ̂
      (=gb2312		  . #x283A)	; ｅ̂ [08-26]
      (=jis-x0212	  . #x2B34)	; &I-JSP-2B34; [11-20]
      (=jis-x0213-1	  . #x2960)	; &I-JX1-2960; [09-64]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00CB)	; Ë
    (latin-iso8859-1	. #xCB)	; &I-LATIN1-4B;
    (latin-iso8859-2	. #xCB)	; &I-LATIN2-4B;
    (latin-iso8859-3	. #xCB)	; &I-LATIN3-4B;
    (latin-iso8859-4	. #xCB)	; &I-LATIN4-4B;
    (latin-iso8859-9	. #xCB)	; &I-LATIN5-4B;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DIAERESIS")
      (=ucs		  . #x00EB)	; ë
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH DIAERESIS")
      (=ucs		  . #x00CB)	; Ë
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00CB)	; Ｅ̈
    (=jis-x0212		. #x2A33)	; Ｅ̈ [10-19]
    (=jis-x0213-1	. #x2942)	; &I-JX1-2942; [09-34]
    (=jef-china3	. #x88C7)	; &I-JC3-88C7;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH DIAERESIS")
      (=ucs		  . #x00CB)	; Ë
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00EB)	; ｅ̈
      (=jis-x0212	  . #x2B33)	; ｅ̈ [11-19]
      (=jis-x0213-1	  . #x2961)	; &I-JX1-2961; [09-65]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00CC)	; Ì
    (latin-iso8859-1	. #xCC)	; &I-LATIN1-4C;
    (latin-iso8859-3	. #xCC)	; &I-LATIN3-4C;
    (latin-iso8859-9	. #xCC)	; &I-LATIN5-4C;
    (latin-viscii	. #xCC)	; &I-MULE-VIET-U-6C;
    (latin-viscii-upper . #xEC)	; &I-MULE-VIET-U-6C;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH GRAVE")
      (=ucs		  . #x00EC)	; ì
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH GRAVE")
      (=ucs		  . #x00CC)	; Ì
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@jis/fw	. #x00CC)	; Ｉ̀
    (=jis-x0212		. #x2A40)	; Ｉ̀ [10-32]
    (=jis-x0213-1	. #x2943)	; &I-JX1-2943; [09-35]
    (=jef-china3	. #x85BB)	; &I-JC3-85BB;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH GRAVE")
      (=ucs		  . #x00CC)	; Ì
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00EC)	; ｉ̀
      (=ucs@jis/fw	  . #x00EC)	; ｉ̀
      (=gb2312		  . #x282C)	; ｉ̀ [08-12]
      (=jis-x0212	  . #x2B40)	; &I-JSP-2B40; [11-32]
      (=jis-x0213-1	  . #x2962)	; &I-JX1-2962; [09-66]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00CD)	; Í
    (latin-iso8859-1	. #xCD)	; &I-LATIN1-4D;
    (latin-iso8859-2	. #xCD)	; &I-LATIN2-4D;
    (latin-iso8859-3	. #xCD)	; &I-LATIN3-4D;
    (latin-iso8859-4	. #xCD)	; &I-LATIN4-4D;
    (latin-iso8859-9	. #xCD)	; &I-LATIN5-4D;
    (latin-viscii	. #xCD)	; &I-MULE-VIET-U-6D;
    (latin-viscii-upper . #xED)	; &I-MULE-VIET-U-6D;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH ACUTE")
      (=ucs		  . #x00ED)	; í
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH ACUTE")
      (=ucs		  . #x00CD)	; Í
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x00CD)	; Ｉ́
    (=jis-x0212		. #x2A3F)	; Ｉ́ [10-31]
    (=jis-x0213-1	. #x2944)	; &I-JX1-2944; [09-36]
    (=jef-china3	. #x85DB)	; &I-JC3-85DB;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH ACUTE")
      (=ucs		  . #x00CD)	; Í
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00ED)	; ｉ́
      (=ucs@jis/fw	  . #x00ED)	; ｉ́
      (=gb2312		  . #x282A)	; ｉ́ [08-10]
      (=jis-x0212	  . #x2B3F)	; &I-JSP-2B3F; [11-31]
      (=jis-x0213-1	  . #x2963)	; &I-JX1-2963; [09-67]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00CE)	; Î
    (latin-iso8859-1	. #xCE)	; &I-LATIN1-4E;
    (latin-iso8859-2	. #xCE)	; &I-LATIN2-4E;
    (latin-iso8859-3	. #xCE)	; &I-LATIN3-4E;
    (latin-iso8859-4	. #xCE)	; &I-LATIN4-4E;
    (latin-iso8859-9	. #xCE)	; &I-LATIN5-4E;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH CIRCUMFLEX")
      (=ucs		  . #x00EE)	; î
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
      (=ucs		  . #x00CE)	; Î
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00CE)	; Ｉ̂
    (=jis-x0212		. #x2A42)	; Ｉ̂ [10-34]
    (=jis-x0213-1	. #x2945)	; &I-JX1-2945; [09-37]
    (=jef-china3	. #x86BC)	; &I-JC3-86BC;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
      (=ucs		  . #x00CE)	; Î
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00EE)	; ｉ̂
      (=jis-x0212	  . #x2B42)	; ｉ̂ [11-34]
      (=jis-x0213-1	  . #x2964)	; &I-JX1-2964; [09-68]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00CF)	; Ï
    (latin-iso8859-1	. #xCF)	; &I-LATIN1-4F;
    (latin-iso8859-3	. #xCF)	; &I-LATIN3-4F;
    (latin-iso8859-9	. #xCF)	; &I-LATIN5-4F;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH DIAERESIS")
      (=ucs		  . #x00EF)	; ï
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH DIAERESIS")
      (=ucs		  . #x00CF)	; Ï
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00CF)	; Ｉ̈
    (=jis-x0212		. #x2A41)	; Ｉ̈ [10-33]
    (=jis-x0213-1	. #x2946)	; &I-JX1-2946; [09-38]
    (=jef-china3	. #x88C9)	; &I-JC3-88C9;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH DIAERESIS")
      (=ucs		  . #x00CF)	; Ï
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00EF)	; ｉ̈
      (=jis-x0212	  . #x2B41)	; ｉ̈ [11-33]
      (=jis-x0213-1	  . #x2965)	; &I-JX1-2965; [09-69]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ETH")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (=ucs		. #x00D0)	; Ð
    (latin-iso8859-1	. #xD0)	; &I-LATIN1-50;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ETH")
      (=ucs		  . #x00F0)	; ð
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER ETH")
      (=ucs		  . #x00D0)	; Ð
      ))
    (=ucs@jis/fw	. #x00D0)	; &JX1-2947;
    (=ks-x1001		. #x2822)	; &JX1-2947; [08-02]
    (=jis-x0213-1	. #x2947)	; &I-JX1-2947; [09-39]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER ETH")
      (=ucs		  . #x00D0)	; Ð
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00F0)	; &JX1-2966;
      (=ks-x1001	  . #x2923)	; &JX1-2966; [09-03]
      (=jis-x0212	  . #x2943)	; &I-JSP-2943; [09-35]
      (=jis-x0213-1	  . #x2966)	; &I-JX1-2966; [09-70]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER N")
      (=ucs		  . #x004E)	; N
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x00D1)	; Ñ
    (latin-iso8859-1	. #xD1)	; &I-LATIN1-51;
    (latin-iso8859-3	. #xD1)	; &I-LATIN3-51;
    (latin-iso8859-9	. #xD1)	; &I-LATIN5-51;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH TILDE")
      (=ucs		  . #x00F1)	; ñ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER N WITH TILDE")
      (=ucs		  . #x00D1)	; Ñ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER N")
      (=ucs		  . #xFF2E)	; Ｎ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x00D1)	; Ｎ̃
    (=jis-x0212		. #x2A50)	; Ｎ̃ [10-48]
    (=jis-x0213-1	. #x2948)	; &I-JX1-2948; [09-40]
    (=jef-china3	. #x86E6)	; &I-JC3-86E6;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH TILDE")
      (=ucs		  . #x00D1)	; Ñ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00F1)	; ｎ̃
      (=jis-x0212	  . #x2B50)	; ｎ̃ [11-48]
      (=jis-x0213-1	  . #x2967)	; &I-JX1-2967; [09-71]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00D2)	; Ò
    (latin-iso8859-1	. #xD2)	; &I-LATIN1-52;
    (latin-iso8859-3	. #xD2)	; &I-LATIN3-52;
    (latin-iso8859-9	. #xD2)	; &I-LATIN5-52;
    (latin-viscii	. #xD2)	; &I-MULE-VIET-U-72;
    (latin-viscii-upper . #xF2)	; &I-MULE-VIET-U-72;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH GRAVE")
      (=ucs		  . #x00F2)	; ò
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH GRAVE")
      (=ucs		  . #x00D2)	; Ò
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@jis/fw	. #x00D2)	; Ｏ̀
    (=jis-x0212		. #x2A52)	; Ｏ̀ [10-50]
    (=jis-x0213-1	. #x2949)	; &I-JX1-2949; [09-41]
    (=jef-china3	. #x85BD)	; &I-JC3-85BD;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH GRAVE")
      (=ucs		  . #x00D2)	; Ò
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00F2)	; ｏ̀
      (=ucs@jis/fw	  . #x00F2)	; ｏ̀
      (=gb2312		  . #x2830)	; ｏ̀ [08-16]
      (=jis-x0212	  . #x2B52)	; &I-JSP-2B52; [11-50]
      (=jis-x0213-1	  . #x2968)	; &I-JX1-2968; [09-72]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00D3)	; Ó
    (latin-iso8859-1	. #xD3)	; &I-LATIN1-53;
    (latin-iso8859-2	. #xD3)	; &I-LATIN2-53;
    (latin-iso8859-3	. #xD3)	; &I-LATIN3-53;
    (latin-iso8859-9	. #xD3)	; &I-LATIN5-53;
    (latin-viscii	. #xD3)	; &I-MULE-VIET-U-73;
    (latin-viscii-upper . #xF3)	; &I-MULE-VIET-U-73;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH ACUTE")
      (=ucs		  . #x00F3)	; ó
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH ACUTE")
      (=ucs		  . #x00D3)	; Ó
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x00D3)	; Ｏ́
    (=jis-x0212		. #x2A51)	; Ｏ́ [10-49]
    (=jis-x0213-1	. #x294A)	; &I-JX1-294A; [09-42]
    (=jef-china3	. #x85E0)	; &I-JC3-85E0;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH ACUTE")
      (=ucs		  . #x00D3)	; Ó
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00F3)	; ｏ́
      (=ucs@jis/fw	  . #x00F3)	; ｏ́
      (=gb2312		  . #x282E)	; ｏ́ [08-14]
      (=jis-x0212	  . #x2B51)	; &I-JSP-2B51; [11-49]
      (=jis-x0213-1	  . #x2969)	; &I-JX1-2969; [09-73]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00D4)	; Ô
    (latin-iso8859-1	. #xD4)	; &I-LATIN1-54;
    (latin-iso8859-2	. #xD4)	; &I-LATIN2-54;
    (latin-iso8859-3	. #xD4)	; &I-LATIN3-54;
    (latin-iso8859-4	. #xD4)	; &I-LATIN4-54;
    (latin-iso8859-9	. #xD4)	; &I-LATIN5-54;
    (latin-tcvn5712	. #xA4)	; &I-VSCII2-24;
    (latin-viscii	. #xD4)	; &I-MULE-VIET-U-74;
    (latin-viscii-upper . #xF4)	; &I-MULE-VIET-U-74;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH CIRCUMFLEX")
      (=ucs		  . #x00F4)	; ô
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
      (=ucs		  . #x00D4)	; Ô
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00D4)	; Ｏ̂
    (=jis-x0212		. #x2A54)	; Ｏ̂ [10-52]
    (=jis-x0213-1	. #x294B)	; &I-JX1-294B; [09-43]
    (=jef-china3	. #x86BF)	; &I-JC3-86BF;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
      (=ucs		  . #x00D4)	; Ô
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00F4)	; ｏ̂
      (=jis-x0212	  . #x2B54)	; ｏ̂ [11-52]
      (=jis-x0213-1	  . #x296A)	; &I-JX1-296A; [09-74]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x00D5)	; Õ
    (latin-iso8859-1	. #xD5)	; &I-LATIN1-55;
    (latin-iso8859-4	. #xD5)	; &I-LATIN4-55;
    (latin-iso8859-9	. #xD5)	; &I-LATIN5-55;
    (latin-viscii	. #xA0)	; &I-MULE-VIET-U-75;
    (latin-viscii-upper . #xF5)	; &I-MULE-VIET-U-75;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH TILDE")
      (=ucs		  . #x00F5)	; õ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH TILDE")
      (=ucs		  . #x00D5)	; Õ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x00D5)	; Ｏ̃
    (=jis-x0212		. #x2A58)	; Ｏ̃ [10-56]
    (=jis-x0213-1	. #x294C)	; &I-JX1-294C; [09-44]
    (=jef-china3	. #x86E7)	; &I-JC3-86E7;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH TILDE")
      (=ucs		  . #x00D5)	; Õ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00F5)	; ｏ̃
      (=jis-x0212	  . #x2B58)	; ｏ̃ [11-56]
      (=jis-x0213-1	  . #x296B)	; &I-JX1-296B; [09-75]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00D6)	; Ö
    (latin-iso8859-1	. #xD6)	; &I-LATIN1-56;
    (latin-iso8859-2	. #xD6)	; &I-LATIN2-56;
    (latin-iso8859-3	. #xD6)	; &I-LATIN3-56;
    (latin-iso8859-4	. #xD6)	; &I-LATIN4-56;
    (latin-iso8859-9	. #xD6)	; &I-LATIN5-56;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DIAERESIS")
      (=ucs		  . #x00F6)	; ö
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH DIAERESIS")
      (=ucs		  . #x00D6)	; Ö
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00D6)	; Ｏ̈
    (=jis-x0212		. #x2A53)	; Ｏ̈ [10-51]
    (=jis-x0213-1	. #x294D)	; &I-JX1-294D; [09-45]
    (=jef-china3	. #x88CB)	; &I-JC3-88CB;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH DIAERESIS")
      (=ucs		  . #x00D6)	; Ö
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00F6)	; ｏ̈
      (=jis-x0212	  . #x2B53)	; ｏ̈ [11-51]
      (=jis-x0213-1	  . #x296C)	; &I-JX1-296C; [09-76]
      ))
    ))
(define-char
  '((name		. "MULTIPLICATION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00D7)	; ×
    (latin-iso8859-1	. #xD7)	; &I-LATIN1-57;
    (latin-iso8859-2	. #xD7)	; &I-LATIN2-57;
    (latin-iso8859-3	. #xD7)	; &I-LATIN3-57;
    (latin-iso8859-4	. #xD7)	; &I-LATIN4-57;
    (hebrew-iso8859-8	. #xAA)	; &I-HEBREW-2A;
    (latin-iso8859-9	. #xD7)	; &I-LATIN5-57;
    ))
(define-char
  '((<-denotational
     ((name		  . "MULTIPLICATION SIGN")
      (=ucs		  . #x00D7)	; ×
      ))
    (=ucs@gb		. #x00D7)	; &J90-215F;
    (=ucs@jis		. #x00D7)	; &J90-215F;
    (=jis-x0208		. #x215F)	; &J90-215F; [01-63]
    (=gb2312		. #x2141)	; &I-G0-2141; [01-33]
    (=ks-x1001		. #x213F)	; &I-K0-213F; [01-31]
    (=cns11643-1	. #x2232)	; &I-C1-2232; [02-18]
    (=jis-x0213-1	. #x215F)	; &I-JX1-215F; [01-63]
    (=big5		. #xA1D1)	; &I-B-A1D1;
    (<-fullwidth
     ((name		  . "MULTIPLICATION SIGN")
      (=ucs		  . #x00D7)	; ×
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x00D8)	; Ø
    (latin-iso8859-1	. #xD8)	; &I-LATIN1-58;
    (latin-iso8859-4	. #xD8)	; &I-LATIN4-58;
    (latin-iso8859-9	. #xD8)	; &I-LATIN5-58;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH STROKE")
      (=ucs		  . #x00F8)	; ø
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH STROKE")
      (=ucs		  . #x00D8)	; Ø
      ))
    (=ucs@jis/fw	. #x00D8)	; &JX1-294E;
    (=ks-x1001		. #x282A)	; &JX1-294E; [08-10]
    (=jis-x0212		. #x292C)	; &I-JSP-292C; [09-12]
    (=jis-x0213-1	. #x294E)	; &I-JX1-294E; [09-46]
    (=jef-china3	. #x83A2)	; &I-JC3-83A2;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH STROKE")
      (=ucs		  . #x00D8)	; Ø
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00F8)	; &JX1-296D;
      (=ks-x1001	  . #x292A)	; &JX1-296D; [09-10]
      (=jis-x0212	  . #x294C)	; &I-JSP-294C; [09-44]
      (=jis-x0213-1	  . #x296D)	; &I-JX1-296D; [09-77]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00D9)	; Ù
    (latin-iso8859-1	. #xD9)	; &I-LATIN1-59;
    (latin-iso8859-3	. #xD9)	; &I-LATIN3-59;
    (latin-iso8859-9	. #xD9)	; &I-LATIN5-59;
    (latin-viscii	. #xD9)	; &I-MULE-VIET-U-79;
    (latin-viscii-upper . #xF9)	; &I-MULE-VIET-U-79;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH GRAVE")
      (=ucs		  . #x00F9)	; ù
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH GRAVE")
      (=ucs		  . #x00D9)	; Ù
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@jis/fw	. #x00D9)	; Ｕ̀
    (=jis-x0212		. #x2A63)	; Ｕ̀ [10-67]
    (=jis-x0213-1	. #x294F)	; &I-JX1-294F; [09-47]
    (=jef-china3	. #x85BF)	; &I-JC3-85BF;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH GRAVE")
      (=ucs		  . #x00D9)	; Ù
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00F9)	; ｕ̀
      (=ucs@jis/fw	  . #x00F9)	; ｕ̀
      (=gb2312		  . #x2834)	; ｕ̀ [08-20]
      (=jis-x0212	  . #x2B63)	; &I-JSP-2B63; [11-67]
      (=jis-x0213-1	  . #x296E)	; &I-JX1-296E; [09-78]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00DA)	; Ú
    (latin-iso8859-1	. #xDA)	; &I-LATIN1-5A;
    (latin-iso8859-2	. #xDA)	; &I-LATIN2-5A;
    (latin-iso8859-3	. #xDA)	; &I-LATIN3-5A;
    (latin-iso8859-4	. #xDA)	; &I-LATIN4-5A;
    (latin-iso8859-9	. #xDA)	; &I-LATIN5-5A;
    (latin-viscii	. #xDA)	; &I-MULE-VIET-U-7A;
    (latin-viscii-upper . #xFA)	; &I-MULE-VIET-U-7A;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH ACUTE")
      (=ucs		  . #x00FA)	; ú
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH ACUTE")
      (=ucs		  . #x00DA)	; Ú
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x00DA)	; Ｕ́
    (=jis-x0212		. #x2A62)	; Ｕ́ [10-66]
    (=jis-x0213-1	. #x2950)	; &I-JX1-2950; [09-48]
    (=jef-china3	. #x85E6)	; &I-JC3-85E6;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH ACUTE")
      (=ucs		  . #x00DA)	; Ú
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00FA)	; ｕ́
      (=ucs@jis/fw	  . #x00FA)	; ｕ́
      (=gb2312		  . #x2832)	; ｕ́ [08-18]
      (=jis-x0212	  . #x2B62)	; &I-JSP-2B62; [11-66]
      (=jis-x0213-1	  . #x296F)	; &I-JX1-296F; [09-79]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00DB)	; Û
    (latin-iso8859-1	. #xDB)	; &I-LATIN1-5B;
    (latin-iso8859-3	. #xDB)	; &I-LATIN3-5B;
    (latin-iso8859-4	. #xDB)	; &I-LATIN4-5B;
    (latin-iso8859-9	. #xDB)	; &I-LATIN5-5B;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH CIRCUMFLEX")
      (=ucs		  . #x00FB)	; û
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
      (=ucs		  . #x00DB)	; Û
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00DB)	; Ｕ̂
    (=jis-x0212		. #x2A65)	; Ｕ̂ [10-69]
    (=jis-x0213-1	. #x2951)	; &I-JX1-2951; [09-49]
    (=jef-china3	. #x86C1)	; &I-JC3-86C1;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
      (=ucs		  . #x00DB)	; Û
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00FB)	; ｕ̂
      (=jis-x0212	  . #x2B65)	; ｕ̂ [11-69]
      (=jis-x0213-1	  . #x2970)	; &I-JX1-2970; [09-80]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00DC)	; Ü
    (latin-iso8859-1	. #xDC)	; &I-LATIN1-5C;
    (latin-iso8859-2	. #xDC)	; &I-LATIN2-5C;
    (latin-iso8859-3	. #xDC)	; &I-LATIN3-5C;
    (latin-iso8859-4	. #xDC)	; &I-LATIN4-5C;
    (latin-iso8859-9	. #xDC)	; &I-LATIN5-5C;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DIAERESIS")
      (=ucs		  . #x00FC)	; ü
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH DIAERESIS")
      (=ucs		  . #x00DC)	; Ü
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00DC)	; Ｕ̈
    (=jis-x0212		. #x2A64)	; Ｕ̈ [10-68]
    (=jis-x0213-1	. #x2952)	; &I-JX1-2952; [09-50]
    (=jef-china3	. #x88CE)	; &I-JC3-88CE;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH DIAERESIS")
      (=ucs		  . #x00DC)	; Ü
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x00FC)	; ｕ̈
      (=ucs@jis/fw	  . #x00FC)	; ｕ̈
      (=gb2312		  . #x2839)	; ｕ̈ [08-25]
      (=jis-x0212	  . #x2B64)	; &I-JSP-2B64; [11-68]
      (=jis-x0213-1	  . #x2971)	; &I-JX1-2971; [09-81]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER Y")
      (=ucs		  . #x0059)	; Y
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00DD)	; Ý
    (latin-iso8859-1	. #xDD)	; &I-LATIN1-5D;
    (latin-iso8859-2	. #xDD)	; &I-LATIN2-5D;
    (latin-viscii	. #xDD)	; &I-MULE-VIET-U-7D;
    (latin-viscii-upper . #xFD)	; &I-MULE-VIET-U-7D;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH ACUTE")
      (=ucs		  . #x00FD)	; ý
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER Y WITH ACUTE")
      (=ucs		  . #x00DD)	; Ý
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Y")
      (=ucs		  . #xFF39)	; Ｙ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x00DD)	; Ｙ́
    (=jis-x0212		. #x2A72)	; Ｙ́ [10-82]
    (=jis-x0213-1	. #x2953)	; &I-JX1-2953; [09-51]
    (=jef-china3	. #x85E9)	; &I-JC3-85E9;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH ACUTE")
      (=ucs		  . #x00DD)	; Ý
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00FD)	; ｙ́
      (=jis-x0212	  . #x2B72)	; ｙ́ [11-82]
      (=jis-x0213-1	  . #x2972)	; &I-JX1-2972; [09-82]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER THORN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (=ucs		. #x00DE)	; Þ
    (latin-iso8859-1	. #xDE)	; &I-LATIN1-5E;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER THORN")
      (=ucs		  . #x00FE)	; þ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER THORN")
      (=ucs		  . #x00DE)	; Þ
      ))
    (=ucs@jis/fw	. #x00DE)	; &JX1-2954;
    (=ks-x1001		. #x282D)	; &JX1-2954; [08-13]
    (=jis-x0212		. #x2930)	; &I-JSP-2930; [09-16]
    (=jis-x0213-1	. #x2954)	; &I-JX1-2954; [09-52]
    (=jef-china3	. #x83A4)	; &I-JC3-83A4;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER THORN")
      (=ucs		  . #x00DE)	; Þ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00FE)	; &JX1-2973;
      (=ks-x1001	  . #x292D)	; &JX1-2973; [09-13]
      (=jis-x0212	  . #x2950)	; &I-JSP-2950; [09-48]
      (=jis-x0213-1	  . #x2973)	; &I-JX1-2973; [09-83]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER SHARP S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "German")
    (=ucs		. #x00DF)	; ß
    (latin-iso8859-1	. #xDF)	; &I-LATIN1-5F;
    (latin-iso8859-2	. #xDF)	; &I-LATIN2-5F;
    (latin-iso8859-3	. #xDF)	; &I-LATIN3-5F;
    (latin-iso8859-4	. #xDF)	; &I-LATIN4-5F;
    (latin-iso8859-9	. #xDF)	; &I-LATIN5-5F;
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER SHARP S")
      (=ucs		  . #x00DF)	; ß
      ))
    (=ucs@jis/fw	. #x00DF)	; &JX1-2955;
    (=ks-x1001		. #x292C)	; &JX1-2955; [09-12]
    (=jis-x0212		. #x294E)	; &I-JSP-294E; [09-46]
    (=jis-x0213-1	. #x2955)	; &I-JX1-2955; [09-53]
    (=jef-china3	. #x83B7)	; &I-JC3-83B7;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER SHARP S")
      (=ucs		  . #x00DF)	; ß
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00E0)	; à
    (latin-iso8859-1	. #xE0)	; &I-LATIN1-60;
    (latin-iso8859-3	. #xE0)	; &I-LATIN3-60;
    (latin-iso8859-9	. #xE0)	; &I-LATIN5-60;
    (latin-tcvn5712	. #xB5)	; &I-VSCII2-35;
    (latin-viscii	. #xE0)	; &I-MULE-VIET-L-60;
    (latin-viscii-lower . #xE0)	; &I-MULE-VIET-L-60;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH GRAVE")
      (=ucs		  . #x00C0)	; À
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH GRAVE")
      (=ucs		  . #x00E0)	; à
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@gb/fw		. #x00E0)	; ａ̀
    (=ucs@jis/fw	. #x00E0)	; ａ̀
    (=gb2312		. #x2824)	; ａ̀ [08-04]
    (=jis-x0212		. #x2B22)	; &I-JSP-2B22; [11-02]
    (=jis-x0213-1	. #x2956)	; &I-JX1-2956; [09-54]
    (=jef-china3	. #x85C1)	; &I-JC3-85C1;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH GRAVE")
      (=ucs		  . #x00E0)	; à
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C0)	; Ａ̀
      (=jis-x0212	  . #x2A22)	; Ａ̀ [10-02]
      (=jis-x0213-1	  . #x2937)	; &I-JX1-2937; [09-23]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00E1)	; á
    (latin-iso8859-1	. #xE1)	; &I-LATIN1-61;
    (latin-iso8859-2	. #xE1)	; &I-LATIN2-61;
    (latin-iso8859-3	. #xE1)	; &I-LATIN3-61;
    (latin-iso8859-4	. #xE1)	; &I-LATIN4-61;
    (latin-iso8859-9	. #xE1)	; &I-LATIN5-61;
    (latin-tcvn5712	. #xB8)	; &I-VSCII2-38;
    (latin-viscii	. #xE1)	; &I-MULE-VIET-L-61;
    (latin-viscii-lower . #xE1)	; &I-MULE-VIET-L-61;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH ACUTE")
      (=ucs		  . #x00C1)	; Á
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH ACUTE")
      (=ucs		  . #x00E1)	; á
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@gb/fw		. #x00E1)	; ａ́
    (=ucs@jis/fw	. #x00E1)	; ａ́
    (=gb2312		. #x2822)	; ａ́ [08-02]
    (=jis-x0212		. #x2B21)	; &I-JSP-2B21; [11-01]
    (=jis-x0213-1	. #x2957)	; &I-JX1-2957; [09-55]
    (=jef-china3	. #x85EB)	; &I-JC3-85EB;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH ACUTE")
      (=ucs		  . #x00E1)	; á
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C1)	; Ａ́
      (=jis-x0212	  . #x2A21)	; Ａ́ [10-01]
      (=jis-x0213-1	  . #x2938)	; &I-JX1-2938; [09-24]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00E2)	; â
    (latin-iso8859-1	. #xE2)	; &I-LATIN1-62;
    (latin-iso8859-2	. #xE2)	; &I-LATIN2-62;
    (latin-iso8859-3	. #xE2)	; &I-LATIN3-62;
    (latin-iso8859-4	. #xE2)	; &I-LATIN4-62;
    (latin-iso8859-9	. #xE2)	; &I-LATIN5-62;
    (latin-tcvn5712	. #xA9)	; &I-VSCII2-29;
    (latin-viscii	. #xE2)	; &I-MULE-VIET-L-62;
    (latin-viscii-lower . #xE2)	; &I-MULE-VIET-L-62;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH CIRCUMFLEX")
      (=ucs		  . #x00C2)	; Â
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH CIRCUMFLEX")
      (=ucs		  . #x00E2)	; â
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00E2)	; ａ̂
    (=jis-x0212		. #x2B24)	; ａ̂ [11-04]
    (=jis-x0213-1	. #x2958)	; &I-JX1-2958; [09-56]
    (=jef-china3	. #x86C4)	; &I-JC3-86C4;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH CIRCUMFLEX")
      (=ucs		  . #x00E2)	; â
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C2)	; Ａ̂
      (=jis-x0212	  . #x2A24)	; Ａ̂ [10-04]
      (=jis-x0213-1	  . #x2939)	; &I-JX1-2939; [09-25]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x00E3)	; ã
    (latin-iso8859-1	. #xE3)	; &I-LATIN1-63;
    (latin-iso8859-4	. #xE3)	; &I-LATIN4-63;
    (latin-iso8859-9	. #xE3)	; &I-LATIN5-63;
    (latin-tcvn5712	. #xB7)	; &I-VSCII2-37;
    (latin-viscii	. #xE3)	; &I-MULE-VIET-L-63;
    (latin-viscii-lower . #xE3)	; &I-MULE-VIET-L-63;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH TILDE")
      (=ucs		  . #x00C3)	; Ã
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH TILDE")
      (=ucs		  . #x00E3)	; ã
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x00E3)	; ａ̃
    (=jis-x0212		. #x2B2A)	; ａ̃ [11-10]
    (=jis-x0213-1	. #x2959)	; &I-JX1-2959; [09-57]
    (=jef-china3	. #x86EF)	; &I-JC3-86EF;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH TILDE")
      (=ucs		  . #x00E3)	; ã
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C3)	; Ａ̃
      (=jis-x0212	  . #x2A2A)	; Ａ̃ [10-10]
      (=jis-x0213-1	  . #x293A)	; &I-JX1-293A; [09-26]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00E4)	; ä
    (latin-iso8859-1	. #xE4)	; &I-LATIN1-64;
    (latin-iso8859-2	. #xE4)	; &I-LATIN2-64;
    (latin-iso8859-3	. #xE4)	; &I-LATIN3-64;
    (latin-iso8859-4	. #xE4)	; &I-LATIN4-64;
    (latin-iso8859-9	. #xE4)	; &I-LATIN5-64;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH DIAERESIS")
      (=ucs		  . #x00C4)	; Ä
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH DIAERESIS")
      (=ucs		  . #x00E4)	; ä
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00E4)	; ａ̈
    (=jis-x0212		. #x2B23)	; ａ̈ [11-03]
    (=jis-x0213-1	. #x295A)	; &I-JX1-295A; [09-58]
    (=jef-china3	. #x88D2)	; &I-JC3-88D2;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH DIAERESIS")
      (=ucs		  . #x00E4)	; ä
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C4)	; Ａ̈
      (=jis-x0212	  . #x2A23)	; Ａ̈ [10-03]
      (=jis-x0213-1	  . #x293B)	; &I-JX1-293B; [09-27]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING RING ABOVE")
      (=ucs		  . #x030A)	; ̊
      ))
    (=ucs		. #x00E5)	; å
    (latin-iso8859-1	. #xE5)	; &I-LATIN1-65;
    (latin-iso8859-4	. #xE5)	; &I-LATIN4-65;
    (latin-iso8859-9	. #xE5)	; &I-LATIN5-65;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH RING ABOVE")
      (=ucs		  . #x00C5)	; Å
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH RING ABOVE")
      (=ucs		  . #x00E5)	; å
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING RING ABOVE")
      (=ucs		  . #x030A)	; ̊
      ))
    (=ucs@jis/fw	. #x00E5)	; ａ̊
    (=jis-x0212		. #x2B29)	; ａ̊ [11-09]
    (=jis-x0213-1	. #x295B)	; &I-JX1-295B; [09-59]
    (=jef-china3	. #x89A7)	; &I-JC3-89A7;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH RING ABOVE")
      (=ucs		  . #x00E5)	; å
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C5)	; Ａ̊
      (=jis-x0212	  . #x2A29)	; Ａ̊ [10-09]
      (=jis-x0213-1	  . #x293C)	; &I-JX1-293C; [09-28]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER AE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "ash *")
    (=ucs		. #x00E6)	; æ
    (latin-iso8859-1	. #xE6)	; &I-LATIN1-66;
    (latin-iso8859-4	. #xE6)	; &I-LATIN4-66;
    (latin-iso8859-9	. #xE6)	; &I-LATIN5-66;
    (ipa		. #xA4)	; &I-MULE-IPA-24;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER AE")
      (=ucs		  . #x00C6)	; Æ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER AE")
      (=ucs		  . #x00E6)	; æ
      ))
    (=ucs@jis/fw	. #x00E6)	; &JX1-295C;
    (=ks-x1001		. #x2921)	; &JX1-295C; [09-01]
    (=jis-x0212		. #x2941)	; &I-JSP-2941; [09-33]
    (=jis-x0213-1	. #x295C)	; &I-JX1-295C; [09-60]
    (=jef-china3	. #x83B0)	; &I-JC3-83B0;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER AE")
      (=ucs		  . #x00E6)	; æ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C6)	; &JX1-293D;
      (=ks-x1001	  . #x2821)	; &JX1-293D; [08-01]
      (=jis-x0212	  . #x2921)	; &I-JSP-2921; [09-01]
      (=jis-x0213-1	  . #x293D)	; &I-JX1-293D; [09-29]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x00E7)	; ç
    (latin-iso8859-1	. #xE7)	; &I-LATIN1-67;
    (latin-iso8859-2	. #xE7)	; &I-LATIN2-67;
    (latin-iso8859-3	. #xE7)	; &I-LATIN3-67;
    (latin-iso8859-9	. #xE7)	; &I-LATIN5-67;
    (ipa		. #xCE)	; &I-MULE-IPA-4E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CEDILLA")
      (=ucs		  . #x00C7)	; Ç
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH CEDILLA")
      (=ucs		  . #x00E7)	; ç
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER C")
      (=ucs		  . #xFF43)	; ｃ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x00E7)	; ｃ̧
    (=jis-x0212		. #x2B2E)	; ｃ̧ [11-14]
    (=jis-x0213-1	. #x295D)	; &I-JX1-295D; [09-61]
    (=jef-china3	. #x89FB)	; &I-JC3-89FB;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CEDILLA")
      (=ucs		  . #x00E7)	; ç
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C7)	; Ｃ̧
      (=jis-x0212	  . #x2A2E)	; Ｃ̧ [10-14]
      (=jis-x0213-1	  . #x293E)	; &I-JX1-293E; [09-30]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00E8)	; è
    (latin-iso8859-1	. #xE8)	; &I-LATIN1-68;
    (latin-iso8859-3	. #xE8)	; &I-LATIN3-68;
    (latin-iso8859-9	. #xE8)	; &I-LATIN5-68;
    (latin-tcvn5712	. #xCC)	; &I-VSCII2-4C;
    (latin-viscii	. #xE8)	; &I-MULE-VIET-L-68;
    (latin-viscii-lower . #xE8)	; &I-MULE-VIET-L-68;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH GRAVE")
      (=ucs		  . #x00C8)	; È
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH GRAVE")
      (=ucs		  . #x00E8)	; è
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@gb/fw		. #x00E8)	; ｅ̀
    (=ucs@jis/fw	. #x00E8)	; ｅ̀
    (=gb2312		. #x2828)	; ｅ̀ [08-08]
    (=jis-x0212		. #x2B32)	; &I-JSP-2B32; [11-18]
    (=jis-x0213-1	. #x295E)	; &I-JX1-295E; [09-62]
    (=jef-china3	. #x85C2)	; &I-JC3-85C2;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH GRAVE")
      (=ucs		  . #x00E8)	; è
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C8)	; Ｅ̀
      (=jis-x0212	  . #x2A32)	; Ｅ̀ [10-18]
      (=jis-x0213-1	  . #x293F)	; &I-JX1-293F; [09-31]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00E9)	; é
    (latin-iso8859-1	. #xE9)	; &I-LATIN1-69;
    (latin-iso8859-2	. #xE9)	; &I-LATIN2-69;
    (latin-iso8859-3	. #xE9)	; &I-LATIN3-69;
    (latin-iso8859-4	. #xE9)	; &I-LATIN4-69;
    (latin-iso8859-9	. #xE9)	; &I-LATIN5-69;
    (latin-tcvn5712	. #xD0)	; &I-VSCII2-50;
    (latin-viscii	. #xE9)	; &I-MULE-VIET-L-69;
    (latin-viscii-lower . #xE9)	; &I-MULE-VIET-L-69;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH ACUTE")
      (=ucs		  . #x00C9)	; É
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH ACUTE")
      (=ucs		  . #x00E9)	; é
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@gb/fw		. #x00E9)	; ｅ́
    (=ucs@jis/fw	. #x00E9)	; ｅ́
    (=gb2312		. #x2826)	; ｅ́ [08-06]
    (=jis-x0212		. #x2B31)	; &I-JSP-2B31; [11-17]
    (=jis-x0213-1	. #x295F)	; &I-JX1-295F; [09-63]
    (=jef-china3	. #x85EE)	; &I-JC3-85EE;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH ACUTE")
      (=ucs		  . #x00E9)	; é
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00C9)	; Ｅ́
      (=jis-x0212	  . #x2A31)	; Ｅ́ [10-17]
      (=jis-x0213-1	  . #x2940)	; &I-JX1-2940; [09-32]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00EA)	; ê
    (latin-iso8859-1	. #xEA)	; &I-LATIN1-6A;
    (latin-iso8859-3	. #xEA)	; &I-LATIN3-6A;
    (latin-iso8859-9	. #xEA)	; &I-LATIN5-6A;
    (latin-tcvn5712	. #xAA)	; &I-VSCII2-2A;
    (latin-viscii	. #xEA)	; &I-MULE-VIET-L-6A;
    (latin-viscii-lower . #xEA)	; &I-MULE-VIET-L-6A;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CIRCUMFLEX")
      (=ucs		  . #x00CA)	; Ê
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH CIRCUMFLEX")
      (=ucs		  . #x00EA)	; ê
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@gb/fw		. #x00EA)	; ｅ̂
    (=ucs@jis/fw	. #x00EA)	; ｅ̂
    (=gb2312		. #x283A)	; ｅ̂ [08-26]
    (=jis-x0212		. #x2B34)	; &I-JSP-2B34; [11-20]
    (=jis-x0213-1	. #x2960)	; &I-JX1-2960; [09-64]
    (=jef-china3	. #x86C6)	; &I-JC3-86C6;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH CIRCUMFLEX")
      (=ucs		  . #x00EA)	; ê
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00CA)	; Ｅ̂
      (=jis-x0212	  . #x2A34)	; Ｅ̂ [10-20]
      (=jis-x0213-1	  . #x2941)	; &I-JX1-2941; [09-33]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00EB)	; ë
    (latin-iso8859-1	. #xEB)	; &I-LATIN1-6B;
    (latin-iso8859-2	. #xEB)	; &I-LATIN2-6B;
    (latin-iso8859-3	. #xEB)	; &I-LATIN3-6B;
    (latin-iso8859-4	. #xEB)	; &I-LATIN4-6B;
    (latin-iso8859-9	. #xEB)	; &I-LATIN5-6B;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DIAERESIS")
      (=ucs		  . #x00CB)	; Ë
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH DIAERESIS")
      (=ucs		  . #x00EB)	; ë
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00EB)	; ｅ̈
    (=jis-x0212		. #x2B33)	; ｅ̈ [11-19]
    (=jis-x0213-1	. #x2961)	; &I-JX1-2961; [09-65]
    (=jef-china3	. #x88D4)	; &I-JC3-88D4;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH DIAERESIS")
      (=ucs		  . #x00EB)	; ë
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00CB)	; Ｅ̈
      (=jis-x0212	  . #x2A33)	; Ｅ̈ [10-19]
      (=jis-x0213-1	  . #x2942)	; &I-JX1-2942; [09-34]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00EC)	; ì
    (latin-iso8859-1	. #xEC)	; &I-LATIN1-6C;
    (latin-iso8859-3	. #xEC)	; &I-LATIN3-6C;
    (latin-iso8859-9	. #xEC)	; &I-LATIN5-6C;
    (latin-tcvn5712	. #xD7)	; &I-VSCII2-57;
    (latin-viscii	. #xEC)	; &I-MULE-VIET-L-6C;
    (latin-viscii-lower . #xEC)	; &I-MULE-VIET-L-6C;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH GRAVE")
      (=ucs		  . #x00CC)	; Ì
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH GRAVE")
      (=ucs		  . #x00EC)	; ì
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@gb/fw		. #x00EC)	; ｉ̀
    (=ucs@jis/fw	. #x00EC)	; ｉ̀
    (=gb2312		. #x282C)	; ｉ̀ [08-12]
    (=jis-x0212		. #x2B40)	; &I-JSP-2B40; [11-32]
    (=jis-x0213-1	. #x2962)	; &I-JX1-2962; [09-66]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH GRAVE")
      (=ucs		  . #x00EC)	; ì
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00CC)	; Ｉ̀
      (=jis-x0212	  . #x2A40)	; Ｉ̀ [10-32]
      (=jis-x0213-1	  . #x2943)	; &I-JX1-2943; [09-35]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00ED)	; í
    (latin-iso8859-1	. #xED)	; &I-LATIN1-6D;
    (latin-iso8859-2	. #xED)	; &I-LATIN2-6D;
    (latin-iso8859-3	. #xED)	; &I-LATIN3-6D;
    (latin-iso8859-4	. #xED)	; &I-LATIN4-6D;
    (latin-iso8859-9	. #xED)	; &I-LATIN5-6D;
    (latin-tcvn5712	. #xDD)	; &I-VSCII2-5D;
    (latin-viscii	. #xED)	; &I-MULE-VIET-L-6D;
    (latin-viscii-lower . #xED)	; &I-MULE-VIET-L-6D;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH ACUTE")
      (=ucs		  . #x00CD)	; Í
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH ACUTE")
      (=ucs		  . #x00ED)	; í
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@gb/fw		. #x00ED)	; ｉ́
    (=ucs@jis/fw	. #x00ED)	; ｉ́
    (=gb2312		. #x282A)	; ｉ́ [08-10]
    (=jis-x0212		. #x2B3F)	; &I-JSP-2B3F; [11-31]
    (=jis-x0213-1	. #x2963)	; &I-JX1-2963; [09-67]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH ACUTE")
      (=ucs		  . #x00ED)	; í
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00CD)	; Ｉ́
      (=jis-x0212	  . #x2A3F)	; Ｉ́ [10-31]
      (=jis-x0213-1	  . #x2944)	; &I-JX1-2944; [09-36]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00EE)	; î
    (latin-iso8859-1	. #xEE)	; &I-LATIN1-6E;
    (latin-iso8859-2	. #xEE)	; &I-LATIN2-6E;
    (latin-iso8859-3	. #xEE)	; &I-LATIN3-6E;
    (latin-iso8859-4	. #xEE)	; &I-LATIN4-6E;
    (latin-iso8859-9	. #xEE)	; &I-LATIN5-6E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH CIRCUMFLEX")
      (=ucs		  . #x00CE)	; Î
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH CIRCUMFLEX")
      (=ucs		  . #x00EE)	; î
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00EE)	; ｉ̂
    (=jis-x0212		. #x2B42)	; ｉ̂ [11-34]
    (=jis-x0213-1	. #x2964)	; &I-JX1-2964; [09-68]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH CIRCUMFLEX")
      (=ucs		  . #x00EE)	; î
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00CE)	; Ｉ̂
      (=jis-x0212	  . #x2A42)	; Ｉ̂ [10-34]
      (=jis-x0213-1	  . #x2945)	; &I-JX1-2945; [09-37]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00EF)	; ï
    (latin-iso8859-1	. #xEF)	; &I-LATIN1-6F;
    (latin-iso8859-3	. #xEF)	; &I-LATIN3-6F;
    (latin-iso8859-9	. #xEF)	; &I-LATIN5-6F;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH DIAERESIS")
      (=ucs		  . #x00CF)	; Ï
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH DIAERESIS")
      (=ucs		  . #x00EF)	; ï
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00EF)	; ｉ̈
    (=jis-x0212		. #x2B41)	; ｉ̈ [11-33]
    (=jis-x0213-1	. #x2965)	; &I-JX1-2965; [09-69]
    (=jef-china3	. #x88D6)	; &I-JC3-88D6;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH DIAERESIS")
      (=ucs		  . #x00EF)	; ï
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00CF)	; Ｉ̈
      (=jis-x0212	  . #x2A41)	; Ｉ̈ [10-33]
      (=jis-x0213-1	  . #x2946)	; &I-JX1-2946; [09-38]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ETH")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (=ucs		. #x00F0)	; ð
    (latin-iso8859-1	. #xF0)	; &I-LATIN1-70;
    (ipa		. #xC9)	; &I-MULE-IPA-49;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ETH")
      (=ucs		  . #x00D0)	; Ð
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER ETH")
      (=ucs		  . #x00F0)	; ð
      ))
    (=ucs@jis/fw	. #x00F0)	; &JX1-2966;
    (=ks-x1001		. #x2923)	; &JX1-2966; [09-03]
    (=jis-x0212		. #x2943)	; &I-JSP-2943; [09-35]
    (=jis-x0213-1	. #x2966)	; &I-JX1-2966; [09-70]
    (=jef-china3	. #x83B4)	; &I-JC3-83B4;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER ETH")
      (=ucs		  . #x00F0)	; ð
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D0)	; &JX1-2947;
      (=ks-x1001	  . #x2822)	; &JX1-2947; [08-02]
      (=jis-x0213-1	  . #x2947)	; &I-JX1-2947; [09-39]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER N")
      (=ucs		  . #x006E)	; n
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x00F1)	; ñ
    (latin-iso8859-1	. #xF1)	; &I-LATIN1-71;
    (latin-iso8859-3	. #xF1)	; &I-LATIN3-71;
    (latin-iso8859-9	. #xF1)	; &I-LATIN5-71;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH TILDE")
      (=ucs		  . #x00D1)	; Ñ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER N WITH TILDE")
      (=ucs		  . #x00F1)	; ñ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER N")
      (=ucs		  . #xFF4E)	; ｎ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x00F1)	; ｎ̃
    (=jis-x0212		. #x2B50)	; ｎ̃ [11-48]
    (=jis-x0213-1	. #x2967)	; &I-JX1-2967; [09-71]
    (=jef-china3	. #x86F3)	; &I-JC3-86F3;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH TILDE")
      (=ucs		  . #x00F1)	; ñ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D1)	; Ｎ̃
      (=jis-x0212	  . #x2A50)	; Ｎ̃ [10-48]
      (=jis-x0213-1	  . #x2948)	; &I-JX1-2948; [09-40]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00F2)	; ò
    (latin-iso8859-1	. #xF2)	; &I-LATIN1-72;
    (latin-iso8859-3	. #xF2)	; &I-LATIN3-72;
    (latin-iso8859-9	. #xF2)	; &I-LATIN5-72;
    (latin-tcvn5712	. #xDF)	; &I-VSCII2-5F;
    (latin-viscii	. #xF2)	; &I-MULE-VIET-L-72;
    (latin-viscii-lower . #xF2)	; &I-MULE-VIET-L-72;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH GRAVE")
      (=ucs		  . #x00D2)	; Ò
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH GRAVE")
      (=ucs		  . #x00F2)	; ò
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@gb/fw		. #x00F2)	; ｏ̀
    (=ucs@jis/fw	. #x00F2)	; ｏ̀
    (=gb2312		. #x2830)	; ｏ̀ [08-16]
    (=jis-x0212		. #x2B52)	; &I-JSP-2B52; [11-50]
    (=jis-x0213-1	. #x2968)	; &I-JX1-2968; [09-72]
    (=jef-china3	. #x85C5)	; &I-JC3-85C5;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH GRAVE")
      (=ucs		  . #x00F2)	; ò
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D2)	; Ｏ̀
      (=jis-x0212	  . #x2A52)	; Ｏ̀ [10-50]
      (=jis-x0213-1	  . #x2949)	; &I-JX1-2949; [09-41]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00F3)	; ó
    (latin-iso8859-1	. #xF3)	; &I-LATIN1-73;
    (latin-iso8859-2	. #xF3)	; &I-LATIN2-73;
    (latin-iso8859-3	. #xF3)	; &I-LATIN3-73;
    (latin-iso8859-9	. #xF3)	; &I-LATIN5-73;
    (latin-tcvn5712	. #xE3)	; &I-VSCII2-63;
    (latin-viscii	. #xF3)	; &I-MULE-VIET-L-73;
    (latin-viscii-lower . #xF3)	; &I-MULE-VIET-L-73;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH ACUTE")
      (=ucs		  . #x00D3)	; Ó
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH ACUTE")
      (=ucs		  . #x00F3)	; ó
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@gb/fw		. #x00F3)	; ｏ́
    (=ucs@jis/fw	. #x00F3)	; ｏ́
    (=gb2312		. #x282E)	; ｏ́ [08-14]
    (=jis-x0212		. #x2B51)	; &I-JSP-2B51; [11-49]
    (=jis-x0213-1	. #x2969)	; &I-JX1-2969; [09-73]
    (=jef-china3	. #x85F6)	; &I-JC3-85F6;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH ACUTE")
      (=ucs		  . #x00F3)	; ó
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D3)	; Ｏ́
      (=jis-x0212	  . #x2A51)	; Ｏ́ [10-49]
      (=jis-x0213-1	  . #x294A)	; &I-JX1-294A; [09-42]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00F4)	; ô
    (latin-iso8859-1	. #xF4)	; &I-LATIN1-74;
    (latin-iso8859-2	. #xF4)	; &I-LATIN2-74;
    (latin-iso8859-3	. #xF4)	; &I-LATIN3-74;
    (latin-iso8859-4	. #xF4)	; &I-LATIN4-74;
    (latin-iso8859-9	. #xF4)	; &I-LATIN5-74;
    (latin-tcvn5712	. #xAB)	; &I-VSCII2-2B;
    (latin-viscii	. #xF4)	; &I-MULE-VIET-L-74;
    (latin-viscii-lower . #xF4)	; &I-MULE-VIET-L-74;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH CIRCUMFLEX")
      (=ucs		  . #x00D4)	; Ô
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH CIRCUMFLEX")
      (=ucs		  . #x00F4)	; ô
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00F4)	; ｏ̂
    (=jis-x0212		. #x2B54)	; ｏ̂ [11-52]
    (=jis-x0213-1	. #x296A)	; &I-JX1-296A; [09-74]
    (=jef-china3	. #x86CC)	; &I-JC3-86CC;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH CIRCUMFLEX")
      (=ucs		  . #x00F4)	; ô
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D4)	; Ｏ̂
      (=jis-x0212	  . #x2A54)	; Ｏ̂ [10-52]
      (=jis-x0213-1	  . #x294B)	; &I-JX1-294B; [09-43]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x00F5)	; õ
    (latin-iso8859-1	. #xF5)	; &I-LATIN1-75;
    (latin-iso8859-4	. #xF5)	; &I-LATIN4-75;
    (latin-iso8859-9	. #xF5)	; &I-LATIN5-75;
    (latin-tcvn5712	. #xE2)	; &I-VSCII2-62;
    (latin-viscii	. #xF5)	; &I-MULE-VIET-L-75;
    (latin-viscii-lower . #xF5)	; &I-MULE-VIET-L-75;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH TILDE")
      (=ucs		  . #x00D5)	; Õ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH TILDE")
      (=ucs		  . #x00F5)	; õ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x00F5)	; ｏ̃
    (=jis-x0212		. #x2B58)	; ｏ̃ [11-56]
    (=jis-x0213-1	. #x296B)	; &I-JX1-296B; [09-75]
    (=jef-china3	. #x86F4)	; &I-JC3-86F4;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH TILDE")
      (=ucs		  . #x00F5)	; õ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D5)	; Ｏ̃
      (=jis-x0212	  . #x2A58)	; Ｏ̃ [10-56]
      (=jis-x0213-1	  . #x294C)	; &I-JX1-294C; [09-44]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00F6)	; ö
    (latin-iso8859-1	. #xF6)	; &I-LATIN1-76;
    (latin-iso8859-2	. #xF6)	; &I-LATIN2-76;
    (latin-iso8859-3	. #xF6)	; &I-LATIN3-76;
    (latin-iso8859-4	. #xF6)	; &I-LATIN4-76;
    (latin-iso8859-9	. #xF6)	; &I-LATIN5-76;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DIAERESIS")
      (=ucs		  . #x00D6)	; Ö
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH DIAERESIS")
      (=ucs		  . #x00F6)	; ö
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00F6)	; ｏ̈
    (=jis-x0212		. #x2B53)	; ｏ̈ [11-51]
    (=jis-x0213-1	. #x296C)	; &I-JX1-296C; [09-76]
    (=jef-china3	. #x88D8)	; &I-JC3-88D8;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH DIAERESIS")
      (=ucs		  . #x00F6)	; ö
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D6)	; Ｏ̈
      (=jis-x0212	  . #x2A53)	; Ｏ̈ [10-51]
      (=jis-x0213-1	  . #x294D)	; &I-JX1-294D; [09-45]
      ))
    ))
(define-char
  '((name		. "DIVISION SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x00F7)	; ÷
    (latin-iso8859-1	. #xF7)	; &I-LATIN1-77;
    (latin-iso8859-2	. #xF7)	; &I-LATIN2-77;
    (latin-iso8859-3	. #xF7)	; &I-LATIN3-77;
    (latin-iso8859-4	. #xF7)	; &I-LATIN4-77;
    (hebrew-iso8859-8	. #xBA)	; &I-HEBREW-3A;
    (latin-iso8859-9	. #xF7)	; &I-LATIN5-77;
    ))
(define-char
  '((<-denotational
     ((name		  . "DIVISION SIGN")
      (=ucs		  . #x00F7)	; ÷
      ))
    (=ucs@gb		. #x00F7)	; &J90-2160;
    (=ucs@jis		. #x00F7)	; &J90-2160;
    (=jis-x0208		. #x2160)	; &J90-2160; [01-64]
    (=gb2312		. #x2142)	; &I-G0-2142; [01-34]
    (=ks-x1001		. #x2140)	; &I-K0-2140; [01-32]
    (=cns11643-1	. #x2233)	; &I-C1-2233; [02-19]
    (=jis-x0213-1	. #x2160)	; &I-JX1-2160; [01-64]
    (=big5		. #xA1D2)	; &I-B-A1D2;
    (<-fullwidth
     ((name		  . "DIVISION SIGN")
      (=ucs		  . #x00F7)	; ÷
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x00F8)	; ø
    (latin-iso8859-1	. #xF8)	; &I-LATIN1-78;
    (latin-iso8859-4	. #xF8)	; &I-LATIN4-78;
    (latin-iso8859-9	. #xF8)	; &I-LATIN5-78;
    (ipa		. #xAF)	; &I-MULE-IPA-2F;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH STROKE")
      (=ucs		  . #x00D8)	; Ø
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH STROKE")
      (=ucs		  . #x00F8)	; ø
      ))
    (=ucs@jis/fw	. #x00F8)	; &JX1-296D;
    (=ks-x1001		. #x292A)	; &JX1-296D; [09-10]
    (=jis-x0212		. #x294C)	; &I-JSP-294C; [09-44]
    (=jis-x0213-1	. #x296D)	; &I-JX1-296D; [09-77]
    (=jef-china3	. #x83AD)	; &I-JC3-83AD;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH STROKE")
      (=ucs		  . #x00F8)	; ø
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D8)	; &JX1-294E;
      (=ks-x1001	  . #x282A)	; &JX1-294E; [08-10]
      (=jis-x0212	  . #x292C)	; &I-JSP-292C; [09-12]
      (=jis-x0213-1	  . #x294E)	; &I-JX1-294E; [09-46]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x00F9)	; ù
    (latin-iso8859-1	. #xF9)	; &I-LATIN1-79;
    (latin-iso8859-3	. #xF9)	; &I-LATIN3-79;
    (latin-iso8859-9	. #xF9)	; &I-LATIN5-79;
    (latin-tcvn5712	. #xEF)	; &I-VSCII2-6F;
    (latin-viscii	. #xF9)	; &I-MULE-VIET-L-79;
    (latin-viscii-lower . #xF9)	; &I-MULE-VIET-L-79;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH GRAVE")
      (=ucs		  . #x00D9)	; Ù
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH GRAVE")
      (=ucs		  . #x00F9)	; ù
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs@gb/fw		. #x00F9)	; ｕ̀
    (=ucs@jis/fw	. #x00F9)	; ｕ̀
    (=gb2312		. #x2834)	; ｕ̀ [08-20]
    (=jis-x0212		. #x2B63)	; &I-JSP-2B63; [11-67]
    (=jis-x0213-1	. #x296E)	; &I-JX1-296E; [09-78]
    (=jef-china3	. #x85C7)	; &I-JC3-85C7;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH GRAVE")
      (=ucs		  . #x00F9)	; ù
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00D9)	; Ｕ̀
      (=jis-x0212	  . #x2A63)	; Ｕ̀ [10-67]
      (=jis-x0213-1	  . #x294F)	; &I-JX1-294F; [09-47]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00FA)	; ú
    (latin-iso8859-1	. #xFA)	; &I-LATIN1-7A;
    (latin-iso8859-2	. #xFA)	; &I-LATIN2-7A;
    (latin-iso8859-3	. #xFA)	; &I-LATIN3-7A;
    (latin-iso8859-4	. #xFA)	; &I-LATIN4-7A;
    (latin-iso8859-9	. #xFA)	; &I-LATIN5-7A;
    (latin-tcvn5712	. #xF3)	; &I-VSCII2-73;
    (latin-viscii	. #xFA)	; &I-MULE-VIET-L-7A;
    (latin-viscii-lower . #xFA)	; &I-MULE-VIET-L-7A;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH ACUTE")
      (=ucs		  . #x00DA)	; Ú
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH ACUTE")
      (=ucs		  . #x00FA)	; ú
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@gb/fw		. #x00FA)	; ｕ́
    (=ucs@jis/fw	. #x00FA)	; ｕ́
    (=gb2312		. #x2832)	; ｕ́ [08-18]
    (=jis-x0212		. #x2B62)	; &I-JSP-2B62; [11-66]
    (=jis-x0213-1	. #x296F)	; &I-JX1-296F; [09-79]
    (=jef-china3	. #x85FC)	; &I-JC3-85FC;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH ACUTE")
      (=ucs		  . #x00FA)	; ú
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00DA)	; Ｕ́
      (=jis-x0212	  . #x2A62)	; Ｕ́ [10-66]
      (=jis-x0213-1	  . #x2950)	; &I-JX1-2950; [09-48]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x00FB)	; û
    (latin-iso8859-1	. #xFB)	; &I-LATIN1-7B;
    (latin-iso8859-3	. #xFB)	; &I-LATIN3-7B;
    (latin-iso8859-4	. #xFB)	; &I-LATIN4-7B;
    (latin-iso8859-9	. #xFB)	; &I-LATIN5-7B;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH CIRCUMFLEX")
      (=ucs		  . #x00DB)	; Û
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH CIRCUMFLEX")
      (=ucs		  . #x00FB)	; û
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x00FB)	; ｕ̂
    (=jis-x0212		. #x2B65)	; ｕ̂ [11-69]
    (=jis-x0213-1	. #x2970)	; &I-JX1-2970; [09-80]
    (=jef-china3	. #x86CE)	; &I-JC3-86CE;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH CIRCUMFLEX")
      (=ucs		  . #x00FB)	; û
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00DB)	; Ｕ̂
      (=jis-x0212	  . #x2A65)	; Ｕ̂ [10-69]
      (=jis-x0213-1	  . #x2951)	; &I-JX1-2951; [09-49]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00FC)	; ü
    (latin-iso8859-1	. #xFC)	; &I-LATIN1-7C;
    (latin-iso8859-2	. #xFC)	; &I-LATIN2-7C;
    (latin-iso8859-3	. #xFC)	; &I-LATIN3-7C;
    (latin-iso8859-4	. #xFC)	; &I-LATIN4-7C;
    (latin-iso8859-9	. #xFC)	; &I-LATIN5-7C;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DIAERESIS")
      (=ucs		  . #x00DC)	; Ü
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH DIAERESIS")
      (=ucs		  . #x00FC)	; ü
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@gb/fw		. #x00FC)	; ｕ̈
    (=ucs@jis/fw	. #x00FC)	; ｕ̈
    (=gb2312		. #x2839)	; ｕ̈ [08-25]
    (=jis-x0212		. #x2B64)	; &I-JSP-2B64; [11-68]
    (=jis-x0213-1	. #x2971)	; &I-JX1-2971; [09-81]
    (=jef-china3	. #x88DB)	; &I-JC3-88DB;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH DIAERESIS")
      (=ucs		  . #x00FC)	; ü
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00DC)	; Ｕ̈
      (=jis-x0212	  . #x2A64)	; Ｕ̈ [10-68]
      (=jis-x0213-1	  . #x2952)	; &I-JX1-2952; [09-50]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER Y")
      (=ucs		  . #x0079)	; y
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x00FD)	; ý
    (latin-iso8859-1	. #xFD)	; &I-LATIN1-7D;
    (latin-iso8859-2	. #xFD)	; &I-LATIN2-7D;
    (latin-tcvn5712	. #xFD)	; &I-VSCII2-7D;
    (latin-viscii	. #xFD)	; &I-MULE-VIET-L-7D;
    (latin-viscii-lower . #xFD)	; &I-MULE-VIET-L-7D;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH ACUTE")
      (=ucs		  . #x00DD)	; Ý
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER Y WITH ACUTE")
      (=ucs		  . #x00FD)	; ý
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Y")
      (=ucs		  . #xFF59)	; ｙ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x00FD)	; ｙ́
    (=jis-x0212		. #x2B72)	; ｙ́ [11-82]
    (=jis-x0213-1	. #x2972)	; &I-JX1-2972; [09-82]
    (=jef-china3	. #x86A1)	; &I-JC3-86A1;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH ACUTE")
      (=ucs		  . #x00FD)	; ý
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00DD)	; Ｙ́
      (=jis-x0212	  . #x2A72)	; Ｙ́ [10-82]
      (=jis-x0213-1	  . #x2953)	; &I-JX1-2953; [09-51]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER THORN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Icelandic")
    (=ucs		. #x00FE)	; þ
    (latin-iso8859-1	. #xFE)	; &I-LATIN1-7E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER THORN")
      (=ucs		  . #x00DE)	; Þ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER THORN")
      (=ucs		  . #x00FE)	; þ
      ))
    (=ucs@jis/fw	. #x00FE)	; &JX1-2973;
    (=ks-x1001		. #x292D)	; &JX1-2973; [09-13]
    (=jis-x0212		. #x2950)	; &I-JSP-2950; [09-48]
    (=jis-x0213-1	. #x2973)	; &I-JX1-2973; [09-83]
    (=jef-china3	. #x83AF)	; &I-JC3-83AF;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER THORN")
      (=ucs		  . #x00FE)	; þ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x00DE)	; &JX1-2954;
      (=ks-x1001	  . #x282D)	; &JX1-2954; [08-13]
      (=jis-x0212	  . #x2930)	; &I-JSP-2930; [09-16]
      (=jis-x0213-1	  . #x2954)	; &I-JX1-2954; [09-52]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER Y")
      (=ucs		  . #x0079)	; y
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x00FF)	; ÿ
    (latin-iso8859-1	. #xFF)	; &I-LATIN1-7F;
    (latin-iso8859-9	. #xFF)	; &I-LATIN5-7F;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x0178)	; Ÿ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x00FF)	; ÿ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Y")
      (=ucs		  . #xFF59)	; ｙ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x00FF)	; ｙ̈
    (=jis-x0212		. #x2B73)	; ｙ̈ [11-83]
    (=jis-x0213-1	. #x2974)	; &I-JX1-2974; [09-84]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x00FF)	; ÿ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0178)	; Ｙ̈
      (=jis-x0212	  . #x2A73)	; Ｙ̈ [10-83]
      ))
    ))
