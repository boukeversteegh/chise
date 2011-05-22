;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x0400)	; Ѐ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE WITH GRAVE")
      (=ucs		  . #x0450)	; ѐ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x0401)	; Ё
    (cyrillic-iso8859-5 . #xA1)	; &I-CYRILLIC-21;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IO")
      (=ucs		  . #x0451)	; ё
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER IO")
      (=ucs		  . #x0401)	; Ё
      ))
    (=decomposition
     ((=ucs@gb/fw	  . #x0415)	; &J90-2726;
      (=ucs@jis/fw	  . #x0415)	; &J90-2726;
      (=jis-x0208	  . #x2726)	; &J90-2726; [07-06]
      (=gb2312		  . #x2726)	; &I-G0-2726; [07-06]
      (=ks-x1001	  . #x2C26)	; &I-K0-2C26; [12-06]
      (=jis-x0213-1	  . #x2726)	; &I-JX1-2726; [07-06]
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@gb/fw		. #x0401)	; &J90-2726;̈
    (=ucs@jis/fw	. #x0401)	; &J90-2726;̈
    (=jis-x0208		. #x2727)	; &J90-2726;̈ [07-07]
    (=gb2312		. #x2727)	; &I-G0-2727; [07-07]
    (=ks-x1001		. #x2C27)	; &I-K0-2C27; [12-07]
    (=jis-x0213-1	. #x2727)	; &I-JX1-2727; [07-07]
    (=big5-eten		. #xC7F9)	; &I-B-C7F9;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER IO")
      (=ucs		  . #x0401)	; Ё
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0451)	; &J90-2756;̈
      (=ucs@jis/fw	  . #x0451)	; &J90-2756;̈
      (=jis-x0208	  . #x2757)	; &J90-2756;̈ [07-55]
      (=gb2312		  . #x2757)	; &I-G0-2757; [07-55]
      (=ks-x1001	  . #x2C57)	; &I-K0-2C57; [12-55]
      (=jis-x0213-1	  . #x2757)	; &I-JX1-2757; [07-55]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (=ucs		. #x0402)	; Ђ
    (cyrillic-iso8859-5 . #xA2)	; &I-CYRILLIC-22;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DJE")
      (=ucs		  . #x0452)	; ђ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER DJE")
      (=ucs		  . #x0402)	; Ђ
      ))
    (=ucs@jis/fw	. #x0402)	; &JSP-2742;
    (=jis-x0212		. #x2742)	; &JSP-2742; [07-34]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DJE")
      (=ucs		  . #x0402)	; Ђ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0452)	; &JSP-2772;
      (=jis-x0212	  . #x2772)	; &JSP-2772; [07-82]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Г
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0403)	; Ѓ
    (cyrillic-iso8859-5 . #xA3)	; &I-CYRILLIC-23;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GJE")
      (=ucs		  . #x0453)	; ѓ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER GJE")
      (=ucs		  . #x0403)	; Ѓ
      ))
    (=decomposition
     ((=ucs@gb/fw	  . #x0413)	; &J90-2724;
      (=ucs@jis/fw	  . #x0413)	; &J90-2724;
      (=jis-x0208	  . #x2724)	; &J90-2724; [07-04]
      (=gb2312		  . #x2724)	; &I-G0-2724; [07-04]
      (=ks-x1001	  . #x2C24)	; &I-K0-2C24; [12-04]
      (=jis-x0213-1	  . #x2724)	; &I-JX1-2724; [07-04]
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0403)	; &J90-2724;́
    (=jis-x0212		. #x2743)	; &J90-2724;́ [07-35]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER GJE")
      (=ucs		  . #x0403)	; Ѓ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0453)	; &J90-2754;́
      (=jis-x0212	  . #x2773)	; &J90-2754;́ [07-83]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0404)	; Є
    (cyrillic-iso8859-5 . #xA4)	; &I-CYRILLIC-24;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=ucs		  . #x0454)	; є
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=ucs		  . #x0404)	; Є
      ))
    (=ucs@jis/fw	. #x0404)	; &JSP-2744;
    (=jis-x0212		. #x2744)	; &JSP-2744; [07-36]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=ucs		  . #x0404)	; Є
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0454)	; &JSP-2774;
      (=jis-x0212	  . #x2774)	; &JSP-2774; [07-84]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0405)	; Ѕ
    (cyrillic-iso8859-5 . #xA5)	; &I-CYRILLIC-25;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DZE")
      (=ucs		  . #x0455)	; ѕ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER DZE")
      (=ucs		  . #x0405)	; Ѕ
      ))
    (=ucs@jis/fw	. #x0405)	; &JSP-2745;
    (=jis-x0212		. #x2745)	; &JSP-2745; [07-37]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DZE")
      (=ucs		  . #x0405)	; Ѕ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0455)	; &JSP-2775;
      (=jis-x0212	  . #x2775)	; &JSP-2775; [07-85]
      ))
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0406)	; І
    (cyrillic-iso8859-5 . #xA6)	; &I-CYRILLIC-26;
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; і
      ))
    ))
(define-char
  '((<-denotational
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; І
      ))
    (=ucs@jis/fw	. #x0406)	; &JSP-2746;
    (=jis-x0212		. #x2746)	; &JSP-2746; [07-38]
    (<-fullwidth
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; І
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0456)	; &JSP-2776;
      (=jis-x0212	  . #x2776)	; &JSP-2776; [07-86]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (=decomposition
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; І
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x0407)	; Ї
    (cyrillic-iso8859-5 . #xA7)	; &I-CYRILLIC-27;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YI")
      (=ucs		  . #x0457)	; ї
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER YI")
      (=ucs		  . #x0407)	; Ї
      ))
    (=decomposition
     ((=ucs@jis/fw	  . #x0406)	; &JSP-2746;
      (=jis-x0212	  . #x2746)	; &JSP-2746; [07-38]
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x0407)	; &JSP-2746;̈
    (=jis-x0212		. #x2747)	; &JSP-2746;̈ [07-39]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YI")
      (=ucs		  . #x0407)	; Ї
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0457)	; &JSP-2776;̈
      (=jis-x0212	  . #x2777)	; &JSP-2776;̈ [07-87]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER JE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0408)	; Ј
    (cyrillic-iso8859-5 . #xA8)	; &I-CYRILLIC-28;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER JE")
      (=ucs		  . #x0458)	; ј
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER JE")
      (=ucs		  . #x0408)	; Ј
      ))
    (=ucs@jis/fw	. #x0408)	; &JSP-2748;
    (=jis-x0212		. #x2748)	; &JSP-2748; [07-40]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER JE")
      (=ucs		  . #x0408)	; Ј
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0458)	; &JSP-2778;
      (=jis-x0212	  . #x2778)	; &JSP-2778; [07-88]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0409)	; Љ
    (cyrillic-iso8859-5 . #xA9)	; &I-CYRILLIC-29;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER LJE")
      (=ucs		  . #x0459)	; љ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER LJE")
      (=ucs		  . #x0409)	; Љ
      ))
    (=ucs@jis/fw	. #x0409)	; &JSP-2749;
    (=jis-x0212		. #x2749)	; &JSP-2749; [07-41]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER LJE")
      (=ucs		  . #x0409)	; Љ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x0459)	; &JSP-2779;
      (=jis-x0212	  . #x2779)	; &JSP-2779; [07-89]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER NJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x040A)	; Њ
    (cyrillic-iso8859-5 . #xAA)	; &I-CYRILLIC-2A;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER NJE")
      (=ucs		  . #x045A)	; њ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER NJE")
      (=ucs		  . #x040A)	; Њ
      ))
    (=ucs@jis/fw	. #x040A)	; &JSP-274A;
    (=jis-x0212		. #x274A)	; &JSP-274A; [07-42]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER NJE")
      (=ucs		  . #x040A)	; Њ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x045A)	; &JSP-277A;
      (=jis-x0212	  . #x277A)	; &JSP-277A; [07-90]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (=ucs		. #x040B)	; Ћ
    (cyrillic-iso8859-5 . #xAB)	; &I-CYRILLIC-2B;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TSHE")
      (=ucs		  . #x045B)	; ћ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER TSHE")
      (=ucs		  . #x040B)	; Ћ
      ))
    (=ucs@jis/fw	. #x040B)	; &JSP-274B;
    (=jis-x0212		. #x274B)	; &JSP-274B; [07-43]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER TSHE")
      (=ucs		  . #x040B)	; Ћ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x045B)	; &JSP-277B;
      (=jis-x0212	  . #x277B)	; &JSP-277B; [07-91]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KJE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; К
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x040C)	; Ќ
    (cyrillic-iso8859-5 . #xAC)	; &I-CYRILLIC-2C;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KJE")
      (=ucs		  . #x045C)	; ќ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER KJE")
      (=ucs		  . #x040C)	; Ќ
      ))
    (=ucs@jis/fw	. #x040C)	; &JSP-274C;
    (=jis-x0212		. #x274C)	; &JSP-274C; [07-44]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER KJE")
      (=ucs		  . #x040C)	; Ќ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x045C)	; &J90-275C;́
      (=jis-x0212	  . #x277C)	; &J90-275C;́ [07-92]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH GRAVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x040D)	; Ѝ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH GRAVE")
      (=ucs		  . #x045D)	; ѝ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHORT U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x040E)	; Ў
    (cyrillic-iso8859-5 . #xAE)	; &I-CYRILLIC-2E;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHORT U")
      (=ucs		  . #x045E)	; ў
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT U")
      (=ucs		  . #x040E)	; Ў
      ))
    (=ucs@jis/fw	. #x040E)	; &JSP-274D;
    (=jis-x0212		. #x274D)	; &JSP-274D; [07-45]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT U")
      (=ucs		  . #x040E)	; Ў
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x045E)	; &J90-2765;̆
      (=jis-x0212	  . #x277D)	; &J90-2765;̆ [07-93]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DZHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x040F)	; Џ
    (cyrillic-iso8859-5 . #xAF)	; &I-CYRILLIC-2F;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DZHE")
      (=ucs		  . #x045F)	; џ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER DZHE")
      (=ucs		  . #x040F)	; Џ
      ))
    (=ucs@jis/fw	. #x040F)	; &JSP-274E;
    (=jis-x0212		. #x274E)	; &JSP-274E; [07-46]
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DZHE")
      (=ucs		  . #x040F)	; Џ
      ))
    (->lowercase
     ((=ucs@jis/fw	  . #x045F)	; &JSP-277E;
      (=jis-x0212	  . #x277E)	; &JSP-277E; [07-94]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0410)	; А
    (cyrillic-iso8859-5 . #xB0)	; &I-CYRILLIC-30;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; а
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; А
      ))
    (=ucs@gb/fw		. #x0410)	; &J90-2721;
    (=ucs@jis/fw	. #x0410)	; &J90-2721;
    (=jis-x0208		. #x2721)	; &J90-2721; [07-01]
    (=gb2312		. #x2721)	; &I-G0-2721; [07-01]
    (=ks-x1001		. #x2C21)	; &I-K0-2C21; [12-01]
    (=jis-x0213-1	. #x2721)	; &I-JX1-2721; [07-01]
    (=big5-eten		. #xC7F3)	; &I-B-C7F3;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; А
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0430)	; &J90-2751;
      (=ucs@jis/fw	  . #x0430)	; &J90-2751;
      (=jis-x0208	  . #x2751)	; &J90-2751; [07-49]
      (=gb2312		  . #x2751)	; &I-G0-2751; [07-49]
      (=ks-x1001	  . #x2C51)	; &I-K0-2C51; [12-49]
      (=jis-x0213-1	  . #x2751)	; &I-JX1-2751; [07-49]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0411)	; Б
    (cyrillic-iso8859-5 . #xB1)	; &I-CYRILLIC-31;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BE")
      (=ucs		  . #x0431)	; б
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER BE")
      (=ucs		  . #x0411)	; Б
      ))
    (=ucs@gb/fw		. #x0411)	; &J90-2722;
    (=ucs@jis/fw	. #x0411)	; &J90-2722;
    (=jis-x0208		. #x2722)	; &J90-2722; [07-02]
    (=gb2312		. #x2722)	; &I-G0-2722; [07-02]
    (=ks-x1001		. #x2C22)	; &I-K0-2C22; [12-02]
    (=jis-x0213-1	. #x2722)	; &I-JX1-2722; [07-02]
    (=big5-eten		. #xC7F4)	; &I-B-C7F4;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER BE")
      (=ucs		  . #x0411)	; Б
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0431)	; &J90-2752;
      (=ucs@jis/fw	  . #x0431)	; &J90-2752;
      (=jis-x0208	  . #x2752)	; &J90-2752; [07-50]
      (=gb2312		  . #x2752)	; &I-G0-2752; [07-50]
      (=ks-x1001	  . #x2C52)	; &I-K0-2C52; [12-50]
      (=jis-x0213-1	  . #x2752)	; &I-JX1-2752; [07-50]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER VE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0412)	; В
    (cyrillic-iso8859-5 . #xB2)	; &I-CYRILLIC-32;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER VE")
      (=ucs		  . #x0432)	; в
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER VE")
      (=ucs		  . #x0412)	; В
      ))
    (=ucs@gb/fw		. #x0412)	; &J90-2723;
    (=ucs@jis/fw	. #x0412)	; &J90-2723;
    (=jis-x0208		. #x2723)	; &J90-2723; [07-03]
    (=gb2312		. #x2723)	; &I-G0-2723; [07-03]
    (=ks-x1001		. #x2C23)	; &I-K0-2C23; [12-03]
    (=jis-x0213-1	. #x2723)	; &I-JX1-2723; [07-03]
    (=big5-eten		. #xC7F5)	; &I-B-C7F5;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER VE")
      (=ucs		  . #x0412)	; В
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0432)	; &J90-2753;
      (=ucs@jis/fw	  . #x0432)	; &J90-2753;
      (=jis-x0208	  . #x2753)	; &J90-2753; [07-51]
      (=gb2312		  . #x2753)	; &I-G0-2753; [07-51]
      (=ks-x1001	  . #x2C53)	; &I-K0-2C53; [12-51]
      (=jis-x0213-1	  . #x2753)	; &I-JX1-2753; [07-51]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0413)	; Г
    (cyrillic-iso8859-5 . #xB3)	; &I-CYRILLIC-33;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; г
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Г
      ))
    (=ucs@gb/fw		. #x0413)	; &J90-2724;
    (=ucs@jis/fw	. #x0413)	; &J90-2724;
    (=jis-x0208		. #x2724)	; &J90-2724; [07-04]
    (=gb2312		. #x2724)	; &I-G0-2724; [07-04]
    (=ks-x1001		. #x2C24)	; &I-K0-2C24; [12-04]
    (=jis-x0213-1	. #x2724)	; &I-JX1-2724; [07-04]
    (=big5-eten		. #xC7F6)	; &I-B-C7F6;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Г
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0433)	; &J90-2754;
      (=ucs@jis/fw	  . #x0433)	; &J90-2754;
      (=jis-x0208	  . #x2754)	; &J90-2754; [07-52]
      (=gb2312		  . #x2754)	; &I-G0-2754; [07-52]
      (=ks-x1001	  . #x2C54)	; &I-K0-2C54; [12-52]
      (=jis-x0213-1	  . #x2754)	; &I-JX1-2754; [07-52]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER DE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0414)	; Д
    (cyrillic-iso8859-5 . #xB4)	; &I-CYRILLIC-34;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER DE")
      (=ucs		  . #x0434)	; д
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER DE")
      (=ucs		  . #x0414)	; Д
      ))
    (=ucs@gb/fw		. #x0414)	; &J90-2725;
    (=ucs@jis/fw	. #x0414)	; &J90-2725;
    (=jis-x0208		. #x2725)	; &J90-2725; [07-05]
    (=gb2312		. #x2725)	; &I-G0-2725; [07-05]
    (=ks-x1001		. #x2C25)	; &I-K0-2C25; [12-05]
    (=jis-x0213-1	. #x2725)	; &I-JX1-2725; [07-05]
    (=big5-eten		. #xC7F7)	; &I-B-C7F7;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER DE")
      (=ucs		  . #x0414)	; Д
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0434)	; &J90-2755;
      (=ucs@jis/fw	  . #x0434)	; &J90-2755;
      (=jis-x0208	  . #x2755)	; &J90-2755; [07-53]
      (=gb2312		  . #x2755)	; &I-G0-2755; [07-53]
      (=ks-x1001	  . #x2C55)	; &I-K0-2C55; [12-53]
      (=jis-x0213-1	  . #x2755)	; &I-JX1-2755; [07-53]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0415)	; Е
    (cyrillic-iso8859-5 . #xB5)	; &I-CYRILLIC-35;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      ))
    (=ucs@gb/fw		. #x0415)	; &J90-2726;
    (=ucs@jis/fw	. #x0415)	; &J90-2726;
    (=jis-x0208		. #x2726)	; &J90-2726; [07-06]
    (=gb2312		. #x2726)	; &I-G0-2726; [07-06]
    (=ks-x1001		. #x2C26)	; &I-K0-2C26; [12-06]
    (=jis-x0213-1	. #x2726)	; &I-JX1-2726; [07-06]
    (=big5-eten		. #xC7F8)	; &I-B-C7F8;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0435)	; &J90-2756;
      (=ucs@jis/fw	  . #x0435)	; &J90-2756;
      (=jis-x0208	  . #x2756)	; &J90-2756; [07-54]
      (=gb2312		  . #x2756)	; &I-G0-2756; [07-54]
      (=ks-x1001	  . #x2C56)	; &I-K0-2C56; [12-54]
      (=jis-x0213-1	  . #x2756)	; &I-JX1-2756; [07-54]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0416)	; Ж
    (cyrillic-iso8859-5 . #xB6)	; &I-CYRILLIC-36;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; ж
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ж
      ))
    (=ucs@gb/fw		. #x0416)	; &J90-2728;
    (=ucs@jis/fw	. #x0416)	; &J90-2728;
    (=jis-x0208		. #x2728)	; &J90-2728; [07-08]
    (=gb2312		. #x2728)	; &I-G0-2728; [07-08]
    (=ks-x1001		. #x2C28)	; &I-K0-2C28; [12-08]
    (=jis-x0213-1	. #x2728)	; &I-JX1-2728; [07-08]
    (=big5-eten		. #xC7FA)	; &I-B-C7FA;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ж
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0436)	; &J90-2758;
      (=ucs@jis/fw	  . #x0436)	; &J90-2758;
      (=jis-x0208	  . #x2758)	; &J90-2758; [07-56]
      (=gb2312		  . #x2758)	; &I-G0-2758; [07-56]
      (=ks-x1001	  . #x2C58)	; &I-K0-2C58; [12-56]
      (=jis-x0213-1	  . #x2758)	; &I-JX1-2758; [07-56]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0417)	; З
    (cyrillic-iso8859-5 . #xB7)	; &I-CYRILLIC-37;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; з
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; З
      ))
    (=ucs@gb/fw		. #x0417)	; &J90-2729;
    (=ucs@jis/fw	. #x0417)	; &J90-2729;
    (=jis-x0208		. #x2729)	; &J90-2729; [07-09]
    (=gb2312		. #x2729)	; &I-G0-2729; [07-09]
    (=ks-x1001		. #x2C29)	; &I-K0-2C29; [12-09]
    (=jis-x0213-1	. #x2729)	; &I-JX1-2729; [07-09]
    (=big5-eten		. #xC7FB)	; &I-B-C7FB;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; З
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0437)	; &J90-2759;
      (=ucs@jis/fw	  . #x0437)	; &J90-2759;
      (=jis-x0208	  . #x2759)	; &J90-2759; [07-57]
      (=gb2312		  . #x2759)	; &I-G0-2759; [07-57]
      (=ks-x1001	  . #x2C59)	; &I-K0-2C59; [12-57]
      (=jis-x0213-1	  . #x2759)	; &I-JX1-2759; [07-57]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0418)	; И
    (cyrillic-iso8859-5 . #xB8)	; &I-CYRILLIC-38;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      ))
    (=ucs@gb/fw		. #x0418)	; &J90-272A;
    (=ucs@jis/fw	. #x0418)	; &J90-272A;
    (=jis-x0208		. #x272A)	; &J90-272A; [07-10]
    (=gb2312		. #x272A)	; &I-G0-272A; [07-10]
    (=ks-x1001		. #x2C2A)	; &I-K0-2C2A; [12-10]
    (=jis-x0213-1	. #x272A)	; &I-JX1-272A; [07-10]
    (=big5-eten		. #xC7FC)	; &I-B-C7FC;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0438)	; &J90-275A;
      (=ucs@jis/fw	  . #x0438)	; &J90-275A;
      (=jis-x0208	  . #x275A)	; &J90-275A; [07-58]
      (=gb2312		  . #x275A)	; &I-G0-275A; [07-58]
      (=ks-x1001	  . #x2C5A)	; &I-K0-2C5A; [12-58]
      (=jis-x0213-1	  . #x275A)	; &I-JX1-275A; [07-58]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHORT I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x0419)	; Й
    (cyrillic-iso8859-5 . #xB9)	; &I-CYRILLIC-39;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHORT I")
      (=ucs		  . #x0439)	; й
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT I")
      (=ucs		  . #x0419)	; Й
      ))
    (=ucs@gb/fw		. #x0419)	; &J90-272B;
    (=ucs@jis/fw	. #x0419)	; &J90-272B;
    (=jis-x0208		. #x272B)	; &J90-272B; [07-11]
    (=gb2312		. #x272B)	; &I-G0-272B; [07-11]
    (=ks-x1001		. #x2C2B)	; &I-K0-2C2B; [12-11]
    (=jis-x0213-1	. #x272B)	; &I-JX1-272B; [07-11]
    (=big5-eten		. #xC7FD)	; &I-B-C7FD;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT I")
      (=ucs		  . #x0419)	; Й
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0439)	; &J90-275A;̆
      (=ucs@jis/fw	  . #x0439)	; &J90-275A;̆
      (=jis-x0208	  . #x275B)	; &J90-275A;̆ [07-59]
      (=gb2312		  . #x275B)	; &I-G0-275B; [07-59]
      (=ks-x1001	  . #x2C5B)	; &I-K0-2C5B; [12-59]
      (=jis-x0213-1	  . #x275B)	; &I-JX1-275B; [07-59]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x041A)	; К
    (cyrillic-iso8859-5 . #xBA)	; &I-CYRILLIC-3A;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; к
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; К
      ))
    (=ucs@gb/fw		. #x041A)	; &J90-272C;
    (=ucs@jis/fw	. #x041A)	; &J90-272C;
    (=jis-x0208		. #x272C)	; &J90-272C; [07-12]
    (=gb2312		. #x272C)	; &I-G0-272C; [07-12]
    (=ks-x1001		. #x2C2C)	; &I-K0-2C2C; [12-12]
    (=jis-x0213-1	. #x272C)	; &I-JX1-272C; [07-12]
    (=big5-eten		. #xC7FE)	; &I-B-C7FE;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; К
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x043A)	; &J90-275C;
      (=ucs@jis/fw	  . #x043A)	; &J90-275C;
      (=jis-x0208	  . #x275C)	; &J90-275C; [07-60]
      (=gb2312		  . #x275C)	; &I-G0-275C; [07-60]
      (=ks-x1001	  . #x2C5C)	; &I-K0-2C5C; [12-60]
      (=jis-x0213-1	  . #x275C)	; &I-JX1-275C; [07-60]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EL")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x041B)	; Л
    (cyrillic-iso8859-5 . #xBB)	; &I-CYRILLIC-3B;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EL")
      (=ucs		  . #x043B)	; л
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER EL")
      (=ucs		  . #x041B)	; Л
      ))
    (=ucs@gb/fw		. #x041B)	; &J90-272D;
    (=ucs@jis/fw	. #x041B)	; &J90-272D;
    (=jis-x0208		. #x272D)	; &J90-272D; [07-13]
    (=gb2312		. #x272D)	; &I-G0-272D; [07-13]
    (=ks-x1001		. #x2C2D)	; &I-K0-2C2D; [12-13]
    (=jis-x0213-1	. #x272D)	; &I-JX1-272D; [07-13]
    (=big5-eten		. #xC840)	; &I-B-C840;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EL")
      (=ucs		  . #x041B)	; Л
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x043B)	; &J90-275D;
      (=ucs@jis/fw	  . #x043B)	; &J90-275D;
      (=jis-x0208	  . #x275D)	; &J90-275D; [07-61]
      (=gb2312		  . #x275D)	; &I-G0-275D; [07-61]
      (=ks-x1001	  . #x2C5D)	; &I-K0-2C5D; [12-61]
      (=jis-x0213-1	  . #x275D)	; &I-JX1-275D; [07-61]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EM")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x041C)	; М
    (cyrillic-iso8859-5 . #xBC)	; &I-CYRILLIC-3C;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EM")
      (=ucs		  . #x043C)	; м
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER EM")
      (=ucs		  . #x041C)	; М
      ))
    (=ucs@gb/fw		. #x041C)	; &J90-272E;
    (=ucs@jis/fw	. #x041C)	; &J90-272E;
    (=jis-x0208		. #x272E)	; &J90-272E; [07-14]
    (=gb2312		. #x272E)	; &I-G0-272E; [07-14]
    (=ks-x1001		. #x2C2E)	; &I-K0-2C2E; [12-14]
    (=jis-x0213-1	. #x272E)	; &I-JX1-272E; [07-14]
    (=big5-eten		. #xC841)	; &I-B-C841;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EM")
      (=ucs		  . #x041C)	; М
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x043C)	; &J90-275E;
      (=ucs@jis/fw	  . #x043C)	; &J90-275E;
      (=jis-x0208	  . #x275E)	; &J90-275E; [07-62]
      (=gb2312		  . #x275E)	; &I-G0-275E; [07-62]
      (=ks-x1001	  . #x2C5E)	; &I-K0-2C5E; [12-62]
      (=jis-x0213-1	  . #x275E)	; &I-JX1-275E; [07-62]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x041D)	; Н
    (cyrillic-iso8859-5 . #xBD)	; &I-CYRILLIC-3D;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN")
      (=ucs		  . #x043D)	; н
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER EN")
      (=ucs		  . #x041D)	; Н
      ))
    (=ucs@gb/fw		. #x041D)	; &J90-272F;
    (=ucs@jis/fw	. #x041D)	; &J90-272F;
    (=jis-x0208		. #x272F)	; &J90-272F; [07-15]
    (=gb2312		. #x272F)	; &I-G0-272F; [07-15]
    (=ks-x1001		. #x2C2F)	; &I-K0-2C2F; [12-15]
    (=jis-x0213-1	. #x272F)	; &I-JX1-272F; [07-15]
    (=big5-eten		. #xC842)	; &I-B-C842;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EN")
      (=ucs		  . #x041D)	; Н
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x043D)	; &J90-275F;
      (=ucs@jis/fw	  . #x043D)	; &J90-275F;
      (=jis-x0208	  . #x275F)	; &J90-275F; [07-63]
      (=gb2312		  . #x275F)	; &I-G0-275F; [07-63]
      (=ks-x1001	  . #x2C5F)	; &I-K0-2C5F; [12-63]
      (=jis-x0213-1	  . #x275F)	; &I-JX1-275F; [07-63]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x041E)	; О
    (cyrillic-iso8859-5 . #xBE)	; &I-CYRILLIC-3E;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; о
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; О
      ))
    (=ucs@gb/fw		. #x041E)	; &J90-2730;
    (=ucs@jis/fw	. #x041E)	; &J90-2730;
    (=jis-x0208		. #x2730)	; &J90-2730; [07-16]
    (=gb2312		. #x2730)	; &I-G0-2730; [07-16]
    (=ks-x1001		. #x2C30)	; &I-K0-2C30; [12-16]
    (=jis-x0213-1	. #x2730)	; &I-JX1-2730; [07-16]
    (=big5-eten		. #xC843)	; &I-B-C843;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; О
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x043E)	; &J90-2760;
      (=ucs@jis/fw	  . #x043E)	; &J90-2760;
      (=jis-x0208	  . #x2760)	; &J90-2760; [07-64]
      (=gb2312		  . #x2760)	; &I-G0-2760; [07-64]
      (=ks-x1001	  . #x2C60)	; &I-K0-2C60; [12-64]
      (=jis-x0213-1	  . #x2760)	; &I-JX1-2760; [07-64]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x041F)	; П
    (cyrillic-iso8859-5 . #xBF)	; &I-CYRILLIC-3F;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PE")
      (=ucs		  . #x043F)	; п
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER PE")
      (=ucs		  . #x041F)	; П
      ))
    (=ucs@gb/fw		. #x041F)	; &J90-2731;
    (=ucs@jis/fw	. #x041F)	; &J90-2731;
    (=jis-x0208		. #x2731)	; &J90-2731; [07-17]
    (=gb2312		. #x2731)	; &I-G0-2731; [07-17]
    (=ks-x1001		. #x2C31)	; &I-K0-2C31; [12-17]
    (=jis-x0213-1	. #x2731)	; &I-JX1-2731; [07-17]
    (=big5-eten		. #xC844)	; &I-B-C844;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER PE")
      (=ucs		  . #x041F)	; П
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x043F)	; &J90-2761;
      (=ucs@jis/fw	  . #x043F)	; &J90-2761;
      (=jis-x0208	  . #x2761)	; &J90-2761; [07-65]
      (=gb2312		  . #x2761)	; &I-G0-2761; [07-65]
      (=ks-x1001	  . #x2C61)	; &I-K0-2C61; [12-65]
      (=jis-x0213-1	  . #x2761)	; &I-JX1-2761; [07-65]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0420)	; Р
    (cyrillic-iso8859-5 . #xC0)	; &I-CYRILLIC-40;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ER")
      (=ucs		  . #x0440)	; р
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER ER")
      (=ucs		  . #x0420)	; Р
      ))
    (=ucs@gb/fw		. #x0420)	; &J90-2732;
    (=ucs@jis/fw	. #x0420)	; &J90-2732;
    (=jis-x0208		. #x2732)	; &J90-2732; [07-18]
    (=gb2312		. #x2732)	; &I-G0-2732; [07-18]
    (=ks-x1001		. #x2C32)	; &I-K0-2C32; [12-18]
    (=jis-x0213-1	. #x2732)	; &I-JX1-2732; [07-18]
    (=big5-eten		. #xC845)	; &I-B-C845;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ER")
      (=ucs		  . #x0420)	; Р
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0440)	; &J90-2762;
      (=ucs@jis/fw	  . #x0440)	; &J90-2762;
      (=jis-x0208	  . #x2762)	; &J90-2762; [07-66]
      (=gb2312		  . #x2762)	; &I-G0-2762; [07-66]
      (=ks-x1001	  . #x2C62)	; &I-K0-2C62; [12-66]
      (=jis-x0213-1	  . #x2762)	; &I-JX1-2762; [07-66]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0421)	; С
    (cyrillic-iso8859-5 . #xC1)	; &I-CYRILLIC-41;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ES")
      (=ucs		  . #x0441)	; с
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER ES")
      (=ucs		  . #x0421)	; С
      ))
    (=ucs@gb/fw		. #x0421)	; &J90-2733;
    (=ucs@jis/fw	. #x0421)	; &J90-2733;
    (=jis-x0208		. #x2733)	; &J90-2733; [07-19]
    (=gb2312		. #x2733)	; &I-G0-2733; [07-19]
    (=ks-x1001		. #x2C33)	; &I-K0-2C33; [12-19]
    (=jis-x0213-1	. #x2733)	; &I-JX1-2733; [07-19]
    (=big5-eten		. #xC846)	; &I-B-C846;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER ES")
      (=ucs		  . #x0421)	; С
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0441)	; &J90-2763;
      (=ucs@jis/fw	  . #x0441)	; &J90-2763;
      (=jis-x0208	  . #x2763)	; &J90-2763; [07-67]
      (=gb2312		  . #x2763)	; &I-G0-2763; [07-67]
      (=ks-x1001	  . #x2C63)	; &I-K0-2C63; [12-67]
      (=jis-x0213-1	  . #x2763)	; &I-JX1-2763; [07-67]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0422)	; Т
    (cyrillic-iso8859-5 . #xC2)	; &I-CYRILLIC-42;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TE")
      (=ucs		  . #x0442)	; т
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER TE")
      (=ucs		  . #x0422)	; Т
      ))
    (=ucs@gb/fw		. #x0422)	; &J90-2734;
    (=ucs@jis/fw	. #x0422)	; &J90-2734;
    (=jis-x0208		. #x2734)	; &J90-2734; [07-20]
    (=gb2312		. #x2734)	; &I-G0-2734; [07-20]
    (=ks-x1001		. #x2C34)	; &I-K0-2C34; [12-20]
    (=jis-x0213-1	. #x2734)	; &I-JX1-2734; [07-20]
    (=big5-eten		. #xC847)	; &I-B-C847;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER TE")
      (=ucs		  . #x0422)	; Т
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0442)	; &J90-2764;
      (=ucs@jis/fw	  . #x0442)	; &J90-2764;
      (=jis-x0208	  . #x2764)	; &J90-2764; [07-68]
      (=gb2312		  . #x2764)	; &I-G0-2764; [07-68]
      (=ks-x1001	  . #x2C64)	; &I-K0-2C64; [12-68]
      (=jis-x0213-1	  . #x2764)	; &I-JX1-2764; [07-68]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0423)	; У
    (cyrillic-iso8859-5 . #xC3)	; &I-CYRILLIC-43;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      ))
    (=ucs@gb/fw		. #x0423)	; &J90-2735;
    (=ucs@jis/fw	. #x0423)	; &J90-2735;
    (=jis-x0208		. #x2735)	; &J90-2735; [07-21]
    (=gb2312		. #x2735)	; &I-G0-2735; [07-21]
    (=ks-x1001		. #x2C35)	; &I-K0-2C35; [12-21]
    (=jis-x0213-1	. #x2735)	; &I-JX1-2735; [07-21]
    (=big5-eten		. #xC848)	; &I-B-C848;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0443)	; &J90-2765;
      (=ucs@jis/fw	  . #x0443)	; &J90-2765;
      (=jis-x0208	  . #x2765)	; &J90-2765; [07-69]
      (=gb2312		  . #x2765)	; &I-G0-2765; [07-69]
      (=ks-x1001	  . #x2C65)	; &I-K0-2C65; [12-69]
      (=jis-x0213-1	  . #x2765)	; &I-JX1-2765; [07-69]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EF")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0424)	; Ф
    (cyrillic-iso8859-5 . #xC4)	; &I-CYRILLIC-44;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EF")
      (=ucs		  . #x0444)	; ф
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER EF")
      (=ucs		  . #x0424)	; Ф
      ))
    (=ucs@gb/fw		. #x0424)	; &J90-2736;
    (=ucs@jis/fw	. #x0424)	; &J90-2736;
    (=jis-x0208		. #x2736)	; &J90-2736; [07-22]
    (=gb2312		. #x2736)	; &I-G0-2736; [07-22]
    (=ks-x1001		. #x2C36)	; &I-K0-2C36; [12-22]
    (=jis-x0213-1	. #x2736)	; &I-JX1-2736; [07-22]
    (=big5-eten		. #xC849)	; &I-B-C849;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER EF")
      (=ucs		  . #x0424)	; Ф
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0444)	; &J90-2766;
      (=ucs@jis/fw	  . #x0444)	; &J90-2766;
      (=jis-x0208	  . #x2766)	; &J90-2766; [07-70]
      (=gb2312		  . #x2766)	; &I-G0-2766; [07-70]
      (=ks-x1001	  . #x2C66)	; &I-K0-2C66; [12-70]
      (=jis-x0213-1	  . #x2766)	; &I-JX1-2766; [07-70]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0425)	; Х
    (cyrillic-iso8859-5 . #xC5)	; &I-CYRILLIC-45;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HA")
      (=ucs		  . #x0445)	; х
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER HA")
      (=ucs		  . #x0425)	; Х
      ))
    (=ucs@gb/fw		. #x0425)	; &J90-2737;
    (=ucs@jis/fw	. #x0425)	; &J90-2737;
    (=jis-x0208		. #x2737)	; &J90-2737; [07-23]
    (=gb2312		. #x2737)	; &I-G0-2737; [07-23]
    (=ks-x1001		. #x2C37)	; &I-K0-2C37; [12-23]
    (=jis-x0213-1	. #x2737)	; &I-JX1-2737; [07-23]
    (=big5-eten		. #xC84A)	; &I-B-C84A;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER HA")
      (=ucs		  . #x0425)	; Х
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0445)	; &J90-2767;
      (=ucs@jis/fw	  . #x0445)	; &J90-2767;
      (=jis-x0208	  . #x2767)	; &J90-2767; [07-71]
      (=gb2312		  . #x2767)	; &I-G0-2767; [07-71]
      (=ks-x1001	  . #x2C67)	; &I-K0-2C67; [12-71]
      (=jis-x0213-1	  . #x2767)	; &I-JX1-2767; [07-71]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TSE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0426)	; Ц
    (cyrillic-iso8859-5 . #xC6)	; &I-CYRILLIC-46;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TSE")
      (=ucs		  . #x0446)	; ц
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER TSE")
      (=ucs		  . #x0426)	; Ц
      ))
    (=ucs@gb/fw		. #x0426)	; &J90-2738;
    (=ucs@jis/fw	. #x0426)	; &J90-2738;
    (=jis-x0208		. #x2738)	; &J90-2738; [07-24]
    (=gb2312		. #x2738)	; &I-G0-2738; [07-24]
    (=ks-x1001		. #x2C38)	; &I-K0-2C38; [12-24]
    (=jis-x0213-1	. #x2738)	; &I-JX1-2738; [07-24]
    (=big5-eten		. #xC84B)	; &I-B-C84B;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER TSE")
      (=ucs		  . #x0426)	; Ц
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0446)	; &J90-2768;
      (=ucs@jis/fw	  . #x0446)	; &J90-2768;
      (=jis-x0208	  . #x2768)	; &J90-2768; [07-72]
      (=gb2312		  . #x2768)	; &I-G0-2768; [07-72]
      (=ks-x1001	  . #x2C68)	; &I-K0-2C68; [12-72]
      (=jis-x0213-1	  . #x2768)	; &I-JX1-2768; [07-72]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0427)	; Ч
    (cyrillic-iso8859-5 . #xC7)	; &I-CYRILLIC-47;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; ч
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ч
      ))
    (=ucs@gb/fw		. #x0427)	; &J90-2739;
    (=ucs@jis/fw	. #x0427)	; &J90-2739;
    (=jis-x0208		. #x2739)	; &J90-2739; [07-25]
    (=gb2312		. #x2739)	; &I-G0-2739; [07-25]
    (=ks-x1001		. #x2C39)	; &I-K0-2C39; [12-25]
    (=jis-x0213-1	. #x2739)	; &I-JX1-2739; [07-25]
    (=big5-eten		. #xC84C)	; &I-B-C84C;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ч
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0447)	; &J90-2769;
      (=ucs@jis/fw	  . #x0447)	; &J90-2769;
      (=jis-x0208	  . #x2769)	; &J90-2769; [07-73]
      (=gb2312		  . #x2769)	; &I-G0-2769; [07-73]
      (=ks-x1001	  . #x2C69)	; &I-K0-2C69; [12-73]
      (=jis-x0213-1	  . #x2769)	; &I-JX1-2769; [07-73]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0428)	; Ш
    (cyrillic-iso8859-5 . #xC8)	; &I-CYRILLIC-48;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHA")
      (=ucs		  . #x0448)	; ш
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER SHA")
      (=ucs		  . #x0428)	; Ш
      ))
    (=ucs@gb/fw		. #x0428)	; &J90-273A;
    (=ucs@jis/fw	. #x0428)	; &J90-273A;
    (=jis-x0208		. #x273A)	; &J90-273A; [07-26]
    (=gb2312		. #x273A)	; &I-G0-273A; [07-26]
    (=ks-x1001		. #x2C3A)	; &I-K0-2C3A; [12-26]
    (=jis-x0213-1	. #x273A)	; &I-JX1-273A; [07-26]
    (=big5-eten		. #xC84D)	; &I-B-C84D;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHA")
      (=ucs		  . #x0428)	; Ш
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0448)	; &J90-276A;
      (=ucs@jis/fw	  . #x0448)	; &J90-276A;
      (=jis-x0208	  . #x276A)	; &J90-276A; [07-74]
      (=gb2312		  . #x276A)	; &I-G0-276A; [07-74]
      (=ks-x1001	  . #x2C6A)	; &I-K0-2C6A; [12-74]
      (=jis-x0213-1	  . #x276A)	; &I-JX1-276A; [07-74]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHCHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0429)	; Щ
    (cyrillic-iso8859-5 . #xC9)	; &I-CYRILLIC-49;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHCHA")
      (=ucs		  . #x0449)	; щ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER SHCHA")
      (=ucs		  . #x0429)	; Щ
      ))
    (=ucs@gb/fw		. #x0429)	; &J90-273B;
    (=ucs@jis/fw	. #x0429)	; &J90-273B;
    (=jis-x0208		. #x273B)	; &J90-273B; [07-27]
    (=gb2312		. #x273B)	; &I-G0-273B; [07-27]
    (=ks-x1001		. #x2C3B)	; &I-K0-2C3B; [12-27]
    (=jis-x0213-1	. #x273B)	; &I-JX1-273B; [07-27]
    (=big5-eten		. #xC84E)	; &I-B-C84E;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SHCHA")
      (=ucs		  . #x0429)	; Щ
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x0449)	; &J90-276B;
      (=ucs@jis/fw	  . #x0449)	; &J90-276B;
      (=jis-x0208	  . #x276B)	; &J90-276B; [07-75]
      (=gb2312		  . #x276B)	; &I-G0-276B; [07-75]
      (=ks-x1001	  . #x2C6B)	; &I-K0-2C6B; [12-75]
      (=jis-x0213-1	  . #x276B)	; &I-JX1-276B; [07-75]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HARD SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x042A)	; Ъ
    (cyrillic-iso8859-5 . #xCA)	; &I-CYRILLIC-4A;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HARD SIGN")
      (=ucs		  . #x044A)	; ъ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER HARD SIGN")
      (=ucs		  . #x042A)	; Ъ
      ))
    (=ucs@gb/fw		. #x042A)	; &J90-273C;
    (=ucs@jis/fw	. #x042A)	; &J90-273C;
    (=jis-x0208		. #x273C)	; &J90-273C; [07-28]
    (=gb2312		. #x273C)	; &I-G0-273C; [07-28]
    (=ks-x1001		. #x2C3C)	; &I-K0-2C3C; [12-28]
    (=jis-x0213-1	. #x273C)	; &I-JX1-273C; [07-28]
    (=big5-eten		. #xC84F)	; &I-B-C84F;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER HARD SIGN")
      (=ucs		  . #x042A)	; Ъ
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x044A)	; &J90-276C;
      (=ucs@jis/fw	  . #x044A)	; &J90-276C;
      (=jis-x0208	  . #x276C)	; &J90-276C; [07-76]
      (=gb2312		  . #x276C)	; &I-G0-276C; [07-76]
      (=ks-x1001	  . #x2C6C)	; &I-K0-2C6C; [12-76]
      (=jis-x0213-1	  . #x276C)	; &I-JX1-276C; [07-76]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x042B)	; Ы
    (cyrillic-iso8859-5 . #xCB)	; &I-CYRILLIC-4B;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; ы
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ы
      ))
    (=ucs@gb/fw		. #x042B)	; &J90-273D;
    (=ucs@jis/fw	. #x042B)	; &J90-273D;
    (=jis-x0208		. #x273D)	; &J90-273D; [07-29]
    (=gb2312		. #x273D)	; &I-G0-273D; [07-29]
    (=ks-x1001		. #x2C3D)	; &I-K0-2C3D; [12-29]
    (=jis-x0213-1	. #x273D)	; &I-JX1-273D; [07-29]
    (=big5-eten		. #xC850)	; &I-B-C850;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ы
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x044B)	; &J90-276D;
      (=ucs@jis/fw	  . #x044B)	; &J90-276D;
      (=jis-x0208	  . #x276D)	; &J90-276D; [07-77]
      (=gb2312		  . #x276D)	; &I-G0-276D; [07-77]
      (=ks-x1001	  . #x2C6D)	; &I-K0-2C6D; [12-77]
      (=jis-x0213-1	  . #x276D)	; &I-JX1-276D; [07-77]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SOFT SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x042C)	; Ь
    (cyrillic-iso8859-5 . #xCC)	; &I-CYRILLIC-4C;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SOFT SIGN")
      (=ucs		  . #x044C)	; ь
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=ucs		  . #x042C)	; Ь
      ))
    (=ucs@gb/fw		. #x042C)	; &J90-273E;
    (=ucs@jis/fw	. #x042C)	; &J90-273E;
    (=jis-x0208		. #x273E)	; &J90-273E; [07-30]
    (=gb2312		. #x273E)	; &I-G0-273E; [07-30]
    (=ks-x1001		. #x2C3E)	; &I-K0-2C3E; [12-30]
    (=jis-x0213-1	. #x273E)	; &I-JX1-273E; [07-30]
    (=big5-eten		. #xC851)	; &I-B-C851;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=ucs		  . #x042C)	; Ь
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x044C)	; &J90-276E;
      (=ucs@jis/fw	  . #x044C)	; &J90-276E;
      (=jis-x0208	  . #x276E)	; &J90-276E; [07-78]
      (=gb2312		  . #x276E)	; &I-G0-276E; [07-78]
      (=ks-x1001	  . #x2C6E)	; &I-K0-2C6E; [12-78]
      (=jis-x0213-1	  . #x276E)	; &I-JX1-276E; [07-78]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x042D)	; Э
    (cyrillic-iso8859-5 . #xCD)	; &I-CYRILLIC-4D;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; э
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Э
      ))
    (=ucs@gb/fw		. #x042D)	; &J90-273F;
    (=ucs@jis/fw	. #x042D)	; &J90-273F;
    (=jis-x0208		. #x273F)	; &J90-273F; [07-31]
    (=gb2312		. #x273F)	; &I-G0-273F; [07-31]
    (=ks-x1001		. #x2C3F)	; &I-K0-2C3F; [12-31]
    (=jis-x0213-1	. #x273F)	; &I-JX1-273F; [07-31]
    (=big5-eten		. #xC852)	; &I-B-C852;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Э
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x044D)	; &J90-276F;
      (=ucs@jis/fw	  . #x044D)	; &J90-276F;
      (=jis-x0208	  . #x276F)	; &J90-276F; [07-79]
      (=gb2312		  . #x276F)	; &I-G0-276F; [07-79]
      (=ks-x1001	  . #x2C6F)	; &I-K0-2C6F; [12-79]
      (=jis-x0213-1	  . #x276F)	; &I-JX1-276F; [07-79]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YU")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x042E)	; Ю
    (cyrillic-iso8859-5 . #xCE)	; &I-CYRILLIC-4E;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YU")
      (=ucs		  . #x044E)	; ю
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER YU")
      (=ucs		  . #x042E)	; Ю
      ))
    (=ucs@gb/fw		. #x042E)	; &J90-2740;
    (=ucs@jis/fw	. #x042E)	; &J90-2740;
    (=jis-x0208		. #x2740)	; &J90-2740; [07-32]
    (=gb2312		. #x2740)	; &I-G0-2740; [07-32]
    (=ks-x1001		. #x2C40)	; &I-K0-2C40; [12-32]
    (=jis-x0213-1	. #x2740)	; &I-JX1-2740; [07-32]
    (=big5-eten		. #xC853)	; &I-B-C853;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YU")
      (=ucs		  . #x042E)	; Ю
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x044E)	; &J90-2770;
      (=ucs@jis/fw	  . #x044E)	; &J90-2770;
      (=jis-x0208	  . #x2770)	; &J90-2770; [07-80]
      (=gb2312		  . #x2770)	; &I-G0-2770; [07-80]
      (=ks-x1001	  . #x2C70)	; &I-K0-2C70; [12-80]
      (=jis-x0213-1	  . #x2770)	; &I-JX1-2770; [07-80]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x042F)	; Я
    (cyrillic-iso8859-5 . #xCF)	; &I-CYRILLIC-4F;
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YA")
      (=ucs		  . #x044F)	; я
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC CAPITAL LETTER YA")
      (=ucs		  . #x042F)	; Я
      ))
    (=ucs@gb/fw		. #x042F)	; &J90-2741;
    (=ucs@jis/fw	. #x042F)	; &J90-2741;
    (=jis-x0208		. #x2741)	; &J90-2741; [07-33]
    (=gb2312		. #x2741)	; &I-G0-2741; [07-33]
    (=ks-x1001		. #x2C41)	; &I-K0-2C41; [12-33]
    (=jis-x0213-1	. #x2741)	; &I-JX1-2741; [07-33]
    (=big5-eten		. #xC854)	; &I-B-C854;
    (<-fullwidth
     ((name		  . "CYRILLIC CAPITAL LETTER YA")
      (=ucs		  . #x042F)	; Я
      ))
    (->lowercase
     ((=ucs@gb/fw	  . #x044F)	; &J90-2771;
      (=ucs@jis/fw	  . #x044F)	; &J90-2771;
      (=jis-x0208	  . #x2771)	; &J90-2771; [07-81]
      (=gb2312		  . #x2771)	; &I-G0-2771; [07-81]
      (=ks-x1001	  . #x2C71)	; &I-K0-2C71; [12-81]
      (=jis-x0213-1	  . #x2771)	; &I-JX1-2771; [07-81]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0430)	; а
    (cyrillic-iso8859-5 . #xD0)	; &I-CYRILLIC-50;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; А
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; а
      ))
    (=ucs@gb/fw		. #x0430)	; &J90-2751;
    (=ucs@jis/fw	. #x0430)	; &J90-2751;
    (=jis-x0208		. #x2751)	; &J90-2751; [07-49]
    (=gb2312		. #x2751)	; &I-G0-2751; [07-49]
    (=ks-x1001		. #x2C51)	; &I-K0-2C51; [12-49]
    (=jis-x0213-1	. #x2751)	; &I-JX1-2751; [07-49]
    (=big5-eten		. #xC855)	; &I-B-C855;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; а
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0410)	; &J90-2721;
      (=ucs@jis/fw	  . #x0410)	; &J90-2721;
      (=jis-x0208	  . #x2721)	; &J90-2721; [07-01]
      (=gb2312		  . #x2721)	; &I-G0-2721; [07-01]
      (=ks-x1001	  . #x2C21)	; &I-K0-2C21; [12-01]
      (=jis-x0213-1	  . #x2721)	; &I-JX1-2721; [07-01]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0431)	; б
    (cyrillic-iso8859-5 . #xD1)	; &I-CYRILLIC-51;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BE")
      (=ucs		  . #x0411)	; Б
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER BE")
      (=ucs		  . #x0431)	; б
      ))
    (=ucs@gb/fw		. #x0431)	; &J90-2752;
    (=ucs@jis/fw	. #x0431)	; &J90-2752;
    (=jis-x0208		. #x2752)	; &J90-2752; [07-50]
    (=gb2312		. #x2752)	; &I-G0-2752; [07-50]
    (=ks-x1001		. #x2C52)	; &I-K0-2C52; [12-50]
    (=jis-x0213-1	. #x2752)	; &I-JX1-2752; [07-50]
    (=big5-eten		. #xC856)	; &I-B-C856;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER BE")
      (=ucs		  . #x0431)	; б
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0411)	; &J90-2722;
      (=ucs@jis/fw	  . #x0411)	; &J90-2722;
      (=jis-x0208	  . #x2722)	; &J90-2722; [07-02]
      (=gb2312		  . #x2722)	; &I-G0-2722; [07-02]
      (=ks-x1001	  . #x2C22)	; &I-K0-2C22; [12-02]
      (=jis-x0213-1	  . #x2722)	; &I-JX1-2722; [07-02]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER VE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0432)	; в
    (cyrillic-iso8859-5 . #xD2)	; &I-CYRILLIC-52;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER VE")
      (=ucs		  . #x0412)	; В
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER VE")
      (=ucs		  . #x0432)	; в
      ))
    (=ucs@gb/fw		. #x0432)	; &J90-2753;
    (=ucs@jis/fw	. #x0432)	; &J90-2753;
    (=jis-x0208		. #x2753)	; &J90-2753; [07-51]
    (=gb2312		. #x2753)	; &I-G0-2753; [07-51]
    (=ks-x1001		. #x2C53)	; &I-K0-2C53; [12-51]
    (=jis-x0213-1	. #x2753)	; &I-JX1-2753; [07-51]
    (=big5-eten		. #xC857)	; &I-B-C857;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER VE")
      (=ucs		  . #x0432)	; в
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0412)	; &J90-2723;
      (=ucs@jis/fw	  . #x0412)	; &J90-2723;
      (=jis-x0208	  . #x2723)	; &J90-2723; [07-03]
      (=gb2312		  . #x2723)	; &I-G0-2723; [07-03]
      (=ks-x1001	  . #x2C23)	; &I-K0-2C23; [12-03]
      (=jis-x0213-1	  . #x2723)	; &I-JX1-2723; [07-03]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0433)	; г
    (cyrillic-iso8859-5 . #xD3)	; &I-CYRILLIC-53;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE")
      (=ucs		  . #x0413)	; Г
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; г
      ))
    (=ucs@gb/fw		. #x0433)	; &J90-2754;
    (=ucs@jis/fw	. #x0433)	; &J90-2754;
    (=jis-x0208		. #x2754)	; &J90-2754; [07-52]
    (=gb2312		. #x2754)	; &I-G0-2754; [07-52]
    (=ks-x1001		. #x2C54)	; &I-K0-2C54; [12-52]
    (=jis-x0213-1	. #x2754)	; &I-JX1-2754; [07-52]
    (=big5-eten		. #xC858)	; &I-B-C858;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; г
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0413)	; &J90-2724;
      (=ucs@jis/fw	  . #x0413)	; &J90-2724;
      (=jis-x0208	  . #x2724)	; &J90-2724; [07-04]
      (=gb2312		  . #x2724)	; &I-G0-2724; [07-04]
      (=ks-x1001	  . #x2C24)	; &I-K0-2C24; [12-04]
      (=jis-x0213-1	  . #x2724)	; &I-JX1-2724; [07-04]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0434)	; д
    (cyrillic-iso8859-5 . #xD4)	; &I-CYRILLIC-54;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DE")
      (=ucs		  . #x0414)	; Д
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER DE")
      (=ucs		  . #x0434)	; д
      ))
    (=ucs@gb/fw		. #x0434)	; &J90-2755;
    (=ucs@jis/fw	. #x0434)	; &J90-2755;
    (=jis-x0208		. #x2755)	; &J90-2755; [07-53]
    (=gb2312		. #x2755)	; &I-G0-2755; [07-53]
    (=ks-x1001		. #x2C55)	; &I-K0-2C55; [12-53]
    (=jis-x0213-1	. #x2755)	; &I-JX1-2755; [07-53]
    (=big5-eten		. #xC859)	; &I-B-C859;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DE")
      (=ucs		  . #x0434)	; д
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0414)	; &J90-2725;
      (=ucs@jis/fw	  . #x0414)	; &J90-2725;
      (=jis-x0208	  . #x2725)	; &J90-2725; [07-05]
      (=gb2312		  . #x2725)	; &I-G0-2725; [07-05]
      (=ks-x1001	  . #x2C25)	; &I-K0-2C25; [12-05]
      (=jis-x0213-1	  . #x2725)	; &I-JX1-2725; [07-05]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0435)	; е
    (cyrillic-iso8859-5 . #xD5)	; &I-CYRILLIC-55;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      ))
    (=ucs@gb/fw		. #x0435)	; &J90-2756;
    (=ucs@jis/fw	. #x0435)	; &J90-2756;
    (=jis-x0208		. #x2756)	; &J90-2756; [07-54]
    (=gb2312		. #x2756)	; &I-G0-2756; [07-54]
    (=ks-x1001		. #x2C56)	; &I-K0-2C56; [12-54]
    (=jis-x0213-1	. #x2756)	; &I-JX1-2756; [07-54]
    (=big5-eten		. #xC85A)	; &I-B-C85A;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0415)	; &J90-2726;
      (=ucs@jis/fw	  . #x0415)	; &J90-2726;
      (=jis-x0208	  . #x2726)	; &J90-2726; [07-06]
      (=gb2312		  . #x2726)	; &I-G0-2726; [07-06]
      (=ks-x1001	  . #x2C26)	; &I-K0-2C26; [12-06]
      (=jis-x0213-1	  . #x2726)	; &I-JX1-2726; [07-06]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0436)	; ж
    (cyrillic-iso8859-5 . #xD6)	; &I-CYRILLIC-56;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ж
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; ж
      ))
    (=ucs@gb/fw		. #x0436)	; &J90-2758;
    (=ucs@jis/fw	. #x0436)	; &J90-2758;
    (=jis-x0208		. #x2758)	; &J90-2758; [07-56]
    (=gb2312		. #x2758)	; &I-G0-2758; [07-56]
    (=ks-x1001		. #x2C58)	; &I-K0-2C58; [12-56]
    (=jis-x0213-1	. #x2758)	; &I-JX1-2758; [07-56]
    (=big5-eten		. #xC85C)	; &I-B-C85C;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; ж
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0416)	; &J90-2728;
      (=ucs@jis/fw	  . #x0416)	; &J90-2728;
      (=jis-x0208	  . #x2728)	; &J90-2728; [07-08]
      (=gb2312		  . #x2728)	; &I-G0-2728; [07-08]
      (=ks-x1001	  . #x2C28)	; &I-K0-2C28; [12-08]
      (=jis-x0213-1	  . #x2728)	; &I-JX1-2728; [07-08]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0437)	; з
    (cyrillic-iso8859-5 . #xD7)	; &I-CYRILLIC-57;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; З
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; з
      ))
    (=ucs@gb/fw		. #x0437)	; &J90-2759;
    (=ucs@jis/fw	. #x0437)	; &J90-2759;
    (=jis-x0208		. #x2759)	; &J90-2759; [07-57]
    (=gb2312		. #x2759)	; &I-G0-2759; [07-57]
    (=ks-x1001		. #x2C59)	; &I-K0-2C59; [12-57]
    (=jis-x0213-1	. #x2759)	; &I-JX1-2759; [07-57]
    (=big5-eten		. #xC85D)	; &I-B-C85D;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; з
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0417)	; &J90-2729;
      (=ucs@jis/fw	  . #x0417)	; &J90-2729;
      (=jis-x0208	  . #x2729)	; &J90-2729; [07-09]
      (=gb2312		  . #x2729)	; &I-G0-2729; [07-09]
      (=ks-x1001	  . #x2C29)	; &I-K0-2C29; [12-09]
      (=jis-x0213-1	  . #x2729)	; &I-JX1-2729; [07-09]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0438)	; и
    (cyrillic-iso8859-5 . #xD8)	; &I-CYRILLIC-58;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      ))
    (=ucs@gb/fw		. #x0438)	; &J90-275A;
    (=ucs@jis/fw	. #x0438)	; &J90-275A;
    (=jis-x0208		. #x275A)	; &J90-275A; [07-58]
    (=gb2312		. #x275A)	; &I-G0-275A; [07-58]
    (=ks-x1001		. #x2C5A)	; &I-K0-2C5A; [12-58]
    (=jis-x0213-1	. #x275A)	; &I-JX1-275A; [07-58]
    (=big5-eten		. #xC85E)	; &I-B-C85E;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0418)	; &J90-272A;
      (=ucs@jis/fw	  . #x0418)	; &J90-272A;
      (=jis-x0208	  . #x272A)	; &J90-272A; [07-10]
      (=gb2312		  . #x272A)	; &I-G0-272A; [07-10]
      (=ks-x1001	  . #x2C2A)	; &I-K0-2C2A; [12-10]
      (=jis-x0213-1	  . #x272A)	; &I-JX1-272A; [07-10]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHORT I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x0439)	; й
    (cyrillic-iso8859-5 . #xD9)	; &I-CYRILLIC-59;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT I")
      (=ucs		  . #x0419)	; Й
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER SHORT I")
      (=ucs		  . #x0439)	; й
      ))
    (=decomposition
     ((=ucs@gb/fw	  . #x0438)	; &J90-275A;
      (=ucs@jis/fw	  . #x0438)	; &J90-275A;
      (=jis-x0208	  . #x275A)	; &J90-275A; [07-58]
      (=gb2312		  . #x275A)	; &I-G0-275A; [07-58]
      (=ks-x1001	  . #x2C5A)	; &I-K0-2C5A; [12-58]
      (=jis-x0213-1	  . #x275A)	; &I-JX1-275A; [07-58]
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs@gb/fw		. #x0439)	; &J90-275A;̆
    (=ucs@jis/fw	. #x0439)	; &J90-275A;̆
    (=jis-x0208		. #x275B)	; &J90-275A;̆ [07-59]
    (=gb2312		. #x275B)	; &I-G0-275B; [07-59]
    (=ks-x1001		. #x2C5B)	; &I-K0-2C5B; [12-59]
    (=jis-x0213-1	. #x275B)	; &I-JX1-275B; [07-59]
    (=big5-eten		. #xC85F)	; &I-B-C85F;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHORT I")
      (=ucs		  . #x0439)	; й
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0419)	; &J90-272B;
      (=ucs@jis/fw	  . #x0419)	; &J90-272B;
      (=jis-x0208	  . #x272B)	; &J90-272B; [07-11]
      (=gb2312		  . #x272B)	; &I-G0-272B; [07-11]
      (=ks-x1001	  . #x2C2B)	; &I-K0-2C2B; [12-11]
      (=jis-x0213-1	  . #x272B)	; &I-JX1-272B; [07-11]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x043A)	; к
    (cyrillic-iso8859-5 . #xDA)	; &I-CYRILLIC-5A;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA")
      (=ucs		  . #x041A)	; К
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; к
      ))
    (=ucs@gb/fw		. #x043A)	; &J90-275C;
    (=ucs@jis/fw	. #x043A)	; &J90-275C;
    (=jis-x0208		. #x275C)	; &J90-275C; [07-60]
    (=gb2312		. #x275C)	; &I-G0-275C; [07-60]
    (=ks-x1001		. #x2C5C)	; &I-K0-2C5C; [12-60]
    (=jis-x0213-1	. #x275C)	; &I-JX1-275C; [07-60]
    (=big5-eten		. #xC860)	; &I-B-C860;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; к
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x041A)	; &J90-272C;
      (=ucs@jis/fw	  . #x041A)	; &J90-272C;
      (=jis-x0208	  . #x272C)	; &J90-272C; [07-12]
      (=gb2312		  . #x272C)	; &I-G0-272C; [07-12]
      (=ks-x1001	  . #x2C2C)	; &I-K0-2C2C; [12-12]
      (=jis-x0213-1	  . #x272C)	; &I-JX1-272C; [07-12]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EL")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x043B)	; л
    (cyrillic-iso8859-5 . #xDB)	; &I-CYRILLIC-5B;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EL")
      (=ucs		  . #x041B)	; Л
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER EL")
      (=ucs		  . #x043B)	; л
      ))
    (=ucs@gb/fw		. #x043B)	; &J90-275D;
    (=ucs@jis/fw	. #x043B)	; &J90-275D;
    (=jis-x0208		. #x275D)	; &J90-275D; [07-61]
    (=gb2312		. #x275D)	; &I-G0-275D; [07-61]
    (=ks-x1001		. #x2C5D)	; &I-K0-2C5D; [12-61]
    (=jis-x0213-1	. #x275D)	; &I-JX1-275D; [07-61]
    (=big5-eten		. #xC861)	; &I-B-C861;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EL")
      (=ucs		  . #x043B)	; л
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x041B)	; &J90-272D;
      (=ucs@jis/fw	  . #x041B)	; &J90-272D;
      (=jis-x0208	  . #x272D)	; &J90-272D; [07-13]
      (=gb2312		  . #x272D)	; &I-G0-272D; [07-13]
      (=ks-x1001	  . #x2C2D)	; &I-K0-2C2D; [12-13]
      (=jis-x0213-1	  . #x272D)	; &I-JX1-272D; [07-13]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EM")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x043C)	; м
    (cyrillic-iso8859-5 . #xDC)	; &I-CYRILLIC-5C;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EM")
      (=ucs		  . #x041C)	; М
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER EM")
      (=ucs		  . #x043C)	; м
      ))
    (=ucs@gb/fw		. #x043C)	; &J90-275E;
    (=ucs@jis/fw	. #x043C)	; &J90-275E;
    (=jis-x0208		. #x275E)	; &J90-275E; [07-62]
    (=gb2312		. #x275E)	; &I-G0-275E; [07-62]
    (=ks-x1001		. #x2C5E)	; &I-K0-2C5E; [12-62]
    (=jis-x0213-1	. #x275E)	; &I-JX1-275E; [07-62]
    (=big5-eten		. #xC862)	; &I-B-C862;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EM")
      (=ucs		  . #x043C)	; м
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x041C)	; &J90-272E;
      (=ucs@jis/fw	  . #x041C)	; &J90-272E;
      (=jis-x0208	  . #x272E)	; &J90-272E; [07-14]
      (=gb2312		  . #x272E)	; &I-G0-272E; [07-14]
      (=ks-x1001	  . #x2C2E)	; &I-K0-2C2E; [12-14]
      (=jis-x0213-1	  . #x272E)	; &I-JX1-272E; [07-14]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x043D)	; н
    (cyrillic-iso8859-5 . #xDD)	; &I-CYRILLIC-5D;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN")
      (=ucs		  . #x041D)	; Н
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER EN")
      (=ucs		  . #x043D)	; н
      ))
    (=ucs@gb/fw		. #x043D)	; &J90-275F;
    (=ucs@jis/fw	. #x043D)	; &J90-275F;
    (=jis-x0208		. #x275F)	; &J90-275F; [07-63]
    (=gb2312		. #x275F)	; &I-G0-275F; [07-63]
    (=ks-x1001		. #x2C5F)	; &I-K0-2C5F; [12-63]
    (=jis-x0213-1	. #x275F)	; &I-JX1-275F; [07-63]
    (=big5-eten		. #xC863)	; &I-B-C863;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EN")
      (=ucs		  . #x043D)	; н
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x041D)	; &J90-272F;
      (=ucs@jis/fw	  . #x041D)	; &J90-272F;
      (=jis-x0208	  . #x272F)	; &J90-272F; [07-15]
      (=gb2312		  . #x272F)	; &I-G0-272F; [07-15]
      (=ks-x1001	  . #x2C2F)	; &I-K0-2C2F; [12-15]
      (=jis-x0213-1	  . #x272F)	; &I-JX1-272F; [07-15]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x043E)	; о
    (cyrillic-iso8859-5 . #xDE)	; &I-CYRILLIC-5E;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; О
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; о
      ))
    (=ucs@gb/fw		. #x043E)	; &J90-2760;
    (=ucs@jis/fw	. #x043E)	; &J90-2760;
    (=jis-x0208		. #x2760)	; &J90-2760; [07-64]
    (=gb2312		. #x2760)	; &I-G0-2760; [07-64]
    (=ks-x1001		. #x2C60)	; &I-K0-2C60; [12-64]
    (=jis-x0213-1	. #x2760)	; &I-JX1-2760; [07-64]
    (=big5-eten		. #xC864)	; &I-B-C864;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; о
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x041E)	; &J90-2730;
      (=ucs@jis/fw	  . #x041E)	; &J90-2730;
      (=jis-x0208	  . #x2730)	; &J90-2730; [07-16]
      (=gb2312		  . #x2730)	; &I-G0-2730; [07-16]
      (=ks-x1001	  . #x2C30)	; &I-K0-2C30; [12-16]
      (=jis-x0213-1	  . #x2730)	; &I-JX1-2730; [07-16]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x043F)	; п
    (cyrillic-iso8859-5 . #xDF)	; &I-CYRILLIC-5F;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER PE")
      (=ucs		  . #x041F)	; П
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER PE")
      (=ucs		  . #x043F)	; п
      ))
    (=ucs@gb/fw		. #x043F)	; &J90-2761;
    (=ucs@jis/fw	. #x043F)	; &J90-2761;
    (=jis-x0208		. #x2761)	; &J90-2761; [07-65]
    (=gb2312		. #x2761)	; &I-G0-2761; [07-65]
    (=ks-x1001		. #x2C61)	; &I-K0-2C61; [12-65]
    (=jis-x0213-1	. #x2761)	; &I-JX1-2761; [07-65]
    (=big5-eten		. #xC865)	; &I-B-C865;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER PE")
      (=ucs		  . #x043F)	; п
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x041F)	; &J90-2731;
      (=ucs@jis/fw	  . #x041F)	; &J90-2731;
      (=jis-x0208	  . #x2731)	; &J90-2731; [07-17]
      (=gb2312		  . #x2731)	; &I-G0-2731; [07-17]
      (=ks-x1001	  . #x2C31)	; &I-K0-2C31; [12-17]
      (=jis-x0213-1	  . #x2731)	; &I-JX1-2731; [07-17]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0440)	; р
    (cyrillic-iso8859-5 . #xE0)	; &I-CYRILLIC-60;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ER")
      (=ucs		  . #x0420)	; Р
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER ER")
      (=ucs		  . #x0440)	; р
      ))
    (=ucs@gb/fw		. #x0440)	; &J90-2762;
    (=ucs@jis/fw	. #x0440)	; &J90-2762;
    (=jis-x0208		. #x2762)	; &J90-2762; [07-66]
    (=gb2312		. #x2762)	; &I-G0-2762; [07-66]
    (=ks-x1001		. #x2C62)	; &I-K0-2C62; [12-66]
    (=jis-x0213-1	. #x2762)	; &I-JX1-2762; [07-66]
    (=big5-eten		. #xC866)	; &I-B-C866;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ER")
      (=ucs		  . #x0440)	; р
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0420)	; &J90-2732;
      (=ucs@jis/fw	  . #x0420)	; &J90-2732;
      (=jis-x0208	  . #x2732)	; &J90-2732; [07-18]
      (=gb2312		  . #x2732)	; &I-G0-2732; [07-18]
      (=ks-x1001	  . #x2C32)	; &I-K0-2C32; [12-18]
      (=jis-x0213-1	  . #x2732)	; &I-JX1-2732; [07-18]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0441)	; с
    (cyrillic-iso8859-5 . #xE1)	; &I-CYRILLIC-61;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ES")
      (=ucs		  . #x0421)	; С
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER ES")
      (=ucs		  . #x0441)	; с
      ))
    (=ucs@gb/fw		. #x0441)	; &J90-2763;
    (=ucs@jis/fw	. #x0441)	; &J90-2763;
    (=jis-x0208		. #x2763)	; &J90-2763; [07-67]
    (=gb2312		. #x2763)	; &I-G0-2763; [07-67]
    (=ks-x1001		. #x2C63)	; &I-K0-2C63; [12-67]
    (=jis-x0213-1	. #x2763)	; &I-JX1-2763; [07-67]
    (=big5-eten		. #xC867)	; &I-B-C867;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER ES")
      (=ucs		  . #x0441)	; с
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0421)	; &J90-2733;
      (=ucs@jis/fw	  . #x0421)	; &J90-2733;
      (=jis-x0208	  . #x2733)	; &J90-2733; [07-19]
      (=gb2312		  . #x2733)	; &I-G0-2733; [07-19]
      (=ks-x1001	  . #x2C33)	; &I-K0-2C33; [12-19]
      (=jis-x0213-1	  . #x2733)	; &I-JX1-2733; [07-19]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0442)	; т
    (cyrillic-iso8859-5 . #xE2)	; &I-CYRILLIC-62;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TE")
      (=ucs		  . #x0422)	; Т
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER TE")
      (=ucs		  . #x0442)	; т
      ))
    (=ucs@gb/fw		. #x0442)	; &J90-2764;
    (=ucs@jis/fw	. #x0442)	; &J90-2764;
    (=jis-x0208		. #x2764)	; &J90-2764; [07-68]
    (=gb2312		. #x2764)	; &I-G0-2764; [07-68]
    (=ks-x1001		. #x2C64)	; &I-K0-2C64; [12-68]
    (=jis-x0213-1	. #x2764)	; &I-JX1-2764; [07-68]
    (=big5-eten		. #xC868)	; &I-B-C868;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER TE")
      (=ucs		  . #x0442)	; т
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0422)	; &J90-2734;
      (=ucs@jis/fw	  . #x0422)	; &J90-2734;
      (=jis-x0208	  . #x2734)	; &J90-2734; [07-20]
      (=gb2312		  . #x2734)	; &I-G0-2734; [07-20]
      (=ks-x1001	  . #x2C34)	; &I-K0-2C34; [12-20]
      (=jis-x0213-1	  . #x2734)	; &I-JX1-2734; [07-20]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0443)	; у
    (cyrillic-iso8859-5 . #xE3)	; &I-CYRILLIC-63;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      ))
    (=ucs@gb/fw		. #x0443)	; &J90-2765;
    (=ucs@jis/fw	. #x0443)	; &J90-2765;
    (=jis-x0208		. #x2765)	; &J90-2765; [07-69]
    (=gb2312		. #x2765)	; &I-G0-2765; [07-69]
    (=ks-x1001		. #x2C65)	; &I-K0-2C65; [12-69]
    (=jis-x0213-1	. #x2765)	; &I-JX1-2765; [07-69]
    (=big5-eten		. #xC869)	; &I-B-C869;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0423)	; &J90-2735;
      (=ucs@jis/fw	  . #x0423)	; &J90-2735;
      (=jis-x0208	  . #x2735)	; &J90-2735; [07-21]
      (=gb2312		  . #x2735)	; &I-G0-2735; [07-21]
      (=ks-x1001	  . #x2C35)	; &I-K0-2C35; [12-21]
      (=jis-x0213-1	  . #x2735)	; &I-JX1-2735; [07-21]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EF")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0444)	; ф
    (cyrillic-iso8859-5 . #xE4)	; &I-CYRILLIC-64;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EF")
      (=ucs		  . #x0424)	; Ф
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER EF")
      (=ucs		  . #x0444)	; ф
      ))
    (=ucs@gb/fw		. #x0444)	; &J90-2766;
    (=ucs@jis/fw	. #x0444)	; &J90-2766;
    (=jis-x0208		. #x2766)	; &J90-2766; [07-70]
    (=gb2312		. #x2766)	; &I-G0-2766; [07-70]
    (=ks-x1001		. #x2C66)	; &I-K0-2C66; [12-70]
    (=jis-x0213-1	. #x2766)	; &I-JX1-2766; [07-70]
    (=big5-eten		. #xC86A)	; &I-B-C86A;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER EF")
      (=ucs		  . #x0444)	; ф
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0424)	; &J90-2736;
      (=ucs@jis/fw	  . #x0424)	; &J90-2736;
      (=jis-x0208	  . #x2736)	; &J90-2736; [07-22]
      (=gb2312		  . #x2736)	; &I-G0-2736; [07-22]
      (=ks-x1001	  . #x2C36)	; &I-K0-2C36; [12-22]
      (=jis-x0213-1	  . #x2736)	; &I-JX1-2736; [07-22]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0445)	; х
    (cyrillic-iso8859-5 . #xE5)	; &I-CYRILLIC-65;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HA")
      (=ucs		  . #x0425)	; Х
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER HA")
      (=ucs		  . #x0445)	; х
      ))
    (=ucs@gb/fw		. #x0445)	; &J90-2767;
    (=ucs@jis/fw	. #x0445)	; &J90-2767;
    (=jis-x0208		. #x2767)	; &J90-2767; [07-71]
    (=gb2312		. #x2767)	; &I-G0-2767; [07-71]
    (=ks-x1001		. #x2C67)	; &I-K0-2C67; [12-71]
    (=jis-x0213-1	. #x2767)	; &I-JX1-2767; [07-71]
    (=big5-eten		. #xC86B)	; &I-B-C86B;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER HA")
      (=ucs		  . #x0445)	; х
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0425)	; &J90-2737;
      (=ucs@jis/fw	  . #x0425)	; &J90-2737;
      (=jis-x0208	  . #x2737)	; &J90-2737; [07-23]
      (=gb2312		  . #x2737)	; &I-G0-2737; [07-23]
      (=ks-x1001	  . #x2C37)	; &I-K0-2C37; [12-23]
      (=jis-x0213-1	  . #x2737)	; &I-JX1-2737; [07-23]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0446)	; ц
    (cyrillic-iso8859-5 . #xE6)	; &I-CYRILLIC-66;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TSE")
      (=ucs		  . #x0426)	; Ц
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER TSE")
      (=ucs		  . #x0446)	; ц
      ))
    (=ucs@gb/fw		. #x0446)	; &J90-2768;
    (=ucs@jis/fw	. #x0446)	; &J90-2768;
    (=jis-x0208		. #x2768)	; &J90-2768; [07-72]
    (=gb2312		. #x2768)	; &I-G0-2768; [07-72]
    (=ks-x1001		. #x2C68)	; &I-K0-2C68; [12-72]
    (=jis-x0213-1	. #x2768)	; &I-JX1-2768; [07-72]
    (=big5-eten		. #xC86C)	; &I-B-C86C;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER TSE")
      (=ucs		  . #x0446)	; ц
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0426)	; &J90-2738;
      (=ucs@jis/fw	  . #x0426)	; &J90-2738;
      (=jis-x0208	  . #x2738)	; &J90-2738; [07-24]
      (=gb2312		  . #x2738)	; &I-G0-2738; [07-24]
      (=ks-x1001	  . #x2C38)	; &I-K0-2C38; [12-24]
      (=jis-x0213-1	  . #x2738)	; &I-JX1-2738; [07-24]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0447)	; ч
    (cyrillic-iso8859-5 . #xE7)	; &I-CYRILLIC-67;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ч
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; ч
      ))
    (=ucs@gb/fw		. #x0447)	; &J90-2769;
    (=ucs@jis/fw	. #x0447)	; &J90-2769;
    (=jis-x0208		. #x2769)	; &J90-2769; [07-73]
    (=gb2312		. #x2769)	; &I-G0-2769; [07-73]
    (=ks-x1001		. #x2C69)	; &I-K0-2C69; [12-73]
    (=jis-x0213-1	. #x2769)	; &I-JX1-2769; [07-73]
    (=big5-eten		. #xC86D)	; &I-B-C86D;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; ч
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0427)	; &J90-2739;
      (=ucs@jis/fw	  . #x0427)	; &J90-2739;
      (=jis-x0208	  . #x2739)	; &J90-2739; [07-25]
      (=gb2312		  . #x2739)	; &I-G0-2739; [07-25]
      (=ks-x1001	  . #x2C39)	; &I-K0-2C39; [12-25]
      (=jis-x0213-1	  . #x2739)	; &I-JX1-2739; [07-25]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0448)	; ш
    (cyrillic-iso8859-5 . #xE8)	; &I-CYRILLIC-68;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHA")
      (=ucs		  . #x0428)	; Ш
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER SHA")
      (=ucs		  . #x0448)	; ш
      ))
    (=ucs@gb/fw		. #x0448)	; &J90-276A;
    (=ucs@jis/fw	. #x0448)	; &J90-276A;
    (=jis-x0208		. #x276A)	; &J90-276A; [07-74]
    (=gb2312		. #x276A)	; &I-G0-276A; [07-74]
    (=ks-x1001		. #x2C6A)	; &I-K0-2C6A; [12-74]
    (=jis-x0213-1	. #x276A)	; &I-JX1-276A; [07-74]
    (=big5-eten		. #xC86E)	; &I-B-C86E;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHA")
      (=ucs		  . #x0448)	; ш
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0428)	; &J90-273A;
      (=ucs@jis/fw	  . #x0428)	; &J90-273A;
      (=jis-x0208	  . #x273A)	; &J90-273A; [07-26]
      (=gb2312		  . #x273A)	; &I-G0-273A; [07-26]
      (=ks-x1001	  . #x2C3A)	; &I-K0-2C3A; [12-26]
      (=jis-x0213-1	  . #x273A)	; &I-JX1-273A; [07-26]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHCHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0449)	; щ
    (cyrillic-iso8859-5 . #xE9)	; &I-CYRILLIC-69;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHCHA")
      (=ucs		  . #x0429)	; Щ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER SHCHA")
      (=ucs		  . #x0449)	; щ
      ))
    (=ucs@gb/fw		. #x0449)	; &J90-276B;
    (=ucs@jis/fw	. #x0449)	; &J90-276B;
    (=jis-x0208		. #x276B)	; &J90-276B; [07-75]
    (=gb2312		. #x276B)	; &I-G0-276B; [07-75]
    (=ks-x1001		. #x2C6B)	; &I-K0-2C6B; [12-75]
    (=jis-x0213-1	. #x276B)	; &I-JX1-276B; [07-75]
    (=big5-eten		. #xC86F)	; &I-B-C86F;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHCHA")
      (=ucs		  . #x0449)	; щ
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0429)	; &J90-273B;
      (=ucs@jis/fw	  . #x0429)	; &J90-273B;
      (=jis-x0208	  . #x273B)	; &J90-273B; [07-27]
      (=gb2312		  . #x273B)	; &I-G0-273B; [07-27]
      (=ks-x1001	  . #x2C3B)	; &I-K0-2C3B; [12-27]
      (=jis-x0213-1	  . #x273B)	; &I-JX1-273B; [07-27]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HARD SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x044A)	; ъ
    (cyrillic-iso8859-5 . #xEA)	; &I-CYRILLIC-6A;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HARD SIGN")
      (=ucs		  . #x042A)	; Ъ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER HARD SIGN")
      (=ucs		  . #x044A)	; ъ
      ))
    (=ucs@gb/fw		. #x044A)	; &J90-276C;
    (=ucs@jis/fw	. #x044A)	; &J90-276C;
    (=jis-x0208		. #x276C)	; &J90-276C; [07-76]
    (=gb2312		. #x276C)	; &I-G0-276C; [07-76]
    (=ks-x1001		. #x2C6C)	; &I-K0-2C6C; [12-76]
    (=jis-x0213-1	. #x276C)	; &I-JX1-276C; [07-76]
    (=big5-eten		. #xC870)	; &I-B-C870;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER HARD SIGN")
      (=ucs		  . #x044A)	; ъ
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x042A)	; &J90-273C;
      (=ucs@jis/fw	  . #x042A)	; &J90-273C;
      (=jis-x0208	  . #x273C)	; &J90-273C; [07-28]
      (=gb2312		  . #x273C)	; &I-G0-273C; [07-28]
      (=ks-x1001	  . #x2C3C)	; &I-K0-2C3C; [12-28]
      (=jis-x0213-1	  . #x273C)	; &I-JX1-273C; [07-28]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x044B)	; ы
    (cyrillic-iso8859-5 . #xEB)	; &I-CYRILLIC-6B;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ы
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; ы
      ))
    (=ucs@gb/fw		. #x044B)	; &J90-276D;
    (=ucs@jis/fw	. #x044B)	; &J90-276D;
    (=jis-x0208		. #x276D)	; &J90-276D; [07-77]
    (=gb2312		. #x276D)	; &I-G0-276D; [07-77]
    (=ks-x1001		. #x2C6D)	; &I-K0-2C6D; [12-77]
    (=jis-x0213-1	. #x276D)	; &I-JX1-276D; [07-77]
    (=big5-eten		. #xC871)	; &I-B-C871;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; ы
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x042B)	; &J90-273D;
      (=ucs@jis/fw	  . #x042B)	; &J90-273D;
      (=jis-x0208	  . #x273D)	; &J90-273D; [07-29]
      (=gb2312		  . #x273D)	; &I-G0-273D; [07-29]
      (=ks-x1001	  . #x2C3D)	; &I-K0-2C3D; [12-29]
      (=jis-x0213-1	  . #x273D)	; &I-JX1-273D; [07-29]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SOFT SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x044C)	; ь
    (cyrillic-iso8859-5 . #xEC)	; &I-CYRILLIC-6C;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SOFT SIGN")
      (=ucs		  . #x042C)	; Ь
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER SOFT SIGN")
      (=ucs		  . #x044C)	; ь
      ))
    (=ucs@gb/fw		. #x044C)	; &J90-276E;
    (=ucs@jis/fw	. #x044C)	; &J90-276E;
    (=jis-x0208		. #x276E)	; &J90-276E; [07-78]
    (=gb2312		. #x276E)	; &I-G0-276E; [07-78]
    (=ks-x1001		. #x2C6E)	; &I-K0-2C6E; [12-78]
    (=jis-x0213-1	. #x276E)	; &I-JX1-276E; [07-78]
    (=big5-eten		. #xC872)	; &I-B-C872;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SOFT SIGN")
      (=ucs		  . #x044C)	; ь
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x042C)	; &J90-273E;
      (=ucs@jis/fw	  . #x042C)	; &J90-273E;
      (=jis-x0208	  . #x273E)	; &J90-273E; [07-30]
      (=gb2312		  . #x273E)	; &I-G0-273E; [07-30]
      (=ks-x1001	  . #x2C3E)	; &I-K0-2C3E; [12-30]
      (=jis-x0213-1	  . #x273E)	; &I-JX1-273E; [07-30]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x044D)	; э
    (cyrillic-iso8859-5 . #xED)	; &I-CYRILLIC-6D;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Э
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; э
      ))
    (=ucs@gb/fw		. #x044D)	; &J90-276F;
    (=ucs@jis/fw	. #x044D)	; &J90-276F;
    (=jis-x0208		. #x276F)	; &J90-276F; [07-79]
    (=gb2312		. #x276F)	; &I-G0-276F; [07-79]
    (=ks-x1001		. #x2C6F)	; &I-K0-2C6F; [12-79]
    (=jis-x0213-1	. #x276F)	; &I-JX1-276F; [07-79]
    (=big5-eten		. #xC873)	; &I-B-C873;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; э
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x042D)	; &J90-273F;
      (=ucs@jis/fw	  . #x042D)	; &J90-273F;
      (=jis-x0208	  . #x273F)	; &J90-273F; [07-31]
      (=gb2312		  . #x273F)	; &I-G0-273F; [07-31]
      (=ks-x1001	  . #x2C3F)	; &I-K0-2C3F; [12-31]
      (=jis-x0213-1	  . #x273F)	; &I-JX1-273F; [07-31]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YU")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x044E)	; ю
    (cyrillic-iso8859-5 . #xEE)	; &I-CYRILLIC-6E;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YU")
      (=ucs		  . #x042E)	; Ю
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER YU")
      (=ucs		  . #x044E)	; ю
      ))
    (=ucs@gb/fw		. #x044E)	; &J90-2770;
    (=ucs@jis/fw	. #x044E)	; &J90-2770;
    (=jis-x0208		. #x2770)	; &J90-2770; [07-80]
    (=gb2312		. #x2770)	; &I-G0-2770; [07-80]
    (=ks-x1001		. #x2C70)	; &I-K0-2C70; [12-80]
    (=jis-x0213-1	. #x2770)	; &I-JX1-2770; [07-80]
    (=big5-eten		. #xC874)	; &I-B-C874;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YU")
      (=ucs		  . #x044E)	; ю
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x042E)	; &J90-2740;
      (=ucs@jis/fw	  . #x042E)	; &J90-2740;
      (=jis-x0208	  . #x2740)	; &J90-2740; [07-32]
      (=gb2312		  . #x2740)	; &I-G0-2740; [07-32]
      (=ks-x1001	  . #x2C40)	; &I-K0-2C40; [12-32]
      (=jis-x0213-1	  . #x2740)	; &I-JX1-2740; [07-32]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x044F)	; я
    (cyrillic-iso8859-5 . #xEF)	; &I-CYRILLIC-6F;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YA")
      (=ucs		  . #x042F)	; Я
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER YA")
      (=ucs		  . #x044F)	; я
      ))
    (=ucs@gb/fw		. #x044F)	; &J90-2771;
    (=ucs@jis/fw	. #x044F)	; &J90-2771;
    (=jis-x0208		. #x2771)	; &J90-2771; [07-81]
    (=gb2312		. #x2771)	; &I-G0-2771; [07-81]
    (=ks-x1001		. #x2C71)	; &I-K0-2C71; [12-81]
    (=jis-x0213-1	. #x2771)	; &I-JX1-2771; [07-81]
    (=big5-eten		. #xC875)	; &I-B-C875;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YA")
      (=ucs		  . #x044F)	; я
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x042F)	; &J90-2741;
      (=ucs@jis/fw	  . #x042F)	; &J90-2741;
      (=jis-x0208	  . #x2741)	; &J90-2741; [07-33]
      (=gb2312		  . #x2741)	; &I-G0-2741; [07-33]
      (=ks-x1001	  . #x2C41)	; &I-K0-2C41; [12-33]
      (=jis-x0213-1	  . #x2741)	; &I-JX1-2741; [07-33]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x0450)	; ѐ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE WITH GRAVE")
      (=ucs		  . #x0400)	; Ѐ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x0451)	; ё
    (cyrillic-iso8859-5 . #xF1)	; &I-CYRILLIC-71;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IO")
      (=ucs		  . #x0401)	; Ё
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER IO")
      (=ucs		  . #x0451)	; ё
      ))
    (=decomposition
     ((=ucs@gb/fw	  . #x0435)	; &J90-2756;
      (=ucs@jis/fw	  . #x0435)	; &J90-2756;
      (=jis-x0208	  . #x2756)	; &J90-2756; [07-54]
      (=gb2312		  . #x2756)	; &I-G0-2756; [07-54]
      (=ks-x1001	  . #x2C56)	; &I-K0-2C56; [12-54]
      (=jis-x0213-1	  . #x2756)	; &I-JX1-2756; [07-54]
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@gb/fw		. #x0451)	; &J90-2756;̈
    (=ucs@jis/fw	. #x0451)	; &J90-2756;̈
    (=jis-x0208		. #x2757)	; &J90-2756;̈ [07-55]
    (=gb2312		. #x2757)	; &I-G0-2757; [07-55]
    (=ks-x1001		. #x2C57)	; &I-K0-2C57; [12-55]
    (=jis-x0213-1	. #x2757)	; &I-JX1-2757; [07-55]
    (=big5-eten		. #xC85B)	; &I-B-C85B;
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER IO")
      (=ucs		  . #x0451)	; ё
      ))
    (->uppercase
     ((=ucs@gb/fw	  . #x0401)	; &J90-2726;̈
      (=ucs@jis/fw	  . #x0401)	; &J90-2726;̈
      (=jis-x0208	  . #x2727)	; &J90-2726;̈ [07-07]
      (=gb2312		  . #x2727)	; &I-G0-2727; [07-07]
      (=ks-x1001	  . #x2C27)	; &I-K0-2C27; [12-07]
      (=jis-x0213-1	  . #x2727)	; &I-JX1-2727; [07-07]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (=ucs		. #x0452)	; ђ
    (cyrillic-iso8859-5 . #xF2)	; &I-CYRILLIC-72;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DJE")
      (=ucs		  . #x0402)	; Ђ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER DJE")
      (=ucs		  . #x0452)	; ђ
      ))
    (=ucs@jis/fw	. #x0452)	; &JSP-2772;
    (=jis-x0212		. #x2772)	; &JSP-2772; [07-82]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DJE")
      (=ucs		  . #x0452)	; ђ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0402)	; &JSP-2742;
      (=jis-x0212	  . #x2742)	; &JSP-2742; [07-34]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER GHE")
      (=ucs		  . #x0433)	; г
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x0453)	; ѓ
    (cyrillic-iso8859-5 . #xF3)	; &I-CYRILLIC-73;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GJE")
      (=ucs		  . #x0403)	; Ѓ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER GJE")
      (=ucs		  . #x0453)	; ѓ
      ))
    (=decomposition
     ((=ucs@gb/fw	  . #x0433)	; &J90-2754;
      (=ucs@jis/fw	  . #x0433)	; &J90-2754;
      (=jis-x0208	  . #x2754)	; &J90-2754; [07-52]
      (=gb2312		  . #x2754)	; &I-G0-2754; [07-52]
      (=ks-x1001	  . #x2C54)	; &I-K0-2C54; [12-52]
      (=jis-x0213-1	  . #x2754)	; &I-JX1-2754; [07-52]
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x0453)	; &J90-2754;́
    (=jis-x0212		. #x2773)	; &J90-2754;́ [07-83]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER GJE")
      (=ucs		  . #x0453)	; ѓ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0403)	; &J90-2724;́
      (=jis-x0212	  . #x2743)	; &J90-2724;́ [07-35]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UKRAINIAN IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0454)	; є
    (cyrillic-iso8859-5 . #xF4)	; &I-CYRILLIC-74;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER UKRAINIAN IE")
      (=ucs		  . #x0404)	; Є
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=ucs		  . #x0454)	; є
      ))
    (=ucs@jis/fw	. #x0454)	; &JSP-2774;
    (=jis-x0212		. #x2774)	; &JSP-2774; [07-84]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER UKRAINIAN IE")
      (=ucs		  . #x0454)	; є
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0404)	; &JSP-2744;
      (=jis-x0212	  . #x2744)	; &JSP-2744; [07-36]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0455)	; ѕ
    (cyrillic-iso8859-5 . #xF5)	; &I-CYRILLIC-75;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DZE")
      (=ucs		  . #x0405)	; Ѕ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER DZE")
      (=ucs		  . #x0455)	; ѕ
      ))
    (=ucs@jis/fw	. #x0455)	; &JSP-2775;
    (=jis-x0212		. #x2775)	; &JSP-2775; [07-85]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DZE")
      (=ucs		  . #x0455)	; ѕ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0405)	; &JSP-2745;
      (=jis-x0212	  . #x2745)	; &JSP-2745; [07-37]
      ))
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0456)	; і
    (cyrillic-iso8859-5 . #xF6)	; &I-CYRILLIC-76;
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0406)	; І
      ))
    ))
(define-char
  '((<-denotational
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; і
      ))
    (=ucs@jis/fw	. #x0456)	; &JSP-2776;
    (=jis-x0212		. #x2776)	; &JSP-2776; [07-86]
    (<-fullwidth
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; і
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0406)	; &JSP-2746;
      (=jis-x0212	  . #x2746)	; &JSP-2746; [07-38]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Ukrainian")
    (=decomposition
     ((name . "CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I")
      (=ucs		  . #x0456)	; і
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x0457)	; ї
    (cyrillic-iso8859-5 . #xF7)	; &I-CYRILLIC-77;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YI")
      (=ucs		  . #x0407)	; Ї
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER YI")
      (=ucs		  . #x0457)	; ї
      ))
    (=decomposition
     ((=ucs@jis/fw	  . #x0456)	; &JSP-2776;
      (=jis-x0212	  . #x2776)	; &JSP-2776; [07-86]
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs@jis/fw	. #x0457)	; &JSP-2776;̈
    (=jis-x0212		. #x2777)	; &JSP-2776;̈ [07-87]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER YI")
      (=ucs		  . #x0457)	; ї
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0407)	; &JSP-2746;̈
      (=jis-x0212	  . #x2747)	; &JSP-2746;̈ [07-39]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER JE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0458)	; ј
    (cyrillic-iso8859-5 . #xF8)	; &I-CYRILLIC-78;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER JE")
      (=ucs		  . #x0408)	; Ј
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER JE")
      (=ucs		  . #x0458)	; ј
      ))
    (=ucs@jis/fw	. #x0458)	; &JSP-2778;
    (=jis-x0212		. #x2778)	; &JSP-2778; [07-88]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER JE")
      (=ucs		  . #x0458)	; ј
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0408)	; &JSP-2748;
      (=jis-x0212	  . #x2748)	; &JSP-2748; [07-40]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0459)	; љ
    (cyrillic-iso8859-5 . #xF9)	; &I-CYRILLIC-79;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER LJE")
      (=ucs		  . #x0409)	; Љ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER LJE")
      (=ucs		  . #x0459)	; љ
      ))
    (=ucs@jis/fw	. #x0459)	; &JSP-2779;
    (=jis-x0212		. #x2779)	; &JSP-2779; [07-89]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER LJE")
      (=ucs		  . #x0459)	; љ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x0409)	; &JSP-2749;
      (=jis-x0212	  . #x2749)	; &JSP-2749; [07-41]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER NJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x045A)	; њ
    (cyrillic-iso8859-5 . #xFA)	; &I-CYRILLIC-7A;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER NJE")
      (=ucs		  . #x040A)	; Њ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER NJE")
      (=ucs		  . #x045A)	; њ
      ))
    (=ucs@jis/fw	. #x045A)	; &JSP-277A;
    (=jis-x0212		. #x277A)	; &JSP-277A; [07-90]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER NJE")
      (=ucs		  . #x045A)	; њ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x040A)	; &JSP-274A;
      (=jis-x0212	  . #x274A)	; &JSP-274A; [07-42]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TSHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Serbocroatian")
    (=ucs		. #x045B)	; ћ
    (cyrillic-iso8859-5 . #xFB)	; &I-CYRILLIC-7B;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TSHE")
      (=ucs		  . #x040B)	; Ћ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER TSHE")
      (=ucs		  . #x045B)	; ћ
      ))
    (=ucs@jis/fw	. #x045B)	; &JSP-277B;
    (=jis-x0212		. #x277B)	; &JSP-277B; [07-91]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER TSHE")
      (=ucs		  . #x045B)	; ћ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x040B)	; &JSP-274B;
      (=jis-x0212	  . #x274B)	; &JSP-274B; [07-43]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KJE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER KA")
      (=ucs		  . #x043A)	; к
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs		. #x045C)	; ќ
    (cyrillic-iso8859-5 . #xFC)	; &I-CYRILLIC-7C;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KJE")
      (=ucs		  . #x040C)	; Ќ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER KJE")
      (=ucs		  . #x045C)	; ќ
      ))
    (=decomposition
     ((=ucs@gb/fw	  . #x043A)	; &J90-275C;
      (=ucs@jis/fw	  . #x043A)	; &J90-275C;
      (=jis-x0208	  . #x275C)	; &J90-275C; [07-60]
      (=gb2312		  . #x275C)	; &I-G0-275C; [07-60]
      (=ks-x1001	  . #x2C5C)	; &I-K0-2C5C; [12-60]
      (=jis-x0213-1	  . #x275C)	; &I-JX1-275C; [07-60]
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (=ucs@jis/fw	. #x045C)	; &J90-275C;́
    (=jis-x0212		. #x277C)	; &J90-275C;́ [07-92]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER KJE")
      (=ucs		  . #x045C)	; ќ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x040C)	; &JSP-274C;
      (=jis-x0212	  . #x274C)	; &JSP-274C; [07-44]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH GRAVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      )
     ((name		  . "COMBINING GRAVE ACCENT")
      (=ucs		  . #x0300)	; ̀
      ))
    (=ucs		. #x045D)	; ѝ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH GRAVE")
      (=ucs		  . #x040D)	; Ѝ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHORT U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Byelorussian")
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x045E)	; ў
    (cyrillic-iso8859-5 . #xFE)	; &I-CYRILLIC-7E;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHORT U")
      (=ucs		  . #x040E)	; Ў
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER SHORT U")
      (=ucs		  . #x045E)	; ў
      ))
    (=decomposition
     ((=ucs@gb/fw	  . #x0443)	; &J90-2765;
      (=ucs@jis/fw	  . #x0443)	; &J90-2765;
      (=jis-x0208	  . #x2765)	; &J90-2765; [07-69]
      (=gb2312		  . #x2765)	; &I-G0-2765; [07-69]
      (=ks-x1001	  . #x2C65)	; &I-K0-2C65; [12-69]
      (=jis-x0213-1	  . #x2765)	; &I-JX1-2765; [07-69]
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs@jis/fw	. #x045E)	; &J90-2765;̆
    (=jis-x0212		. #x277D)	; &J90-2765;̆ [07-93]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER SHORT U")
      (=ucs		  . #x045E)	; ў
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x040E)	; &JSP-274D;
      (=jis-x0212	  . #x274D)	; &JSP-274D; [07-45]
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER DZHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x045F)	; џ
    (cyrillic-iso8859-5 . #xFF)	; &I-CYRILLIC-7F;
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER DZHE")
      (=ucs		  . #x040F)	; Џ
      ))
    ))
(define-char
  '((<-denotational
     ((name		  . "CYRILLIC SMALL LETTER DZHE")
      (=ucs		  . #x045F)	; џ
      ))
    (=ucs@jis/fw	. #x045F)	; &JSP-277E;
    (=jis-x0212		. #x277E)	; &JSP-277E; [07-94]
    (<-fullwidth
     ((name		  . "CYRILLIC SMALL LETTER DZHE")
      (=ucs		  . #x045F)	; џ
      ))
    (->uppercase
     ((=ucs@jis/fw	  . #x040F)	; &JSP-274E;
      (=jis-x0212	  . #x274E)	; &JSP-274E; [07-46]
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0460)	; Ѡ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OMEGA")
      (=ucs		  . #x0461)	; ѡ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0461)	; ѡ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OMEGA")
      (=ucs		  . #x0460)	; Ѡ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YAT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0462)	; Ѣ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YAT")
      (=ucs		  . #x0463)	; ѣ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YAT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0463)	; ѣ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER YAT")
      (=ucs		  . #x0462)	; Ѣ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0464)	; Ѥ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED E")
      (=ucs		  . #x0465)	; ѥ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0465)	; ѥ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IOTIFIED E")
      (=ucs		  . #x0464)	; Ѥ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER LITTLE YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0466)	; Ѧ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER LITTLE YUS")
      (=ucs		  . #x0467)	; ѧ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER LITTLE YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0467)	; ѧ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER LITTLE YUS")
      (=ucs		  . #x0466)	; Ѧ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0468)	; Ѩ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS")
      (=ucs		  . #x0469)	; ѩ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0469)	; ѩ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS")
      (=ucs		  . #x0468)	; Ѩ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BIG YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x046A)	; Ѫ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BIG YUS")
      (=ucs		  . #x046B)	; ѫ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BIG YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x046B)	; ѫ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BIG YUS")
      (=ucs		  . #x046A)	; Ѫ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x046C)	; Ѭ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IOTIFIED BIG YUS")
      (=ucs		  . #x046D)	; ѭ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IOTIFIED BIG YUS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x046D)	; ѭ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS")
      (=ucs		  . #x046C)	; Ѭ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x046E)	; Ѯ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KSI")
      (=ucs		  . #x046F)	; ѯ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x046F)	; ѯ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KSI")
      (=ucs		  . #x046E)	; Ѯ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PSI")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0470)	; Ѱ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PSI")
      (=ucs		  . #x0471)	; ѱ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PSI")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0471)	; ѱ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER PSI")
      (=ucs		  . #x0470)	; Ѱ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER FITA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0472)	; Ѳ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER FITA")
      (=ucs		  . #x0473)	; ѳ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER FITA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0473)	; ѳ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER FITA")
      (=ucs		  . #x0472)	; Ѳ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IZHITSA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0474)	; Ѵ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IZHITSA")
      (=ucs		  . #x0475)	; ѵ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IZHITSA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0475)	; ѵ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IZHITSA")
      (=ucs		  . #x0474)	; Ѵ
      ))
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER IZHITSA")
      (=ucs		  . #x0474)	; Ѵ
      )
     ((name		  . "COMBINING DOUBLE GRAVE ACCENT")
      (=ucs		  . #x030F)	; ̏
      ))
    (=ucs		. #x0476)	; Ѷ
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
      (=ucs		  . #x0477)	; ѷ
      ))
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER IZHITSA")
      (=ucs		  . #x0475)	; ѵ
      )
     ((name		  . "COMBINING DOUBLE GRAVE ACCENT")
      (=ucs		  . #x030F)	; ̏
      ))
    (=ucs		. #x0477)	; ѷ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT")
      (=ucs		  . #x0476)	; Ѷ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER UK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0478)	; Ѹ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER UK")
      (=ucs		  . #x0479)	; ѹ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER UK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0479)	; ѹ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER UK")
      (=ucs		  . #x0478)	; Ѹ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ROUND OMEGA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x047A)	; Ѻ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ROUND OMEGA")
      (=ucs		  . #x047B)	; ѻ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ROUND OMEGA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x047B)	; ѻ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ROUND OMEGA")
      (=ucs		  . #x047A)	; Ѻ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OMEGA WITH TITLO")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x047C)	; Ѽ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OMEGA WITH TITLO")
      (=ucs		  . #x047D)	; ѽ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OMEGA WITH TITLO")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x047D)	; ѽ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OMEGA WITH TITLO")
      (=ucs		  . #x047C)	; Ѽ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER OT")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x047E)	; Ѿ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER OT")
      (=ucs		  . #x047F)	; ѿ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER OT")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x047F)	; ѿ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER OT")
      (=ucs		  . #x047E)	; Ѿ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KOPPA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0480)	; Ҁ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KOPPA")
      (=ucs		  . #x0481)	; ҁ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KOPPA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0481)	; ҁ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KOPPA")
      (=ucs		  . #x0480)	; Ҁ
      ))
    ))
(define-char
  '((name		. "CYRILLIC THOUSANDS SIGN")
    (general-category	symbol other) ; Informative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0482)	; ҂
    ))
(define-char
  '((name		. "COMBINING CYRILLIC TITLO")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0483)	; ҃
    ))
(define-char
  '((name		. "COMBINING CYRILLIC PALATALIZATION")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0484)	; ҄
    ))
(define-char
  '((name		. "COMBINING CYRILLIC DASIA PNEUMATA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0485)	; ҅
    ))
(define-char
  '((name		. "COMBINING CYRILLIC PSILI PNEUMATA")
    (general-category	mark non-spacing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0486)	; ҆
    ))
(define-char
  '((name		. "COMBINING CYRILLIC HUNDRED THOUSANDS SIGN")
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0488)	; ҈
    ))
(define-char
  '((name		. "COMBINING CYRILLIC MILLIONS SIGN")
    (general-category	mark enclosing) ; Normative Category
    (bidi-category	. "NSM")
    (mirrored		. nil)
    (=ucs		. #x0489)	; ҉
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SEMISOFT SIGN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x048C)	; Ҍ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SEMISOFT SIGN")
      (=ucs		  . #x048D)	; ҍ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SEMISOFT SIGN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x048D)	; ҍ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SEMISOFT SIGN")
      (=ucs		  . #x048C)	; Ҍ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ER WITH TICK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x048E)	; Ҏ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ER WITH TICK")
      (=ucs		  . #x048F)	; ҏ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ER WITH TICK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x048F)	; ҏ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ER WITH TICK")
      (=ucs		  . #x048E)	; Ҏ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH UPTURN")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0490)	; Ґ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH UPTURN")
      (=ucs		  . #x0491)	; ґ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH UPTURN")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0491)	; ґ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE WITH UPTURN")
      (=ucs		  . #x0490)	; Ґ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0492)	; Ғ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH STROKE")
      (=ucs		  . #x0493)	; ғ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0493)	; ғ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER GHE WITH STROKE")
      (=ucs		  . #x0492)	; Ғ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0494)	; Ҕ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK")
      (=ucs		  . #x0495)	; ҕ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0495)	; ҕ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK")
      (=ucs		  . #x0494)	; Ҕ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0496)	; Җ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH DESCENDER")
      (=ucs		  . #x0497)	; җ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0497)	; җ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER")
      (=ucs		  . #x0496)	; Җ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0498)	; Ҙ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE WITH DESCENDER")
      (=ucs		  . #x0499)	; ҙ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0499)	; ҙ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE WITH DESCENDER")
      (=ucs		  . #x0498)	; Ҙ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x049A)	; Қ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH DESCENDER")
      (=ucs		  . #x049B)	; қ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x049B)	; қ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH DESCENDER")
      (=ucs		  . #x049A)	; Қ
      ))
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x049C)	; Ҝ
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE")
      (=ucs		  . #x049D)	; ҝ
      ))
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x049D)	; ҝ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE")
      (=ucs		  . #x049C)	; Ҝ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x049E)	; Ҟ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH STROKE")
      (=ucs		  . #x049F)	; ҟ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x049F)	; ҟ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH STROKE")
      (=ucs		  . #x049E)	; Ҟ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BASHKIR KA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04A0)	; Ҡ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BASHKIR KA")
      (=ucs		  . #x04A1)	; ҡ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BASHKIR KA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04A1)	; ҡ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BASHKIR KA")
      (=ucs		  . #x04A0)	; Ҡ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04A2)	; Ң
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN WITH DESCENDER")
      (=ucs		  . #x04A3)	; ң
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04A3)	; ң
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN WITH DESCENDER")
      (=ucs		  . #x04A2)	; Ң
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE EN GHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04A4)	; Ҥ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE EN GHE")
      (=ucs		  . #x04A5)	; ҥ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE EN GHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04A5)	; ҥ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE EN GHE")
      (=ucs		  . #x04A4)	; Ҥ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (=ucs		. #x04A6)	; Ҧ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK")
      (=ucs		  . #x04A7)	; ҧ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (=ucs		. #x04A7)	; ҧ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK")
      (=ucs		  . #x04A6)	; Ҧ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN HA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04A8)	; Ҩ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN HA")
      (=ucs		  . #x04A9)	; ҩ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN HA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04A9)	; ҩ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN HA")
      (=ucs		  . #x04A8)	; Ҩ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ES WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04AA)	; Ҫ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ES WITH DESCENDER")
      (=ucs		  . #x04AB)	; ҫ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ES WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04AB)	; ҫ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ES WITH DESCENDER")
      (=ucs		  . #x04AA)	; Ҫ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER TE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04AC)	; Ҭ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER TE WITH DESCENDER")
      (=ucs		  . #x04AD)	; ҭ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER TE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04AD)	; ҭ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER TE WITH DESCENDER")
      (=ucs		  . #x04AC)	; Ҭ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER STRAIGHT U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04AE)	; Ү
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER STRAIGHT U")
      (=ucs		  . #x04AF)	; ү
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER STRAIGHT U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04AF)	; ү
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER STRAIGHT U")
      (=ucs		  . #x04AE)	; Ү
      ))
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04B0)	; Ұ
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE")
      (=ucs		  . #x04B1)	; ұ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04B1)	; ұ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE")
      (=ucs		  . #x04B0)	; Ұ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER HA WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04B2)	; Ҳ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER HA WITH DESCENDER")
      (=ucs		  . #x04B3)	; ҳ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER HA WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04B3)	; ҳ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER HA WITH DESCENDER")
      (=ucs		  . #x04B2)	; Ҳ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE TE TSE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (=ucs		. #x04B4)	; Ҵ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE TE TSE")
      (=ucs		  . #x04B5)	; ҵ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE TE TSE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (iso-10646-comment	. "Abkhasian")
    (=ucs		. #x04B5)	; ҵ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE TE TSE")
      (=ucs		  . #x04B4)	; Ҵ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04B6)	; Ҷ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE WITH DESCENDER")
      (=ucs		  . #x04B7)	; ҷ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04B7)	; ҷ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE WITH DESCENDER")
      (=ucs		  . #x04B6)	; Ҷ
      ))
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04B8)	; Ҹ
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE")
      (=ucs		  . #x04B9)	; ҹ
      ))
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04B9)	; ҹ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE")
      (=ucs		  . #x04B8)	; Ҹ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SHHA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04BA)	; Һ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SHHA")
      (=ucs		  . #x04BB)	; һ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SHHA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04BB)	; һ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SHHA")
      (=ucs		  . #x04BA)	; Һ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04BC)	; Ҽ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN CHE")
      (=ucs		  . #x04BD)	; ҽ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04BD)	; ҽ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE")
      (=ucs		  . #x04BC)	; Ҽ
      ))
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04BE)	; Ҿ
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER")
      (=ucs		  . #x04BF)	; ҿ
      ))
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04BF)	; ҿ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER")
      (=ucs		  . #x04BE)	; Ҿ
      ))
    ))
(define-char
  '((name		. "CYRILLIC LETTER PALOCHKA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04C0)	; Ӏ
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ж
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x04C1)	; Ӂ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH BREVE")
      (=ucs		  . #x04C2)	; ӂ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; ж
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x04C2)	; ӂ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH BREVE")
      (=ucs		  . #x04C1)	; Ӂ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KA WITH HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04C3)	; Ӄ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KA WITH HOOK")
      (=ucs		  . #x04C4)	; ӄ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KA WITH HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04C4)	; ӄ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KA WITH HOOK")
      (=ucs		  . #x04C3)	; Ӄ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER EN WITH HOOK")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04C7)	; Ӈ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER EN WITH HOOK")
      (=ucs		  . #x04C8)	; ӈ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER EN WITH HOOK")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04C8)	; ӈ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER EN WITH HOOK")
      (=ucs		  . #x04C7)	; Ӈ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER KHAKASSIAN CHE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04CB)	; Ӌ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER KHAKASSIAN CHE")
      (=ucs		  . #x04CC)	; ӌ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER KHAKASSIAN CHE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04CC)	; ӌ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER KHAKASSIAN CHE")
      (=ucs		  . #x04CB)	; Ӌ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; А
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x04D0)	; Ӑ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A WITH BREVE")
      (=ucs		  . #x04D1)	; ӑ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; а
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x04D1)	; ӑ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A WITH BREVE")
      (=ucs		  . #x04D0)	; Ӑ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER A WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER A")
      (=ucs		  . #x0410)	; А
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04D2)	; Ӓ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER A WITH DIAERESIS")
      (=ucs		  . #x04D3)	; ӓ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER A WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER A")
      (=ucs		  . #x0430)	; а
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04D3)	; ӓ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER A WITH DIAERESIS")
      (=ucs		  . #x04D2)	; Ӓ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LIGATURE A IE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04D4)	; Ӕ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LIGATURE A IE")
      (=ucs		  . #x04D5)	; ӕ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LIGATURE A IE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04D5)	; ӕ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LIGATURE A IE")
      (=ucs		  . #x04D4)	; Ӕ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER IE WITH BREVE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER IE")
      (=ucs		  . #x0415)	; Е
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x04D6)	; Ӗ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER IE WITH BREVE")
      (=ucs		  . #x04D7)	; ӗ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER IE WITH BREVE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER IE")
      (=ucs		  . #x0435)	; е
      )
     ((name		  . "COMBINING BREVE")
      (=ucs		  . #x0306)	; ̆
      ))
    (=ucs		. #x04D7)	; ӗ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER IE WITH BREVE")
      (=ucs		  . #x04D6)	; Ӗ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SCHWA")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04D8)	; Ә
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SCHWA")
      (=ucs		  . #x04D9)	; ә
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SCHWA")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04D9)	; ә
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER SCHWA")
      (=ucs		  . #x04D8)	; Ә
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER SCHWA")
      (=ucs		  . #x04D8)	; Ә
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04DA)	; Ӛ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS")
      (=ucs		  . #x04DB)	; ӛ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER SCHWA")
      (=ucs		  . #x04D9)	; ә
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04DB)	; ӛ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS")
      (=ucs		  . #x04DA)	; Ӛ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE")
      (=ucs		  . #x0416)	; Ж
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04DC)	; Ӝ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZHE WITH DIAERESIS")
      (=ucs		  . #x04DD)	; ӝ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZHE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER ZHE")
      (=ucs		  . #x0436)	; ж
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04DD)	; ӝ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS")
      (=ucs		  . #x04DC)	; Ӝ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER ZE")
      (=ucs		  . #x0417)	; З
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04DE)	; Ӟ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ZE WITH DIAERESIS")
      (=ucs		  . #x04DF)	; ӟ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ZE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER ZE")
      (=ucs		  . #x0437)	; з
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04DF)	; ӟ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS")
      (=ucs		  . #x04DE)	; Ӟ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER ABKHASIAN DZE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04E0)	; Ӡ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER ABKHASIAN DZE")
      (=ucs		  . #x04E1)	; ӡ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER ABKHASIAN DZE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04E1)	; ӡ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER ABKHASIAN DZE")
      (=ucs		  . #x04E0)	; Ӡ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x04E2)	; Ӣ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH MACRON")
      (=ucs		  . #x04E3)	; ӣ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x04E3)	; ӣ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH MACRON")
      (=ucs		  . #x04E2)	; Ӣ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER I WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER I")
      (=ucs		  . #x0418)	; И
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04E4)	; Ӥ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER I WITH DIAERESIS")
      (=ucs		  . #x04E5)	; ӥ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER I WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER I")
      (=ucs		  . #x0438)	; и
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04E5)	; ӥ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER I WITH DIAERESIS")
      (=ucs		  . #x04E4)	; Ӥ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER O")
      (=ucs		  . #x041E)	; О
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04E6)	; Ӧ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER O WITH DIAERESIS")
      (=ucs		  . #x04E7)	; ӧ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER O")
      (=ucs		  . #x043E)	; о
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04E7)	; ӧ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER O WITH DIAERESIS")
      (=ucs		  . #x04E6)	; Ӧ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER BARRED O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04E8)	; Ө
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER BARRED O")
      (=ucs		  . #x04E9)	; ө
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER BARRED O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x04E9)	; ө
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER BARRED O")
      (=ucs		  . #x04E8)	; Ө
      ))
    ))
(define-char
  '((name . "CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER BARRED O")
      (=ucs		  . #x04E8)	; Ө
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04EA)	; Ӫ
    (->lowercase
     ((name . "CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS")
      (=ucs		  . #x04EB)	; ӫ
      ))
    ))
(define-char
  '((name . "CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER BARRED O")
      (=ucs		  . #x04E9)	; ө
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04EB)	; ӫ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS")
      (=ucs		  . #x04EA)	; Ӫ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER E WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER E")
      (=ucs		  . #x042D)	; Э
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04EC)	; Ӭ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER E WITH DIAERESIS")
      (=ucs		  . #x04ED)	; ӭ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER E WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER E")
      (=ucs		  . #x044D)	; э
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04ED)	; ӭ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER E WITH DIAERESIS")
      (=ucs		  . #x04EC)	; Ӭ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH MACRON")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x04EE)	; Ӯ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH MACRON")
      (=ucs		  . #x04EF)	; ӯ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH MACRON")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      )
     ((name		  . "COMBINING MACRON")
      (=ucs		  . #x0304)	; ̄
      ))
    (=ucs		. #x04EF)	; ӯ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U WITH MACRON")
      (=ucs		  . #x04EE)	; Ӯ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04F0)	; Ӱ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH DIAERESIS")
      (=ucs		  . #x04F1)	; ӱ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04F1)	; ӱ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER U WITH DIAERESIS")
      (=ucs		  . #x04F0)	; Ӱ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER U")
      (=ucs		  . #x0423)	; У
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs		. #x04F2)	; Ӳ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x04F3)	; ӳ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER U")
      (=ucs		  . #x0443)	; у
      )
     ((name		  . "COMBINING DOUBLE ACUTE ACCENT")
      (=ucs		  . #x030B)	; ̋
      ))
    (=ucs		. #x04F3)	; ӳ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE")
      (=ucs		  . #x04F2)	; Ӳ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER CHE")
      (=ucs		  . #x0427)	; Ч
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04F4)	; Ӵ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER CHE WITH DIAERESIS")
      (=ucs		  . #x04F5)	; ӵ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER CHE WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER CHE")
      (=ucs		  . #x0447)	; ч
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04F5)	; ӵ
    (->uppercase
     ((name		  . "CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS")
      (=ucs		  . #x04F4)	; Ӵ
      ))
    ))
(define-char
  '((name		. "CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC CAPITAL LETTER YERU")
      (=ucs		  . #x042B)	; Ы
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04F8)	; Ӹ
    (->lowercase
     ((name		  . "CYRILLIC SMALL LETTER YERU WITH DIAERESIS")
      (=ucs		  . #x04F9)	; ӹ
      ))
    ))
(define-char
  '((name		. "CYRILLIC SMALL LETTER YERU WITH DIAERESIS")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=decomposition
     ((name		  . "CYRILLIC SMALL LETTER YERU")
      (=ucs		  . #x044B)	; ы
      )
     ((name		  . "COMBINING DIAERESIS")
      (=ucs		  . #x0308)	; ̈
      ))
    (=ucs		. #x04F9)	; ӹ
    (->uppercase
     ((name . "CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS")
      (=ucs		  . #x04F8)	; Ӹ
      ))
    ))
