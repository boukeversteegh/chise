;;; char-db-util.el --- Character Database utility -*- coding: utf-8-er; -*-

;; Copyright (C) 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006,
;;   2007, 2008, 2009, 2010, 2011 MORIOKA Tomohiko.

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: CHISE, Character Database, ISO/IEC 10646, UCS, Unicode, MULE.

;; This file is part of XEmacs CHISE.

;; XEmacs CHISE is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; XEmacs CHISE is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs CHISE; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Code:

(require 'chise-subr)
(require 'ideograph-subr)

(defconst unidata-normative-category-alist
  '(("Lu" letter	uppercase)
    ("Ll" letter	lowercase)
    ("Lt" letter	titlecase)
    ("Mn" mark		non-spacing)
    ("Mc" mark		spacing-combining)
    ("Me" mark		enclosing)
    ("Nd" number	decimal-digit)
    ("Nl" number	letter)
    ("No" number	other)
    ("Zs" separator	space)
    ("Zl" separator	line)
    ("Zp" separator	paragraph)
    ("Cc" other		control)
    ("Cf" other		format)
    ("Cs" other		surrogate)
    ("Co" other		private-use)
    ("Cn" other		not-assigned)))

(defconst unidata-informative-category-alist
  '(("Lm" letter	modifier)
    ("Lo" letter	other)
    ("Pc" punctuation	connector)
    ("Pd" punctuation	dash)
    ("Ps" punctuation	open)
    ("Pe" punctuation	close)
    ("Pi" punctuation	initial-quote)
    ("Pf" punctuation	final-quote)
    ("Po" punctuation	other)
    ("Sm" symbol	math)
    ("Sc" symbol	currency)
    ("Sk" symbol	modifier)
    ("So" symbol	other)
    ))

(defconst shuowen-radicals
  [?一 ?上 ?示 ?三 ?王 ?玉 ?玨 ?气 ?士 ?丨 ; 010
   ?屮 ?艸 ?蓐 ?茻 ?小 ?八 ?釆 ?半 ?牛 ?犛 ; 020
   ?告 ?口 ?凵 ?吅 ?哭 ?走 ?止 ?癶 ?步 ?此 ; 030
   ?正 ?是 ?辵 ?彳 ?廴 ?㢟 ?行 ?齒 ?牙 ?足 ; 040
   ?疋 ?品 ?龠 ?冊 ?㗊 ?舌 ?干 ?谷 ?只 ?㕯 ; 050
   ?句 ?丩 ?古 ?十 ?卅 ?言 ?誩 ?音 ?䇂 ?丵 ; 060
   ?菐 ?𠬞 ?𠬜 ?共 ?異 ?舁 ?𦥑 ?䢅 ?爨 ?革 ; 070
   ?鬲 ?䰜 ?爪 ?𠃨 ?鬥 ?又 ?𠂇 ?㕜 ?支 ?𦘒 ; 080
   ?聿 ?畫 ?隶 ?臤 ?臣 ?殳 ?殺 ?𠘧 ?寸 ?皮 ; 090
   ?㼱 ?攴 ?敎 ?卜 ?用 ?爻 ?㸚 ?𥄎 ?目 ?䀠 ; 100
   ?眉 ?盾 ?自 ?白 ?鼻 ?皕 ?習 ?羽 ?隹 ?奞 ; 110
   ?萑 ?𦫳 ?苜 ?羊 ?羴 ?瞿 ?雔 ?雥 ?鳥 ?烏 ; 120
   ?𠦒 ?冓 ?幺 ?𢆶 ?叀 ?玄 ?予 ?放 ?𠬪 ?𣦼 ; 130
   ?歺 ?死 ?冎 ?骨 ?肉 ?筋 ?刀 ?刃 ?㓞 ?丰 ; 140
   ?耒 ?𧢲 ?竹 ?箕 ?丌 ?左 ?工 ?㠭 ?巫 ?甘 ; 150
   ?旨 ?曰 ?乃 ?丂 ?可 ?兮 ?号 ?亏 ?喜 ?壴 ; 160
   ?鼓 ?豈 ?豆 ?豊 ?豐 ?䖒 ?虍 ?虎 ?虤 ?皿 ; 170
   ?𠙴 ?去 ?血 ?丶 ?丹 ?青 ?井 ?皀 ?鬯 ?食 ; 180
   ?亼 ?會 ?倉 ?入 ?缶 ?矢 ?高 ?冂 ?𩫏 ?京 ; 190
   ?亯 ?𣆪 ?畗 ?㐭 ?嗇 ?來 ?麥 ?夊 ?舛 ?䑞 ; 200
   ?韋 ?弟 ?夂 ?久 ?桀 ?木 ?東 ?林 ?才 ?叒 ; 210
   ?之 ?帀 ?出 ?𣎵 ?生 ?乇 ?𠂹 ?𠌶 ?華 ?𥝌 ; 220
   ?稽 ?巢 ?桼 ?束 ?㯻 ?囗 ?員 ?貝 ?邑 ?𨛜 ; 230
   ?日 ?旦 ?倝 ?㫃 ?冥 ?晶 ?月 ?有 ?明 ?囧 ; 240
   ?夕 ?多 ?毌 ?𢎘 ?𣐺 ?卣 ?齊 ?朿 ?片 ?鼎 ; 250
   ?克 ?彔 ?禾 ?秝 ?黍 ?香 ?米 ?毇 ?臼 ?凶 ; 260
   ?𣎳 ?林 ?麻 ?尗 ?耑 ?韭 ?瓜 ?瓠 ?宀 ?宮 ; 270
   ?呂 ?穴 ?㝱 ?𤕫 ?冖 ?𠔼 ?冃 ?㒳 ?网 ?襾 ; 280
   ?巾 ?巿 ?帛 ?白 ?㡀 ?黹 ?人 ?𠤎 ?匕 ?从 ; 290
   ])

(defun shuowen-radical (number)
  (aref shuowen-radicals (1- number)))

(defvar char-db-file-coding-system 'utf-8-mcs-er)

(defvar char-db-ignored-attributes '(ideographic-products))

(defvar char-db-coded-charset-priority-list
  '(ascii
    control-1
    latin-iso8859-1
    latin-iso8859-2
    latin-iso8859-3
    latin-iso8859-4
    latin-iso8859-9
    latin-jisx0201
    cyrillic-iso8859-5
    greek-iso8859-7
    thai-tis620
    =jis-x0208
    =jis-x0208@1978
    =jis-x0208@1983
    japanese-jisx0212
    chinese-gb2312
    =jis-x0208@1990
    chinese-cns11643-1
    chinese-cns11643-2
    chinese-cns11643-3
    chinese-cns11643-4
    chinese-cns11643-5
    chinese-cns11643-6
    chinese-cns11643-7
    =jis-x0213-1
    =jis-x0213-1@2000
    =jis-x0213-1@2004
    =jis-x0213-2
    korean-ksc5601
    chinese-isoir165
    katakana-jisx0201
    hebrew-iso8859-8
    chinese-gb12345
    latin-viscii
    ethiopic-ucs
    =big5-cdp
    =gt
    =adobe-japan1-0
    =adobe-japan1-1
    =adobe-japan1-2
    =adobe-japan1-3
    =adobe-japan1-4
    =adobe-japan1-5
    =adobe-japan1-6
    =hanyo-denshi/ja
    =hanyo-denshi/jb
    =hanyo-denshi/jc
    =hanyo-denshi/jd
    =hanyo-denshi/ft
    =hanyo-denshi/ia
    =hanyo-denshi/ib
    =hanyo-denshi/hg
    =hanyo-denshi/ks
    =daikanwa
    =daikanwa@rev2
    =daikanwa@rev1
    =cbeta
    =gt-k
    ideograph-hanziku-1
    ideograph-hanziku-2
    ideograph-hanziku-3
    ideograph-hanziku-4
    ideograph-hanziku-5
    ideograph-hanziku-6
    ideograph-hanziku-7
    ideograph-hanziku-8
    ideograph-hanziku-9
    ideograph-hanziku-10
    ideograph-hanziku-11
    ideograph-hanziku-12
    =>>>jis-x0208
    =>>>jis-x0213-1
    =>>jis-x0208
    =>>jis-x0213-1
    =>>jis-x0213-1@2000
    =>>jis-x0213-1@2004
    =>>jis-x0213-2
    =>>jis-x0208@1978
    =>>hanyo-denshi/ft
    =>>hanyo-denshi/ks
    =>>gt
    =>>daikanwa
    =>jis-x0208@usual
    =>jis-x0208
    =>jis-x0208@1997
    =>jis-x0213-1
    =>jis-x0213-1@2000
    =>jis-x0213-1@2004
    =>jis-x0213-2@usual
    =>jis-x0213-2
    ==>ucs@bucs
    =>ucs@iso
    =>ucs@unicode
    =>ucs@jis
    =>ucs@JP
    =>ucs@cns
    =>ucs@ks
    =>>ucs@iso
    =>>ucs@unicode
    =>>ucs@jis
    =>>ucs@cns
    =>>>ucs@iso
    =>>>ucs@unicode
    =ucs@iso
    =ucs@unicode
    =>>big5-cdp
    =>>gt-k
    =>gt
    =>big5-cdp
    =>daikanwa
    =big5
    =big5-eten
    =>gt-k
    =zinbun-oracle
    =>zinbun-oracle
    =ruimoku-v6
    =>>ruimoku-v6
    =jef-china3
    =shinjigen))


;;; @ char-db formatters
;;;

(defun char-db-make-char-spec (char)
  (let (ret char-spec)
    (cond ((characterp char)
	   (cond ((and (setq ret (encode-char char '=ucs 'defined-only))
		       (not (and (<= #xE000 ret)(<= ret #xF8FF))))
		  (setq char-spec (list (cons '=ucs ret)))
		  (cond ((setq ret (get-char-attribute char 'name))
			 (setq char-spec (cons (cons 'name ret) char-spec))
			 )
			((setq ret (get-char-attribute char 'name*))
			 (setq char-spec (cons (cons 'name* ret) char-spec))
			 ))
		  )
		 ((setq ret
			(catch 'tag
			  (let ((rest char-db-coded-charset-priority-list)
				ccs)
			    (while rest
			      (setq ccs (charset-name
					 (find-charset (car rest))))
			      (if (setq ret
					(encode-char char ccs
						     'defined-only))
				  (throw 'tag (cons ccs ret)))
			      (setq rest (cdr rest))))))
		  (setq char-spec (list ret))
		  (dolist (ccs (delq (car ret) (charset-list)))
		    (if (and (or (charset-iso-final-char ccs)
				 (memq ccs
				       '(=daikanwa
					 =daikanwa@rev2
					 ;; =gt-k
					 =jis-x0208@1997
					 ))
				 (string-match "=ucs@" (symbol-name ccs)))
			     (setq ccs (charset-name ccs))
			     (null (assq ccs char-spec))
			     (setq ret (encode-char char ccs 'defined-only)))
			(setq char-spec (cons (cons ccs ret) char-spec))))
		  (if (null char-spec)
		      (setq char-spec (split-char char)))
		  (cond ((setq ret (get-char-attribute char 'name))
			 (setq char-spec (cons (cons 'name ret) char-spec))
			 )
			((setq ret (get-char-attribute char 'name*))
			 (setq char-spec (cons (cons 'name* ret) char-spec))
			 ))
		  )
		 ((setq ret (get-char-attribute
			     char 'ideographic-combination))
		  (setq char-spec
			(cons (cons 'ideographic-combination ret)
			      char-spec))
		  ))
	   char-spec)
	  ((consp char)
	   char))))
    
(defun char-db-insert-char-spec (char &optional readable column
				      required-features)
  (unless column
    (setq column (current-column)))
  (let (char-spec temp-char)
    (setq char-spec (char-db-make-char-spec char))
    (unless (or (characterp char) ; char
		(condition-case nil
		    (setq char (find-char char-spec))
		  (error nil)))
      ;; define temporary character
      ;;   Current implementation is dirty.
      (setq temp-char (define-char (cons '(ideograph-daikanwa . 0)
					 char-spec)))
      (remove-char-attribute temp-char 'ideograph-daikanwa)
      (setq char temp-char))
    (insert-char-attributes char
			    readable
                            (union (mapcar #'car char-spec)
				   required-features)
			    nil 'for-sub-node)
    (when temp-char
      ;; undefine temporary character
      ;;   Current implementation is dirty.
      (setq char-spec (char-attribute-alist temp-char))
      (while char-spec
	(remove-char-attribute temp-char (car (car char-spec)))
	(setq char-spec (cdr char-spec))))))

(defun char-db-insert-alist (alist &optional readable column)
  (unless column
    (setq column (current-column)))
  (let ((line-breaking
	 (concat "\n" (make-string (1+ column) ?\ )))
	name value
	ret al ; cal
	key
	lbs cell rest separator)
    (insert "(")
    (while alist
      (setq name (car (car alist))
	    value (cdr (car alist)))
      (cond ((eq name 'char)
	     (insert "(char . ")
	     (if (setq ret (condition-case nil
			       (find-char value)
			     (error nil)))
		 (progn
		   (setq al nil
			 ;; cal nil
			 )
		   (while value
		     (setq key (car (car value)))
                     ;; (if (find-charset key)
                     ;;     (setq cal (cons key cal))
		     (setq al (cons key al))
		     ;; )
		     (setq value (cdr value)))
		   (insert-char-attributes ret
					   readable
					   (or al 'none) ; cal
					   nil 'for-sub-node))
	       (insert (prin1-to-string value)))
	     (insert ")")
	     (insert line-breaking))
	    ((consp value)
	     (insert (format "(%-18s " name))
	     (setq lbs (concat "\n" (make-string (current-column) ?\ )))
	     (while (consp value)
	       (setq cell (car value))
	       (if (and (consp cell)
			(consp (car cell))
			(setq ret (condition-case nil
				      (find-char cell)
				    (error nil)))
			)
		   (progn
		     (setq rest cell
			   al nil
			   ;; cal nil
			   )
		     (while rest
		       (setq key (car (car rest)))
                       ;; (if (find-charset key)
                       ;;     (setq cal (cons key cal))
		       (setq al (cons key al))
		       ;; )
		       (setq rest (cdr rest)))
		     (if separator
			 (insert lbs))
		     (insert-char-attributes ret
					     readable
					     al ; cal
					     nil 'for-sub-node)
		     (setq separator lbs))
		 (if separator
		     (insert separator))
		 (insert (prin1-to-string cell))
		 (setq separator " "))
	       (setq value (cdr value)))
	     (insert ")")
	     (insert line-breaking))
	    (t
	     (insert (format "(%-18s . %S)%s"
			     name value
			     line-breaking))))
      (setq alist (cdr alist))))
  (insert ")"))

(defun char-db-insert-char-reference (plist &optional readable column)
  (unless column
    (setq column (current-column)))
  (let ((line-breaking
	 (concat "\n" (make-string (1+ column) ?\ )))
	(separator "")
	name value)
    (insert "(")
    (while plist
      (setq name (pop plist))
      (setq value (pop plist))
      (cond ((eq name :char)
	     (insert separator)
	     (insert ":char\t")
	     (cond ((numberp value)
		    (setq value (decode-char '=ucs value)))
                   ;; ((consp value)
                   ;;  (setq value (or (find-char value)
                   ;;                  value)))
		   )
	     (char-db-insert-char-spec value readable)
             (insert line-breaking)
	     (setq separator ""))
	    ((eq name :radical)
	     (insert (format "%s%s\t%d ; %c%s"
			     separator
			     name value
			     (ideographic-radical value)
			     line-breaking))
	     (setq separator ""))
            (t
	     (insert (format "%s%s\t%S" separator name value))
	     (setq separator line-breaking)))
      ))
  (insert ")"))

(defun char-db-decode-isolated-char (ccs code-point)
  (let (ret)
    (setq ret
	  (cond ((eq ccs 'arabic-iso8859-6)
		 (decode-char ccs code-point))
		((and (memq ccs '(=gt-pj-1
				  =gt-pj-2
				  =gt-pj-3
				  =gt-pj-4
				  =gt-pj-5
				  =gt-pj-6
				  =gt-pj-7
				  =gt-pj-8
				  =gt-pj-9
				  =gt-pj-10
				  =gt-pj-11))
		      (setq ret (decode-char ccs code-point))
		      (setq ret (encode-char ret '=gt 'defined-only)))
		 (decode-builtin-char '=gt ret))
		(t
		 (decode-builtin-char ccs code-point))))
    (cond ((and (<= 0 (char-int ret))
		(<= (char-int ret) #x1F))
	   (decode-char '=ucs (+ #x2400 (char-int ret))))
	  ((= (char-int ret) #x7F)
	   ?\u2421)
	  (t ret))))

(defvar char-db-convert-obsolete-format t)

(defun char-db-insert-ccs-feature (name value line-breaking)
  (insert
   (format
    (cond ((memq name '(=shinjigen
			=shinjigen@1ed
			=shinjigen@rev =shinjigen/+p@rev
			=daikanwa/ho))
	   "(%-18s .  %04d)\t; %c")
	  ((eq name '=shinjigen@1ed/24pr)
	   "(%-18s . %04d)\t; %c")
	  ((or (memq name '(=daikanwa =>>daikanwa =>daikanwa
			    =daikanwa@rev1 =daikanwa@rev2
			    =daikanwa/+p =daikanwa/+2p
			    =gt =>>>gt =>>gt =>gt
			    =gt-k =>>gt-k =>gt-k
			    =>>adobe-japan1
			    =cbeta =>>cbeta
			    =zinbun-oracle =>zinbun-oracle))
	       (string-match "^=adobe-" (symbol-name name)))
	   "(%-18s . %05d)\t; %c")
	  ((memq name '(=hanyo-denshi/ks =>>hanyo-denshi/ks mojikyo))
	   "(%-18s . %06d)\t; %c")
	  ((>= (charset-dimension name) 2)
	   "(%-18s . #x%04X)\t; %c")
	  (t
	   "(%-18s . #x%02X)\t; %c"))
    name
    (if (= (charset-iso-graphic-plane name) 1)
	(logior value
		(cond ((= (charset-dimension name) 1)
		       #x80)
		      ((= (charset-dimension name) 2)
		       #x8080)
		      ((= (charset-dimension name) 3)
		       #x808080)
		      (t 0)))
      value)
    (char-db-decode-isolated-char name value)))
  (if (and (= (charset-chars name) 94)
	   (= (charset-dimension name) 2))
      (insert (format " [%02d-%02d]"
		      (- (lsh value -8) 32)
		      (- (logand value 255) 32))))
  (insert line-breaking))

(defun char-db-insert-relation-feature (char name value line-breaking
					     ccss readable)
  (insert (format "(%-18s%s " name line-breaking))
  (let ((lbs (concat "\n" (make-string (current-column) ?\ )))
	separator cell sources required-features
	ret)
    (while (consp value)
      (setq cell (car value))
      (if (integerp cell)
	  (setq cell (decode-char '=ucs cell)))
      (cond
       ((eq name '->subsumptive)
	(when (or (not (some (lambda (atr)
			       (get-char-attribute cell atr))
			     char-db-ignored-attributes))
		  (some (lambda (ccs)
			  (encode-char cell ccs 'defined-only))
			ccss))
	  (if separator
	      (insert lbs))
	  (let ((char-db-ignored-attributes
		 (cons '<-subsumptive
		       char-db-ignored-attributes)))
	    (insert-char-attributes cell readable nil nil 'for-sub-node))
	  (setq separator lbs))
	)
       ((characterp cell)
	(setq sources
	      (get-char-attribute
	       char (intern (format "%s*sources" name))))
	(setq required-features nil)
	(dolist (source sources)
	  (cond
	   ((memq source '(JP
			   JP/Jouyou
			   shinjigen shinjigen@1ed shinjigen@rev))
	    (setq required-features
		  (union required-features
			 '(=jis-x0208
			   =jis-x0208@1990
			   =jis-x0213-1@2000
			   =jis-x0213-1@2004
			   =jis-x0213-2
			   =jis-x0212
			   =jis-x0208@1983
			   =jis-x0208@1978
			   =shinjigen))))
	   ((eq source 'CN)
	    (setq required-features
		  (union required-features
			 '(=gb2312
			   =gb12345
			   =iso-ir165)))))
	  (cond
	   ((find-charset (setq ret (intern (format "=%s" source))))
	    (setq required-features
		  (cons ret required-features)))
	   (t (setq required-features
		    (cons source required-features)))))
	(cond ((string-match "@JP" (symbol-name name))
	       (setq required-features
		     (union required-features
			    '(=jis-x0208
			      =jis-x0208@1990
			      =jis-x0213-1-2000
			      =jis-x0213-2-2000
			      =jis-x0212
			      =jis-x0208@1983
			      =jis-x0208@1978))))
	      ((string-match "@CN" (symbol-name name))
	       (setq required-features
		     (union required-features
			    '(=gb2312
			      =gb12345
			      =iso-ir165)))))
	(if separator
	    (insert lbs))
	(if readable
	    (insert (format "%S" cell))
	  (char-db-insert-char-spec cell readable
				    nil
				    required-features))
	(setq separator lbs))
       ((consp cell)
	(if separator
	    (insert lbs))
	(if (consp (car cell))
	    (char-db-insert-char-spec cell readable)
	  (char-db-insert-char-reference cell readable))
	(setq separator lbs))
       (t
	(if separator
	    (insert separator))
	(insert (prin1-to-string cell))
	(setq separator " ")))
      (setq value (cdr value)))
    (insert ")")
    (insert line-breaking)))

(defun insert-char-attributes (char &optional readable attributes column
				    for-sub-node)
  (unless column
    (setq column (current-column)))
  (let (name value ; has-long-ccs-name
	rest
	radical strokes
	(line-breaking
	 (concat "\n" (make-string (1+ column) ?\ )))
	lbs cell separator ret
	key al cal
	dest-ccss ; sources required-features
	ccss)
    (let (atr-d)
      (setq attributes
	    (sort (if attributes
		      (if (consp attributes)
			  (progn
			    (dolist (name attributes)
			      (unless (memq name char-db-ignored-attributes)
				(if (find-charset name)
				    (push name ccss))
				(push name atr-d)))
			    atr-d))
		    (dolist (name (char-attribute-list))
		      (unless (memq name char-db-ignored-attributes)
			(if (find-charset name)
			    (push name ccss))
			(push name atr-d)))
		    atr-d)
		  #'char-attribute-name<)))
    (insert "(")
    (when (memq '<-subsumptive attributes)
      (when (or readable (not for-sub-node))
	(when (setq value (get-char-attribute char '<-subsumptive))
	  (char-db-insert-relation-feature char '<-subsumptive value
					   line-breaking
					   ccss readable)))
      (setq attributes (delq '<-subsumptive attributes)))
    (when (and (memq '<-denotational attributes)
	       (setq value (get-char-attribute char '<-denotational)))
      (char-db-insert-relation-feature char '<-denotational value
				       line-breaking
				       ccss readable)
      (setq attributes (delq '<-denotational attributes)))
    (when (and (memq 'name attributes)
	       (setq value (get-char-attribute char 'name)))
      (insert (format
	       (if (> (+ (current-column) (length value)) 48)
		   "(name . %S)%s"
		 "(name               . %S)%s")
	       value line-breaking))
      (setq attributes (delq 'name attributes))
      )
    (when (and (memq 'name* attributes)
	       (setq value (get-char-attribute char 'name*)))
      (insert (format
	       (if (> (+ (current-column) (length value)) 48)
		   "(name* . %S)%s"
		 "(name*              . %S)%s")
	       value line-breaking))
      (setq attributes (delq 'name* attributes))
      )
    (when (and (memq 'script attributes)
	       (setq value (get-char-attribute char 'script)))
      (insert (format "(script\t\t%s)%s"
		      (mapconcat (function prin1-to-string)
				 value " ")
		      line-breaking))
      (setq attributes (delq 'script attributes))
      )
    (dolist (name '(=>ucs =>ucs*))
      (when (and (memq name attributes)
		 (setq value (get-char-attribute char name)))
	(insert (format "(%-18s . #x%04X)\t; %c%s"
			name value (decode-char '=ucs value)
			line-breaking))
	(setq attributes (delq name attributes))))
    (dolist (name '(=>ucs@gb =>ucs@big5))
      (when (and (memq name attributes)
		 (setq value (get-char-attribute char name)))
	(insert (format "(%-18s . #x%04X)\t; %c%s"
			name value
			(decode-char (intern
				      (concat "="
					      (substring
					       (symbol-name name) 2)))
				     value)
			line-breaking))
	(setq attributes (delq name attributes))
	))
    ;; (dolist (name '(=>daikanwa))
    ;;   (when (and (memq name attributes)
    ;;              (setq value (get-char-attribute char name)))
    ;;     (insert
    ;;      (if (integerp value)
    ;;          (format "(%-18s . %05d)\t; %c%s"
    ;;                  name value (decode-char '=daikanwa value)
    ;;                  line-breaking)
    ;;        (format "(%-18s %s)\t; %c%s"
    ;;                name
    ;;                (mapconcat (function prin1-to-string)
    ;;                           value " ")
    ;;                (char-representative-of-daikanwa char)
    ;;                line-breaking)))
    ;;     (setq attributes (delq name attributes))))
    (when (and (memq 'general-category attributes)
	       (setq value (get-char-attribute char 'general-category)))
      (insert (format
	       "(general-category\t%s) ; %s%s"
	       (mapconcat (lambda (cell)
			    (format "%S" cell))
			  value " ")
	       (cond ((rassoc value unidata-normative-category-alist)
		      "Normative Category")
		     ((rassoc value unidata-informative-category-alist)
		      "Informative Category")
		     (t
		      "Unknown Category"))
	       line-breaking))
      (setq attributes (delq 'general-category attributes))
      )
    (when (and (memq 'bidi-category attributes)
	       (setq value (get-char-attribute char 'bidi-category)))
      (insert (format "(bidi-category\t. %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'bidi-category attributes))
      )
    (unless (or (not (memq 'mirrored attributes))
		(eq (setq value (get-char-attribute char 'mirrored 'empty))
		    'empty))
      (insert (format "(mirrored\t\t. %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'mirrored attributes))
      )
    (cond
     ((and (memq 'decimal-digit-value attributes)
	   (setq value (get-char-attribute char 'decimal-digit-value)))
      (insert (format "(decimal-digit-value . %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'decimal-digit-value attributes))
      (when (and (memq 'digit-value attributes)
		 (setq value (get-char-attribute char 'digit-value)))
	(insert (format "(digit-value\t . %S)%s"
			value
			line-breaking))
	(setq attributes (delq 'digit-value attributes))
	)
      (when (and (memq 'numeric-value attributes)
		 (setq value (get-char-attribute char 'numeric-value)))
	(insert (format "(numeric-value\t . %S)%s"
			value
			line-breaking))
	(setq attributes (delq 'numeric-value attributes))
	)
      )
     (t
      (when (and (memq 'digit-value attributes)
		 (setq value (get-char-attribute char 'digit-value)))
	(insert (format "(digit-value\t. %S)%s"
			value
			line-breaking))
	(setq attributes (delq 'digit-value attributes))
	)
      (when (and (memq 'numeric-value attributes)
		 (setq value (get-char-attribute char 'numeric-value)))
	(insert (format "(numeric-value\t. %S)%s"
			value
			line-breaking))
	(setq attributes (delq 'numeric-value attributes))
	)))
    (when (and (memq 'iso-10646-comment attributes)
	       (setq value (get-char-attribute char 'iso-10646-comment)))
      (insert (format "(iso-10646-comment\t. %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'iso-10646-comment attributes))
      )
    (when (and (memq 'morohashi-daikanwa attributes)
	       (setq value (get-char-attribute char 'morohashi-daikanwa)))
      (insert (format "(morohashi-daikanwa\t%s)%s"
		      (mapconcat (function prin1-to-string) value " ")
		      line-breaking))
      (setq attributes (delq 'morohashi-daikanwa attributes))
      )
    (setq radical nil
	  strokes nil)
    (when (and (memq 'ideographic-radical attributes)
	       (setq value (get-char-attribute char 'ideographic-radical)))
      (setq radical value)
      (insert (format "(ideographic-radical . %S)\t; %c%s"
		      radical
		      (ideographic-radical radical)
		      line-breaking))
      (setq attributes (delq 'ideographic-radical attributes))
      )
    (when (and (memq 'shuowen-radical attributes)
	       (setq value (get-char-attribute char 'shuowen-radical)))
      (insert (format "(shuowen-radical\t. %S)\t; %c%s"
		      value
		      (shuowen-radical value)
		      line-breaking))
      (setq attributes (delq 'shuowen-radical attributes))
      )
    (let (key)
      (dolist (domain
	       (append
		char-db-feature-domains
		(let (dest domain)
		  (dolist (feature (char-attribute-list))
		    (setq feature (symbol-name feature))
		    (when (string-match
			   "\\(radical\\|strokes\\)@\\([^@*]+\\)\\(\\*\\|$\\)"
			   feature)
		      (setq domain (intern (match-string 2 feature)))
		     (unless (memq domain dest)
		       (setq dest (cons domain dest)))))
		  (sort dest #'string<))))
	(setq key (intern (format "%s@%s" 'ideographic-radical domain)))
	(when (and (memq key attributes)
		   (setq value (get-char-attribute char key)))
	  (setq radical value)
	  (insert (format "(%s . %S)\t; %c%s"
			  key
			  radical
			  (ideographic-radical radical)
			  line-breaking))
	  (setq attributes (delq key attributes))
	  )
	(setq key (intern (format "%s@%s" 'ideographic-strokes domain)))
	(when (and (memq key attributes)
		   (setq value (get-char-attribute char key)))
	  (setq strokes value)
	  (insert (format "(%s . %S)%s"
			  key
			  strokes
			  line-breaking))
	  (setq attributes (delq key attributes))
	  )
	(setq key (intern (format "%s@%s" 'total-strokes domain)))
	(when (and (memq key attributes)
		   (setq value (get-char-attribute char key)))
	  (insert (format "(%s       . %S)%s"
			  key
			  value
			  line-breaking))
	  (setq attributes (delq key attributes))
	  )
	(dolist (feature '(ideographic-radical
			   ideographic-strokes
			   total-strokes))
	  (setq key (intern (format "%s@%s*sources" feature domain)))
	  (when (and (memq key attributes)
		     (setq value (get-char-attribute char key)))
	    (insert (format "(%s%s" key line-breaking))
	    (dolist (cell value)
	      (insert (format " %s" cell)))
	    (insert ")")
	    (insert line-breaking)
	    (setq attributes (delq key attributes))
	    ))
	))
    (when (and (memq 'ideographic-strokes attributes)
	       (setq value (get-char-attribute char 'ideographic-strokes)))
      (setq strokes value)
      (insert (format "(ideographic-strokes . %S)%s"
		      strokes
		      line-breaking))
      (setq attributes (delq 'ideographic-strokes attributes))
      )
    (when (and (memq 'kangxi-radical attributes)
	       (setq value (get-char-attribute char 'kangxi-radical)))
      (unless (eq value radical)
	(insert (format "(kangxi-radical\t . %S)\t; %c%s"
			value
			(ideographic-radical value)
			line-breaking))
	(or radical
	    (setq radical value)))
      (setq attributes (delq 'kangxi-radical attributes))
      )
    (when (and (memq 'kangxi-strokes attributes)
	       (setq value (get-char-attribute char 'kangxi-strokes)))
      (unless (eq value strokes)
	(insert (format "(kangxi-strokes\t . %S)%s"
			value
			line-breaking))
	(or strokes
	    (setq strokes value)))
      (setq attributes (delq 'kangxi-strokes attributes))
      )
    (when (and (memq 'japanese-radical attributes)
	       (setq value (get-char-attribute char 'japanese-radical)))
      (unless (eq value radical)
	(insert (format "(japanese-radical\t . %S)\t; %c%s"
			value
			(ideographic-radical value)
			line-breaking))
	(or radical
	    (setq radical value)))
      (setq attributes (delq 'japanese-radical attributes))
      )
    (when (and (memq 'japanese-strokes attributes)
	       (setq value (get-char-attribute char 'japanese-strokes)))
      (unless (eq value strokes)
	(insert (format "(japanese-strokes\t . %S)%s"
			value
			line-breaking))
	(or strokes
	    (setq strokes value)))
      (setq attributes (delq 'japanese-strokes attributes))
      )
    (when (and (memq 'cns-radical attributes)
	       (setq value (get-char-attribute char 'cns-radical)))
      (insert (format "(cns-radical\t . %S)\t; %c%s"
		      value
		      (ideographic-radical value)
		      line-breaking))
      (setq attributes (delq 'cns-radical attributes))
      )
    (when (and (memq 'cns-strokes attributes)
	       (setq value (get-char-attribute char 'cns-strokes)))
      (unless (eq value strokes)
	(insert (format "(cns-strokes\t . %S)%s"
			value
			line-breaking))
	(or strokes
	    (setq strokes value)))
      (setq attributes (delq 'cns-strokes attributes))
      )
    (when (and (memq 'shinjigen-1-radical attributes)
	       (setq value (get-char-attribute char 'shinjigen-1-radical)))
      (unless (eq value radical)
	(insert (format "(shinjigen-1-radical . %S)\t; %c%s"
			value
			(ideographic-radical value)
			line-breaking))
	(or radical
	    (setq radical value)))
      (setq attributes (delq 'shinjigen-1-radical attributes))
      )
    (when (and (memq 'ideographic- attributes)
	       (setq value (get-char-attribute char 'ideographic-)))
      (insert "(ideographic-       ")
      (setq lbs (concat "\n" (make-string (current-column) ?\ ))
	    separator nil)
      (while (consp value)
	(setq cell (car value))
	(if (integerp cell)
	    (setq cell (decode-char '=ucs cell)))
	(cond ((characterp cell)
	       (if separator
		   (insert lbs))
	       (if readable
		   (insert (format "%S" cell))
		 (char-db-insert-char-spec cell readable))
	       (setq separator lbs))
	      ((consp cell)
	       (if separator
		   (insert lbs))
	       (if (consp (car cell))
		   (char-db-insert-char-spec cell readable)
		 (char-db-insert-char-reference cell readable))
	       (setq separator lbs))
	      (t
	       (if separator
		   (insert separator))
	       (insert (prin1-to-string cell))
	       (setq separator " ")))
	(setq value (cdr value)))
      (insert ")")
      (insert line-breaking)
      (setq attributes (delq 'ideographic- attributes)))
    (when (and (memq 'total-strokes attributes)
	       (setq value (get-char-attribute char 'total-strokes)))
      (insert (format "(total-strokes       . %S)%s"
		      value
		      line-breaking))
      (setq attributes (delq 'total-strokes attributes))
      )
    (when (and (memq '->ideograph attributes)
	       (setq value (get-char-attribute char '->ideograph)))
      (insert (format "(->ideograph\t%s)%s"
		      (mapconcat (lambda (code)
				   (cond ((symbolp code)
					  (symbol-name code))
					 ((integerp code)
					  (format "#x%04X" code))
					 (t
					  (format "%s %S"
						  line-breaking code))))
				 value " ")
		      line-breaking))
      (setq attributes (delq '->ideograph attributes))
      )
    ;; (when (and (memq '->decomposition attributes)
    ;;            (setq value (get-char-attribute char '->decomposition)))
    ;;   (insert (format "(->decomposition\t%s)%s"
    ;;                   (mapconcat (lambda (code)
    ;;                                (cond ((symbolp code)
    ;;                                       (symbol-name code))
    ;;                                      ((characterp code)
    ;;                                       (if readable
    ;;                                           (format "%S" code)
    ;;                                         (format "#x%04X"
    ;;                                                 (char-int code))
    ;;                                         ))
    ;;                                      ((integerp code)
    ;;                                       (format "#x%04X" code))
    ;;                                      (t
    ;;                                       (format "%s%S" line-breaking code))))
    ;;                              value " ")
    ;;                   line-breaking))
    ;;   (setq attributes (delq '->decomposition attributes))
    ;;   )
    (if (equal (get-char-attribute char '->titlecase)
	       (get-char-attribute char '->uppercase))
	(setq attributes (delq '->titlecase attributes)))
    (when (and (memq '->mojikyo attributes)
	       (setq value (get-char-attribute char '->mojikyo)))
      (insert (format "(->mojikyo\t\t. %06d)\t; %c%s"
		      value (decode-char 'mojikyo value)
		      line-breaking))
      (setq attributes (delq '->mojikyo attributes))
      )
    (when (and (memq 'hanyu-dazidian-vol attributes)
	       (setq value (get-char-attribute char 'hanyu-dazidian-vol)))
      (insert (format "(hanyu-dazidian-vol  . %d)%s"
		      value line-breaking))
      (setq attributes (delq 'hanyu-dazidian-vol attributes))
      )
    (when (and (memq 'hanyu-dazidian-page attributes)
	       (setq value (get-char-attribute char 'hanyu-dazidian-page)))
      (insert (format "(hanyu-dazidian-page . %d)%s"
		      value line-breaking))
      (setq attributes (delq 'hanyu-dazidian-page attributes))
      )
    (when (and (memq 'hanyu-dazidian-char attributes)
	       (setq value (get-char-attribute char 'hanyu-dazidian-char)))
      (insert (format "(hanyu-dazidian-char . %d)%s"
		      value line-breaking))
      (setq attributes (delq 'hanyu-dazidian-char attributes))
      )
    (unless readable
      (dolist (ignored '(composition
			 ->denotational <-subsumptive ->ucs-unified
			 ->ideographic-component-forms))
	(setq attributes (delq ignored attributes))))
    (while attributes
      (setq name (car attributes))
      (if (setq value (get-char-attribute char name))
	  (cond ((setq ret (find-charset name))
		 (setq name (charset-name ret))
		 (if (and (not (memq name dest-ccss))
			  (prog1
			      (setq value (get-char-attribute char name))
			    (setq dest-ccss (cons name dest-ccss))))
		     (char-db-insert-ccs-feature name value line-breaking))
		 )
		((string-match "^=>ucs@" (symbol-name name))
		 (insert (format "(%-18s . #x%04X)\t; %c%s"
				 name value (decode-char '=ucs value)
				 line-breaking))
		 )
		((eq name 'jisx0208-1978/4X)
		 (insert (format "(%-18s . #x%04X)%s"
				 name value
				 line-breaking))
		 )
		((and
		  (not readable)
		  (not (eq name '->subsumptive))
		  (not (eq name '->uppercase))
		  (not (eq name '->lowercase))
		  (not (eq name '->titlecase))
		  (not (eq name '->canonical))
		  (not (eq name '->Bopomofo))
		  (not (eq name '->mistakable))
		  (not (eq name '->ideographic-variants))
		  (null (get-char-attribute
			 char (intern (format "%s*sources" name))))
		  (not (string-match "\\*sources$" (symbol-name name)))
		  (null (get-char-attribute
			 char (intern (format "%s*note" name))))
		  (not (string-match "\\*note$" (symbol-name name)))
		  (or (eq name '<-identical)
		      (eq name '<-uppercase)
		      (eq name '<-lowercase)
		      (eq name '<-titlecase)
		      (eq name '<-canonical)
		      (eq name '<-ideographic-variants)
                      ;; (eq name '<-synonyms)
		      (string-match "^<-synonyms" (symbol-name name))
		      (eq name '<-mistakable)
		      (when (string-match "^->" (symbol-name name))
			(cond
			 ((string-match "^->fullwidth" (symbol-name name))
			  (not (and (consp value)
				    (characterp (car value))
				    (encode-char
				     (car value) '=ucs 'defined-only)))
			  )
			 (t)))
		      ))
		 )
		((or (eq name 'ideographic-structure)
		     (eq name 'ideographic-combination)
		     (eq name 'ideographic-)
		     (eq name '=decomposition)
		     (char-feature-base-name= '=decomposition name)
                     (char-feature-base-name= '=>decomposition name)
                     ;; (string-match "^=>*decomposition\\(@[^*]+\\)?$"
                     ;;               (symbol-name name))
		     (string-match "^\\(->\\|<-\\)[^*]*$" (symbol-name name))
		     (string-match "^\\(->\\|<-\\)[^*]*\\*sources$"
				   (symbol-name name))
		     )
		 (char-db-insert-relation-feature char name value
						  line-breaking
						  ccss readable))
		((memq name '(ideograph=
			      original-ideograph-of
			      ancient-ideograph-of
			      vulgar-ideograph-of
			      wrong-ideograph-of
                              ;; simplified-ideograph-of
			      ideographic-variants
                              ;; ideographic-different-form-of
			      ))
		 (insert (format "(%-18s%s " name line-breaking))
		 (setq lbs (concat "\n" (make-string (current-column) ?\ ))
		       separator nil)
		 (while (consp value)
		   (setq cell (car value))
		   (if (and (consp cell)
			    (consp (car cell)))
		       (progn
			 (if separator
			     (insert lbs))
			 (char-db-insert-alist cell readable)
			 (setq separator lbs))
		     (if separator
			 (insert separator))
		     (insert (prin1-to-string cell))
		     (setq separator " "))
		   (setq value (cdr value)))
		 (insert ")")
		 (insert line-breaking))
                ((consp value)
		 (insert (format "(%-18s " name))
		 (setq lbs (concat "\n" (make-string (current-column) ?\ ))
		       separator nil)
		 (while (consp value)
		   (setq cell (car value))
		   (if (and (consp cell)
			    (consp (car cell))
			    (setq ret (condition-case nil
					  (find-char cell)
					(error nil))))
		       (progn
			 (setq rest cell
			       al nil
			       cal nil)
			 (while rest
			   (setq key (car (car rest)))
			   (if (find-charset key)
			       (setq cal (cons key cal))
			     (setq al (cons key al)))
			   (setq rest (cdr rest)))
			 (if separator
			     (insert lbs))
			 (insert-char-attributes ret
						 readable
						 al ; cal
						 nil 'for-sub-node)
			 (setq separator lbs))
		     (setq ret (prin1-to-string cell))
		     (if separator
			 (if (< (+ (current-column)
				   (length ret)
				   (length separator))
				76)
			     (insert separator)
			   (insert lbs)))
		     (insert ret)
		     (setq separator " "))
		   (setq value (cdr value)))
		 (insert ")")
		 (insert line-breaking))
		(t
                 (insert (format "(%-18s" name))
		 (setq ret (prin1-to-string value))
		 (unless (< (+ (current-column)
			       (length ret)
			       3)
			    76)
		   (insert line-breaking))
		 (insert " . " ret ")" line-breaking)
		 ;; (insert (format "(%-18s . %S)%s"
                 ;;                 name value
                 ;;                 line-breaking))
		 )
		))
      (setq attributes (cdr attributes)))
    (insert ")")))

(defun insert-char-data (char &optional readable
			      attributes)
  (save-restriction
    (narrow-to-region (point)(point))
    (insert "(define-char
  '")
    (insert-char-attributes char readable attributes)
    (insert ")\n")
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (replace-match ""))
    ;; from tabify.
    (goto-char (point-min))
    (while (re-search-forward "[ \t][ \t][ \t]*" nil t)
      (let ((column (current-column))
	    (indent-tabs-mode t))
	(delete-region (match-beginning 0) (point))
	(indent-to column)))
    (goto-char (point-max))
    ;; (tabify (point-min)(point-max))
    ))

(defun insert-char-data-with-variant (char &optional printable
					   no-ucs-unified
					   script excluded-script)
  (insert-char-data char printable)
  (let ((variants (char-variants char))
	rest
	variant vs ret)
    (setq variants (sort variants #'<))
    (setq rest variants)
    (setq variants (cons char variants))
    (while rest
      (setq variant (car rest))
      (unless (get-char-attribute variant '<-subsumptive)
	(if (and (or (null script)
		     (null (setq vs (get-char-attribute variant 'script)))
		     (memq script vs))
		 (or (null excluded-script)
		     (null (setq vs (get-char-attribute variant 'script)))
		     (not (memq excluded-script vs))))
	    (unless (and no-ucs-unified (get-char-attribute variant '=ucs))
	      (insert-char-data variant printable)
	      (if (setq ret (char-variants variant))
		  (while ret
		    (or (memq (car ret) variants)
                        ;; (get-char-attribute (car ret) '<-subsumptive)
			(setq rest (nconc rest (list (car ret)))))
		    (setq ret (cdr ret)))))))
      (setq rest (cdr rest)))))

(defun insert-char-range-data (min max &optional script excluded-script)
  (let ((code min)
	char)
    (while (<= code max)
      (setq char (decode-char '=ucs code))
      (if (encode-char char '=ucs 'defined-only)
	  (insert-char-data-with-variant char nil 'no-ucs-unified
					 script excluded-script))
      (setq code (1+ code)))))

(defun write-char-range-data-to-file (min max file
					  &optional script excluded-script)
  (let ((coding-system-for-write char-db-file-coding-system))
    (with-temp-buffer
      (insert (format ";; -*- coding: %s -*-\n"
		      char-db-file-coding-system))
      (insert-char-range-data min max script excluded-script)
      (write-region (point-min)(point-max) file))))

(defvar what-character-original-window-configuration)

;;;###autoload
(defun what-char-definition (char)
  (interactive (list (char-after)))
  (let ((buf (get-buffer-create "*Character Description*"))
	(the-buf (current-buffer))
	(win-conf (current-window-configuration)))
    (pop-to-buffer buf)
    (make-local-variable 'what-character-original-window-configuration)
    (setq what-character-original-window-configuration win-conf)
    (setq buffer-read-only nil)
    (erase-buffer)
    (condition-case err
	(progn
	  (insert-char-data-with-variant char 'printable)
	  (unless (char-attribute-alist char)
	    (insert (format ";; = %c\n"
			    (let* ((rest (split-char char))
				   (ccs (pop rest))
				   (code (pop rest)))
			      (while rest
				(setq code (logior (lsh code 8)
						   (pop rest))))
			      (decode-char ccs code)))))
          ;; (char-db-update-comment)
	  (set-buffer-modified-p nil)
	  (view-mode the-buf (lambda (buf)
			       (set-window-configuration
				what-character-original-window-configuration)
			       ))
	  (goto-char (point-min)))
      (error (progn
	       (set-window-configuration
		what-character-original-window-configuration)
	       (signal (car err) (cdr err)))))))


;;; @ end
;;;

(provide 'char-db-util)

;;; char-db-util.el ends here
