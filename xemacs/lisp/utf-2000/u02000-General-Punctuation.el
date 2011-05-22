;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "EN QUAD")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2000)	;  
    (->canonical
     ((name		  . "EN SPACE")
      (=ucs		  . #x2002)	;  
      ))
    ))
(define-char
  '((name		. "EM QUAD")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2001)	;  
    (->canonical
     ((name		  . "EM SPACE")
      (=ucs		  . #x2003)	;  
      ))
    ))
(define-char
  '((name		. "EN SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2002)	;  
    (<-compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2003)	;  
    (=cns11643-1	. #x256D)	; &I-C1-256D; [05-77]
    (<-compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "THREE-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2004)	;  
    (<-compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "FOUR-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2005)	;  
    (<-compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "SIX-PER-EM SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2006)	;  
    (<-compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "FIGURE SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2007)	;  
    (<-noBreak
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "PUNCTUATION SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2008)	;  
    (<-compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "THIN SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2009)	;  
    (<-compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "HAIR SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x200A)	;  
    (<-compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "ZERO WIDTH SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200B)	; ​
    ))
(define-char
  '((name		. "ZERO WIDTH NON-JOINER")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200C)	; ‌
    ))
(define-char
  '((name		. "ZERO WIDTH JOINER")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x200D)	; ‍
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT MARK")
    (general-category	other format) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x200E)	; ‎
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT MARK")
    (general-category	other format) ; Normative Category
    (bidi-category	. "R")
    (mirrored		. nil)
    (=ucs		. #x200F)	; ‏
    ))
(define-char
  '((name		. "HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2010)	; ‐
    ))
(define-char
  '((<-denotational
     ((name		  . "HYPHEN")
      (=ucs		  . #x2010)	; ‐
      ))
    (=ucs@jis		. #x2010)	; &J90-213E;
    (=jis-x0208		. #x213E)	; &J90-213E; [01-30]
    (=jis-x0213-1	. #x213E)	; &I-JX1-213E; [01-30]
    (<-fullwidth
     ((name		  . "HYPHEN")
      (=ucs		  . #x2010)	; ‐
      ))
    ))
(define-char
  '((name		. "NON-BREAKING HYPHEN")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2011)	; ‑
    (<-noBreak
     ((name		  . "HYPHEN")
      (=ucs		  . #x2010)	; ‐
      ))
    ))
(define-char
  '((name		. "FIGURE DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2012)	; ‒
    ))
(define-char
  '((name		. "EN DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2013)	; –
    ))
(define-char
  '((<-denotational
     ((name		  . "EN DASH")
      (=ucs		  . #x2013)	; –
      ))
    (=ucs@cns		. #x2013)	; &JX1-237C;
    (=ucs@jis		. #x2013)	; &JX1-237C;
    (=ucs@big5		. #x2013)	; &JX1-237C;
    (=cns11643-1	. #x2139)	; &JX1-237C; [01-25]
    (=jis-x0213-1	. #x237C)	; &I-JX1-237C; [03-92]
    (=big5		. #xA156)	; &I-B-A156;
    (<-fullwidth
     ((name		  . "EN DASH")
      (=ucs		  . #x2013)	; –
      ))
    ))
(define-char
  '((name		. "EM DASH")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2014)	; —
    ))
(define-char
  '((<-denotational
     ((name		  . "EM DASH")
      (=ucs		  . #x2014)	; —
      ))
    (=ucs@cns		. #x2014)	; &J90-213D;
    (=ucs@jis		. #x2014)	; &J90-213D;
    (=ucs@big5		. #x2014)	; &J90-213D;
    (=jis-x0208		. #x213D)	; &J90-213D; [01-29]
    (=cns11643-1	. #x2137)	; &I-C1-2137; [01-23]
    (=jis-x0213-1	. #x213D)	; &I-JX1-213D; [01-29]
    (=big5		. #xA158)	; &I-B-A158;
    (<-fullwidth
     ((name		  . "EM DASH")
      (=ucs		  . #x2014)	; —
      ))
    ))
(define-char
  '((name		. "HORIZONTAL BAR")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2015)	; ―
    (greek-iso8859-7	. #xAF)	; &I-GREEK-2F;
    ))
(define-char
  '((<-denotational
     ((name		  . "HORIZONTAL BAR")
      (=ucs		  . #x2015)	; ―
      ))
    (=ucs@gb		. #x2015)	; &K0-212A;
    (=ucs@ks		. #x2015)	; &K0-212A;
    (=gb2312		. #x212A)	; &K0-212A; [01-10]
    (=ks-x1001		. #x212A)	; &I-K0-212A; [01-10]
    (<-fullwidth
     ((name		  . "HORIZONTAL BAR")
      (=ucs		  . #x2015)	; ―
      ))
    ))
(define-char
  '((name		. "DOUBLE VERTICAL LINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2016)	; ‖
    ))
(define-char
  '((<-denotational
     ((name		  . "DOUBLE VERTICAL LINE")
      (=ucs		  . #x2016)	; ‖
      ))
    (=ucs@gb		. #x2016)	; &J90-2142;
    (=ucs@cns		. #x2016)	; &J90-2142;
    (=ucs@jis		. #x2016)	; &J90-2142;
    (=jis-x0208		. #x2142)	; &J90-2142; [01-34]
    (=gb2312		. #x212C)	; &I-G0-212C; [01-12]
    (=cns11643-1	. #x225D)	; &I-C1-225D; [02-61]
    (=jis-x0213-1	. #x2142)	; &I-JX1-2142; [01-34]
    (<-fullwidth
     ((name		  . "DOUBLE VERTICAL LINE")
      (=ucs		  . #x2016)	; ‖
      ))
    ))
(define-char
  '((name		. "DOUBLE LOW LINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING DOUBLE LOW LINE")
      (=ucs		  . #x0333)	; ̳
      ))
    (=ucs		. #x2017)	; ‗
    (hebrew-iso8859-8	. #xDF)	; &I-HEBREW-5F;
    ))
(define-char
  '((name		. "LEFT SINGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2018)	; ‘
    ))
(define-char
  '((<-denotational
     ((name		  . "LEFT SINGLE QUOTATION MARK")
      (=ucs		  . #x2018)	; ‘
      ))
    (=ucs@gb		. #x2018)	; &J90-2146;
    (=ucs@cns		. #x2018)	; &J90-2146;
    (=ucs@jis		. #x2018)	; &J90-2146;
    (=ucs@ks		. #x2018)	; &J90-2146;
    (=ucs@big5		. #x2018)	; &J90-2146;
    (=jis-x0208		. #x2146)	; &J90-2146; [01-38]
    (=gb2312		. #x212E)	; &I-G0-212E; [01-14]
    (=ks-x1001		. #x212E)	; &I-K0-212E; [01-14]
    (=cns11643-1	. #x2164)	; &I-C1-2164; [01-68]
    (=jis-x0213-1	. #x2146)	; &I-JX1-2146; [01-38]
    (=big5		. #xA1A5)	; &I-B-A1A5;
    (<-fullwidth
     ((name		  . "LEFT SINGLE QUOTATION MARK")
      (=ucs		  . #x2018)	; ‘
      ))
    ))
(define-char
  '((name		. "RIGHT SINGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2019)	; ’
    ))
(define-char
  '((<-denotational
     ((name		  . "RIGHT SINGLE QUOTATION MARK")
      (=ucs		  . #x2019)	; ’
      ))
    (=ucs@gb		. #x2019)	; &J90-2147;
    (=ucs@cns		. #x2019)	; &J90-2147;
    (=ucs@jis		. #x2019)	; &J90-2147;
    (=ucs@ks		. #x2019)	; &J90-2147;
    (=ucs@big5		. #x2019)	; &J90-2147;
    (=jis-x0208		. #x2147)	; &J90-2147; [01-39]
    (=gb2312		. #x212F)	; &I-G0-212F; [01-15]
    (=ks-x1001		. #x212F)	; &I-K0-212F; [01-15]
    (=cns11643-1	. #x2165)	; &I-C1-2165; [01-69]
    (=jis-x0213-1	. #x2147)	; &I-JX1-2147; [01-39]
    (=big5		. #xA1A6)	; &I-B-A1A6;
    (<-fullwidth
     ((name		  . "RIGHT SINGLE QUOTATION MARK")
      (=ucs		  . #x2019)	; ’
      ))
    ))
(define-char
  '((name		. "SINGLE LOW-9 QUOTATION MARK")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201A)	; ‚
    ))
(define-char
  '((name		. "SINGLE HIGH-REVERSED-9 QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201B)	; ‛
    ))
(define-char
  '((name		. "LEFT DOUBLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201C)	; “
    ))
(define-char
  '((<-denotational
     ((name		  . "LEFT DOUBLE QUOTATION MARK")
      (=ucs		  . #x201C)	; “
      ))
    (=ucs@gb		. #x201C)	; &J90-2148;
    (=ucs@cns		. #x201C)	; &J90-2148;
    (=ucs@jis		. #x201C)	; &J90-2148;
    (=ucs@ks		. #x201C)	; &J90-2148;
    (=ucs@big5		. #x201C)	; &J90-2148;
    (=jis-x0208		. #x2148)	; &J90-2148; [01-40]
    (=gb2312		. #x2130)	; &I-G0-2130; [01-16]
    (=ks-x1001		. #x2130)	; &I-K0-2130; [01-16]
    (=cns11643-1	. #x2166)	; &I-C1-2166; [01-70]
    (=jis-x0213-1	. #x2148)	; &I-JX1-2148; [01-40]
    (=big5		. #xA1A7)	; &I-B-A1A7;
    (<-fullwidth
     ((name		  . "LEFT DOUBLE QUOTATION MARK")
      (=ucs		  . #x201C)	; “
      ))
    ))
(define-char
  '((name		. "RIGHT DOUBLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201D)	; ”
    ))
(define-char
  '((<-denotational
     ((name		  . "RIGHT DOUBLE QUOTATION MARK")
      (=ucs		  . #x201D)	; ”
      ))
    (=ucs@gb		. #x201D)	; &J90-2149;
    (=ucs@cns		. #x201D)	; &J90-2149;
    (=ucs@jis		. #x201D)	; &J90-2149;
    (=ucs@ks		. #x201D)	; &J90-2149;
    (=ucs@big5		. #x201D)	; &J90-2149;
    (=jis-x0208		. #x2149)	; &J90-2149; [01-41]
    (=gb2312		. #x2131)	; &I-G0-2131; [01-17]
    (=ks-x1001		. #x2131)	; &I-K0-2131; [01-17]
    (=cns11643-1	. #x2167)	; &I-C1-2167; [01-71]
    (=jis-x0213-1	. #x2149)	; &I-JX1-2149; [01-41]
    (=big5		. #xA1A8)	; &I-B-A1A8;
    (<-fullwidth
     ((name		  . "RIGHT DOUBLE QUOTATION MARK")
      (=ucs		  . #x201D)	; ”
      ))
    ))
(define-char
  '((name		. "DOUBLE LOW-9 QUOTATION MARK")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201E)	; „
    ))
(define-char
  '((name		. "DOUBLE HIGH-REVERSED-9 QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x201F)	; ‟
    ))
(define-char
  '((name		. "DAGGER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2020)	; †
    ))
(define-char
  '((<-denotational
     ((name		  . "DAGGER")
      (=ucs		  . #x2020)	; †
      ))
    (=ucs@jis		. #x2020)	; &J90-2277;
    (=ucs@ks		. #x2020)	; &J90-2277;
    (=jis-x0208@1983	. #x2277)	; &J90-2277; [02-87]
    (=ks-x1001		. #x2253)	; &I-K0-2253; [02-51]
    (=jis-x0208@1990	. #x2277)	; &I-J90-2277; [02-87]
    (=jis-x0213-1	. #x2277)	; &I-JX1-2277; [02-87]
    (<-fullwidth
     ((name		  . "DAGGER")
      (=ucs		  . #x2020)	; †
      ))
    ))
(define-char
  '((name		. "DOUBLE DAGGER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2021)	; ‡
    ))
(define-char
  '((<-denotational
     ((name		  . "DOUBLE DAGGER")
      (=ucs		  . #x2021)	; ‡
      ))
    (=ucs@jis		. #x2021)	; &J90-2278;
    (=ucs@ks		. #x2021)	; &J90-2278;
    (=jis-x0208@1983	. #x2278)	; &J90-2278; [02-88]
    (=ks-x1001		. #x2254)	; &I-K0-2254; [02-52]
    (=jis-x0208@1990	. #x2278)	; &I-J90-2278; [02-88]
    (=jis-x0213-1	. #x2278)	; &I-JX1-2278; [02-88]
    (<-fullwidth
     ((name		  . "DOUBLE DAGGER")
      (=ucs		  . #x2021)	; ‡
      ))
    ))
(define-char
  '((name		. "BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2022)	; •
    ))
(define-char
  '((<-denotational
     ((name		  . "BULLET")
      (=ucs		  . #x2022)	; •
      ))
    (=ucs@jis/fw	. #x2022)	; &JX1-2340;
    (=jis-x0213-1	. #x2340)	; &JX1-2340; [03-32]
    (<-fullwidth
     ((name		  . "BULLET")
      (=ucs		  . #x2022)	; •
      ))
    ))
(define-char
  '((name		. "TRIANGULAR BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2023)	; ‣
    ))
(define-char
  '((name		. "ONE DOT LEADER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2024)	; ․
    (<-compat
     ((name		  . "FULL STOP")
      (=ucs		  . #x002E)	; .
      ))
    ))
(define-char
  '((name		. "TWO DOT LEADER")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "FULL STOP")
      (=ucs		  . #x002E)	; .
      )
     ((name		  . "FULL STOP")
      (=ucs		  . #x002E)	; .
      ))
    (=ucs		. #x2025)	; ‥
    ))
(define-char
  '((<-denotational
     ((name		  . "TWO DOT LEADER")
      (=ucs		  . #x2025)	; ‥
      ))
    (=ucs@cns		. #x2025)	; &J90-2145;
    (=ucs@jis		. #x2025)	; &J90-2145;
    (=ucs@ks		. #x2025)	; &J90-2145;
    (=ucs@big5		. #x2025)	; &J90-2145;
    (=jis-x0208		. #x2145)	; &J90-2145; [01-37]
    (=ks-x1001		. #x2125)	; &I-K0-2125; [01-05]
    (=cns11643-1	. #x212D)	; &I-C1-212D; [01-13]
    (=jis-x0213-1	. #x2145)	; &I-JX1-2145; [01-37]
    (=big5		. #xA14C)	; &I-B-A14C;
    (<-fullwidth
     ((name		  . "TWO DOT LEADER")
      (=ucs		  . #x2025)	; ‥
      ))
    ))
(define-char
  '((name		. "HORIZONTAL ELLIPSIS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "FULL STOP")
      (=ucs		  . #x002E)	; .
      )
     ((name		  . "FULL STOP")
      (=ucs		  . #x002E)	; .
      )
     ((name		  . "FULL STOP")
      (=ucs		  . #x002E)	; .
      ))
    (=ucs		. #x2026)	; …
    ))
(define-char
  '((<-denotational
     ((name		  . "HORIZONTAL ELLIPSIS")
      (=ucs		  . #x2026)	; …
      ))
    (=ucs@gb		. #x2026)	; &J90-2144;
    (=ucs@cns		. #x2026)	; &J90-2144;
    (=ucs@jis		. #x2026)	; &J90-2144;
    (=ucs@ks		. #x2026)	; &J90-2144;
    (=ucs@big5		. #x2026)	; &J90-2144;
    (=jis-x0208		. #x2144)	; &J90-2144; [01-36]
    (=gb2312		. #x212D)	; &I-G0-212D; [01-13]
    (=ks-x1001		. #x2126)	; &I-K0-2126; [01-06]
    (=cns11643-1	. #x212C)	; &I-C1-212C; [01-12]
    (=jis-x0213-1	. #x2144)	; &I-JX1-2144; [01-36]
    (=big5		. #xA14B)	; &I-B-A14B;
    (<-fullwidth
     ((name		  . "HORIZONTAL ELLIPSIS")
      (=ucs		  . #x2026)	; …
      ))
    ))
(define-char
  '((name		. "HYPHENATION POINT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2027)	; ‧
    ))
(define-char
  '((<-denotational
     ((name		  . "HYPHENATION POINT")
      (=ucs		  . #x2027)	; ‧
      ))
    (=ucs@cns		. #x2027)	; &C1-2126;
    (=ucs@big5		. #x2027)	; &C1-2126;
    (=cns11643-1	. #x2126)	; &C1-2126; [01-06]
    (=big5		. #xA145)	; &I-B-A145;
    (<-fullwidth
     ((name		  . "HYPHENATION POINT")
      (=ucs		  . #x2027)	; ‧
      ))
    ))
(define-char
  '((name		. "LINE SEPARATOR")
    (general-category	separator line) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x2028)	;  
    ))
(define-char
  '((name		. "PARAGRAPH SEPARATOR")
    (general-category	separator paragraph) ; Normative Category
    (bidi-category	. "B")
    (mirrored		. nil)
    (=ucs		. #x2029)	;  
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT EMBEDDING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRE")
    (mirrored		. nil)
    (=ucs		. #x202A)	; ‪
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT EMBEDDING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLE")
    (mirrored		. nil)
    (=ucs		. #x202B)	; ‫
    ))
(define-char
  '((name		. "POP DIRECTIONAL FORMATTING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "PDF")
    (mirrored		. nil)
    (=ucs		. #x202C)	; ‬
    ))
(define-char
  '((name		. "LEFT-TO-RIGHT OVERRIDE")
    (general-category	other format) ; Normative Category
    (bidi-category	. "LRO")
    (mirrored		. nil)
    (=ucs		. #x202D)	; ‭
    ))
(define-char
  '((name		. "RIGHT-TO-LEFT OVERRIDE")
    (general-category	other format) ; Normative Category
    (bidi-category	. "RLO")
    (mirrored		. nil)
    (=ucs		. #x202E)	; ‮
    ))
(define-char
  '((name		. "NARROW NO-BREAK SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x202F)	;  
    (<-noBreak
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      ))
    ))
(define-char
  '((name		. "PER MILLE SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2030)	; ‰
    ))
(define-char
  '((<-denotational
     ((name		  . "PER MILLE SIGN")
      (=ucs		  . #x2030)	; ‰
      ))
    (=ucs@gb		. #x2030)	; &J90-2273;
    (=ucs@jis		. #x2030)	; &J90-2273;
    (=ucs@ks		. #x2030)	; &J90-2273;
    (=gb2312		. #x216B)	; &J90-2273; [01-75]
    (=jis-x0208@1983	. #x2273)	; &I-J83-2273; [02-83]
    (=ks-x1001		. #x2236)	; &I-K0-2236; [02-22]
    (=jis-x0208@1990	. #x2273)	; &I-J90-2273; [02-83]
    (=jis-x0213-1	. #x2273)	; &I-JX1-2273; [02-83]
    (<-fullwidth
     ((name		  . "PER MILLE SIGN")
      (=ucs		  . #x2030)	; ‰
      ))
    ))
(define-char
  '((name		. "PER TEN THOUSAND SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2031)	; ‱
    ))
(define-char
  '((name		. "PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x2032)	; ′
    ))
(define-char
  '((<-denotational
     ((name		  . "PRIME")
      (=ucs		  . #x2032)	; ′
      ))
    (=ucs@gb		. #x2032)	; &J90-216C;
    (=ucs@cns		. #x2032)	; &J90-216C;
    (=ucs@jis		. #x2032)	; &J90-216C;
    (=ucs@ks		. #x2032)	; &J90-216C;
    (=ucs@big5		. #x2032)	; &J90-216C;
    (=jis-x0208		. #x216C)	; &J90-216C; [01-76]
    (=gb2312		. #x2164)	; &I-G0-2164; [01-68]
    (=ks-x1001		. #x2147)	; &I-K0-2147; [01-39]
    (=cns11643-1	. #x216B)	; &I-C1-216B; [01-75]
    (=jis-x0213-1	. #x216C)	; &I-JX1-216C; [01-76]
    (=big5		. #xA1AC)	; &I-B-A1AC;
    (<-fullwidth
     ((name		  . "PRIME")
      (=ucs		  . #x2032)	; ′
      ))
    ))
(define-char
  '((name		. "DOUBLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "PRIME")
      (=ucs		  . #x2032)	; ′
      )
     ((name		  . "PRIME")
      (=ucs		  . #x2032)	; ′
      ))
    (=ucs		. #x2033)	; ″
    ))
(define-char
  '((<-denotational
     ((name		  . "DOUBLE PRIME")
      (=ucs		  . #x2033)	; ″
      ))
    (=ucs@gb		. #x2033)	; &J90-216D;
    (=ucs@jis		. #x2033)	; &J90-216D;
    (=ucs@ks		. #x2033)	; &J90-216D;
    (=jis-x0208		. #x216D)	; &J90-216D; [01-77]
    (=gb2312		. #x2165)	; &I-G0-2165; [01-69]
    (=ks-x1001		. #x2148)	; &I-K0-2148; [01-40]
    (=jis-x0213-1	. #x216D)	; &I-JX1-216D; [01-77]
    (<-fullwidth
     ((name		  . "DOUBLE PRIME")
      (=ucs		  . #x2033)	; ″
      ))
    ))
(define-char
  '((name		. "TRIPLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "PRIME")
      (=ucs		  . #x2032)	; ′
      )
     ((name		  . "PRIME")
      (=ucs		  . #x2032)	; ′
      )
     ((name		  . "PRIME")
      (=ucs		  . #x2032)	; ′
      ))
    (=ucs		. #x2034)	; ‴
    ))
(define-char
  '((name		. "REVERSED PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2035)	; ‵
    ))
(define-char
  '((<-denotational
     ((name		  . "REVERSED PRIME")
      (=ucs		  . #x2035)	; ‵
      ))
    (=ucs@cns		. #x2035)	; &C1-216A;
    (=ucs@big5		. #x2035)	; &C1-216A;
    (=cns11643-1	. #x216A)	; &C1-216A; [01-74]
    (=big5		. #xA1AB)	; &I-B-A1AB;
    (<-fullwidth
     ((name		  . "REVERSED PRIME")
      (=ucs		  . #x2035)	; ‵
      ))
    ))
(define-char
  '((name		. "REVERSED DOUBLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "REVERSED PRIME")
      (=ucs		  . #x2035)	; ‵
      )
     ((name		  . "REVERSED PRIME")
      (=ucs		  . #x2035)	; ‵
      ))
    (=ucs		. #x2036)	; ‶
    ))
(define-char
  '((name		. "REVERSED TRIPLE PRIME")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "REVERSED PRIME")
      (=ucs		  . #x2035)	; ‵
      )
     ((name		  . "REVERSED PRIME")
      (=ucs		  . #x2035)	; ‵
      )
     ((name		  . "REVERSED PRIME")
      (=ucs		  . #x2035)	; ‵
      ))
    (=ucs		. #x2037)	; ‷
    ))
(define-char
  '((name		. "CARET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2038)	; ‸
    ))
(define-char
  '((name		. "SINGLE LEFT-POINTING ANGLE QUOTATION MARK")
    (general-category	punctuation initial-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2039)	; ‹
    ))
(define-char
  '((name		. "SINGLE RIGHT-POINTING ANGLE QUOTATION MARK")
    (general-category	punctuation final-quote) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x203A)	; ›
    ))
(define-char
  '((name		. "REFERENCE MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x203B)	; ※
    ))
(define-char
  '((<-denotational
     ((name		  . "REFERENCE MARK")
      (=ucs		  . #x203B)	; ※
      ))
    (=ucs@gb		. #x203B)	; &J90-2228;
    (=ucs@cns		. #x203B)	; &J90-2228;
    (=ucs@jis		. #x203B)	; &J90-2228;
    (=ucs@ks		. #x203B)	; &J90-2228;
    (=ucs@big5		. #x203B)	; &J90-2228;
    (=jis-x0208		. #x2228)	; &J90-2228; [02-08]
    (=gb2312		. #x2179)	; &I-G0-2179; [01-89]
    (=ks-x1001		. #x2158)	; &I-K0-2158; [01-56]
    (=cns11643-1	. #x216F)	; &I-C1-216F; [01-79]
    (=jis-x0213-1	. #x2228)	; &I-JX1-2228; [02-08]
    (=big5		. #xA1B0)	; &I-B-A1B0;
    (<-fullwidth
     ((name		  . "REFERENCE MARK")
      (=ucs		  . #x203B)	; ※
      ))
    ))
(define-char
  '((name		. "DOUBLE EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "EXCLAMATION MARK")
      (=ucs		  . #x0021)	; !
      )
     ((name		  . "EXCLAMATION MARK")
      (=ucs		  . #x0021)	; !
      ))
    (=ucs		. #x203C)	; ‼
    ))
(define-char
  '((<-denotational
     ((name		  . "DOUBLE EXCLAMATION MARK")
      (=ucs		  . #x203C)	; ‼
      ))
    (=ucs@jis		. #x203C)	; &JX1-286B;
    (=jis-x0213-1	. #x286B)	; &JX1-286B; [08-75]
    (<-fullwidth
     ((name		  . "DOUBLE EXCLAMATION MARK")
      (=ucs		  . #x203C)	; ‼
      ))
    ))
(define-char
  '((name		. "INTERROBANG")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x203D)	; ‽
    ))
(define-char
  '((name		. "OVERLINE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "SPACE")
      (=ucs		  . #x0020)	;
      )
     ((name		  . "COMBINING OVERLINE")
      (=ucs		  . #x0305)	; ̅
      ))
    (=ucs		. #x203E)	; ‾
    (latin-jisx0201	. #x7E)	; &I-LATINJ-7E;
    (hebrew-iso8859-8	. #xAF)	; &I-HEBREW-2F;
    ))
(define-char
  '((<-denotational
     ((name		  . "OVERLINE")
      (=ucs		  . #x203E)	; ‾
      ))
    (name		. "FULLWIDTH OVERLINE")
    (=ucs@gb		. #xFFE3)	; &J90-2131;
    (=ucs@jis		. #x203E)	; &J90-2131;
    (=jis-x0208		. #x2131)	; &J90-2131; [01-17]
    (=gb2312		. #x237E)	; &I-G0-237E; [03-94]
    (=ks-x1001		. #x237E)	; &I-K0-237E; [03-94]
    (=cns11643-1	. #x2223)	; &I-C1-2223; [02-03]
    (=jis-x0213-1	. #x2131)	; &I-JX1-2131; [01-17]
    (=big5		. #xA1C2)	; &I-B-A1C2;
    (<-fullwidth
     ((name		  . "OVERLINE")
      (=ucs		  . #x203E)	; ‾
      ))
    ))
(define-char
  '((name		. "UNDERTIE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (iso-10646-comment	. "Enotikon")
    (=ucs		. #x203F)	; ‿
    ))
(define-char
  '((name		. "CHARACTER TIE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2040)	; ⁀
    ))
(define-char
  '((name		. "CARET INSERTION POINT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2041)	; ⁁
    ))
(define-char
  '((name		. "ASTERISM")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2042)	; ⁂
    ))
(define-char
  '((<-denotational
     ((name		  . "ASTERISM")
      (=ucs		  . #x2042)	; ⁂
      ))
    (=ucs@jis		. #x2042)	; &JX1-2C7E;
    (=jis-x0213-1	. #x2C7E)	; &JX1-2C7E; [12-94]
    (<-fullwidth
     ((name		  . "ASTERISM")
      (=ucs		  . #x2042)	; ⁂
      ))
    ))
(define-char
  '((name		. "HYPHEN BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2043)	; ⁃
    ))
(define-char
  '((name		. "FRACTION SLASH")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x2044)	; ⁄
    ))
(define-char
  '((name		. "LEFT SQUARE BRACKET WITH QUILL")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2045)	; ⁅
    ))
(define-char
  '((name		. "RIGHT SQUARE BRACKET WITH QUILL")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x2046)	; ⁆
    ))
(define-char
  '((name		. "DOUBLE QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (=>decomposition@compat
     ((name		  . "QUESTION MARK")
      (=ucs		  . #x003F)	; ?
      )
     ((name		  . "QUESTION MARK")
      (=ucs		  . #x003F)	; ?
      ))
    (=ucs		. #x2047)	; ⁇
    ))
(define-char
  '((<-denotational
     ((name		  . "DOUBLE QUESTION MARK")
      (=ucs		  . #x2047)	; ⁇
      ))
    (=ucs@jis		. #x2047)	; &JX1-286C;
    (=jis-x0213-1	. #x286C)	; &JX1-286C; [08-76]
    (<-fullwidth
     ((name		  . "DOUBLE QUESTION MARK")
      (=ucs		  . #x2047)	; ⁇
      ))
    ))
(define-char
  '((name		. "QUESTION EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "QUESTION MARK")
      (=ucs		  . #x003F)	; ?
      )
     ((name		  . "EXCLAMATION MARK")
      (=ucs		  . #x0021)	; !
      ))
    (=ucs		. #x2048)	; ⁈
    ))
(define-char
  '((<-denotational
     ((name		  . "QUESTION EXCLAMATION MARK")
      (=ucs		  . #x2048)	; ⁈
      ))
    (=ucs@jis		. #x2048)	; &JX1-286D;
    (=jis-x0213-1	. #x286D)	; &JX1-286D; [08-77]
    (<-fullwidth
     ((name		  . "QUESTION EXCLAMATION MARK")
      (=ucs		  . #x2048)	; ⁈
      ))
    ))
(define-char
  '((name		. "EXCLAMATION QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "EXCLAMATION MARK")
      (=ucs		  . #x0021)	; !
      )
     ((name		  . "QUESTION MARK")
      (=ucs		  . #x003F)	; ?
      ))
    (=ucs		. #x2049)	; ⁉
    ))
(define-char
  '((<-denotational
     ((name		  . "EXCLAMATION QUESTION MARK")
      (=ucs		  . #x2049)	; ⁉
      ))
    (=ucs@jis		. #x2049)	; &JX1-286E;
    (=jis-x0213-1	. #x286E)	; &JX1-286E; [08-78]
    (<-fullwidth
     ((name		  . "EXCLAMATION QUESTION MARK")
      (=ucs		  . #x2049)	; ⁉
      ))
    ))
(define-char
  '((name		. "TIRONIAN SIGN ET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204A)	; ⁊
    ))
(define-char
  '((name		. "REVERSED PILCROW SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204B)	; ⁋
    ))
(define-char
  '((name		. "BLACK LEFTWARDS BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204C)	; ⁌
    ))
(define-char
  '((name		. "BLACK RIGHTWARDS BULLET")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x204D)	; ⁍
    ))
(define-char
  '((name		. "TWO ASTERISKS ALIGNED VERTICALLY")
    (=ucs		. #x2051)	; ⁑
    ))
(define-char
  '((<-denotational
     ((name		  . "TWO ASTERISKS ALIGNED VERTICALLY")
      (=ucs		  . #x2051)	; ⁑
      ))
    (=ucs@jis		. #x2051)	; &JX1-2C7D;
    (=jis-x0213-1	. #x2C7D)	; &JX1-2C7D; [12-93]
    (<-fullwidth
     ((name		  . "TWO ASTERISKS ALIGNED VERTICALLY")
      (=ucs		  . #x2051)	; ⁑
      ))
    ))
(define-char
  '((name		. "INHIBIT SYMMETRIC SWAPPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206A)	; ⁪
    ))
(define-char
  '((name		. "ACTIVATE SYMMETRIC SWAPPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206B)	; ⁫
    ))
(define-char
  '((name		. "INHIBIT ARABIC FORM SHAPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206C)	; ⁬
    ))
(define-char
  '((name		. "ACTIVATE ARABIC FORM SHAPING")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206D)	; ⁭
    ))
(define-char
  '((name		. "NATIONAL DIGIT SHAPES")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206E)	; ⁮
    ))
(define-char
  '((name		. "NOMINAL DIGIT SHAPES")
    (general-category	other format) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x206F)	; ⁯
    ))
