;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name		. "SPACE")
    (general-category	separator space) ; Normative Category
    (bidi-category	. "WS")
    (mirrored		. nil)
    (=ucs		. #x0020)	;
    (ascii		. #x20)	;
    (latin-viscii	. #x20)	;
    (ipa		. #xFF)	; &I-MULE-IPA-7F;
    (arabic-1-column	. #x21)	; &I-MULE-ARB1-21;
    ))
(define-char
  '((name		. "EXCLAMATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x0021)	; !
    (ascii		. #x21)	; !
    (latin-jisx0201	. #x21)	; &I-LATINJ-21;
    (latin-viscii	. #x21)	; !
    (arabic-1-column	. #x22)	; &I-MULE-ARB1-22;
    (->fullwidth
     ((name		  . "FULLWIDTH EXCLAMATION MARK")
      (=ucs		  . #xFF01)	; ！
      ))
    ))
(define-char
  '((name		. "QUOTATION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x0022)	; "
    (ascii		. #x22)	; "
    (latin-jisx0201	. #x22)	; &I-LATINJ-22;
    (latin-viscii	. #x22)	; "
    (->fullwidth
     ((name		  . "FULLWIDTH QUOTATION MARK")
      (=ucs		  . #xFF02)	; ＂
      ))
    ))
(define-char
  '((name		. "NUMBER SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x0023)	; #
    (ascii		. #x23)	; #
    (latin-jisx0201	. #x23)	; &I-LATINJ-23;
    (latin-viscii	. #x23)	; #
    (->fullwidth
     ((name		  . "FULLWIDTH NUMBER SIGN")
      (=ucs		  . #xFF03)	; ＃
      ))
    ))
(define-char
  '((name		. "DOLLAR SIGN")
    (general-category	symbol currency) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x0024)	; $
    (ascii		. #x24)	; $
    (latin-jisx0201	. #x24)	; &I-LATINJ-24;
    (latin-viscii	. #x24)	; $
    (->fullwidth
     ((name		  . "FULLWIDTH DOLLAR SIGN")
      (=ucs		  . #xFF04)	; ＄
      ))
    ))
(define-char
  '((name		. "PERCENT SIGN")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x0025)	; %
    (ascii		. #x25)	; %
    (latin-jisx0201	. #x25)	; &I-LATINJ-25;
    (latin-viscii	. #x25)	; %
    (->fullwidth
     ((name		  . "FULLWIDTH PERCENT SIGN")
      (=ucs		  . #xFF05)	; ％
      ))
    ))
(define-char
  '((name		. "AMPERSAND")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x0026)	; &
    (ascii		. #x26)	; &
    (latin-jisx0201	. #x26)	; &I-LATINJ-26;
    (latin-viscii	. #x26)	; &
    (->fullwidth
     ((name		  . "FULLWIDTH AMPERSAND")
      (=ucs		  . #xFF06)	; ＆
      ))
    ))
(define-char
  '((name		. "APOSTROPHE")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x0027)	; '
    (ascii		. #x27)	; '
    (latin-jisx0201	. #x27)	; &I-LATINJ-27;
    (latin-viscii	. #x27)	; '
    (->fullwidth
     ((name		  . "FULLWIDTH APOSTROPHE")
      (=ucs		  . #xFF07)	; ＇
      ))
    ))
(define-char
  '((name		. "LEFT PARENTHESIS")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x0028)	; (
    (ascii		. #x28)	; (
    (latin-jisx0201	. #x28)	; &I-LATINJ-28;
    (latin-viscii	. #x28)	; (
    (arabic-1-column	. #x24)	; &I-MULE-ARB1-24;
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT PARENTHESIS")
      (=ucs		  . #xFF08)	; （
      ))
    ))
(define-char
  '((name		. "RIGHT PARENTHESIS")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x0029)	; )
    (ascii		. #x29)	; )
    (latin-jisx0201	. #x29)	; &I-LATINJ-29;
    (latin-viscii	. #x29)	; )
    (arabic-1-column	. #x23)	; &I-MULE-ARB1-23;
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT PARENTHESIS")
      (=ucs		  . #xFF09)	; ）
      ))
    ))
(define-char
  '((name		. "ASTERISK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x002A)	; *
    (ascii		. #x2A)	; *
    (latin-jisx0201	. #x2A)	; &I-LATINJ-2A;
    (latin-viscii	. #x2A)	; *
    (->fullwidth
     ((name		  . "FULLWIDTH ASTERISK")
      (=ucs		  . #xFF0A)	; ＊
      ))
    ))
(define-char
  '((name		. "PLUS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x002B)	; +
    (ascii		. #x2B)	; +
    (latin-jisx0201	. #x2B)	; &I-LATINJ-2B;
    (latin-viscii	. #x2B)	; +
    (->fullwidth
     ((name		  . "FULLWIDTH PLUS SIGN")
      (=ucs		  . #xFF0B)	; ＋
      ))
    ))
(define-char
  '((name		. "COMMA")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (=ucs		. #x002C)	; ,
    (ascii		. #x2C)	; ,
    (latin-jisx0201	. #x2C)	; &I-LATINJ-2C;
    (latin-viscii	. #x2C)	; ,
    (->fullwidth
     ((name		  . "FULLWIDTH COMMA")
      (=ucs		  . #xFF0C)	; ，
      ))
    ))
(define-char
  '((name		. "HYPHEN-MINUS")
    (general-category	punctuation dash) ; Informative Category
    (bidi-category	. "ET")
    (mirrored		. nil)
    (=ucs		. #x002D)	; -
    (ascii		. #x2D)	; -
    (latin-jisx0201	. #x2D)	; &I-LATINJ-2D;
    (latin-viscii	. #x2D)	; -
    (->fullwidth
     ((name		  . "FULLWIDTH HYPHEN-MINUS")
      (=ucs		  . #xFF0D)	; －
      ))
    ))
(define-char
  '((name		. "FULL STOP")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (=ucs		. #x002E)	; .
    (ascii		. #x2E)	; .
    (latin-jisx0201	. #x2E)	; &I-LATINJ-2E;
    (latin-viscii	. #x2E)	; .
    (arabic-1-column	. #x26)	; &I-MULE-ARB1-26;
    (->fullwidth
     ((name		  . "FULLWIDTH FULL STOP")
      (=ucs		  . #xFF0E)	; ．
      ))
    ))
(define-char
  '((name		. "SOLIDUS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ES")
    (mirrored		. nil)
    (=ucs		. #x002F)	; /
    (ascii		. #x2F)	; /
    (latin-jisx0201	. #x2F)	; &I-LATINJ-2F;
    (latin-viscii	. #x2F)	; /
    (->fullwidth
     ((name		  . "FULLWIDTH SOLIDUS")
      (=ucs		  . #xFF0F)	; ／
      ))
    ))
(define-char
  '((name		. "DIGIT ZERO")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 0)
    (digit-value	 . 0)
    (numeric-value	 . 0)
    (=ucs		. #x0030)	; 0
    (ascii		. #x30)	; 0
    (latin-jisx0201	. #x30)	; &I-LATINJ-30;
    (latin-viscii	. #x30)	; 0
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT ZERO")
      (=ucs		  . #xFF10)	; ０
      ))
    ))
(define-char
  '((name		. "DIGIT ONE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 1)
    (digit-value	 . 1)
    (numeric-value	 . 1)
    (=ucs		. #x0031)	; 1
    (ascii		. #x31)	; 1
    (latin-jisx0201	. #x31)	; &I-LATINJ-31;
    (latin-viscii	. #x31)	; 1
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT ONE")
      (=ucs		  . #xFF11)	; １
      ))
    ))
(define-char
  '((name		. "DIGIT TWO")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 2)
    (digit-value	 . 2)
    (numeric-value	 . 2)
    (=ucs		. #x0032)	; 2
    (ascii		. #x32)	; 2
    (latin-jisx0201	. #x32)	; &I-LATINJ-32;
    (latin-viscii	. #x32)	; 2
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT TWO")
      (=ucs		  . #xFF12)	; ２
      ))
    ))
(define-char
  '((name		. "DIGIT THREE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 3)
    (digit-value	 . 3)
    (numeric-value	 . 3)
    (=ucs		. #x0033)	; 3
    (ascii		. #x33)	; 3
    (latin-jisx0201	. #x33)	; &I-LATINJ-33;
    (latin-viscii	. #x33)	; 3
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT THREE")
      (=ucs		  . #xFF13)	; ３
      ))
    ))
(define-char
  '((name		. "DIGIT FOUR")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 4)
    (digit-value	 . 4)
    (numeric-value	 . 4)
    (=ucs		. #x0034)	; 4
    (ascii		. #x34)	; 4
    (latin-jisx0201	. #x34)	; &I-LATINJ-34;
    (latin-viscii	. #x34)	; 4
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT FOUR")
      (=ucs		  . #xFF14)	; ４
      ))
    ))
(define-char
  '((name		. "DIGIT FIVE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 5)
    (digit-value	 . 5)
    (numeric-value	 . 5)
    (=ucs		. #x0035)	; 5
    (ascii		. #x35)	; 5
    (latin-jisx0201	. #x35)	; &I-LATINJ-35;
    (latin-viscii	. #x35)	; 5
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT FIVE")
      (=ucs		  . #xFF15)	; ５
      ))
    ))
(define-char
  '((name		. "DIGIT SIX")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 6)
    (digit-value	 . 6)
    (numeric-value	 . 6)
    (=ucs		. #x0036)	; 6
    (ascii		. #x36)	; 6
    (latin-jisx0201	. #x36)	; &I-LATINJ-36;
    (latin-viscii	. #x36)	; 6
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT SIX")
      (=ucs		  . #xFF16)	; ６
      ))
    ))
(define-char
  '((name		. "DIGIT SEVEN")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 7)
    (digit-value	 . 7)
    (numeric-value	 . 7)
    (=ucs		. #x0037)	; 7
    (ascii		. #x37)	; 7
    (latin-jisx0201	. #x37)	; &I-LATINJ-37;
    (latin-viscii	. #x37)	; 7
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT SEVEN")
      (=ucs		  . #xFF17)	; ７
      ))
    ))
(define-char
  '((name		. "DIGIT EIGHT")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 8)
    (digit-value	 . 8)
    (numeric-value	 . 8)
    (=ucs		. #x0038)	; 8
    (ascii		. #x38)	; 8
    (latin-jisx0201	. #x38)	; &I-LATINJ-38;
    (latin-viscii	. #x38)	; 8
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT EIGHT")
      (=ucs		  . #xFF18)	; ８
      ))
    ))
(define-char
  '((name		. "DIGIT NINE")
    (general-category	number decimal-digit) ; Normative Category
    (bidi-category	. "EN")
    (mirrored		. nil)
    (decimal-digit-value . 9)
    (digit-value	 . 9)
    (numeric-value	 . 9)
    (=ucs		. #x0039)	; 9
    (ascii		. #x39)	; 9
    (latin-jisx0201	. #x39)	; &I-LATINJ-39;
    (latin-viscii	. #x39)	; 9
    (->fullwidth
     ((name		  . "FULLWIDTH DIGIT NINE")
      (=ucs		  . #xFF19)	; ９
      ))
    ))
(define-char
  '((name		. "COLON")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "CS")
    (mirrored		. nil)
    (=ucs		. #x003A)	; :
    (ascii		. #x3A)	; :
    (latin-jisx0201	. #x3A)	; &I-LATINJ-3A;
    (latin-viscii	. #x3A)	; :
    (arabic-1-column	. #x27)	; &I-MULE-ARB1-27;
    (->fullwidth
     ((name		  . "FULLWIDTH COLON")
      (=ucs		  . #xFF1A)	; ：
      ))
    ))
(define-char
  '((name		. "SEMICOLON")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x003B)	; ;
    (ascii		. #x3B)	; ;
    (latin-jisx0201	. #x3B)	; &I-LATINJ-3B;
    (latin-viscii	. #x3B)	; ;
    (->fullwidth
     ((name		  . "FULLWIDTH SEMICOLON")
      (=ucs		  . #xFF1B)	; ；
      ))
    ))
(define-char
  '((name		. "LESS-THAN SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x003C)	; <
    (ascii		. #x3C)	; <
    (latin-jisx0201	. #x3C)	; &I-LATINJ-3C;
    (latin-viscii	. #x3C)	; <
    (->fullwidth
     ((name		  . "FULLWIDTH LESS-THAN SIGN")
      (=ucs		  . #xFF1C)	; ＜
      ))
    ))
(define-char
  '((name		. "EQUALS SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x003D)	; =
    (ascii		. #x3D)	; =
    (latin-jisx0201	. #x3D)	; &I-LATINJ-3D;
    (latin-viscii	. #x3D)	; =
    (->fullwidth
     ((name		  . "FULLWIDTH EQUALS SIGN")
      (=ucs		  . #xFF1D)	; ＝
      ))
    ))
(define-char
  '((name		. "GREATER-THAN SIGN")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x003E)	; >
    (ascii		. #x3E)	; >
    (latin-jisx0201	. #x3E)	; &I-LATINJ-3E;
    (latin-viscii	. #x3E)	; >
    (->fullwidth
     ((name		  . "FULLWIDTH GREATER-THAN SIGN")
      (=ucs		  . #xFF1E)	; ＞
      ))
    ))
(define-char
  '((name		. "QUESTION MARK")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x003F)	; ?
    (ascii		. #x3F)	; ?
    (latin-jisx0201	. #x3F)	; &I-LATINJ-3F;
    (latin-viscii	. #x3F)	; ?
    (->fullwidth
     ((name		  . "FULLWIDTH QUESTION MARK")
      (=ucs		  . #xFF1F)	; ？
      ))
    ))
(define-char
  '((name		. "COMMERCIAL AT")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x0040)	; @
    (ascii		. #x40)	; @
    (latin-jisx0201	. #x40)	; &I-LATINJ-40;
    (latin-viscii	. #x40)	; @
    (->fullwidth
     ((name		  . "FULLWIDTH COMMERCIAL AT")
      (=ucs		  . #xFF20)	; ＠
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER A")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0041)	; A
    (ascii		. #x41)	; A
    (latin-jisx0201	. #x41)	; &I-LATINJ-41;
    (latin-viscii	. #x41)	; A
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER A")
      (=ucs		  . #xFF21)	; Ａ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER A")
      (=ucs		  . #x0061)	; a
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER B")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0042)	; B
    (ascii		. #x42)	; B
    (latin-jisx0201	. #x42)	; &I-LATINJ-42;
    (latin-viscii	. #x42)	; B
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER B")
      (=ucs		  . #xFF22)	; Ｂ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER B")
      (=ucs		  . #x0062)	; b
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER C")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0043)	; C
    (ascii		. #x43)	; C
    (latin-jisx0201	. #x43)	; &I-LATINJ-43;
    (latin-viscii	. #x43)	; C
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER C")
      (=ucs		  . #xFF23)	; Ｃ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER C")
      (=ucs		  . #x0063)	; c
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER D")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0044)	; D
    (ascii		. #x44)	; D
    (latin-jisx0201	. #x44)	; &I-LATINJ-44;
    (latin-viscii	. #x44)	; D
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER D")
      (=ucs		  . #xFF24)	; Ｄ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER D")
      (=ucs		  . #x0064)	; d
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER E")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0045)	; E
    (ascii		. #x45)	; E
    (latin-jisx0201	. #x45)	; &I-LATINJ-45;
    (latin-viscii	. #x45)	; E
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER E")
      (=ucs		  . #xFF25)	; Ｅ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER E")
      (=ucs		  . #x0065)	; e
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER F")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0046)	; F
    (ascii		. #x46)	; F
    (latin-jisx0201	. #x46)	; &I-LATINJ-46;
    (latin-viscii	. #x46)	; F
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER F")
      (=ucs		  . #xFF26)	; Ｆ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER F")
      (=ucs		  . #x0066)	; f
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER G")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0047)	; G
    (ascii		. #x47)	; G
    (latin-jisx0201	. #x47)	; &I-LATINJ-47;
    (latin-viscii	. #x47)	; G
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER G")
      (=ucs		  . #xFF27)	; Ｇ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER G")
      (=ucs		  . #x0067)	; g
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER H")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0048)	; H
    (ascii		. #x48)	; H
    (latin-jisx0201	. #x48)	; &I-LATINJ-48;
    (latin-viscii	. #x48)	; H
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER H")
      (=ucs		  . #xFF28)	; Ｈ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER H")
      (=ucs		  . #x0068)	; h
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER I")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0049)	; I
    (ascii		. #x49)	; I
    (latin-jisx0201	. #x49)	; &I-LATINJ-49;
    (latin-viscii	. #x49)	; I
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER I")
      (=ucs		  . #xFF29)	; Ｉ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER I")
      (=ucs		  . #x0069)	; i
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER J")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x004A)	; J
    (ascii		. #x4A)	; J
    (latin-jisx0201	. #x4A)	; &I-LATINJ-4A;
    (latin-viscii	. #x4A)	; J
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER J")
      (=ucs		  . #xFF2A)	; Ｊ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER J")
      (=ucs		  . #x006A)	; j
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER K")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x004B)	; K
    (ascii		. #x4B)	; K
    (latin-jisx0201	. #x4B)	; &I-LATINJ-4B;
    (latin-viscii	. #x4B)	; K
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER K")
      (=ucs		  . #xFF2B)	; Ｋ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER K")
      (=ucs		  . #x006B)	; k
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER L")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x004C)	; L
    (ascii		. #x4C)	; L
    (latin-jisx0201	. #x4C)	; &I-LATINJ-4C;
    (latin-viscii	. #x4C)	; L
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER L")
      (=ucs		  . #xFF2C)	; Ｌ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER L")
      (=ucs		  . #x006C)	; l
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER M")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x004D)	; M
    (ascii		. #x4D)	; M
    (latin-jisx0201	. #x4D)	; &I-LATINJ-4D;
    (latin-viscii	. #x4D)	; M
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER M")
      (=ucs		  . #xFF2D)	; Ｍ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER M")
      (=ucs		  . #x006D)	; m
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER N")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x004E)	; N
    (ascii		. #x4E)	; N
    (latin-jisx0201	. #x4E)	; &I-LATINJ-4E;
    (latin-viscii	. #x4E)	; N
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER N")
      (=ucs		  . #xFF2E)	; Ｎ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER N")
      (=ucs		  . #x006E)	; n
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER O")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x004F)	; O
    (ascii		. #x4F)	; O
    (latin-jisx0201	. #x4F)	; &I-LATINJ-4F;
    (latin-viscii	. #x4F)	; O
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER O")
      (=ucs		  . #xFF2F)	; Ｏ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER O")
      (=ucs		  . #x006F)	; o
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER P")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0050)	; P
    (ascii		. #x50)	; P
    (latin-jisx0201	. #x50)	; &I-LATINJ-50;
    (latin-viscii	. #x50)	; P
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER P")
      (=ucs		  . #xFF30)	; Ｐ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER P")
      (=ucs		  . #x0070)	; p
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Q")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0051)	; Q
    (ascii		. #x51)	; Q
    (latin-jisx0201	. #x51)	; &I-LATINJ-51;
    (latin-viscii	. #x51)	; Q
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Q")
      (=ucs		  . #xFF31)	; Ｑ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Q")
      (=ucs		  . #x0071)	; q
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER R")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0052)	; R
    (ascii		. #x52)	; R
    (latin-jisx0201	. #x52)	; &I-LATINJ-52;
    (latin-viscii	. #x52)	; R
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER R")
      (=ucs		  . #xFF32)	; Ｒ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER R")
      (=ucs		  . #x0072)	; r
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER S")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0053)	; S
    (ascii		. #x53)	; S
    (latin-jisx0201	. #x53)	; &I-LATINJ-53;
    (latin-viscii	. #x53)	; S
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER S")
      (=ucs		  . #xFF33)	; Ｓ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER S")
      (=ucs		  . #x0073)	; s
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER T")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0054)	; T
    (ascii		. #x54)	; T
    (latin-jisx0201	. #x54)	; &I-LATINJ-54;
    (latin-viscii	. #x54)	; T
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER T")
      (=ucs		  . #xFF34)	; Ｔ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER T")
      (=ucs		  . #x0074)	; t
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER U")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0055)	; U
    (ascii		. #x55)	; U
    (latin-jisx0201	. #x55)	; &I-LATINJ-55;
    (latin-viscii	. #x55)	; U
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER U")
      (=ucs		  . #xFF35)	; Ｕ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER U")
      (=ucs		  . #x0075)	; u
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER V")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0056)	; V
    (ascii		. #x56)	; V
    (latin-jisx0201	. #x56)	; &I-LATINJ-56;
    (latin-viscii	. #x56)	; V
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER V")
      (=ucs		  . #xFF36)	; Ｖ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER V")
      (=ucs		  . #x0076)	; v
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER W")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0057)	; W
    (ascii		. #x57)	; W
    (latin-jisx0201	. #x57)	; &I-LATINJ-57;
    (latin-viscii	. #x57)	; W
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER W")
      (=ucs		  . #xFF37)	; Ｗ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER W")
      (=ucs		  . #x0077)	; w
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER X")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0058)	; X
    (ascii		. #x58)	; X
    (latin-jisx0201	. #x58)	; &I-LATINJ-58;
    (latin-viscii	. #x58)	; X
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER X")
      (=ucs		  . #xFF38)	; Ｘ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER X")
      (=ucs		  . #x0078)	; x
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Y")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0059)	; Y
    (ascii		. #x59)	; Y
    (latin-jisx0201	. #x59)	; &I-LATINJ-59;
    (latin-viscii	. #x59)	; Y
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Y")
      (=ucs		  . #xFF39)	; Ｙ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Y")
      (=ucs		  . #x0079)	; y
      ))
    ))
(define-char
  '((name		. "LATIN CAPITAL LETTER Z")
    (general-category	letter uppercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x005A)	; Z
    (ascii		. #x5A)	; Z
    (latin-jisx0201	. #x5A)	; &I-LATINJ-5A;
    (latin-viscii	. #x5A)	; Z
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN CAPITAL LETTER Z")
      (=ucs		  . #xFF3A)	; Ｚ
      ))
    (->lowercase
     ((name		  . "LATIN SMALL LETTER Z")
      (=ucs		  . #x007A)	; z
      ))
    ))
(define-char
  '((name		. "LEFT SQUARE BRACKET")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x005B)	; [
    (ascii		. #x5B)	; [
    (latin-jisx0201	. #x5B)	; &I-LATINJ-5B;
    (latin-viscii	. #x5B)	; [
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT SQUARE BRACKET")
      (=ucs		  . #xFF3B)	; ［
      ))
    ))
(define-char
  '((name		. "REVERSE SOLIDUS")
    (general-category	punctuation other) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x005C)	; \
    (ascii		. #x5C)	; \
    (latin-viscii	. #x5C)	; \
    (->fullwidth
     ((name		  . "FULLWIDTH REVERSE SOLIDUS")
      (=ucs		  . #xFF3C)	; ＼
      ))
    ))
(define-char
  '((name		. "RIGHT SQUARE BRACKET")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x005D)	; ]
    (ascii		. #x5D)	; ]
    (latin-jisx0201	. #x5D)	; &I-LATINJ-5D;
    (latin-viscii	. #x5D)	; ]
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT SQUARE BRACKET")
      (=ucs		  . #xFF3D)	; ］
      ))
    ))
(define-char
  '((name		. "CIRCUMFLEX ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x005E)	; ^
    (ascii		. #x5E)	; ^
    (latin-jisx0201	. #x5E)	; &I-LATINJ-5E;
    (latin-viscii	. #x5E)	; ^
    (->fullwidth
     ((name		  . "FULLWIDTH CIRCUMFLEX ACCENT")
      (=ucs		  . #xFF3E)	; ＾
      ))
    ))
(define-char
  '((name		. "LOW LINE")
    (general-category	punctuation connector) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x005F)	; _
    (ascii		. #x5F)	; _
    (latin-jisx0201	. #x5F)	; &I-LATINJ-5F;
    (latin-viscii	. #x5F)	; _
    (->fullwidth
     ((name		  . "FULLWIDTH LOW LINE")
      (=ucs		  . #xFF3F)	; ＿
      ))
    ))
(define-char
  '((name		. "GRAVE ACCENT")
    (general-category	symbol modifier) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x0060)	; `
    (ascii		. #x60)	; `
    (latin-jisx0201	. #x60)	; &I-LATINJ-60;
    (latin-viscii	. #x60)	; `
    (->fullwidth
     ((name		  . "FULLWIDTH GRAVE ACCENT")
      (=ucs		  . #xFF40)	; ｀
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER A")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0061)	; a
    (ascii		. #x61)	; a
    (latin-jisx0201	. #x61)	; &I-LATINJ-61;
    (latin-viscii	. #x61)	; a
    (ipa		. #xA5)	; &I-MULE-IPA-25;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER A")
      (=ucs		  . #xFF41)	; ａ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER A")
      (=ucs		  . #x0041)	; A
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER B")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0062)	; b
    (ascii		. #x62)	; b
    (latin-jisx0201	. #x62)	; &I-LATINJ-62;
    (latin-viscii	. #x62)	; b
    (ipa		. #xC1)	; &I-MULE-IPA-41;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER B")
      (=ucs		  . #xFF42)	; ｂ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER B")
      (=ucs		  . #x0042)	; B
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER C")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0063)	; c
    (ascii		. #x63)	; c
    (latin-jisx0201	. #x63)	; &I-LATINJ-63;
    (latin-viscii	. #x63)	; c
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER C")
      (=ucs		  . #xFF43)	; ｃ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER C")
      (=ucs		  . #x0043)	; C
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER D")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0064)	; d
    (ascii		. #x64)	; d
    (latin-jisx0201	. #x64)	; &I-LATINJ-64;
    (latin-viscii	. #x64)	; d
    (ipa		. #xC3)	; &I-MULE-IPA-43;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER D")
      (=ucs		  . #xFF44)	; ｄ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER D")
      (=ucs		  . #x0044)	; D
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER E")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0065)	; e
    (ascii		. #x65)	; e
    (latin-jisx0201	. #x65)	; &I-LATINJ-65;
    (latin-viscii	. #x65)	; e
    (ipa		. #xA2)	; &I-MULE-IPA-22;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER E")
      (=ucs		  . #xFF45)	; ｅ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER E")
      (=ucs		  . #x0045)	; E
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER F")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0066)	; f
    (ascii		. #x66)	; f
    (latin-jisx0201	. #x66)	; &I-LATINJ-66;
    (latin-viscii	. #x66)	; f
    (ipa		. #xC6)	; &I-MULE-IPA-46;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER F")
      (=ucs		  . #xFF46)	; ｆ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER F")
      (=ucs		  . #x0046)	; F
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER G")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0067)	; g
    (ascii		. #x67)	; g
    (latin-jisx0201	. #x67)	; &I-LATINJ-67;
    (latin-viscii	. #x67)	; g
    (ipa		. #xC5)	; &I-MULE-IPA-45;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER G")
      (=ucs		  . #xFF47)	; ｇ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER G")
      (=ucs		  . #x0047)	; G
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER H")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0068)	; h
    (ascii		. #x68)	; h
    (latin-jisx0201	. #x68)	; &I-LATINJ-68;
    (latin-viscii	. #x68)	; h
    (ipa		. #xD1)	; &I-MULE-IPA-51;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER H")
      (=ucs		  . #xFF48)	; ｈ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER H")
      (=ucs		  . #x0048)	; H
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER I")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0069)	; i
    (ascii		. #x69)	; i
    (latin-jisx0201	. #x69)	; &I-LATINJ-69;
    (latin-viscii	. #x69)	; i
    (ipa		. #xA0)	; &I-MULE-IPA-20;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER I")
      (=ucs		  . #xFF49)	; ｉ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER I")
      (=ucs		  . #x0049)	; I
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER J")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x006A)	; j
    (ascii		. #x6A)	; j
    (latin-jisx0201	. #x6A)	; &I-LATINJ-6A;
    (latin-viscii	. #x6A)	; j
    (ipa		. #xD9)	; &I-MULE-IPA-59;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER J")
      (=ucs		  . #xFF4A)	; ｊ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER J")
      (=ucs		  . #x004A)	; J
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER K")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x006B)	; k
    (ascii		. #x6B)	; k
    (latin-jisx0201	. #x6B)	; &I-LATINJ-6B;
    (latin-viscii	. #x6B)	; k
    (ipa		. #xC4)	; &I-MULE-IPA-44;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER K")
      (=ucs		  . #xFF4B)	; ｋ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER K")
      (=ucs		  . #x004B)	; K
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER L")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x006C)	; l
    (ascii		. #x6C)	; l
    (latin-jisx0201	. #x6C)	; &I-LATINJ-6C;
    (latin-viscii	. #x6C)	; l
    (ipa		. #xDA)	; &I-MULE-IPA-5A;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER L")
      (=ucs		  . #xFF4C)	; ｌ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER L")
      (=ucs		  . #x004C)	; L
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER M")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x006D)	; m
    (ascii		. #x6D)	; m
    (latin-jisx0201	. #x6D)	; &I-LATINJ-6D;
    (latin-viscii	. #x6D)	; m
    (ipa		. #xD2)	; &I-MULE-IPA-52;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER M")
      (=ucs		  . #xFF4D)	; ｍ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER M")
      (=ucs		  . #x004D)	; M
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER N")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x006E)	; n
    (ascii		. #x6E)	; n
    (latin-jisx0201	. #x6E)	; &I-LATINJ-6E;
    (latin-viscii	. #x6E)	; n
    (ipa		. #xD3)	; &I-MULE-IPA-53;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER N")
      (=ucs		  . #xFF4E)	; ｎ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER N")
      (=ucs		  . #x004E)	; N
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER O")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x006F)	; o
    (ascii		. #x6F)	; o
    (latin-jisx0201	. #x6F)	; &I-LATINJ-6F;
    (latin-viscii	. #x6F)	; o
    (ipa		. #xB6)	; &I-MULE-IPA-36;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER O")
      (=ucs		  . #xFF4F)	; ｏ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER O")
      (=ucs		  . #x004F)	; O
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER P")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0070)	; p
    (ascii		. #x70)	; p
    (latin-jisx0201	. #x70)	; &I-LATINJ-70;
    (latin-viscii	. #x70)	; p
    (ipa		. #xC0)	; &I-MULE-IPA-40;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER P")
      (=ucs		  . #xFF50)	; ｐ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER P")
      (=ucs		  . #x0050)	; P
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Q")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0071)	; q
    (ascii		. #x71)	; q
    (latin-jisx0201	. #x71)	; &I-LATINJ-71;
    (latin-viscii	. #x71)	; q
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Q")
      (=ucs		  . #xFF51)	; ｑ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Q")
      (=ucs		  . #x0051)	; Q
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER R")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0072)	; r
    (ascii		. #x72)	; r
    (latin-jisx0201	. #x72)	; &I-LATINJ-72;
    (latin-viscii	. #x72)	; r
    (ipa		. #xD6)	; &I-MULE-IPA-56;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER R")
      (=ucs		  . #xFF52)	; ｒ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER R")
      (=ucs		  . #x0052)	; R
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER S")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0073)	; s
    (ascii		. #x73)	; s
    (latin-jisx0201	. #x73)	; &I-LATINJ-73;
    (latin-viscii	. #x73)	; s
    (ipa		. #xCA)	; &I-MULE-IPA-4A;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER S")
      (=ucs		  . #xFF53)	; ｓ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER S")
      (=ucs		  . #x0053)	; S
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER T")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0074)	; t
    (ascii		. #x74)	; t
    (latin-jisx0201	. #x74)	; &I-LATINJ-74;
    (latin-viscii	. #x74)	; t
    (ipa		. #xC2)	; &I-MULE-IPA-42;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER T")
      (=ucs		  . #xFF54)	; ｔ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER T")
      (=ucs		  . #x0054)	; T
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER U")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0075)	; u
    (ascii		. #x75)	; u
    (latin-jisx0201	. #x75)	; &I-LATINJ-75;
    (latin-viscii	. #x75)	; u
    (ipa		. #xB4)	; &I-MULE-IPA-34;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER U")
      (=ucs		  . #xFF55)	; ｕ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER U")
      (=ucs		  . #x0055)	; U
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER V")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0076)	; v
    (ascii		. #x76)	; v
    (latin-jisx0201	. #x76)	; &I-LATINJ-76;
    (latin-viscii	. #x76)	; v
    (ipa		. #xC7)	; &I-MULE-IPA-47;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER V")
      (=ucs		  . #xFF56)	; ｖ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER V")
      (=ucs		  . #x0056)	; V
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER W")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0077)	; w
    (ascii		. #x77)	; w
    (latin-jisx0201	. #x77)	; &I-LATINJ-77;
    (latin-viscii	. #x77)	; w
    (ipa		. #xDE)	; &I-MULE-IPA-5E;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER W")
      (=ucs		  . #xFF57)	; ｗ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER W")
      (=ucs		  . #x0057)	; W
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER X")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0078)	; x
    (ascii		. #x78)	; x
    (latin-jisx0201	. #x78)	; &I-LATINJ-78;
    (latin-viscii	. #x78)	; x
    (ipa		. #xCF)	; &I-MULE-IPA-4F;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER X")
      (=ucs		  . #xFF58)	; ｘ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER X")
      (=ucs		  . #x0058)	; X
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Y")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x0079)	; y
    (ascii		. #x79)	; y
    (latin-jisx0201	. #x79)	; &I-LATINJ-79;
    (latin-viscii	. #x79)	; y
    (ipa		. #xAD)	; &I-MULE-IPA-2D;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Y")
      (=ucs		  . #xFF59)	; ｙ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Y")
      (=ucs		  . #x0059)	; Y
      ))
    ))
(define-char
  '((name		. "LATIN SMALL LETTER Z")
    (general-category	letter lowercase) ; Normative Category
    (bidi-category	. "L")
    (mirrored		. nil)
    (=ucs		. #x007A)	; z
    (ascii		. #x7A)	; z
    (latin-jisx0201	. #x7A)	; &I-LATINJ-7A;
    (latin-viscii	. #x7A)	; z
    (ipa		. #xCB)	; &I-MULE-IPA-4B;
    (->fullwidth
     ((name		  . "FULLWIDTH LATIN SMALL LETTER Z")
      (=ucs		  . #xFF5A)	; ｚ
      ))
    (->uppercase
     ((name		  . "LATIN CAPITAL LETTER Z")
      (=ucs		  . #x005A)	; Z
      ))
    ))
(define-char
  '((name		. "LEFT CURLY BRACKET")
    (general-category	punctuation open) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x007B)	; {
    (ascii		. #x7B)	; {
    (latin-jisx0201	. #x7B)	; &I-LATINJ-7B;
    (latin-viscii	. #x7B)	; {
    (->fullwidth
     ((name		  . "FULLWIDTH LEFT CURLY BRACKET")
      (=ucs		  . #xFF5B)	; ｛
      ))
    ))
(define-char
  '((name		. "VERTICAL LINE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x007C)	; |
    (ascii		. #x7C)	; |
    (latin-jisx0201	. #x7C)	; &I-LATINJ-7C;
    (latin-viscii	. #x7C)	; |
    (->fullwidth
     ((name		  . "FULLWIDTH VERTICAL LINE")
      (=ucs		  . #xFF5C)	; ｜
      ))
    ))
(define-char
  '((name		. "RIGHT CURLY BRACKET")
    (general-category	punctuation close) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. t)
    (=ucs		. #x007D)	; }
    (ascii		. #x7D)	; }
    (latin-jisx0201	. #x7D)	; &I-LATINJ-7D;
    (latin-viscii	. #x7D)	; }
    (->fullwidth
     ((name		  . "FULLWIDTH RIGHT CURLY BRACKET")
      (=ucs		  . #xFF5D)	; ｝
      ))
    ))
(define-char
  '((name		. "TILDE")
    (general-category	symbol math) ; Informative Category
    (bidi-category	. "ON")
    (mirrored		. nil)
    (=ucs		. #x007E)	; ~
    (ascii		. #x7E)	; ~
    (latin-viscii	. #x7E)	; ~
    (->fullwidth
     ((name		  . "FULLWIDTH TILDE")
      (=ucs		  . #xFF5E)	; ～
      ))
    ))
(define-char
  '((name		. "DELETE")
    (general-category	other control) ; Normative Category
    (bidi-category	. "BN")
    (mirrored		. nil)
    (=ucs		. #x007F)	; ␡
    (ascii		. #x7F)	; ␡
    (latin-viscii	. #x7F)	; ␡
    ))
