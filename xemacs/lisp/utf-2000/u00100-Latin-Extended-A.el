;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x0100)	; Ā
    (latin-iso8859-4	. #xC0)	; &I-LATIN4-40;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@jis/fw	. #x0100)	; Ａ̄
    (=jis-x0212		. #x2A27)	; Ａ̄ [10-07]
    (=jis-x0213-1	. #x2975)	; &I-JX1-2975; [09-85]
    (=jef-china3	. #x87A8)	; &I-JC3-87A8;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0101)	; ａ̄
      (=ucs@jis/fw	  . #x0101)	; ａ̄
      (=gb2312		  . #x2821)	; ａ̄ [08-01]
      (=jis-x0212	  . #x2B27)	; &I-JSP-2B27; [11-07]
      (=jis-x0213-1	  . #x297A)	; &I-JX1-297A; [09-90]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x0101)	; ā
    (latin-iso8859-4	. #xE0)	; &I-LATIN4-60;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH MACRON")
      (=ucs		  . #x0100)	; Ā
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@gb/fw		. #x0101)	; ａ̄
    (=ucs@jis/fw	. #x0101)	; ａ̄
    (=gb2312		. #x2821)	; ａ̄ [08-01]
    (=jis-x0212		. #x2B27)	; &I-JSP-2B27; [11-07]
    (=jis-x0213-1	. #x297A)	; &I-JX1-297A; [09-90]
    (=jef-china3	. #x87BC)	; &I-JC3-87BC;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0100)	; Ａ̄
      (=jis-x0212	  . #x2A27)	; Ａ̄ [10-07]
      (=jis-x0213-1	  . #x2975)	; &I-JX1-2975; [09-85]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x0102)	; Ă
    (latin-iso8859-2	. #xC3)	; &I-LATIN2-43;
    (latin-tcvn5712	. #xA1)	; &I-VSCII2-21;
    (latin-viscii	. #xC5)	; &I-MULE-VIET-U-65;
    (latin-viscii-upper . #xE5)	; &I-MULE-VIET-U-65;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs@jis/fw	. #x0102)	; Ａ̆
    (=jis-x0212		. #x2A25)	; Ａ̆ [10-05]
    (=jis-x0213-1	. #x2A3A)	; &I-JX1-2A3A; [10-26]
    (=jef-china3	. #x87DE)	; &I-JC3-87DE;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0103)	; ａ̆
      (=jis-x0212	  . #x2B25)	; ａ̆ [11-05]
      (=jis-x0213-1	  . #x2A49)	; &I-JX1-2A49; [10-41]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x0103)	; ă
    (latin-iso8859-2	. #xE3)	; &I-LATIN2-63;
    (latin-tcvn5712	. #xA8)	; &I-VSCII2-28;
    (latin-viscii	. #xE5)	; &I-MULE-VIET-L-65;
    (latin-viscii-lower . #xE5)	; &I-MULE-VIET-L-65;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x0102)	; Ă
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs@jis/fw	. #x0103)	; ａ̆
    (=jis-x0212		. #x2B25)	; ａ̆ [11-05]
    (=jis-x0213-1	. #x2A49)	; &I-JX1-2A49; [10-41]
    (=jef-china3	. #x87E8)	; &I-JC3-87E8;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH BREVE")
      (=ucs		  . #x0103)	; ă
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0102)	; Ａ̆
      (=jis-x0212	  . #x2A25)	; Ａ̆ [10-05]
      (=jis-x0213-1	  . #x2A3A)	; &I-JX1-2A3A; [10-26]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs		. #x0104)	; Ą
    (latin-iso8859-2	. #xA1)	; &I-LATIN2-21;
    (latin-iso8859-4	. #xA1)	; &I-LATIN4-21;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs@jis/fw	. #x0104)	; Ａ̨
    (=jis-x0212		. #x2A28)	; Ａ̨ [10-08]
    (=jis-x0213-1	. #x2A21)	; &I-JX1-2A21; [10-01]
    (=jef-china3	. #x8AA3)	; &I-JC3-8AA3;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0105)	; ａ̨
      (=jis-x0212	  . #x2B28)	; ａ̨ [11-08]
      (=jis-x0213-1	  . #x2A2C)	; &I-JX1-2A2C; [10-12]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs		. #x0105)	; ą
    (latin-iso8859-2	. #xB1)	; &I-LATIN2-31;
    (latin-iso8859-4	. #xB1)	; &I-LATIN4-31;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A WITH OGONEK")
      (=ucs		  . #x0104)	; Ą
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs@jis/fw	. #x0105)	; ａ̨
    (=jis-x0212		. #x2B28)	; ａ̨ [11-08]
    (=jis-x0213-1	. #x2A2C)	; &I-JX1-2A2C; [10-12]
    (=jef-china3	. #x8AAB)	; &I-JC3-8AAB;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER A WITH OGONEK")
      (=ucs		  . #x0105)	; ą
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0104)	; Ａ̨
      (=jis-x0212	  . #x2A28)	; Ａ̨ [10-08]
      (=jis-x0213-1	  . #x2A21)	; &I-JX1-2A21; [10-01]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0106)	; Ć
    (latin-iso8859-2	. #xC6)	; &I-LATIN2-46;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (=ucs		  . #xFF23)	; Ｃ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0106)	; Ｃ́
    (=jis-x0212		. #x2A2B)	; Ｃ́ [10-11]
    (=jis-x0213-1	. #x2A3C)	; &I-JX1-2A3C; [10-28]
    (=jef-china3	. #x85D6)	; &I-JC3-85D6;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0107)	; ｃ́
      (=jis-x0212	  . #x2B2B)	; ｃ́ [11-11]
      (=jis-x0213-1	  . #x2A4B)	; &I-JX1-2A4B; [10-43]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0107)	; ć
    (latin-iso8859-2	. #xE6)	; &I-LATIN2-66;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH ACUTE")
      (=ucs		  . #x0106)	; Ć
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER C")
      (=ucs		  . #xFF43)	; ｃ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0107)	; ｃ́
    (=jis-x0212		. #x2B2B)	; ｃ́ [11-11]
    (=jis-x0213-1	. #x2A4B)	; &I-JX1-2A4B; [10-43]
    (=jef-china3	. #x85EC)	; &I-JC3-85EC;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH ACUTE")
      (=ucs		  . #x0107)	; ć
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0106)	; Ｃ́
      (=jis-x0212	  . #x2A2B)	; Ｃ́ [10-11]
      (=jis-x0213-1	  . #x2A3C)	; &I-JX1-2A3C; [10-28]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0108)	; Ĉ
    (latin-iso8859-3	. #xC6)	; &I-LATIN3-46;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (=ucs		  . #xFF23)	; Ｃ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0108)	; Ｃ̂
    (=jis-x0212		. #x2A2C)	; Ｃ̂ [10-12]
    (=jis-x0213-1	. #x2A59)	; &I-JX1-2A59; [10-57]
    (=jef-china3	. #x86B8)	; &I-JC3-86B8;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0109)	; ｃ̂
      (=jis-x0212	  . #x2B2C)	; ｃ̂ [11-12]
      (=jis-x0213-1	  . #x2A5F)	; &I-JX1-2A5F; [10-63]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0109)	; ĉ
    (latin-iso8859-3	. #xE6)	; &I-LATIN3-66;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0108)	; Ĉ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER C")
      (=ucs		  . #xFF43)	; ｃ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0109)	; ｃ̂
    (=jis-x0212		. #x2B2C)	; ｃ̂ [11-12]
    (=jis-x0213-1	. #x2A5F)	; &I-JX1-2A5F; [10-63]
    (=jef-china3	. #x86C5)	; &I-JC3-86C5;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CIRCUMFLEX")
      (=ucs		  . #x0109)	; ĉ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0108)	; Ｃ̂
      (=jis-x0212	  . #x2A2C)	; Ｃ̂ [10-12]
      (=jis-x0213-1	  . #x2A59)	; &I-JX1-2A59; [10-57]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x010A)	; Ċ
    (latin-iso8859-3	. #xC5)	; &I-LATIN3-45;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (=ucs		  . #xFF23)	; Ｃ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x010A)	; Ｃ̇
    (=jis-x0212		. #x2A2F)	; Ｃ̇ [10-15]
    (=jef-china3	. #x87FA)	; &I-JC3-87FA;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x010B)	; ｃ̇
      (=jis-x0212	  . #x2B2F)	; ｃ̇ [11-15]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x010B)	; ċ
    (latin-iso8859-3	. #xE5)	; &I-LATIN3-65;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010A)	; Ċ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER C")
      (=ucs		  . #xFF43)	; ｃ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x010B)	; ｃ̇
    (=jis-x0212		. #x2B2F)	; ｃ̇ [11-15]
    (=jef-china3	. #x88B2)	; &I-JC3-88B2;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH DOT ABOVE")
      (=ucs		  . #x010B)	; ċ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x010A)	; Ｃ̇
      (=jis-x0212	  . #x2A2F)	; Ｃ̇ [10-15]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x010C)	; Č
    (latin-iso8859-2	. #xC8)	; &I-LATIN2-48;
    (latin-iso8859-4	. #xC8)	; &I-LATIN4-48;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (=ucs		  . #xFF23)	; Ｃ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x010C)	; Ｃ̌
    (=jis-x0212		. #x2A2D)	; Ｃ̌ [10-13]
    (=jis-x0213-1	. #x2A3D)	; &I-JX1-2A3D; [10-29]
    (=jef-china3	. #x88E0)	; &I-JC3-88E0;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x010D)	; ｃ̌
      (=jis-x0212	  . #x2B2D)	; ｃ̌ [11-13]
      (=jis-x0213-1	  . #x2A4C)	; &I-JX1-2A4C; [10-44]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x010D)	; č
    (latin-iso8859-2	. #xE8)	; &I-LATIN2-68;
    (latin-iso8859-4	. #xE8)	; &I-LATIN4-68;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C WITH CARON")
      (=ucs		  . #x010C)	; Č
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER C")
      (=ucs		  . #xFF43)	; ｃ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x010D)	; ｃ̌
    (=jis-x0212		. #x2B2D)	; ｃ̌ [11-13]
    (=jis-x0213-1	. #x2A4C)	; &I-JX1-2A4C; [10-44]
    (=jef-china3	. #x88EF)	; &I-JC3-88EF;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER C WITH CARON")
      (=ucs		  . #x010D)	; č
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x010C)	; Ｃ̌
      (=jis-x0212	  . #x2A2D)	; Ｃ̌ [10-13]
      (=jis-x0213-1	  . #x2A3D)	; &I-JX1-2A3D; [10-29]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER D")
      (=ucs		  . #x0044)	; D
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x010E)	; Ď
    (latin-iso8859-2	. #xCF)	; &I-LATIN2-4F;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER D")
      (=ucs		  . #xFF24)	; Ｄ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x010E)	; Ｄ̌
    (=jis-x0212		. #x2A30)	; Ｄ̌ [10-16]
    (=jis-x0213-1	. #x2A40)	; &I-JX1-2A40; [10-32]
    (=jef-china3	. #x88E1)	; &I-JC3-88E1;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x010F)	; ｄ̌
      (=jis-x0212	  . #x2B30)	; ｄ̌ [11-16]
      (=jis-x0213-1	  . #x2A4F)	; &I-JX1-2A4F; [10-47]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER D")
      (=ucs		  . #x0064)	; d
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x010F)	; ď
    (latin-iso8859-2	. #xEF)	; &I-LATIN2-6F;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH CARON")
      (=ucs		  . #x010E)	; Ď
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER D")
      (=ucs		  . #xFF44)	; ｄ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x010F)	; ｄ̌
    (=jis-x0212		. #x2B30)	; ｄ̌ [11-16]
    (=jis-x0213-1	. #x2A4F)	; &I-JX1-2A4F; [10-47]
    (=jef-china3	. #x88F0)	; &I-JC3-88F0;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER D WITH CARON")
      (=ucs		  . #x010F)	; ď
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x010E)	; Ｄ̌
      (=jis-x0212	  . #x2A30)	; Ｄ̌ [10-16]
      (=jis-x0213-1	  . #x2A40)	; &I-JX1-2A40; [10-32]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0110)	; Đ
    (latin-iso8859-2	. #xD0)	; &I-LATIN2-50;
    (latin-iso8859-4	. #xD0)	; &I-LATIN4-50;
    (latin-tcvn5712	. #xA7)	; &I-VSCII2-27;
    (latin-viscii	. #xD0)	; &I-MULE-VIET-U-70;
    (latin-viscii-upper . #xF0)	; &I-MULE-VIET-U-70;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; đ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Đ
      ))
    (=ucs@jis/fw	. #x0110)	; &JSP-2922;
    (=jis-x0212		. #x2922)	; &JSP-2922; [09-02]
    (=jef-china3	. #x83A3)	; &I-JC3-83A3;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Đ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0111)	; &JX1-2A50;
      (=ks-x1001	  . #x2922)	; &JX1-2A50; [09-02]
      (=jis-x0212	  . #x2942)	; &I-JSP-2942; [09-34]
      (=jis-x0213-1	  . #x2A50)	; &I-JX1-2A50; [10-48]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0111)	; đ
    (latin-iso8859-2	. #xF0)	; &I-LATIN2-70;
    (latin-iso8859-4	. #xF0)	; &I-LATIN4-70;
    (latin-tcvn5712	. #xAE)	; &I-VSCII2-2E;
    (latin-viscii	. #xF0)	; &I-MULE-VIET-L-70;
    (latin-viscii-lower . #xF0)	; &I-MULE-VIET-L-70;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D WITH STROKE")
      (=ucs		  . #x0110)	; Đ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; đ
      ))
    (=ucs@jis/fw	. #x0111)	; &JX1-2A50;
    (=ks-x1001		. #x2922)	; &JX1-2A50; [09-02]
    (=jis-x0212		. #x2942)	; &I-JSP-2942; [09-34]
    (=jis-x0213-1	. #x2A50)	; &I-JX1-2A50; [10-48]
    (=jef-china3	. #x83AE)	; &I-JC3-83AE;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER D WITH STROKE")
      (=ucs		  . #x0111)	; đ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0110)	; &JSP-2922;
      (=jis-x0212	  . #x2922)	; &JSP-2922; [09-02]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x0112)	; Ē
    (latin-iso8859-4	. #xAA)	; &I-LATIN4-2A;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@jis/fw	. #x0112)	; Ｅ̄
    (=jis-x0212		. #x2A37)	; Ｅ̄ [10-23]
    (=jis-x0213-1	. #x2978)	; &I-JX1-2978; [09-88]
    (=jef-china3	. #x87AB)	; &I-JC3-87AB;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0113)	; ｅ̄
      (=ucs@jis/fw	  . #x0113)	; ｅ̄
      (=gb2312		  . #x2825)	; ｅ̄ [08-05]
      (=jis-x0212	  . #x2B37)	; &I-JSP-2B37; [11-23]
      (=jis-x0213-1	  . #x297D)	; &I-JX1-297D; [09-93]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x0113)	; ē
    (latin-iso8859-4	. #xBA)	; &I-LATIN4-3A;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH MACRON")
      (=ucs		  . #x0112)	; Ē
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@gb/fw		. #x0113)	; ｅ̄
    (=ucs@jis/fw	. #x0113)	; ｅ̄
    (=gb2312		. #x2825)	; ｅ̄ [08-05]
    (=jis-x0212		. #x2B37)	; &I-JSP-2B37; [11-23]
    (=jis-x0213-1	. #x297D)	; &I-JX1-297D; [09-93]
    (=jef-china3	. #x87BF)	; &I-JC3-87BF;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH MACRON")
      (=ucs		  . #x0113)	; ē
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0112)	; Ｅ̄
      (=jis-x0212	  . #x2A37)	; Ｅ̄ [10-23]
      (=jis-x0213-1	  . #x2978)	; &I-JX1-2978; [09-88]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x0114)	; Ĕ
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH BREVE")
      (=ucs		  . #x0115)	; ĕ
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x0115)	; ĕ
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH BREVE")
      (=ucs		  . #x0114)	; Ĕ
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x0116)	; Ė
    (latin-iso8859-4	. #xCC)	; &I-LATIN4-4C;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x0116)	; Ｅ̇
    (=jis-x0212		. #x2A36)	; Ｅ̇ [10-22]
    (=jef-china3	. #x87FC)	; &I-JC3-87FC;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0117)	; ｅ̇
      (=jis-x0212	  . #x2B36)	; ｅ̇ [11-22]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x0117)	; ė
    (latin-iso8859-4	. #xEC)	; &I-LATIN4-6C;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0116)	; Ė
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x0117)	; ｅ̇
    (=jis-x0212		. #x2B36)	; ｅ̇ [11-22]
    (=jef-china3	. #x88B4)	; &I-JC3-88B4;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH DOT ABOVE")
      (=ucs		  . #x0117)	; ė
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0116)	; Ｅ̇
      (=jis-x0212	  . #x2A36)	; Ｅ̇ [10-22]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs		. #x0118)	; Ę
    (latin-iso8859-2	. #xCA)	; &I-LATIN2-4A;
    (latin-iso8859-4	. #xCA)	; &I-LATIN4-4A;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs@jis/fw	. #x0118)	; Ｅ̨
    (=jis-x0212		. #x2A38)	; Ｅ̨ [10-24]
    (=jis-x0213-1	. #x2A3E)	; &I-JX1-2A3E; [10-30]
    (=jef-china3	. #x8AA4)	; &I-JC3-8AA4;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0119)	; ｅ̨
      (=jis-x0212	  . #x2B38)	; ｅ̨ [11-24]
      (=jis-x0213-1	  . #x2A4D)	; &I-JX1-2A4D; [10-45]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs		. #x0119)	; ę
    (latin-iso8859-2	. #xEA)	; &I-LATIN2-6A;
    (latin-iso8859-4	. #xEA)	; &I-LATIN4-6A;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH OGONEK")
      (=ucs		  . #x0118)	; Ę
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs@jis/fw	. #x0119)	; ｅ̨
    (=jis-x0212		. #x2B38)	; ｅ̨ [11-24]
    (=jis-x0213-1	. #x2A4D)	; &I-JX1-2A4D; [10-45]
    (=jef-china3	. #x8AAC)	; &I-JC3-8AAC;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH OGONEK")
      (=ucs		  . #x0119)	; ę
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0118)	; Ｅ̨
      (=jis-x0212	  . #x2A38)	; Ｅ̨ [10-24]
      (=jis-x0213-1	  . #x2A3E)	; &I-JX1-2A3E; [10-30]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x011A)	; Ě
    (latin-iso8859-2	. #xCC)	; &I-LATIN2-4C;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x011A)	; Ｅ̌
    (=jis-x0212		. #x2A35)	; Ｅ̌ [10-21]
    (=jis-x0213-1	. #x2A3F)	; &I-JX1-2A3F; [10-31]
    (=jef-china3	. #x88E2)	; &I-JC3-88E2;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x011B)	; ｅ̌
      (=ucs@jis/fw	  . #x011B)	; ｅ̌
      (=gb2312		  . #x2827)	; ｅ̌ [08-07]
      (=jis-x0212	  . #x2B35)	; &I-JSP-2B35; [11-21]
      (=jis-x0213-1	  . #x2A4E)	; &I-JX1-2A4E; [10-46]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x011B)	; ě
    (latin-iso8859-2	. #xEC)	; &I-LATIN2-6C;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E WITH CARON")
      (=ucs		  . #x011A)	; Ě
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@gb/fw		. #x011B)	; ｅ̌
    (=ucs@jis/fw	. #x011B)	; ｅ̌
    (=gb2312		. #x2827)	; ｅ̌ [08-07]
    (=jis-x0212		. #x2B35)	; &I-JSP-2B35; [11-21]
    (=jis-x0213-1	. #x2A4E)	; &I-JX1-2A4E; [10-46]
    (=jef-china3	. #x88F1)	; &I-JC3-88F1;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER E WITH CARON")
      (=ucs		  . #x011B)	; ě
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x011A)	; Ｅ̌
      (=jis-x0212	  . #x2A35)	; Ｅ̌ [10-21]
      (=jis-x0213-1	  . #x2A3F)	; &I-JX1-2A3F; [10-31]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER G")
      (=ucs		  . #x0047)	; G
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x011C)	; Ĝ
    (latin-iso8859-3	. #xD8)	; &I-LATIN3-58;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER G")
      (=ucs		  . #xFF27)	; Ｇ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x011C)	; Ｇ̂
    (=jis-x0212		. #x2A3A)	; Ｇ̂ [10-26]
    (=jis-x0213-1	. #x2A5A)	; &I-JX1-2A5A; [10-58]
    (=jef-china3	. #x86BA)	; &I-JC3-86BA;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x011D)	; ｇ̂
      (=jis-x0212	  . #x2B3A)	; ｇ̂ [11-26]
      (=jis-x0213-1	  . #x2A60)	; &I-JX1-2A60; [10-64]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER G")
      (=ucs		  . #x0067)	; g
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x011D)	; ĝ
    (latin-iso8859-3	. #xF8)	; &I-LATIN3-78;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011C)	; Ĝ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G")
      (=ucs		  . #xFF47)	; ｇ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x011D)	; ｇ̂
    (=jis-x0212		. #x2B3A)	; ｇ̂ [11-26]
    (=jis-x0213-1	. #x2A60)	; &I-JX1-2A60; [10-64]
    (=jef-china3	. #x86C7)	; &I-JC3-86C7;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH CIRCUMFLEX")
      (=ucs		  . #x011D)	; ĝ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x011C)	; Ｇ̂
      (=jis-x0212	  . #x2A3A)	; Ｇ̂ [10-26]
      (=jis-x0213-1	  . #x2A5A)	; &I-JX1-2A5A; [10-58]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER G")
      (=ucs		  . #x0047)	; G
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x011E)	; Ğ
    (latin-iso8859-3	. #xAB)	; &I-LATIN3-2B;
    (latin-iso8859-9	. #xD0)	; &I-LATIN5-50;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER G")
      (=ucs		  . #xFF27)	; Ｇ
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs@jis/fw	. #x011E)	; Ｇ̆
    (=jis-x0212		. #x2A3B)	; Ｇ̆ [10-27]
    (=jef-china3	. #x87E1)	; &I-JC3-87E1;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x011F)	; ｇ̆
      (=jis-x0212	  . #x2B3B)	; ｇ̆ [11-27]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER G")
      (=ucs		  . #x0067)	; g
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x011F)	; ğ
    (latin-iso8859-3	. #xBB)	; &I-LATIN3-3B;
    (latin-iso8859-9	. #xF0)	; &I-LATIN5-70;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH BREVE")
      (=ucs		  . #x011E)	; Ğ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G")
      (=ucs		  . #xFF47)	; ｇ
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs@jis/fw	. #x011F)	; ｇ̆
    (=jis-x0212		. #x2B3B)	; ｇ̆ [11-27]
    (=jef-china3	. #x87EB)	; &I-JC3-87EB;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH BREVE")
      (=ucs		  . #x011F)	; ğ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x011E)	; Ｇ̆
      (=jis-x0212	  . #x2A3B)	; Ｇ̆ [10-27]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER G")
      (=ucs		  . #x0047)	; G
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x0120)	; Ġ
    (latin-iso8859-3	. #xD5)	; &I-LATIN3-55;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER G")
      (=ucs		  . #xFF27)	; Ｇ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x0120)	; Ｇ̇
    (=jis-x0212		. #x2A3D)	; Ｇ̇ [10-29]
    (=jef-china3	. #x87FE)	; &I-JC3-87FE;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0121)	; ｇ̇
      (=jis-x0212	  . #x2B3D)	; ｇ̇ [11-29]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER G")
      (=ucs		  . #x0067)	; g
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x0121)	; ġ
    (latin-iso8859-3	. #xF5)	; &I-LATIN3-75;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0120)	; Ġ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G")
      (=ucs		  . #xFF47)	; ｇ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x0121)	; ｇ̇
    (=jis-x0212		. #x2B3D)	; ｇ̇ [11-29]
    (=jef-china3	. #x88B6)	; &I-JC3-88B6;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER G WITH DOT ABOVE")
      (=ucs		  . #x0121)	; ġ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0120)	; Ｇ̇
      (=jis-x0212	  . #x2A3D)	; Ｇ̇ [10-29]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER G")
      (=ucs		  . #x0047)	; G
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0122)	; Ģ
    (latin-iso8859-4	. #xAB)	; &I-LATIN4-2B;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G WITH CEDILLA")
      (=ucs		  . #x0123)	; ģ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ģ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER G")
      (=ucs		  . #xFF27)	; Ｇ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0122)	; Ｇ̧
    (=jis-x0212		. #x2A3C)	; Ｇ̧ [10-28]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ģ
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER G")
      (=ucs		  . #x0067)	; g
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0123)	; ģ
    (latin-iso8859-4	. #xBB)	; &I-LATIN4-3B;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G WITH CEDILLA")
      (=ucs		  . #x0122)	; Ģ
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER H")
      (=ucs		  . #x0048)	; H
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0124)	; Ĥ
    (latin-iso8859-3	. #xA6)	; &I-LATIN3-26;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER H")
      (=ucs		  . #xFF28)	; Ｈ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0124)	; Ｈ̂
    (=jis-x0212		. #x2A3E)	; Ｈ̂ [10-30]
    (=jis-x0213-1	. #x2A5B)	; &I-JX1-2A5B; [10-59]
    (=jef-china3	. #x86BB)	; &I-JC3-86BB;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0125)	; ｈ̂
      (=jis-x0212	  . #x2B3E)	; ｈ̂ [11-30]
      (=jis-x0213-1	  . #x2A61)	; &I-JX1-2A61; [10-65]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER H")
      (=ucs		  . #x0068)	; h
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0125)	; ĥ
    (latin-iso8859-3	. #xB6)	; &I-LATIN3-36;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0124)	; Ĥ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER H")
      (=ucs		  . #xFF48)	; ｈ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0125)	; ｈ̂
    (=jis-x0212		. #x2B3E)	; ｈ̂ [11-30]
    (=jis-x0213-1	. #x2A61)	; &I-JX1-2A61; [10-65]
    (=jef-china3	. #x86C8)	; &I-JC3-86C8;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER H WITH CIRCUMFLEX")
      (=ucs		  . #x0125)	; ĥ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0124)	; Ｈ̂
      (=jis-x0212	  . #x2A3E)	; Ｈ̂ [10-30]
      (=jis-x0213-1	  . #x2A5B)	; &I-JX1-2A5B; [10-59]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0126)	; Ħ
    (latin-iso8859-3	. #xA1)	; &I-LATIN3-21;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    (=ucs@jis/fw	. #x0126)	; &JSP-2924;
    (=ks-x1001		. #x2824)	; &JSP-2924; [08-04]
    (=jis-x0212		. #x2924)	; &I-JSP-2924; [09-04]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0127)	; &JX1-2A7D;
      (=ks-x1001	  . #x2924)	; &JX1-2A7D; [09-04]
      (=jis-x0212	  . #x2944)	; &I-JSP-2944; [09-36]
      (=jis-x0213-1	  . #x2A7D)	; &I-JX1-2A7D; [10-93]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0127)	; ħ
    (latin-iso8859-3	. #xB1)	; &I-LATIN3-31;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H WITH STROKE")
      (=ucs		  . #x0126)	; Ħ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (=ucs@jis/fw	. #x0127)	; &JX1-2A7D;
    (=ks-x1001		. #x2924)	; &JX1-2A7D; [09-04]
    (=jis-x0212		. #x2944)	; &I-JSP-2944; [09-36]
    (=jis-x0213-1	. #x2A7D)	; &I-JX1-2A7D; [10-93]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER H WITH STROKE")
      (=ucs		  . #x0127)	; ħ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0126)	; &JSP-2924;
      (=ks-x1001	  . #x2824)	; &JSP-2924; [08-04]
      (=jis-x0212	  . #x2924)	; &I-JSP-2924; [09-04]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x0128)	; Ĩ
    (latin-iso8859-4	. #xA5)	; &I-LATIN4-25;
    (latin-viscii	. #xCE)	; &I-MULE-VIET-U-6E;
    (latin-viscii-upper . #xEE)	; &I-MULE-VIET-U-6E;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x0128)	; Ｉ̃
    (=jis-x0212		. #x2A47)	; Ｉ̃ [10-39]
    (=jef-china3	. #x86E5)	; &I-JC3-86E5;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0129)	; ｉ̃
      (=jis-x0212	  . #x2B47)	; ｉ̃ [11-39]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x0129)	; ĩ
    (latin-iso8859-4	. #xB5)	; &I-LATIN4-35;
    (latin-tcvn5712	. #xDC)	; &I-VSCII2-5C;
    (latin-viscii	. #xEE)	; &I-MULE-VIET-L-6E;
    (latin-viscii-lower . #xEE)	; &I-MULE-VIET-L-6E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH TILDE")
      (=ucs		  . #x0128)	; Ĩ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x0129)	; ｉ̃
    (=jis-x0212		. #x2B47)	; ｉ̃ [11-39]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH TILDE")
      (=ucs		  . #x0129)	; ĩ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0128)	; Ｉ̃
      (=jis-x0212	  . #x2A47)	; Ｉ̃ [10-39]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x012A)	; Ī
    (latin-iso8859-4	. #xCF)	; &I-LATIN4-4F;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@jis/fw	. #x012A)	; Ｉ̄
    (=jis-x0212		. #x2A45)	; Ｉ̄ [10-37]
    (=jis-x0213-1	. #x2976)	; &I-JX1-2976; [09-86]
    (=jef-china3	. #x87AD)	; &I-JC3-87AD;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x012B)	; ｉ̄
      (=ucs@jis/fw	  . #x012B)	; ｉ̄
      (=gb2312		  . #x2829)	; ｉ̄ [08-09]
      (=jis-x0212	  . #x2B45)	; &I-JSP-2B45; [11-37]
      (=jis-x0213-1	  . #x297B)	; &I-JX1-297B; [09-91]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x012B)	; ī
    (latin-iso8859-4	. #xEF)	; &I-LATIN4-6F;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x012A)	; Ī
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@gb/fw		. #x012B)	; ｉ̄
    (=ucs@jis/fw	. #x012B)	; ｉ̄
    (=gb2312		. #x2829)	; ｉ̄ [08-09]
    (=jis-x0212		. #x2B45)	; &I-JSP-2B45; [11-37]
    (=jis-x0213-1	. #x297B)	; &I-JX1-297B; [09-91]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH MACRON")
      (=ucs		  . #x012B)	; ī
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x012A)	; Ｉ̄
      (=jis-x0212	  . #x2A45)	; Ｉ̄ [10-37]
      (=jis-x0213-1	  . #x2976)	; &I-JX1-2976; [09-86]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x012C)	; Ĭ
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH BREVE")
      (=ucs		  . #x012D)	; ĭ
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x012D)	; ĭ
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH BREVE")
      (=ucs		  . #x012C)	; Ĭ
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs		. #x012E)	; Į
    (latin-iso8859-4	. #xC7)	; &I-LATIN4-47;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs@jis/fw	. #x012E)	; Ｉ̨
    (=jis-x0212		. #x2A46)	; Ｉ̨ [10-38]
    (=jef-china3	. #x8AA6)	; &I-JC3-8AA6;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x012F)	; ｉ̨
      (=jis-x0212	  . #x2B46)	; ｉ̨ [11-38]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs		. #x012F)	; į
    (latin-iso8859-4	. #xE7)	; &I-LATIN4-67;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I WITH OGONEK")
      (=ucs		  . #x012E)	; Į
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs@jis/fw	. #x012F)	; ｉ̨
    (=jis-x0212		. #x2B46)	; ｉ̨ [11-38]
    (=jef-china3	. #x8AAE)	; &I-JC3-8AAE;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER I WITH OGONEK")
      (=ucs		  . #x012F)	; į
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x012E)	; Ｉ̨
      (=jis-x0212	  . #x2A46)	; Ｉ̨ [10-38]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x0130)	; İ
    (latin-iso8859-3	. #xA9)	; &I-LATIN3-29;
    (latin-iso8859-9	. #xDD)	; &I-LATIN5-5D;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER I WITH DOT ABOVE")
      (=ucs		  . #x0130)	; İ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x0130)	; Ｉ̇
    (=jis-x0212		. #x2A44)	; Ｉ̇ [10-36]
    (=jef-china3	. #x88A2)	; &I-JC3-88A2;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER I WITH DOT ABOVE")
      (=ucs		  . #x0130)	; İ
      ))
    (->lowercase
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER DOTLESS I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0131)	; ı
    (latin-iso8859-3	. #xB9)	; &I-LATIN3-39;
    (latin-iso8859-9	. #xFD)	; &I-LATIN5-7D;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER DOTLESS I")
      (=ucs		  . #x0131)	; ı
      ))
    (=ucs@jis/fw	. #x0131)	; &JSP-2945;
    (=ks-x1001		. #x2925)	; &JSP-2945; [09-05]
    (=jis-x0212		. #x2945)	; &I-JSP-2945; [09-37]
    (=jef-china3	. #x83B3)	; &I-JC3-83B3;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER DOTLESS I")
      (=ucs		  . #x0131)	; ı
      ))
    (->uppercase
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE IJ")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      )
     ((name		  . "LATIN CAPITAL LETTER J")
      (=ucs		  . #x004A)	; J
      ))
    (=ucs		. #x0132)	; Ĳ
    (->lowercase
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; ĳ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ĳ
      ))
    (=ucs@jis		. #x0132)	; &JSP-2926;
    (=ks-x1001		. #x2826)	; &JSP-2926; [08-06]
    (=jis-x0212		. #x2926)	; &I-JSP-2926; [09-06]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ĳ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0133)	; &JSP-2946;
      (=ks-x1001	  . #x2926)	; &JSP-2946; [09-06]
      (=jis-x0212	  . #x2946)	; &I-JSP-2946; [09-38]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE IJ")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      )
     ((name		  . "LATIN SMALL LETTER J")
      (=ucs		  . #x006A)	; j
      ))
    (=ucs		. #x0133)	; ĳ
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE IJ")
      (=ucs		  . #x0132)	; Ĳ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; ĳ
      ))
    (=ucs@jis/fw	. #x0133)	; &JSP-2946;
    (=ks-x1001		. #x2926)	; &JSP-2946; [09-06]
    (=jis-x0212		. #x2946)	; &I-JSP-2946; [09-38]
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE IJ")
      (=ucs		  . #x0133)	; ĳ
      ))
    (->uppercase
     ((=ucs@jis		  . #x0132)	; &JSP-2926;
      (=ks-x1001	  . #x2826)	; &JSP-2926; [08-06]
      (=jis-x0212	  . #x2926)	; &I-JSP-2926; [09-06]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER J")
      (=ucs		  . #x004A)	; J
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0134)	; Ĵ
    (latin-iso8859-3	. #xAC)	; &I-LATIN3-2C;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER J")
      (=ucs		  . #xFF2A)	; Ｊ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0134)	; Ｊ̂
    (=jis-x0212		. #x2A48)	; Ｊ̂ [10-40]
    (=jis-x0213-1	. #x2A5C)	; &I-JX1-2A5C; [10-60]
    (=jef-china3	. #x86BD)	; &I-JC3-86BD;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0135)	; ｊ̂
      (=jis-x0212	  . #x2B48)	; ｊ̂ [11-40]
      (=jis-x0213-1	  . #x2A62)	; &I-JX1-2A62; [10-66]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER J")
      (=ucs		  . #x006A)	; j
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0135)	; ĵ
    (latin-iso8859-3	. #xBC)	; &I-LATIN3-3C;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0134)	; Ĵ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER J")
      (=ucs		  . #xFF4A)	; ｊ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0135)	; ｊ̂
    (=jis-x0212		. #x2B48)	; ｊ̂ [11-40]
    (=jis-x0213-1	. #x2A62)	; &I-JX1-2A62; [10-66]
    (=jef-china3	. #x86CA)	; &I-JC3-86CA;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER J WITH CIRCUMFLEX")
      (=ucs		  . #x0135)	; ĵ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0134)	; Ｊ̂
      (=jis-x0212	  . #x2A48)	; Ｊ̂ [10-40]
      (=jis-x0213-1	  . #x2A5C)	; &I-JX1-2A5C; [10-60]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER K")
      (=ucs		  . #x004B)	; K
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0136)	; Ķ
    (latin-iso8859-4	. #xD3)	; &I-LATIN4-53;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER K")
      (=ucs		  . #xFF2B)	; Ｋ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0136)	; Ｋ̧
    (=jis-x0212		. #x2A49)	; Ｋ̧ [10-41]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0137)	; ｋ̧
      (=jis-x0212	  . #x2B49)	; ｋ̧ [11-41]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER K")
      (=ucs		  . #x006B)	; k
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0137)	; ķ
    (latin-iso8859-4	. #xF3)	; &I-LATIN4-73;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K WITH CEDILLA")
      (=ucs		  . #x0136)	; Ķ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER K")
      (=ucs		  . #xFF4B)	; ｋ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0137)	; ｋ̧
    (=jis-x0212		. #x2B49)	; ｋ̧ [11-41]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER K WITH CEDILLA")
      (=ucs		  . #x0137)	; ķ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0136)	; Ｋ̧
      (=jis-x0212	  . #x2A49)	; Ｋ̧ [10-41]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER KRA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Greenlandic")
    (=ucs		. #x0138)	; ĸ
    (latin-iso8859-4	. #xA2)	; &I-LATIN4-22;
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER KRA")
      (=ucs		  . #x0138)	; ĸ
      ))
    (=ucs@jis/fw	. #x0138)	; &JSP-2947;
    (=ks-x1001		. #x2927)	; &JSP-2947; [09-07]
    (=jis-x0212		. #x2947)	; &I-JSP-2947; [09-39]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER KRA")
      (=ucs		  . #x0138)	; ĸ
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER L")
      (=ucs		  . #x004C)	; L
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0139)	; Ĺ
    (latin-iso8859-2	. #xC5)	; &I-LATIN2-45;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER L")
      (=ucs		  . #xFF2C)	; Ｌ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0139)	; Ｌ́
    (=jis-x0212		. #x2A4A)	; Ｌ́ [10-42]
    (=jis-x0213-1	. #x2A3B)	; &I-JX1-2A3B; [10-27]
    (=jef-china3	. #x85DD)	; &I-JC3-85DD;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x013A)	; ｌ́
      (=jis-x0212	  . #x2B4A)	; ｌ́ [11-42]
      (=jis-x0213-1	  . #x2A4A)	; &I-JX1-2A4A; [10-42]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER L")
      (=ucs		  . #x006C)	; l
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x013A)	; ĺ
    (latin-iso8859-2	. #xE5)	; &I-LATIN2-65;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH ACUTE")
      (=ucs		  . #x0139)	; Ĺ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER L")
      (=ucs		  . #xFF4C)	; ｌ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x013A)	; ｌ́
    (=jis-x0212		. #x2B4A)	; ｌ́ [11-42]
    (=jis-x0213-1	. #x2A4A)	; &I-JX1-2A4A; [10-42]
    (=jef-china3	. #x85F3)	; &I-JC3-85F3;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH ACUTE")
      (=ucs		  . #x013A)	; ĺ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0139)	; Ｌ́
      (=jis-x0212	  . #x2A4A)	; Ｌ́ [10-42]
      (=jis-x0213-1	  . #x2A3B)	; &I-JX1-2A3B; [10-27]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER L")
      (=ucs		  . #x004C)	; L
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x013B)	; Ļ
    (latin-iso8859-4	. #xA6)	; &I-LATIN4-26;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER L")
      (=ucs		  . #xFF2C)	; Ｌ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x013B)	; Ｌ̧
    (=jis-x0212		. #x2A4C)	; Ｌ̧ [10-44]
    (=jef-china3	. #x89F8)	; &I-JC3-89F8;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x013C)	; ｌ̧
      (=jis-x0212	  . #x2B4C)	; ｌ̧ [11-44]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER L")
      (=ucs		  . #x006C)	; l
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x013C)	; ļ
    (latin-iso8859-4	. #xB6)	; &I-LATIN4-36;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CEDILLA")
      (=ucs		  . #x013B)	; Ļ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER L")
      (=ucs		  . #xFF4C)	; ｌ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x013C)	; ｌ̧
    (=jis-x0212		. #x2B4C)	; ｌ̧ [11-44]
    (=jef-china3	. #x89FE)	; &I-JC3-89FE;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH CEDILLA")
      (=ucs		  . #x013C)	; ļ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x013B)	; Ｌ̧
      (=jis-x0212	  . #x2A4C)	; Ｌ̧ [10-44]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER L")
      (=ucs		  . #x004C)	; L
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x013D)	; Ľ
    (latin-iso8859-2	. #xA5)	; &I-LATIN2-25;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER L")
      (=ucs		  . #xFF2C)	; Ｌ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x013D)	; Ｌ̌
    (=jis-x0212		. #x2A4B)	; Ｌ̌ [10-43]
    (=jis-x0213-1	. #x2A24)	; &I-JX1-2A24; [10-04]
    (=jef-china3	. #x88E6)	; &I-JC3-88E6;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x013E)	; ｌ̌
      (=jis-x0212	  . #x2B4B)	; ｌ̌ [11-43]
      (=jis-x0213-1	  . #x2A2F)	; &I-JX1-2A2F; [10-15]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER L")
      (=ucs		  . #x006C)	; l
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x013E)	; ľ
    (latin-iso8859-2	. #xB5)	; &I-LATIN2-35;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH CARON")
      (=ucs		  . #x013D)	; Ľ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER L")
      (=ucs		  . #xFF4C)	; ｌ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x013E)	; ｌ̌
    (=jis-x0212		. #x2B4B)	; ｌ̌ [11-43]
    (=jis-x0213-1	. #x2A2F)	; &I-JX1-2A2F; [10-15]
    (=jef-china3	. #x88F5)	; &I-JC3-88F5;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH CARON")
      (=ucs		  . #x013E)	; ľ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x013D)	; Ｌ̌
      (=jis-x0212	  . #x2A4B)	; Ｌ̌ [10-43]
      (=jis-x0213-1	  . #x2A24)	; &I-JX1-2A24; [10-04]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN CAPITAL LETTER L")
      (=ucs		  . #x004C)	; L
      )
     ((name		  . "MIDDLE DOT")
      (=ucs		  . #x00B7)	; ·
      ))
    (=ucs		. #x013F)	; Ŀ
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; ŀ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ŀ
      ))
    (=>decomposition@compat
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER L")
      (=ucs		  . #xFF2C)	; Ｌ
      )
     ((name		  . "MIDDLE DOT")
      (=ucs		  . #x00B7)	; ·
      ))
    (=ucs@jis/fw	. #x013F)	; &JSP-2929;
    (=ks-x1001		. #x2828)	; &JSP-2929; [08-08]
    (=jis-x0212		. #x2929)	; &I-JSP-2929; [09-09]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ŀ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0140)	; &JSP-2949;
      (=ks-x1001	  . #x2928)	; &JSP-2949; [09-08]
      (=jis-x0212	  . #x2949)	; &I-JSP-2949; [09-41]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH MIDDLE DOT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "LATIN SMALL LETTER L")
      (=ucs		  . #x006C)	; l
      )
     ((name		  . "MIDDLE DOT")
      (=ucs		  . #x00B7)	; ·
      ))
    (=ucs		. #x0140)	; ŀ
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x013F)	; Ŀ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; ŀ
      ))
    (=>decomposition@compat
     ((name		  . "FULLWIDTH LATIN SMALL LETTER L")
      (=ucs		  . #xFF4C)	; ｌ
      )
     ((name		  . "MIDDLE DOT")
      (=ucs		  . #x00B7)	; ·
      ))
    (=ucs@jis/fw	. #x0140)	; &JSP-2949;
    (=ks-x1001		. #x2928)	; &JSP-2949; [09-08]
    (=jis-x0212		. #x2949)	; &I-JSP-2949; [09-41]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH MIDDLE DOT")
      (=ucs		  . #x0140)	; ŀ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x013F)	; &JSP-2929;
      (=ks-x1001	  . #x2828)	; &JSP-2929; [08-08]
      (=jis-x0212	  . #x2929)	; &I-JSP-2929; [09-09]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0141)	; Ł
    (latin-iso8859-2	. #xA3)	; &I-LATIN2-23;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    (=ucs@jis/fw	. #x0141)	; &JX1-2A23;
    (=ks-x1001		. #x2829)	; &JX1-2A23; [08-09]
    (=jis-x0212		. #x2928)	; &I-JSP-2928; [09-08]
    (=jis-x0213-1	. #x2A23)	; &I-JX1-2A23; [10-03]
    (=jef-china3	. #x83A1)	; &I-JC3-83A1;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0142)	; &JX1-2A2E;
      (=ks-x1001	  . #x2929)	; &JX1-2A2E; [09-09]
      (=jis-x0212	  . #x2948)	; &I-JSP-2948; [09-40]
      (=jis-x0213-1	  . #x2A2E)	; &I-JX1-2A2E; [10-14]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0142)	; ł
    (latin-iso8859-2	. #xB3)	; &I-LATIN2-33;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L WITH STROKE")
      (=ucs		  . #x0141)	; Ł
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    (=ucs@jis/fw	. #x0142)	; &JX1-2A2E;
    (=ks-x1001		. #x2929)	; &JX1-2A2E; [09-09]
    (=jis-x0212		. #x2948)	; &I-JSP-2948; [09-40]
    (=jis-x0213-1	. #x2A2E)	; &I-JX1-2A2E; [10-14]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER L WITH STROKE")
      (=ucs		  . #x0142)	; ł
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0141)	; &JX1-2A23;
      (=ks-x1001	  . #x2829)	; &JX1-2A23; [08-09]
      (=jis-x0212	  . #x2928)	; &I-JSP-2928; [09-08]
      (=jis-x0213-1	  . #x2A23)	; &I-JX1-2A23; [10-03]
      ))
    ))
(define-char
  '((<-denotational
     ((=ucs@jis/fw	  . #x0142)	; &JX1-2A2E;
      (=ks-x1001	  . #x2929)	; &JX1-2A2E; [09-09]
      (=jis-x0212	  . #x2948)	; &I-JSP-2948; [09-40]
      (=jis-x0213-1	  . #x2A2E)	; &I-JX1-2A2E; [10-14]
      ))
    (=jef-china3	. #x83AC)	; &JC3-83AC;
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER N")
      (=ucs		  . #x004E)	; N
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0143)	; Ń
    (latin-iso8859-2	. #xD1)	; &I-LATIN2-51;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER N")
      (=ucs		  . #xFF2E)	; Ｎ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0143)	; Ｎ́
    (=jis-x0212		. #x2A4D)	; Ｎ́ [10-45]
    (=jis-x0213-1	. #x2A41)	; &I-JX1-2A41; [10-33]
    (=jef-china3	. #x85DF)	; &I-JC3-85DF;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0144)	; ｎ́
      (=jis-x0212	  . #x2B4D)	; ｎ́ [11-45]
      (=jis-x0213-1	  . #x2A51)	; &I-JX1-2A51; [10-49]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER N")
      (=ucs		  . #x006E)	; n
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0144)	; ń
    (latin-iso8859-2	. #xF1)	; &I-LATIN2-71;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH ACUTE")
      (=ucs		  . #x0143)	; Ń
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER N")
      (=ucs		  . #xFF4E)	; ｎ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0144)	; ｎ́
    (=jis-x0212		. #x2B4D)	; ｎ́ [11-45]
    (=jis-x0213-1	. #x2A51)	; &I-JX1-2A51; [10-49]
    (=jef-china3	. #x85F5)	; &I-JC3-85F5;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH ACUTE")
      (=ucs		  . #x0144)	; ń
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0143)	; Ｎ́
      (=jis-x0212	  . #x2A4D)	; Ｎ́ [10-45]
      (=jis-x0213-1	  . #x2A41)	; &I-JX1-2A41; [10-33]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER N")
      (=ucs		  . #x004E)	; N
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0145)	; Ņ
    (latin-iso8859-4	. #xD1)	; &I-LATIN4-51;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER N")
      (=ucs		  . #xFF2E)	; Ｎ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0145)	; Ｎ̧
    (=jis-x0212		. #x2A4F)	; Ｎ̧ [10-47]
    (=jef-china3	. #x89F9)	; &I-JC3-89F9;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0146)	; ｎ̧
      (=jis-x0212	  . #x2B4F)	; ｎ̧ [11-47]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER N")
      (=ucs		  . #x006E)	; n
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0146)	; ņ
    (latin-iso8859-4	. #xF1)	; &I-LATIN4-71;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CEDILLA")
      (=ucs		  . #x0145)	; Ņ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER N")
      (=ucs		  . #xFF4E)	; ｎ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0146)	; ｎ̧
    (=jis-x0212		. #x2B4F)	; ｎ̧ [11-47]
    (=jef-china3	. #x8AA1)	; &I-JC3-8AA1;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH CEDILLA")
      (=ucs		  . #x0146)	; ņ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0145)	; Ｎ̧
      (=jis-x0212	  . #x2A4F)	; Ｎ̧ [10-47]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER N")
      (=ucs		  . #x004E)	; N
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x0147)	; Ň
    (latin-iso8859-2	. #xD2)	; &I-LATIN2-52;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER N")
      (=ucs		  . #xFF2E)	; Ｎ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x0147)	; Ｎ̌
    (=jis-x0212		. #x2A4E)	; Ｎ̌ [10-46]
    (=jis-x0213-1	. #x2A42)	; &I-JX1-2A42; [10-34]
    (=jef-china3	. #x88E7)	; &I-JC3-88E7;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0148)	; ｎ̌
      (=jis-x0212	  . #x2B4E)	; ｎ̌ [11-46]
      (=jis-x0213-1	  . #x2A52)	; &I-JX1-2A52; [10-50]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER N")
      (=ucs		  . #x006E)	; n
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x0148)	; ň
    (latin-iso8859-2	. #xF2)	; &I-LATIN2-72;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N WITH CARON")
      (=ucs		  . #x0147)	; Ň
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER N")
      (=ucs		  . #xFF4E)	; ｎ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x0148)	; ｎ̌
    (=jis-x0212		. #x2B4E)	; ｎ̌ [11-46]
    (=jis-x0213-1	. #x2A52)	; &I-JX1-2A52; [10-50]
    (=jef-china3	. #x88F6)	; &I-JC3-88F6;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER N WITH CARON")
      (=ucs		  . #x0148)	; ň
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0147)	; Ｎ̌
      (=jis-x0212	  . #x2A4E)	; Ｎ̌ [10-46]
      (=jis-x0213-1	  . #x2A42)	; &I-JX1-2A42; [10-34]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=>decomposition@compat
     ((name		  . "MODIFIER LETTER APOSTROPHE")
      (=ucs		  . #x02BC)	; ʼ
      )
     ((name		  . "LATIN SMALL LETTER N")
      (=ucs		  . #x006E)	; n
      ))
    (=ucs		. #x0149)	; ŉ
    ))
(define-char
  '((<-denotational
     ((name . "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
      (=ucs		  . #x0149)	; ŉ
      ))
    (=>decomposition@compat
     ((name		  . "MODIFIER LETTER APOSTROPHE")
      (=ucs		  . #x02BC)	; ʼ
      )
     ((name		  . "FULLWIDTH LATIN SMALL LETTER N")
      (=ucs		  . #xFF4E)	; ｎ
      ))
    (=ucs@jis/fw	. #x0149)	; &JSP-294A;
    (=ks-x1001		. #x2930)	; &JSP-294A; [09-16]
    (=jis-x0212		. #x294A)	; &I-JSP-294A; [09-42]
    (<-fullwidth
     ((name . "LATIN SMALL LETTER N PRECEDED BY APOSTROPHE")
      (=ucs		  . #x0149)	; ŉ
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER ENG")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (=ucs		. #x014A)	; Ŋ
    (latin-iso8859-4	. #xBD)	; &I-LATIN4-3D;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; ŋ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; Ŋ
      ))
    (=ucs@jis/fw	. #x014A)	; &JSP-292B;
    (=ks-x1001		. #x282F)	; &JSP-292B; [08-15]
    (=jis-x0212		. #x292B)	; &I-JSP-292B; [09-11]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; Ŋ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x014B)	; &JX1-2A7A;
      (=ks-x1001	  . #x292F)	; &JX1-2A7A; [09-15]
      (=jis-x0212	  . #x294B)	; &I-JSP-294B; [09-43]
      (=jis-x0213-1	  . #x2A7A)	; &I-JX1-2A7A; [10-90]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER ENG")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Sami")
    (=ucs		. #x014B)	; ŋ
    (latin-iso8859-4	. #xBF)	; &I-LATIN4-3F;
    (ipa		. #xD5)	; &I-MULE-IPA-55;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER ENG")
      (=ucs		  . #x014A)	; Ŋ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; ŋ
      ))
    (=ucs@jis/fw	. #x014B)	; &JX1-2A7A;
    (=ks-x1001		. #x292F)	; &JX1-2A7A; [09-15]
    (=jis-x0212		. #x294B)	; &I-JSP-294B; [09-43]
    (=jis-x0213-1	. #x2A7A)	; &I-JX1-2A7A; [10-90]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER ENG")
      (=ucs		  . #x014B)	; ŋ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x014A)	; &JSP-292B;
      (=ks-x1001	  . #x282F)	; &JSP-292B; [08-15]
      (=jis-x0212	  . #x292B)	; &I-JSP-292B; [09-11]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x014C)	; Ō
    (latin-iso8859-4	. #xD2)	; &I-LATIN4-52;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@jis/fw	. #x014C)	; Ｏ̄
    (=jis-x0212		. #x2A57)	; Ｏ̄ [10-55]
    (=jis-x0213-1	. #x2979)	; &I-JX1-2979; [09-89]
    (=jef-china3	. #x87B3)	; &I-JC3-87B3;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x014D)	; ｏ̄
      (=ucs@jis/fw	  . #x014D)	; ｏ̄
      (=gb2312		  . #x282D)	; ｏ̄ [08-13]
      (=jis-x0212	  . #x2B57)	; &I-JSP-2B57; [11-55]
      (=jis-x0213-1	  . #x297E)	; &I-JX1-297E; [09-94]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x014D)	; ō
    (latin-iso8859-4	. #xF2)	; &I-LATIN4-72;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH MACRON")
      (=ucs		  . #x014C)	; Ō
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@gb/fw		. #x014D)	; ｏ̄
    (=ucs@jis/fw	. #x014D)	; ｏ̄
    (=gb2312		. #x282D)	; ｏ̄ [08-13]
    (=jis-x0212		. #x2B57)	; &I-JSP-2B57; [11-55]
    (=jis-x0213-1	. #x297E)	; &I-JX1-297E; [09-94]
    (=jef-china3	. #x87C7)	; &I-JC3-87C7;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH MACRON")
      (=ucs		  . #x014D)	; ō
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x014C)	; Ｏ̄
      (=jis-x0212	  . #x2A57)	; Ｏ̄ [10-55]
      (=jis-x0213-1	  . #x2979)	; &I-JX1-2979; [09-89]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x014E)	; Ŏ
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH BREVE")
      (=ucs		  . #x014F)	; ŏ
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x014F)	; ŏ
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH BREVE")
      (=ucs		  . #x014E)	; Ŏ
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs		. #x0150)	; Ő
    (latin-iso8859-2	. #xD5)	; &I-LATIN2-55;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs@jis/fw	. #x0150)	; Ｏ̋
    (=jis-x0212		. #x2A56)	; Ｏ̋ [10-54]
    (=jis-x0213-1	. #x2A43)	; &I-JX1-2A43; [10-35]
    (=jef-china3	. #x89E2)	; &I-JC3-89E2;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0151)	; ｏ̋
      (=jis-x0212	  . #x2B56)	; ｏ̋ [11-54]
      (=jis-x0213-1	  . #x2A53)	; &I-JX1-2A53; [10-51]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs		. #x0151)	; ő
    (latin-iso8859-2	. #xF5)	; &I-LATIN2-75;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0150)	; Ő
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs@jis/fw	. #x0151)	; ｏ̋
    (=jis-x0212		. #x2B56)	; ｏ̋ [11-54]
    (=jis-x0213-1	. #x2A53)	; &I-JX1-2A53; [10-51]
    (=jef-china3	. #x89E5)	; &I-JC3-89E5;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER O WITH DOUBLE ACUTE")
      (=ucs		  . #x0151)	; ő
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0150)	; Ｏ̋
      (=jis-x0212	  . #x2A56)	; Ｏ̋ [10-54]
      (=jis-x0213-1	  . #x2A43)	; &I-JX1-2A43; [10-35]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LIGATURE OE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0152)	; Œ
    (->lowercase
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; œ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Œ
      ))
    (=ucs@jis		. #x0152)	; &JX1-2B2B;
    (=ks-x1001		. #x282B)	; &JX1-2B2B; [08-11]
    (=jis-x0212		. #x292D)	; &I-JSP-292D; [09-13]
    (=jis-x0213-1	. #x2B2B)	; &I-JX1-2B2B; [11-11]
    (=jef-china3	. #x83A6)	; &I-JC3-83A6;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Œ
      ))
    (->lowercase
     ((=ucs@jis		  . #x0153)	; &JX1-2B2A;
      (=ks-x1001	  . #x292B)	; &JX1-2B2A; [09-11]
      (=jis-x0212	  . #x294D)	; &I-JSP-294D; [09-45]
      (=jis-x0213-1	  . #x2B2A)	; &I-JX1-2B2A; [11-10]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LIGATURE OE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0153)	; œ
    (ipa		. #xB0)	; &I-MULE-IPA-30;
    (->uppercase
     ((name		  . "LATIN CAPITAL LIGATURE OE")
      (=ucs		  . #x0152)	; Œ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; œ
      ))
    (=ucs@jis		. #x0153)	; &JX1-2B2A;
    (=ks-x1001		. #x292B)	; &JX1-2B2A; [09-11]
    (=jis-x0212		. #x294D)	; &I-JSP-294D; [09-45]
    (=jis-x0213-1	. #x2B2A)	; &I-JX1-2B2A; [11-10]
    (=jef-china3	. #x83B1)	; &I-JC3-83B1;
    (<-fullwidth
     ((name		  . "LATIN SMALL LIGATURE OE")
      (=ucs		  . #x0153)	; œ
      ))
    (->uppercase
     ((=ucs@jis		  . #x0152)	; &JX1-2B2B;
      (=ks-x1001	  . #x282B)	; &JX1-2B2B; [08-11]
      (=jis-x0212	  . #x292D)	; &I-JSP-292D; [09-13]
      (=jis-x0213-1	  . #x2B2B)	; &I-JX1-2B2B; [11-11]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER R")
      (=ucs		  . #x0052)	; R
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0154)	; Ŕ
    (latin-iso8859-2	. #xC0)	; &I-LATIN2-40;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER R")
      (=ucs		  . #xFF32)	; Ｒ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0154)	; Ｒ́
    (=jis-x0212		. #x2A59)	; Ｒ́ [10-57]
    (=jis-x0213-1	. #x2A39)	; &I-JX1-2A39; [10-25]
    (=jef-china3	. #x85E3)	; &I-JC3-85E3;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0155)	; ｒ́
      (=jis-x0212	  . #x2B59)	; ｒ́ [11-57]
      (=jis-x0213-1	  . #x2A48)	; &I-JX1-2A48; [10-40]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER R")
      (=ucs		  . #x0072)	; r
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0155)	; ŕ
    (latin-iso8859-2	. #xE0)	; &I-LATIN2-60;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH ACUTE")
      (=ucs		  . #x0154)	; Ŕ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER R")
      (=ucs		  . #xFF52)	; ｒ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0155)	; ｒ́
    (=jis-x0212		. #x2B59)	; ｒ́ [11-57]
    (=jis-x0213-1	. #x2A48)	; &I-JX1-2A48; [10-40]
    (=jef-china3	. #x85F9)	; &I-JC3-85F9;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH ACUTE")
      (=ucs		  . #x0155)	; ŕ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0154)	; Ｒ́
      (=jis-x0212	  . #x2A59)	; Ｒ́ [10-57]
      (=jis-x0213-1	  . #x2A39)	; &I-JX1-2A39; [10-25]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER R")
      (=ucs		  . #x0052)	; R
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0156)	; Ŗ
    (latin-iso8859-4	. #xA3)	; &I-LATIN4-23;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER R")
      (=ucs		  . #xFF32)	; Ｒ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0156)	; Ｒ̧
    (=jis-x0212		. #x2A5B)	; Ｒ̧ [10-59]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0157)	; ｒ̧
      (=jis-x0212	  . #x2B5B)	; ｒ̧ [11-59]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER R")
      (=ucs		  . #x0072)	; r
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0157)	; ŗ
    (latin-iso8859-4	. #xB3)	; &I-LATIN4-33;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CEDILLA")
      (=ucs		  . #x0156)	; Ŗ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER R")
      (=ucs		  . #xFF52)	; ｒ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0157)	; ｒ̧
    (=jis-x0212		. #x2B5B)	; ｒ̧ [11-59]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH CEDILLA")
      (=ucs		  . #x0157)	; ŗ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0156)	; Ｒ̧
      (=jis-x0212	  . #x2A5B)	; Ｒ̧ [10-59]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER R")
      (=ucs		  . #x0052)	; R
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x0158)	; Ř
    (latin-iso8859-2	. #xD8)	; &I-LATIN2-58;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER R")
      (=ucs		  . #xFF32)	; Ｒ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x0158)	; Ｒ̌
    (=jis-x0212		. #x2A5A)	; Ｒ̌ [10-58]
    (=jis-x0213-1	. #x2A44)	; &I-JX1-2A44; [10-36]
    (=jef-china3	. #x88E9)	; &I-JC3-88E9;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0159)	; ｒ̌
      (=jis-x0212	  . #x2B5A)	; ｒ̌ [11-58]
      (=jis-x0213-1	  . #x2A54)	; &I-JX1-2A54; [10-52]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER R")
      (=ucs		  . #x0072)	; r
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x0159)	; ř
    (latin-iso8859-2	. #xF8)	; &I-LATIN2-78;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R WITH CARON")
      (=ucs		  . #x0158)	; Ř
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER R")
      (=ucs		  . #xFF52)	; ｒ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x0159)	; ｒ̌
    (=jis-x0212		. #x2B5A)	; ｒ̌ [11-58]
    (=jis-x0213-1	. #x2A54)	; &I-JX1-2A54; [10-52]
    (=jef-china3	. #x88F8)	; &I-JC3-88F8;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER R WITH CARON")
      (=ucs		  . #x0159)	; ř
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0158)	; Ｒ̌
      (=jis-x0212	  . #x2A5A)	; Ｒ̌ [10-58]
      (=jis-x0213-1	  . #x2A44)	; &I-JX1-2A44; [10-36]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x015A)	; Ś
    (latin-iso8859-2	. #xA6)	; &I-LATIN2-26;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER S")
      (=ucs		  . #xFF33)	; Ｓ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x015A)	; Ｓ́
    (=jis-x0212		. #x2A5C)	; Ｓ́ [10-60]
    (=jis-x0213-1	. #x2A25)	; &I-JX1-2A25; [10-05]
    (=jef-china3	. #x85E4)	; &I-JC3-85E4;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x015B)	; ｓ́
      (=jis-x0212	  . #x2B5C)	; ｓ́ [11-60]
      (=jis-x0213-1	  . #x2A30)	; &I-JX1-2A30; [10-16]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER S")
      (=ucs		  . #x0073)	; s
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x015B)	; ś
    (latin-iso8859-2	. #xB6)	; &I-LATIN2-36;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH ACUTE")
      (=ucs		  . #x015A)	; Ś
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER S")
      (=ucs		  . #xFF53)	; ｓ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x015B)	; ｓ́
    (=jis-x0212		. #x2B5C)	; ｓ́ [11-60]
    (=jis-x0213-1	. #x2A30)	; &I-JX1-2A30; [10-16]
    (=jef-china3	. #x85FA)	; &I-JC3-85FA;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH ACUTE")
      (=ucs		  . #x015B)	; ś
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x015A)	; Ｓ́
      (=jis-x0212	  . #x2A5C)	; Ｓ́ [10-60]
      (=jis-x0213-1	  . #x2A25)	; &I-JX1-2A25; [10-05]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x015C)	; Ŝ
    (latin-iso8859-3	. #xDE)	; &I-LATIN3-5E;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER S")
      (=ucs		  . #xFF33)	; Ｓ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x015C)	; Ｓ̂
    (=jis-x0212		. #x2A5D)	; Ｓ̂ [10-61]
    (=jis-x0213-1	. #x2A5D)	; &I-JX1-2A5D; [10-61]
    (=jef-china3	. #x86C0)	; &I-JC3-86C0;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x015D)	; ｓ̂
      (=jis-x0212	  . #x2B5D)	; ｓ̂ [11-61]
      (=jis-x0213-1	  . #x2A63)	; &I-JX1-2A63; [10-67]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER S")
      (=ucs		  . #x0073)	; s
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x015D)	; ŝ
    (latin-iso8859-3	. #xFE)	; &I-LATIN3-7E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015C)	; Ŝ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER S")
      (=ucs		  . #xFF53)	; ｓ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x015D)	; ｓ̂
    (=jis-x0212		. #x2B5D)	; ｓ̂ [11-61]
    (=jis-x0213-1	. #x2A63)	; &I-JX1-2A63; [10-67]
    (=jef-china3	. #x86CD)	; &I-JC3-86CD;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CIRCUMFLEX")
      (=ucs		  . #x015D)	; ŝ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x015C)	; Ｓ̂
      (=jis-x0212	  . #x2A5D)	; Ｓ̂ [10-61]
      (=jis-x0213-1	  . #x2A5D)	; &I-JX1-2A5D; [10-61]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x015E)	; Ş
    (latin-iso8859-2	. #xAA)	; &I-LATIN2-2A;
    (latin-iso8859-3	. #xAA)	; &I-LATIN3-2A;
    (latin-iso8859-9	. #xDE)	; &I-LATIN5-5E;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ş
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Ş
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER S")
      (=ucs		  . #xFF33)	; Ｓ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x015E)	; Ｓ̧
    (=jis-x0212		. #x2A5F)	; Ｓ̧ [10-63]
    (=jis-x0213-1	. #x2A27)	; &I-JX1-2A27; [10-07]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Ş
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x015F)	; ｓ̧
      (=jis-x0212	  . #x2B5F)	; ｓ̧ [11-63]
      (=jis-x0213-1	  . #x2A33)	; &I-JX1-2A33; [10-19]
      ))
    (->subsumptive
     ((=jef-china3	  . #x89FA)	; &JC3-89FA;
      )
     ((=jef-china3	  . #x8BCB)	; &JC3-8BCB;
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER S")
      (=ucs		  . #x0073)	; s
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x015F)	; ş
    (latin-iso8859-2	. #xBA)	; &I-LATIN2-3A;
    (latin-iso8859-3	. #xBA)	; &I-LATIN3-3A;
    (latin-iso8859-9	. #xFE)	; &I-LATIN5-7E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CEDILLA")
      (=ucs		  . #x015E)	; Ş
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ş
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER S")
      (=ucs		  . #xFF53)	; ｓ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x015F)	; ｓ̧
    (=jis-x0212		. #x2B5F)	; ｓ̧ [11-63]
    (=jis-x0213-1	. #x2A33)	; &I-JX1-2A33; [10-19]
    (=jef-china3	. #x8AA2)	; &I-JC3-8AA2;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CEDILLA")
      (=ucs		  . #x015F)	; ş
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x015E)	; Ｓ̧
      (=jis-x0212	  . #x2A5F)	; Ｓ̧ [10-63]
      (=jis-x0213-1	  . #x2A27)	; &I-JX1-2A27; [10-07]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x0160)	; Š
    (latin-iso8859-2	. #xA9)	; &I-LATIN2-29;
    (latin-iso8859-4	. #xA9)	; &I-LATIN4-29;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER S")
      (=ucs		  . #xFF33)	; Ｓ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x0160)	; Ｓ̌
    (=jis-x0212		. #x2A5E)	; Ｓ̌ [10-62]
    (=jis-x0213-1	. #x2A26)	; &I-JX1-2A26; [10-06]
    (=jef-china3	. #x88EA)	; &I-JC3-88EA;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0161)	; ｓ̌
      (=jis-x0212	  . #x2B5E)	; ｓ̌ [11-62]
      (=jis-x0213-1	  . #x2A32)	; &I-JX1-2A32; [10-18]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER S")
      (=ucs		  . #x0073)	; s
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x0161)	; š
    (latin-iso8859-2	. #xB9)	; &I-LATIN2-39;
    (latin-iso8859-4	. #xB9)	; &I-LATIN4-39;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S WITH CARON")
      (=ucs		  . #x0160)	; Š
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER S")
      (=ucs		  . #xFF53)	; ｓ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x0161)	; ｓ̌
    (=jis-x0212		. #x2B5E)	; ｓ̌ [11-62]
    (=jis-x0213-1	. #x2A32)	; &I-JX1-2A32; [10-18]
    (=jef-china3	. #x88F9)	; &I-JC3-88F9;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER S WITH CARON")
      (=ucs		  . #x0161)	; š
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0160)	; Ｓ̌
      (=jis-x0212	  . #x2A5E)	; Ｓ̌ [10-62]
      (=jis-x0213-1	  . #x2A26)	; &I-JX1-2A26; [10-06]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CEDILLA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER T")
      (=ucs		  . #x0054)	; T
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0162)	; Ţ
    (latin-iso8859-2	. #xDE)	; &I-LATIN2-5E;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER T")
      (=ucs		  . #xFF34)	; Ｔ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0162)	; Ｔ̧
    (=jis-x0212		. #x2A61)	; Ｔ̧ [10-65]
    (=jis-x0213-1	. #x2A47)	; &I-JX1-2A47; [10-39]
    (=jef-china3	. #x8BCC)	; &I-JC3-8BCC;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0163)	; ｔ̧
      (=jis-x0212	  . #x2B61)	; ｔ̧ [11-65]
      (=jis-x0213-1	  . #x2A57)	; &I-JX1-2A57; [10-55]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CEDILLA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER T")
      (=ucs		  . #x0074)	; t
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs		. #x0163)	; ţ
    (latin-iso8859-2	. #xFE)	; &I-LATIN2-7E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CEDILLA")
      (=ucs		  . #x0162)	; Ţ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER T")
      (=ucs		  . #xFF54)	; ｔ
      )
     ((name		  . "COMBINING CEDILLA")
      (=ucs		  . #x0327)	; ̧
      ))
    (=ucs@jis/fw	. #x0163)	; ｔ̧
    (=jis-x0212		. #x2B61)	; ｔ̧ [11-65]
    (=jis-x0213-1	. #x2A57)	; &I-JX1-2A57; [10-55]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH CEDILLA")
      (=ucs		  . #x0163)	; ţ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0162)	; Ｔ̧
      (=jis-x0212	  . #x2A61)	; Ｔ̧ [10-65]
      (=jis-x0213-1	  . #x2A47)	; &I-JX1-2A47; [10-39]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER T")
      (=ucs		  . #x0054)	; T
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x0164)	; Ť
    (latin-iso8859-2	. #xAB)	; &I-LATIN2-2B;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER T")
      (=ucs		  . #xFF34)	; Ｔ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x0164)	; Ｔ̌
    (=jis-x0212		. #x2A60)	; Ｔ̌ [10-64]
    (=jis-x0213-1	. #x2A28)	; &I-JX1-2A28; [10-08]
    (=jef-china3	. #x88EB)	; &I-JC3-88EB;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0165)	; ｔ̌
      (=jis-x0212	  . #x2B60)	; ｔ̌ [11-64]
      (=jis-x0213-1	  . #x2A34)	; &I-JX1-2A34; [10-20]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER T")
      (=ucs		  . #x0074)	; t
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x0165)	; ť
    (latin-iso8859-2	. #xBB)	; &I-LATIN2-3B;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH CARON")
      (=ucs		  . #x0164)	; Ť
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER T")
      (=ucs		  . #xFF54)	; ｔ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x0165)	; ｔ̌
    (=jis-x0212		. #x2B60)	; ｔ̌ [11-64]
    (=jis-x0213-1	. #x2A34)	; &I-JX1-2A34; [10-20]
    (=jef-china3	. #x88FA)	; &I-JC3-88FA;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH CARON")
      (=ucs		  . #x0165)	; ť
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0164)	; Ｔ̌
      (=jis-x0212	  . #x2A60)	; Ｔ̌ [10-64]
      (=jis-x0213-1	  . #x2A28)	; &I-JX1-2A28; [10-08]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0166)	; Ŧ
    (latin-iso8859-4	. #xAC)	; &I-LATIN4-2C;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    (=ucs@jis/fw	. #x0166)	; &JSP-292F;
    (=ks-x1001		. #x282E)	; &JSP-292F; [08-14]
    (=jis-x0212		. #x292F)	; &I-JSP-292F; [09-15]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0167)	; &JSP-294F;
      (=ks-x1001	  . #x292E)	; &JSP-294F; [09-14]
      (=jis-x0212	  . #x294F)	; &I-JSP-294F; [09-47]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0167)	; ŧ
    (latin-iso8859-4	. #xBC)	; &I-LATIN4-3C;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T WITH STROKE")
      (=ucs		  . #x0166)	; Ŧ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    (=ucs@jis/fw	. #x0167)	; &JSP-294F;
    (=ks-x1001		. #x292E)	; &JSP-294F; [09-14]
    (=jis-x0212		. #x294F)	; &I-JSP-294F; [09-47]
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER T WITH STROKE")
      (=ucs		  . #x0167)	; ŧ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0166)	; &JSP-292F;
      (=ks-x1001	  . #x282E)	; &JSP-292F; [08-14]
      (=jis-x0212	  . #x292F)	; &I-JSP-292F; [09-15]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH TILDE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x0168)	; Ũ
    (latin-iso8859-4	. #xDD)	; &I-LATIN4-5D;
    (latin-viscii	. #x9D)	; &I-MULE-VIET-U-7B;
    (latin-viscii-upper . #xFB)	; &I-MULE-VIET-U-7B;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x0168)	; Ｕ̃
    (=jis-x0212		. #x2A6C)	; Ｕ̃ [10-76]
    (=jef-china3	. #x86EB)	; &I-JC3-86EB;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0169)	; ｕ̃
      (=jis-x0212	  . #x2B6C)	; ｕ̃ [11-76]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH TILDE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs		. #x0169)	; ũ
    (latin-iso8859-4	. #xFD)	; &I-LATIN4-7D;
    (latin-tcvn5712	. #xF2)	; &I-VSCII2-72;
    (latin-viscii	. #xFB)	; &I-MULE-VIET-L-7B;
    (latin-viscii-lower . #xFB)	; &I-MULE-VIET-L-7B;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH TILDE")
      (=ucs		  . #x0168)	; Ũ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING TILDE")
      (=ucs		  . #x0303)	; ̃
      ))
    (=ucs@jis/fw	. #x0169)	; ｕ̃
    (=jis-x0212		. #x2B6C)	; ｕ̃ [11-76]
    (=jef-china3	. #x86F8)	; &I-JC3-86F8;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH TILDE")
      (=ucs		  . #x0169)	; ũ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0168)	; Ｕ̃
      (=jis-x0212	  . #x2A6C)	; Ｕ̃ [10-76]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x016A)	; Ū
    (latin-iso8859-4	. #xDE)	; &I-LATIN4-5E;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@jis/fw	. #x016A)	; Ｕ̄
    (=jis-x0212		. #x2A69)	; Ｕ̄ [10-73]
    (=jis-x0213-1	. #x2977)	; &I-JX1-2977; [09-87]
    (=jef-china3	. #x87B9)	; &I-JC3-87B9;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x016B)	; ｕ̄
      (=ucs@jis/fw	  . #x016B)	; ｕ̄
      (=gb2312		  . #x2831)	; ｕ̄ [08-17]
      (=jis-x0212	  . #x2B69)	; &I-JSP-2B69; [11-73]
      (=jis-x0213-1	  . #x297C)	; &I-JX1-297C; [09-92]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x016B)	; ū
    (latin-iso8859-4	. #xFE)	; &I-LATIN4-7E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x016A)	; Ū
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs@gb/fw		. #x016B)	; ｕ̄
    (=ucs@jis/fw	. #x016B)	; ｕ̄
    (=gb2312		. #x2831)	; ｕ̄ [08-17]
    (=jis-x0212		. #x2B69)	; &I-JSP-2B69; [11-73]
    (=jis-x0213-1	. #x297C)	; &I-JX1-297C; [09-92]
    (=jef-china3	. #x87CD)	; &I-JC3-87CD;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH MACRON")
      (=ucs		  . #x016B)	; ū
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x016A)	; Ｕ̄
      (=jis-x0212	  . #x2A69)	; Ｕ̄ [10-73]
      (=jis-x0213-1	  . #x2977)	; &I-JX1-2977; [09-87]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x016C)	; Ŭ
    (latin-iso8859-3	. #xDD)	; &I-LATIN3-5D;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs@jis/fw	. #x016C)	; Ｕ̆
    (=jis-x0212		. #x2A66)	; Ｕ̆ [10-70]
    (=jis-x0213-1	. #x2A5E)	; &I-JX1-2A5E; [10-62]
    (=jef-china3	. #x87E5)	; &I-JC3-87E5;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x016D)	; ｕ̆
      (=jis-x0212	  . #x2B66)	; ｕ̆ [11-70]
      (=jis-x0213-1	  . #x2A64)	; &I-JX1-2A64; [10-68]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x016D)	; ŭ
    (latin-iso8859-3	. #xFD)	; &I-LATIN3-7D;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH BREVE")
      (=ucs		  . #x016C)	; Ŭ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs@jis/fw	. #x016D)	; ｕ̆
    (=jis-x0212		. #x2B66)	; ｕ̆ [11-70]
    (=jis-x0213-1	. #x2A64)	; &I-JX1-2A64; [10-68]
    (=jef-china3	. #x87EF)	; &I-JC3-87EF;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH BREVE")
      (=ucs		  . #x016D)	; ŭ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x016C)	; Ｕ̆
      (=jis-x0212	  . #x2A66)	; Ｕ̆ [10-70]
      (=jis-x0213-1	  . #x2A5E)	; &I-JX1-2A5E; [10-62]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH RING ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING RING ABOVE")
      (=ucs		  . #x030A)	; ̊
      ))
    (=ucs		. #x016E)	; Ů
    (latin-iso8859-2	. #xD9)	; &I-LATIN2-59;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING RING ABOVE")
      (=ucs		  . #x030A)	; ̊
      ))
    (=ucs@jis/fw	. #x016E)	; Ｕ̊
    (=jis-x0212		. #x2A6B)	; Ｕ̊ [10-75]
    (=jis-x0213-1	. #x2A45)	; &I-JX1-2A45; [10-37]
    (=jef-china3	. #x89A5)	; &I-JC3-89A5;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x016F)	; ｕ̊
      (=jis-x0212	  . #x2B6B)	; ｕ̊ [11-75]
      (=jis-x0213-1	  . #x2A55)	; &I-JX1-2A55; [10-53]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH RING ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING RING ABOVE")
      (=ucs		  . #x030A)	; ̊
      ))
    (=ucs		. #x016F)	; ů
    (latin-iso8859-2	. #xF9)	; &I-LATIN2-79;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016E)	; Ů
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING RING ABOVE")
      (=ucs		  . #x030A)	; ̊
      ))
    (=ucs@jis/fw	. #x016F)	; ｕ̊
    (=jis-x0212		. #x2B6B)	; ｕ̊ [11-75]
    (=jis-x0213-1	. #x2A55)	; &I-JX1-2A55; [10-53]
    (=jef-china3	. #x89AD)	; &I-JC3-89AD;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH RING ABOVE")
      (=ucs		  . #x016F)	; ů
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x016E)	; Ｕ̊
      (=jis-x0212	  . #x2A6B)	; Ｕ̊ [10-75]
      (=jis-x0213-1	  . #x2A45)	; &I-JX1-2A45; [10-37]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs		. #x0170)	; Ű
    (latin-iso8859-2	. #xDB)	; &I-LATIN2-5B;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs@jis/fw	. #x0170)	; Ｕ̋
    (=jis-x0212		. #x2A68)	; Ｕ̋ [10-72]
    (=jis-x0213-1	. #x2A46)	; &I-JX1-2A46; [10-38]
    (=jef-china3	. #x89E3)	; &I-JC3-89E3;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0171)	; ｕ̋
      (=jis-x0212	  . #x2B68)	; ｕ̋ [11-72]
      (=jis-x0213-1	  . #x2A56)	; &I-JX1-2A56; [10-54]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs		. #x0171)	; ű
    (latin-iso8859-2	. #xFB)	; &I-LATIN2-7B;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0170)	; Ű
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs@jis/fw	. #x0171)	; ｕ̋
    (=jis-x0212		. #x2B68)	; ｕ̋ [11-72]
    (=jis-x0213-1	. #x2A56)	; &I-JX1-2A56; [10-54]
    (=jef-china3	. #x89E6)	; &I-JC3-89E6;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x0171)	; ű
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0170)	; Ｕ̋
      (=jis-x0212	  . #x2A68)	; Ｕ̋ [10-72]
      (=jis-x0213-1	  . #x2A46)	; &I-JX1-2A46; [10-38]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U WITH OGONEK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs		. #x0172)	; Ų
    (latin-iso8859-4	. #xD9)	; &I-LATIN4-59;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs@jis/fw	. #x0172)	; Ｕ̨
    (=jis-x0212		. #x2A6A)	; Ｕ̨ [10-74]
    (=jef-china3	. #x8AAA)	; &I-JC3-8AAA;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0173)	; ｕ̨
      (=jis-x0212	  . #x2B6A)	; ｕ̨ [11-74]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U WITH OGONEK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs		. #x0173)	; ų
    (latin-iso8859-4	. #xF9)	; &I-LATIN4-79;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U WITH OGONEK")
      (=ucs		  . #x0172)	; Ų
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      )
     ((name		  . "COMBINING OGONEK")
      (=ucs		  . #x0328)	; ̨
      ))
    (=ucs@jis/fw	. #x0173)	; ｕ̨
    (=jis-x0212		. #x2B6A)	; ｕ̨ [11-74]
    (=jef-china3	. #x8AB2)	; &I-JC3-8AB2;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER U WITH OGONEK")
      (=ucs		  . #x0173)	; ų
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0172)	; Ｕ̨
      (=jis-x0212	  . #x2A6A)	; Ｕ̨ [10-74]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER W")
      (=ucs		  . #x0057)	; W
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0174)	; Ŵ
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; ŵ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Ŵ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER W")
      (=ucs		  . #xFF37)	; Ｗ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0174)	; Ｗ̂
    (=jis-x0212		. #x2A71)	; Ｗ̂ [10-81]
    (=jef-china3	. #x86C2)	; &I-JC3-86C2;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Ŵ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0175)	; ｗ̂
      (=jis-x0212	  . #x2B71)	; ｗ̂ [11-81]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER W")
      (=ucs		  . #x0077)	; w
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0175)	; ŵ
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0174)	; Ŵ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; ŵ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER W")
      (=ucs		  . #xFF57)	; ｗ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0175)	; ｗ̂
    (=jis-x0212		. #x2B71)	; ｗ̂ [11-81]
    (=jef-china3	. #x86CF)	; &I-JC3-86CF;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER W WITH CIRCUMFLEX")
      (=ucs		  . #x0175)	; ŵ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0174)	; Ｗ̂
      (=jis-x0212	  . #x2A71)	; Ｗ̂ [10-81]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER Y")
      (=ucs		  . #x0059)	; Y
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0176)	; Ŷ
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; ŷ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Ŷ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Y")
      (=ucs		  . #xFF39)	; Ｙ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0176)	; Ｙ̂
    (=jis-x0212		. #x2A74)	; Ｙ̂ [10-84]
    (=jef-china3	. #x86C3)	; &I-JC3-86C3;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Ŷ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0177)	; ｙ̂
      (=jis-x0212	  . #x2B74)	; ｙ̂ [11-84]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER Y")
      (=ucs		  . #x0079)	; y
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs		. #x0177)	; ŷ
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0176)	; Ŷ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; ŷ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Y")
      (=ucs		  . #xFF59)	; ｙ
      )
     ((name		  . "COMBINING CIRCUMFLEX ACCENT")
      (=ucs		  . #x0302)	; ̂
      ))
    (=ucs@jis/fw	. #x0177)	; ｙ̂
    (=jis-x0212		. #x2B74)	; ｙ̂ [11-84]
    (=jef-china3	. #x86D0)	; &I-JC3-86D0;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Y WITH CIRCUMFLEX")
      (=ucs		  . #x0177)	; ŷ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0176)	; Ｙ̂
      (=jis-x0212	  . #x2A74)	; Ｙ̂ [10-84]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER Y")
      (=ucs		  . #x0059)	; Y
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x0178)	; Ÿ
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x00FF)	; ÿ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x0178)	; Ÿ
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Y")
      (=ucs		  . #xFF39)	; Ｙ
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x0178)	; Ｙ̈
    (=jis-x0212		. #x2A73)	; Ｙ̈ [10-83]
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Y WITH DIAERESIS")
      (=ucs		  . #x0178)	; Ÿ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x00FF)	; ｙ̈
      (=jis-x0212	  . #x2B73)	; ｙ̈ [11-83]
      (=jis-x0213-1	  . #x2974)	; &I-JX1-2974; [09-84]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER Z")
      (=ucs		  . #x005A)	; Z
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0179)	; Ź
    (latin-iso8859-2	. #xAC)	; &I-LATIN2-2C;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Z")
      (=ucs		  . #xFF3A)	; Ｚ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0179)	; Ｚ́
    (=jis-x0212		. #x2A75)	; Ｚ́ [10-85]
    (=jis-x0213-1	. #x2A29)	; &I-JX1-2A29; [10-09]
    (=jef-china3	. #x85EA)	; &I-JC3-85EA;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x017A)	; ｚ́
      (=jis-x0212	  . #x2B75)	; ｚ́ [11-85]
      (=jis-x0213-1	  . #x2A35)	; &I-JX1-2A35; [10-21]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER Z")
      (=ucs		  . #x007A)	; z
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x017A)	; ź
    (latin-iso8859-2	. #xBC)	; &I-LATIN2-3C;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH ACUTE")
      (=ucs		  . #x0179)	; Ź
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Z")
      (=ucs		  . #xFF5A)	; ｚ
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x017A)	; ｚ́
    (=jis-x0212		. #x2B75)	; ｚ́ [11-85]
    (=jis-x0213-1	. #x2A35)	; &I-JX1-2A35; [10-21]
    (=jef-china3	. #x86A2)	; &I-JC3-86A2;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH ACUTE")
      (=ucs		  . #x017A)	; ź
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0179)	; Ｚ́
      (=jis-x0212	  . #x2A75)	; Ｚ́ [10-85]
      (=jis-x0213-1	  . #x2A29)	; &I-JX1-2A29; [10-09]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER Z")
      (=ucs		  . #x005A)	; Z
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x017B)	; Ż
    (latin-iso8859-2	. #xAF)	; &I-LATIN2-2F;
    (latin-iso8859-3	. #xAF)	; &I-LATIN3-2F;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Z")
      (=ucs		  . #xFF3A)	; Ｚ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x017B)	; Ｚ̇
    (=jis-x0212		. #x2A77)	; Ｚ̇ [10-87]
    (=jis-x0213-1	. #x2A2B)	; &I-JX1-2A2B; [10-11]
    (=jef-china3	. #x88AF)	; &I-JC3-88AF;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x017C)	; ｚ̇
      (=jis-x0212	  . #x2B77)	; ｚ̇ [11-87]
      (=jis-x0213-1	  . #x2A38)	; &I-JX1-2A38; [10-24]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH DOT ABOVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER Z")
      (=ucs		  . #x007A)	; z
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs		. #x017C)	; ż
    (latin-iso8859-2	. #xBF)	; &I-LATIN2-3F;
    (latin-iso8859-3	. #xBF)	; &I-LATIN3-3F;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017B)	; Ż
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Z")
      (=ucs		  . #xFF5A)	; ｚ
      )
     ((name		  . "COMBINING DOT ABOVE")
      (=ucs		  . #x0307)	; ̇
      ))
    (=ucs@jis/fw	. #x017C)	; ｚ̇
    (=jis-x0212		. #x2B77)	; ｚ̇ [11-87]
    (=jis-x0213-1	. #x2A38)	; &I-JX1-2A38; [10-24]
    (=jef-china3	. #x88C4)	; &I-JC3-88C4;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH DOT ABOVE")
      (=ucs		  . #x017C)	; ż
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x017B)	; Ｚ̇
      (=jis-x0212	  . #x2A77)	; Ｚ̇ [10-87]
      (=jis-x0213-1	  . #x2A2B)	; &I-JX1-2A2B; [10-11]
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z WITH CARON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER Z")
      (=ucs		  . #x005A)	; Z
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x017D)	; Ž
    (latin-iso8859-2	. #xAE)	; &I-LATIN2-2E;
    (latin-iso8859-4	. #xAE)	; &I-LATIN4-2E;
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Z")
      (=ucs		  . #xFF3A)	; Ｚ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x017D)	; Ｚ̌
    (=jis-x0212		. #x2A76)	; Ｚ̌ [10-86]
    (=jis-x0213-1	. #x2A2A)	; &I-JX1-2A2A; [10-10]
    (=jef-china3	. #x88ED)	; &I-JC3-88ED;
    (<-fullwidth
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x017E)	; ｚ̌
      (=jis-x0212	  . #x2B76)	; ｚ̌ [11-86]
      (=jis-x0213-1	  . #x2A37)	; &I-JX1-2A37; [10-23]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z WITH CARON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "LATIN SMALL LETTER Z")
      (=ucs		  . #x007A)	; z
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs		. #x017E)	; ž
    (latin-iso8859-2	. #xBE)	; &I-LATIN2-3E;
    (latin-iso8859-4	. #xBE)	; &I-LATIN4-3E;
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z WITH CARON")
      (=ucs		  . #x017D)	; Ž
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    (=decomposition
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Z")
      (=ucs		  . #xFF5A)	; ｚ
      )
     ((name		  . "COMBINING CARON")
      (=ucs		  . #x030C)	; ̌
      ))
    (=ucs@jis/fw	. #x017E)	; ｚ̌
    (=jis-x0212		. #x2B76)	; ｚ̌ [11-86]
    (=jis-x0213-1	. #x2A37)	; &I-JX1-2A37; [10-23]
    (=jef-china3	. #x88FC)	; &I-JC3-88FC;
    (<-fullwidth
     ((name		  . "LATIN SMALL LETTER Z WITH CARON")
      (=ucs		  . #x017E)	; ž
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x017D)	; Ｚ̌
      (=jis-x0212	  . #x2A76)	; Ｚ̌ [10-86]
      (=jis-x0213-1	  . #x2A2A)	; &I-JX1-2A2A; [10-10]
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER LONG S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x017F)	; ſ
    (<-compat/formed
     ((name		  . "LATIN SMALL LETTER S")
      (=ucs		  . #x0073)	; s
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      ))
    ))
