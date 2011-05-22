;; -*- coding: utf-8-mcs-er -*-
(define-char
  '((name*		. "latin capital letter m with ring below")
    (general-category	letter uppercase) ; Normative Category
    (=decomposition
     ((name		  . "LATIN CAPITAL LETTER M")
      (=ucs		  . #x004D)	; M
      )
     ((name		  . "COMBINING RING BELOW")
      (=ucs		  . #x0325)	; ̥
      ))
    (=jef-china3	. #x8AF0)	; M̥
    ))
(define-char
  '((name*		. "latin small letter a with macron and acute")
    (general-category	letter lowercase) ; Normative Category
    (=decomposition
     ((name		  . "LATIN SMALL LETTER A WITH MACRON")
      (=ucs		  . #x0101)	; ā
      )
     ((name		  . "COMBINING ACUTE ACCENT")
      (=ucs		  . #x0301)	; ́
      ))
    (sources		ruimoku=C011091-00007)
    (=ruimoku-v6	. #xE00D)	; ā́
    ))
