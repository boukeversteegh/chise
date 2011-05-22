;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "ARABIC COMMA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (=ucs		. #x060C)	; ،
    (arabic-iso8859-6	. #xAC)	; ،
    (arabic-1-column	. #x25)	; &I-MULE-ARB1-25;
    ))
(define-char
  '((name		. "ARABIC SEMICOLON")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x061B)	; ؛
    (arabic-iso8859-6	. #xBB)	; ؛
    (arabic-1-column	. #x28)	; &I-MULE-ARB1-28;
    ))
(define-char
  '((name		. "ARABIC QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x061F)	; ؟
    (arabic-iso8859-6	. #xBF)	; ؟
    (arabic-1-column	. #x29)	; &I-MULE-ARB1-29;
    ))
(define-char
  '((name		. "ARABIC LETTER HAMZA")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0621)	; ء
    (arabic-iso8859-6	. #xC1)	; ء
    ))
(define-char
  '((name		. "ARABIC LETTER ALEF WITH MADDA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "ARABIC LETTER ALEF")
      (=ucs		  . #x0627)	; ا
      )
     ((name		  . "ARABIC MADDAH ABOVE")
      (=ucs		  . #x0653)	; ٓ
      ))
    (=ucs		. #x0622)	; آ
    (arabic-iso8859-6	. #xC2)	; آ
    ))
(define-char
  '((name		. "ARABIC LETTER ALEF WITH HAMZA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "ARABIC LETTER ALEF")
      (=ucs		  . #x0627)	; ا
      )
     ((name		  . "ARABIC HAMZA ABOVE")
      (=ucs		  . #x0654)	; ٔ
      ))
    (=ucs		. #x0623)	; أ
    (arabic-iso8859-6	. #xC3)	; أ
    ))
(define-char
  '((name		. "ARABIC LETTER WAW WITH HAMZA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "ARABIC LETTER WAW")
      (=ucs		  . #x0648)	; و
      )
     ((name		  . "ARABIC HAMZA ABOVE")
      (=ucs		  . #x0654)	; ٔ
      ))
    (=ucs		. #x0624)	; ؤ
    (arabic-iso8859-6	. #xC4)	; ؤ
    ))
(define-char
  '((name		. "ARABIC LETTER ALEF WITH HAMZA BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "ARABIC LETTER ALEF")
      (=ucs		  . #x0627)	; ا
      )
     ((name		  . "ARABIC HAMZA BELOW")
      (=ucs		  . #x0655)	; ٕ
      ))
    (=ucs		. #x0625)	; إ
    (arabic-iso8859-6	. #xC5)	; إ
    ))
(define-char
  '((name		. "ARABIC LETTER YEH WITH HAMZA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "ARABIC LETTER YEH")
      (=ucs		  . #x064A)	; ي
      )
     ((name		  . "ARABIC HAMZA ABOVE")
      (=ucs		  . #x0654)	; ٔ
      ))
    (=ucs		. #x0626)	; ئ
    (arabic-iso8859-6	. #xC6)	; ئ
    ))
(define-char
  '((name		. "ARABIC LETTER ALEF")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0627)	; ا
    (arabic-iso8859-6	. #xC7)	; ا
    ))
(define-char
  '((name		. "ARABIC LETTER BEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0628)	; ب
    (arabic-iso8859-6	. #xC8)	; ب
    ))
(define-char
  '((name		. "ARABIC LETTER TEH MARBUTA")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0629)	; ة
    (arabic-iso8859-6	. #xC9)	; ة
    ))
(define-char
  '((name		. "ARABIC LETTER TEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x062A)	; ت
    (arabic-iso8859-6	. #xCA)	; ت
    ))
(define-char
  '((name		. "ARABIC LETTER THEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x062B)	; ث
    (arabic-iso8859-6	. #xCB)	; ث
    ))
(define-char
  '((name		. "ARABIC LETTER JEEM")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x062C)	; ج
    (arabic-iso8859-6	. #xCC)	; ج
    ))
(define-char
  '((name		. "ARABIC LETTER HAH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x062D)	; ح
    (arabic-iso8859-6	. #xCD)	; ح
    ))
(define-char
  '((name		. "ARABIC LETTER KHAH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x062E)	; خ
    (arabic-iso8859-6	. #xCE)	; خ
    ))
(define-char
  '((name		. "ARABIC LETTER DAL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x062F)	; د
    (arabic-iso8859-6	. #xCF)	; د
    ))
(define-char
  '((name		. "ARABIC LETTER THAL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0630)	; ذ
    (arabic-iso8859-6	. #xD0)	; ذ
    ))
(define-char
  '((name		. "ARABIC LETTER REH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0631)	; ر
    (arabic-iso8859-6	. #xD1)	; ر
    ))
(define-char
  '((name		. "ARABIC LETTER ZAIN")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0632)	; ز
    (arabic-iso8859-6	. #xD2)	; ز
    ))
(define-char
  '((name		. "ARABIC LETTER SEEN")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0633)	; س
    (arabic-iso8859-6	. #xD3)	; س
    ))
(define-char
  '((name		. "ARABIC LETTER SHEEN")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0634)	; ش
    (arabic-iso8859-6	. #xD4)	; ش
    ))
(define-char
  '((name		. "ARABIC LETTER SAD")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0635)	; ص
    (arabic-iso8859-6	. #xD5)	; ص
    ))
(define-char
  '((name		. "ARABIC LETTER DAD")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0636)	; ض
    (arabic-iso8859-6	. #xD6)	; ض
    ))
(define-char
  '((name		. "ARABIC LETTER TAH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0637)	; ط
    (arabic-iso8859-6	. #xD7)	; ط
    ))
(define-char
  '((name		. "ARABIC LETTER ZAH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0638)	; ظ
    (arabic-iso8859-6	. #xD8)	; ظ
    ))
(define-char
  '((name		. "ARABIC LETTER AIN")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0639)	; ع
    (arabic-iso8859-6	. #xD9)	; ع
    ))
(define-char
  '((name		. "ARABIC LETTER GHAIN")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x063A)	; غ
    (arabic-iso8859-6	. #xDA)	; غ
    ))
(define-char
  '((name		. "ARABIC TATWEEL")
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0640)	; ـ
    (arabic-iso8859-6	. #xE0)	; ـ
    ))
(define-char
  '((name		. "ARABIC LETTER FEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0641)	; ف
    (arabic-iso8859-6	. #xE1)	; ف
    ))
(define-char
  '((name		. "ARABIC LETTER QAF")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0642)	; ق
    (arabic-iso8859-6	. #xE2)	; ق
    ))
(define-char
  '((name		. "ARABIC LETTER KAF")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0643)	; ك
    (arabic-iso8859-6	. #xE3)	; ك
    ))
(define-char
  '((name		. "ARABIC LETTER LAM")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0644)	; ل
    (arabic-iso8859-6	. #xE4)	; ل
    ))
(define-char
  '((name		. "ARABIC LETTER MEEM")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0645)	; م
    (arabic-iso8859-6	. #xE5)	; م
    ))
(define-char
  '((name		. "ARABIC LETTER NOON")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0646)	; ن
    (arabic-iso8859-6	. #xE6)	; ن
    ))
(define-char
  '((name		. "ARABIC LETTER HEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0647)	; ه
    (arabic-iso8859-6	. #xE7)	; ه
    ))
(define-char
  '((name		. "ARABIC LETTER WAW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0648)	; و
    (arabic-iso8859-6	. #xE8)	; و
    ))
(define-char
  '((name		. "ARABIC LETTER ALEF MAKSURA")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0649)	; ى
    (arabic-iso8859-6	. #xE9)	; ى
    ))
(define-char
  '((name		. "ARABIC LETTER YEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x064A)	; ي
    (arabic-iso8859-6	. #xEA)	; ي
    ))
(define-char
  '((name		. "ARABIC FATHATAN")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x064B)	; ً
    (arabic-iso8859-6	. #xEB)	; ً
    ))
(define-char
  '((name		. "ARABIC DAMMATAN")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x064C)	; ٌ
    (arabic-iso8859-6	. #xEC)	; ٌ
    ))
(define-char
  '((name		. "ARABIC KASRATAN")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x064D)	; ٍ
    (arabic-iso8859-6	. #xED)	; ٍ
    ))
(define-char
  '((name		. "ARABIC FATHA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x064E)	; َ
    (arabic-iso8859-6	. #xEE)	; َ
    ))
(define-char
  '((name		. "ARABIC DAMMA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x064F)	; ُ
    (arabic-iso8859-6	. #xEF)	; ُ
    ))
(define-char
  '((name		. "ARABIC KASRA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0650)	; ِ
    (arabic-iso8859-6	. #xF0)	; ِ
    ))
(define-char
  '((name		. "ARABIC SHADDA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0651)	; ّ
    (arabic-iso8859-6	. #xF1)	; ّ
    ))
(define-char
  '((name		. "ARABIC SUKUN")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0652)	; ْ
    (arabic-iso8859-6	. #xF2)	; ْ
    ))
(define-char
  '((name		. "ARABIC MADDAH ABOVE")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0653)	; ٓ
    ))
(define-char
  '((name		. "ARABIC HAMZA ABOVE")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0654)	; ٔ
    ))
(define-char
  '((name		. "ARABIC HAMZA BELOW")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0655)	; ٕ
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT ZERO")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 0)
    (digit-value	 . 0)
    (numeric-value	 . 0)
    (=ucs		. #x0660)	; ٠
    (arabic-digit	. #x21)	; &I-MULE-ARBD-21;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT ONE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (=ucs		. #x0661)	; ١
    (arabic-digit	. #x22)	; &I-MULE-ARBD-22;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT TWO")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (=ucs		. #x0662)	; ٢
    (arabic-digit	. #x23)	; &I-MULE-ARBD-23;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT THREE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (=ucs		. #x0663)	; ٣
    (arabic-digit	. #x24)	; &I-MULE-ARBD-24;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT FOUR")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 4)
    (digit-value	 . 4)
    (numeric-value	 . 4)
    (=ucs		. #x0664)	; ٤
    (arabic-digit	. #x25)	; &I-MULE-ARBD-25;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT FIVE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 5)
    (digit-value	 . 5)
    (numeric-value	 . 5)
    (=ucs		. #x0665)	; ٥
    (arabic-digit	. #x26)	; &I-MULE-ARBD-26;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT SIX")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 6)
    (digit-value	 . 6)
    (numeric-value	 . 6)
    (=ucs		. #x0666)	; ٦
    (arabic-digit	. #x27)	; &I-MULE-ARBD-27;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT SEVEN")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 7)
    (digit-value	 . 7)
    (numeric-value	 . 7)
    (=ucs		. #x0667)	; ٧
    (arabic-digit	. #x28)	; &I-MULE-ARBD-28;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT EIGHT")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 8)
    (digit-value	 . 8)
    (numeric-value	 . 8)
    (=ucs		. #x0668)	; ٨
    (arabic-digit	. #x29)	; &I-MULE-ARBD-29;
    ))
(define-char
  '((name		. "ARABIC-INDIC DIGIT NINE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (decimal-digit-value . 9)
    (digit-value	 . 9)
    (numeric-value	 . 9)
    (=ucs		. #x0669)	; ٩
    (arabic-digit	. #x2A)	; &I-MULE-ARBD-2A;
    ))
(define-char
  '((name		. "ARABIC PERCENT SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x066A)	; ٪
    ))
(define-char
  '((name		. "ARABIC DECIMAL SEPARATOR")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (=ucs		. #x066B)	; ٫
    ))
(define-char
  '((name		. "ARABIC THOUSANDS SEPARATOR")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "AN")
    (mirrored		. nil)
    (=ucs		. #x066C)	; ٬
    ))
(define-char
  '((name		. "ARABIC FIVE POINTED STAR")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x066D)	; ٭
    ))
(define-char
  '((name		. "ARABIC LETTER SUPERSCRIPT ALEF")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0670)	; ٰ
    ))
(define-char
  '((name		. "ARABIC LETTER ALEF WASLA")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0671)	; ٱ
    ))
(define-char
  '((name		. "ARABIC LETTER ALEF WITH WAVY HAMZA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0672)	; ٲ
    ))
(define-char
  '((name		. "ARABIC LETTER ALEF WITH WAVY HAMZA BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0673)	; ٳ
    ))
(define-char
  '((name		. "ARABIC LETTER HIGH HAMZA")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0674)	; ٴ
    ))
(define-char
  '((name		. "ARABIC LETTER HIGH HAMZA ALEF")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "ARABIC LETTER ALEF")
      (=ucs		  . #x0627)	; ا
      )
     ((name		  . "ARABIC LETTER HIGH HAMZA")
      (=ucs		  . #x0674)	; ٴ
      ))
    (=ucs		. #x0675)	; ٵ
    ))
(define-char
  '((name		. "ARABIC LETTER HIGH HAMZA WAW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "ARABIC LETTER WAW")
      (=ucs		  . #x0648)	; و
      )
     ((name		  . "ARABIC LETTER HIGH HAMZA")
      (=ucs		  . #x0674)	; ٴ
      ))
    (=ucs		. #x0676)	; ٶ
    ))
(define-char
  '((name		. "ARABIC LETTER U WITH HAMZA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "ARABIC LETTER U")
      (=ucs		  . #x06C7)	; ۇ
      )
     ((name		  . "ARABIC LETTER HIGH HAMZA")
      (=ucs		  . #x0674)	; ٴ
      ))
    (=ucs		. #x0677)	; ٷ
    ))
(define-char
  '((name		. "ARABIC LETTER HIGH HAMZA YEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "ARABIC LETTER YEH")
      (=ucs		  . #x064A)	; ي
      )
     ((name		  . "ARABIC LETTER HIGH HAMZA")
      (=ucs		  . #x0674)	; ٴ
      ))
    (=ucs		. #x0678)	; ٸ
    ))
(define-char
  '((name		. "ARABIC LETTER TTEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0679)	; ٹ
    ))
(define-char
  '((name		. "ARABIC LETTER TTEHEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x067A)	; ٺ
    ))
(define-char
  '((name		. "ARABIC LETTER BEEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x067B)	; ٻ
    ))
(define-char
  '((name		. "ARABIC LETTER TEH WITH RING")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x067C)	; ټ
    ))
(define-char
  '((name . "ARABIC LETTER TEH WITH THREE DOTS ABOVE DOWNWARDS")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x067D)	; ٽ
    ))
(define-char
  '((name		. "ARABIC LETTER PEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x067E)	; پ
    ))
(define-char
  '((name		. "ARABIC LETTER TEHEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x067F)	; ٿ
    ))
(define-char
  '((name		. "ARABIC LETTER BEHEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0680)	; ڀ
    ))
(define-char
  '((name		. "ARABIC LETTER HAH WITH HAMZA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0681)	; ځ
    ))
(define-char
  '((name . "ARABIC LETTER HAH WITH TWO DOTS VERTICAL ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0682)	; ڂ
    ))
(define-char
  '((name		. "ARABIC LETTER NYEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0683)	; ڃ
    ))
(define-char
  '((name		. "ARABIC LETTER DYEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0684)	; ڄ
    ))
(define-char
  '((name		. "ARABIC LETTER HAH WITH THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0685)	; څ
    ))
(define-char
  '((name		. "ARABIC LETTER TCHEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0686)	; چ
    ))
(define-char
  '((name		. "ARABIC LETTER TCHEHEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0687)	; ڇ
    ))
(define-char
  '((name		. "ARABIC LETTER DDAL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0688)	; ڈ
    ))
(define-char
  '((name		. "ARABIC LETTER DAL WITH RING")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0689)	; ډ
    ))
(define-char
  '((name		. "ARABIC LETTER DAL WITH DOT BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x068A)	; ڊ
    ))
(define-char
  '((name . "ARABIC LETTER DAL WITH DOT BELOW AND SMALL TAH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x068B)	; ڋ
    ))
(define-char
  '((name		. "ARABIC LETTER DAHAL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x068C)	; ڌ
    ))
(define-char
  '((name		. "ARABIC LETTER DDAHAL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x068D)	; ڍ
    ))
(define-char
  '((name		. "ARABIC LETTER DUL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x068E)	; ڎ
    ))
(define-char
  '((name . "ARABIC LETTER DAL WITH THREE DOTS ABOVE DOWNWARDS")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x068F)	; ڏ
    ))
(define-char
  '((name		. "ARABIC LETTER DAL WITH FOUR DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0690)	; ڐ
    ))
(define-char
  '((name		. "ARABIC LETTER RREH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0691)	; ڑ
    ))
(define-char
  '((name		. "ARABIC LETTER REH WITH SMALL V")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0692)	; ڒ
    ))
(define-char
  '((name		. "ARABIC LETTER REH WITH RING")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0693)	; ړ
    ))
(define-char
  '((name		. "ARABIC LETTER REH WITH DOT BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0694)	; ڔ
    ))
(define-char
  '((name		. "ARABIC LETTER REH WITH SMALL V BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0695)	; ڕ
    ))
(define-char
  '((name . "ARABIC LETTER REH WITH DOT BELOW AND DOT ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0696)	; ږ
    ))
(define-char
  '((name		. "ARABIC LETTER REH WITH TWO DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0697)	; ڗ
    ))
(define-char
  '((name		. "ARABIC LETTER JEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0698)	; ژ
    ))
(define-char
  '((name		. "ARABIC LETTER REH WITH FOUR DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x0699)	; ڙ
    ))
(define-char
  '((name . "ARABIC LETTER SEEN WITH DOT BELOW AND DOT ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x069A)	; ښ
    ))
(define-char
  '((name		. "ARABIC LETTER SEEN WITH THREE DOTS BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x069B)	; ڛ
    ))
(define-char
  '((name . "ARABIC LETTER SEEN WITH THREE DOTS BELOW AND THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x069C)	; ڜ
    ))
(define-char
  '((name		. "ARABIC LETTER SAD WITH TWO DOTS BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x069D)	; ڝ
    ))
(define-char
  '((name		. "ARABIC LETTER SAD WITH THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x069E)	; ڞ
    ))
(define-char
  '((name		. "ARABIC LETTER TAH WITH THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x069F)	; ڟ
    ))
(define-char
  '((name		. "ARABIC LETTER AIN WITH THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A0)	; ڠ
    ))
(define-char
  '((name		. "ARABIC LETTER DOTLESS FEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A1)	; ڡ
    ))
(define-char
  '((name		. "ARABIC LETTER FEH WITH DOT MOVED BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A2)	; ڢ
    ))
(define-char
  '((name		. "ARABIC LETTER FEH WITH DOT BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A3)	; ڣ
    ))
(define-char
  '((name		. "ARABIC LETTER VEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A4)	; ڤ
    ))
(define-char
  '((name		. "ARABIC LETTER FEH WITH THREE DOTS BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A5)	; ڥ
    ))
(define-char
  '((name		. "ARABIC LETTER PEHEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A6)	; ڦ
    ))
(define-char
  '((name		. "ARABIC LETTER QAF WITH DOT ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A7)	; ڧ
    ))
(define-char
  '((name		. "ARABIC LETTER QAF WITH THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A8)	; ڨ
    ))
(define-char
  '((name		. "ARABIC LETTER KEHEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06A9)	; ک
    ))
(define-char
  '((name		. "ARABIC LETTER SWASH KAF")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06AA)	; ڪ
    ))
(define-char
  '((name		. "ARABIC LETTER KAF WITH RING")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06AB)	; ګ
    ))
(define-char
  '((name		. "ARABIC LETTER KAF WITH DOT ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06AC)	; ڬ
    ))
(define-char
  '((name		. "ARABIC LETTER NG")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06AD)	; ڭ
    ))
(define-char
  '((name		. "ARABIC LETTER KAF WITH THREE DOTS BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06AE)	; ڮ
    ))
(define-char
  '((name		. "ARABIC LETTER GAF")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06AF)	; گ
    ))
(define-char
  '((name		. "ARABIC LETTER GAF WITH RING")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B0)	; ڰ
    ))
(define-char
  '((name		. "ARABIC LETTER NGOEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B1)	; ڱ
    ))
(define-char
  '((name		. "ARABIC LETTER GAF WITH TWO DOTS BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B2)	; ڲ
    ))
(define-char
  '((name		. "ARABIC LETTER GUEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B3)	; ڳ
    ))
(define-char
  '((name		. "ARABIC LETTER GAF WITH THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B4)	; ڴ
    ))
(define-char
  '((name		. "ARABIC LETTER LAM WITH SMALL V")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B5)	; ڵ
    ))
(define-char
  '((name		. "ARABIC LETTER LAM WITH DOT ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B6)	; ڶ
    ))
(define-char
  '((name		. "ARABIC LETTER LAM WITH THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B7)	; ڷ
    ))
(define-char
  '((name		. "ARABIC LETTER LAM WITH THREE DOTS BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B8)	; ڸ
    ))
(define-char
  '((name		. "ARABIC LETTER NOON WITH DOT BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06B9)	; ڹ
    ))
(define-char
  '((name		. "ARABIC LETTER NOON GHUNNA")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06BA)	; ں
    ))
(define-char
  '((name		. "ARABIC LETTER RNOON")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06BB)	; ڻ
    ))
(define-char
  '((name		. "ARABIC LETTER NOON WITH RING")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06BC)	; ڼ
    ))
(define-char
  '((name		. "ARABIC LETTER NOON WITH THREE DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06BD)	; ڽ
    ))
(define-char
  '((name		. "ARABIC LETTER HEH DOACHASHMEE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06BE)	; ھ
    ))
(define-char
  '((name		. "ARABIC LETTER TCHEH WITH DOT ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06BF)	; ڿ
    ))
(define-char
  '((name		. "ARABIC LETTER HEH WITH YEH ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "ARABIC LETTER AE")
      (=ucs		  . #x06D5)	; ە
      )
     ((name		  . "ARABIC HAMZA ABOVE")
      (=ucs		  . #x0654)	; ٔ
      ))
    (=ucs		. #x06C0)	; ۀ
    ))
(define-char
  '((name		. "ARABIC LETTER HEH GOAL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06C1)	; ہ
    ))
(define-char
  '((name		. "ARABIC LETTER HEH GOAL WITH HAMZA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "ARABIC LETTER HEH GOAL")
      (=ucs		  . #x06C1)	; ہ
      )
     ((name		  . "ARABIC HAMZA ABOVE")
      (=ucs		  . #x0654)	; ٔ
      ))
    (=ucs		. #x06C2)	; ۂ
    ))
(define-char
  '((name		. "ARABIC LETTER TEH MARBUTA GOAL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06C3)	; ۃ
    ))
(define-char
  '((name		. "ARABIC LETTER WAW WITH RING")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06C4)	; ۄ
    ))
(define-char
  '((name		. "ARABIC LETTER KIRGHIZ OE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06C5)	; ۅ
    ))
(define-char
  '((name		. "ARABIC LETTER OE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06C6)	; ۆ
    ))
(define-char
  '((name		. "ARABIC LETTER U")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06C7)	; ۇ
    ))
(define-char
  '((name		. "ARABIC LETTER YU")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06C8)	; ۈ
    ))
(define-char
  '((name		. "ARABIC LETTER KIRGHIZ YU")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06C9)	; ۉ
    ))
(define-char
  '((name		. "ARABIC LETTER WAW WITH TWO DOTS ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06CA)	; ۊ
    ))
(define-char
  '((name		. "ARABIC LETTER VE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06CB)	; ۋ
    ))
(define-char
  '((name		. "ARABIC LETTER FARSI YEH")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06CC)	; ی
    ))
(define-char
  '((name		. "ARABIC LETTER YEH WITH TAIL")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06CD)	; ۍ
    ))
(define-char
  '((name		. "ARABIC LETTER YEH WITH SMALL V")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06CE)	; ێ
    ))
(define-char
  '((name		. "ARABIC LETTER WAW WITH DOT ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06CF)	; ۏ
    ))
(define-char
  '((name		. "ARABIC LETTER E")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (iso-10646-comment	. "*")
    (=ucs		. #x06D0)	; ې
    ))
(define-char
  '((name		. "ARABIC LETTER YEH WITH THREE DOTS BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06D1)	; ۑ
    ))
(define-char
  '((name		. "ARABIC LETTER YEH BARREE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06D2)	; ے
    ))
(define-char
  '((name		. "ARABIC LETTER YEH BARREE WITH HAMZA ABOVE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "ARABIC LETTER YEH BARREE")
      (=ucs		  . #x06D2)	; ے
      )
     ((name		  . "ARABIC HAMZA ABOVE")
      (=ucs		  . #x0654)	; ٔ
      ))
    (=ucs		. #x06D3)	; ۓ
    ))
(define-char
  '((name		. "ARABIC FULL STOP")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06D4)	; ۔
    ))
(define-char
  '((name		. "ARABIC LETTER AE")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06D5)	; ە
    ))
(define-char
  '((name . "ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06D6)	; ۖ
    ))
(define-char
  '((name . "ARABIC SMALL HIGH LIGATURE QAF WITH LAM WITH ALEF MAKSURA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06D7)	; ۗ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH MEEM INITIAL FORM")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06D8)	; ۘ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH LAM ALEF")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06D9)	; ۙ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH JEEM")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06DA)	; ۚ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH THREE DOTS")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06DB)	; ۛ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH SEEN")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06DC)	; ۜ
    ))
(define-char
  '((name		. "ARABIC END OF AYAH")
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06DD)	; ۝
    ))
(define-char
  '((name		. "ARABIC START OF RUB EL HIZB")
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06DE)	; ۞
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH ROUNDED ZERO")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06DF)	; ۟
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH UPRIGHT RECTANGULAR ZERO")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06E0)	; ۠
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH DOTLESS HEAD OF KHAH")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06E1)	; ۡ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH MEEM ISOLATED FORM")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06E2)	; ۢ
    ))
(define-char
  '((name		. "ARABIC SMALL LOW SEEN")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06E3)	; ۣ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH MADDA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06E4)	; ۤ
    ))
(define-char
  '((name		. "ARABIC SMALL WAW")
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06E5)	; ۥ
    ))
(define-char
  '((name		. "ARABIC SMALL YEH")
    (general-category	letter modifier) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06E6)	; ۦ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH YEH")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06E7)	; ۧ
    ))
(define-char
  '((name		. "ARABIC SMALL HIGH NOON")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06E8)	; ۨ
    ))
(define-char
  '((name		. "ARABIC PLACE OF SAJDAH")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x06E9)	; ۩
    ))
(define-char
  '((name		. "ARABIC EMPTY CENTRE LOW STOP")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06EA)	; ۪
    ))
(define-char
  '((name		. "ARABIC EMPTY CENTRE HIGH STOP")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06EB)	; ۫
    ))
(define-char
  '((name		. "ARABIC ROUNDED HIGH STOP WITH FILLED CENTRE")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06EC)	; ۬
    ))
(define-char
  '((name		. "ARABIC SMALL LOW MEEM")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x06ED)	; ۭ
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT ZERO")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 0)
    (digit-value	 . 0)
    (numeric-value	 . 0)
    (=ucs		. #x06F0)	; ۰
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT ONE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (=ucs		. #x06F1)	; ۱
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT TWO")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (=ucs		. #x06F2)	; ۲
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT THREE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (=ucs		. #x06F3)	; ۳
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT FOUR")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 4)
    (digit-value	 . 4)
    (numeric-value	 . 4)
    (=ucs		. #x06F4)	; ۴
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT FIVE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 5)
    (digit-value	 . 5)
    (numeric-value	 . 5)
    (=ucs		. #x06F5)	; ۵
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT SIX")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 6)
    (digit-value	 . 6)
    (numeric-value	 . 6)
    (=ucs		. #x06F6)	; ۶
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT SEVEN")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 7)
    (digit-value	 . 7)
    (numeric-value	 . 7)
    (=ucs		. #x06F7)	; ۷
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT EIGHT")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 8)
    (digit-value	 . 8)
    (numeric-value	 . 8)
    (=ucs		. #x06F8)	; ۸
    ))
(define-char
  '((name		. "EXTENDED ARABIC-INDIC DIGIT NINE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 9)
    (digit-value	 . 9)
    (numeric-value	 . 9)
    (=ucs		. #x06F9)	; ۹
    ))
(define-char
  '((name		. "ARABIC LETTER SHEEN WITH DOT BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06FA)	; ۺ
    ))
(define-char
  '((name		. "ARABIC LETTER DAD WITH DOT BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06FB)	; ۻ
    ))
(define-char
  '((name		. "ARABIC LETTER GHAIN WITH DOT BELOW")
    (general-category	letter other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06FC)	; ۼ
    ))
(define-char
  '((name		. "ARABIC SIGN SINDHI AMPERSAND")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06FD)	; ۽
    ))
(define-char
  '((name		. "ARABIC SIGN SINDHI POSTPOSITION MEN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "AL")
    (mirrored		. nil)
    (=ucs		. #x06FE)	; ۾
    ))
