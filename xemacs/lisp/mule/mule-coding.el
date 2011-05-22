;;; mule-coding.el --- Coding-system functions for Mule.

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1995 Amdahl Corporation.
;; Copyright (C) 1995 Sun Microsystems.
;; Copyright (C) 1997, 1999, 2002, 2003, 2004, 2005, 2006, 2008, 2009,
;;   2010, 2011 MORIOKA Tomohiko

;; This file is part of XEmacs.

;; XEmacs is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; XEmacs is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with XEmacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;; split off of mule.el and mostly moved to coding.el

;;; Code:

(defun coding-system-force-on-output (coding-system register)
  "Return the 'force-on-output property of CODING-SYSTEM for the specified REGISTER."
  (check-type register integer)
  (coding-system-property
   coding-system
   (case register
     (0 'force-g0-on-output)
     (1 'force-g1-on-output)
     (2 'force-g2-on-output)
     (3 'force-g3-on-output)
     (t (signal 'args-out-of-range (list register 0 3))))))

(defun coding-system-short (coding-system)
  "Return the 'short property of CODING-SYSTEM."
  (coding-system-property coding-system 'short))

(defun coding-system-no-ascii-eol (coding-system)
  "Return the 'no-ascii-eol property of CODING-SYSTEM."
  (coding-system-property coding-system 'no-ascii-eol))

(defun coding-system-no-ascii-cntl (coding-system)
  "Return the 'no-ascii-cntl property of CODING-SYSTEM."
  (coding-system-property coding-system 'no-ascii-cntl))

(defun coding-system-seven (coding-system)
  "Return the 'seven property of CODING-SYSTEM."
  (coding-system-property coding-system 'seven))

(defun coding-system-lock-shift (coding-system)
  "Return the 'lock-shift property of CODING-SYSTEM."
  (coding-system-property coding-system 'lock-shift))

;;(defun coding-system-use-japanese-jisx0201-roman (coding-system)
;;  "Return the 'use-japanese-jisx0201-roman property of CODING-SYSTEM."
;;  (coding-system-property coding-system 'use-japanese-jisx0201-roman))

;;(defun coding-system-use-japanese-jisx0208-1978 (coding-system)
;;  "Return the 'use-japanese-jisx0208-1978 property of CODING-SYSTEM."
;;  (coding-system-property coding-system 'use-japanese-jisx0208-2978))

(defun coding-system-no-iso6429 (coding-system)
  "Return the 'no-iso6429 property of CODING-SYSTEM."
  (coding-system-property coding-system 'no-iso6429))

(defun coding-system-ccl-encode (coding-system)
  "Return the CCL 'encode property of CODING-SYSTEM."
  (coding-system-property coding-system 'encode))

(defun coding-system-ccl-decode (coding-system)
  "Return the CCL 'decode property of CODING-SYSTEM."
  (coding-system-property coding-system 'decode))


;;;; Definitions of predefined coding systems

(make-coding-system
 'ctext 'iso2022
 "Coding-system used in X as Compound Text Encoding."
 '(charset-g0 ascii
   charset-g1 latin-iso8859-1
   eol-type nil
   mnemonic "CText"))

;;; iso-8859-1 and ctext are aliases.

;; (copy-coding-system 'ctext 'iso-8859-1)
(make-coding-system
 'iso-8859-1 'no-conversion
 "Coding-system used in X as Compound Text Encoding."
 '(eol-type nil mnemonic "Noconv"))

(make-coding-system
 'iso-2022-8bit-ss2 'iso2022
 "ISO-2022 coding system using SS2 for 96-charset in 8-bit code."
 '(charset-g0 ascii
   charset-g1 latin-iso8859-1
   charset-g2 t ;; unspecified but can be used later.
   short t
   mnemonic "ISO8/SS"
   ))

(make-coding-system
 'iso-2022-7bit-ss2 'iso2022
 "ISO-2022 coding system using SS2 for 96-charset in 7-bit code."
 '(charset-g0 ascii
   charset-g2 t ;; unspecified but can be used later.
   seven t
   short t
   mnemonic "ISO7/SS"
   eol-type nil))

;; (copy-coding-system 'iso-2022-7bit-ss2 'iso-2022-jp-2)
(make-coding-system
 'iso-2022-jp-2 'iso2022
 "ISO-2022 coding system using SS2 for 96-charset in 7-bit code."
 (let ((conf
	'(charset-g0 ascii
          charset-g2 t ;; unspecified but can be used later.
	  seven t
	  short t
	  mnemonic "ISO7/SS"
	  eol-type nil)))
   (if (featurep 'utf-2000)
       (list* 'ccs-priority-list
	      '(ascii
		=jis-x0208@1983 =jis-x0208@1978
		latin-jisx0201)
	      conf)
     conf)))

(make-coding-system
 'iso-2022-7bit 'iso2022
 "ISO 2022 based 7-bit encoding using only G0"
 '(charset-g0 ascii
   seven t
   short t
   mnemonic "ISO7"))

;; compatibility for old XEmacsen
(copy-coding-system 'iso-2022-7bit 'iso-2022-7)

(make-coding-system
 'iso-2022-8 'iso2022
 "ISO-2022 eight-bit coding system.  No single-shift or locking-shift."
 '(charset-g0 ascii
   charset-g1 latin-iso8859-1
   short t
   mnemonic "ISO8"
   ))

(make-coding-system
 'escape-quoted 'iso2022
 "ISO-2022 eight-bit coding system with escape quoting; used for .ELC files."
 '(charset-g0 ascii
   charset-g1 latin-iso8859-1
   eol-type lf
   escape-quoted t
   mnemonic "ESC/Quot"
   ))

(make-coding-system
 'iso-2022-lock 'iso2022
 "ISO-2022 coding system using Locking-Shift for 96-charset."
 '(charset-g0 ascii
   charset-g1 t ;; unspecified but can be used later.
   seven t
   lock-shift t
   mnemonic "ISO7/Lock"
   ))

(when (featurep 'utf-2000)
  (setq decomposition-feature-list
	'(=decomposition
	  =decomposition@cid
	  =decomposition@hanyo-denshi))

  (setq coded-charset-entity-reference-alist
	'(((=adobe-japan1-6	. isolated)    "I-AJ1-" 5 d)
	  ( =adobe-japan1-6			 "AJ1-" 5 d)
	  ((=adobe-japan1-base	. isolated)    "I-AJ1-" 5 d)
	  ( =adobe-japan1-base		       "I-AJ1-" 5 d)
	  ((=gt			. isolated)     "I-GT-" 5 d)
	  ( =gt					  "GT-" 5 d)
	  ( =zinbun-oracle                       "ZOB-" 4 d)
	  ((=ruimoku-v6		. isolated)   "I-RUI6-" 4 X)
	  ( =ruimoku-v6				"RUI6-" 4 X)
	  ((=big5-cdp		. isolated)    "I-CDP-" 4 X)
	  ( =big5-cdp			         "CDP-" 4 X)
	  ((=daikanwa@rev2	. isolated)      "I-M-" 5 d)
	  ( =daikanwa				   "M-" 5 d)
	  ( =daikanwa@rev2			 "r2M-" 5 d)
	  ( =daikanwa@rev1			 "r1M-" 5 d)
	  ((=gt-k		. isolated)    "I-GT-K" 5 d)
	  ( =gt-k				 "GT-K" 5 d)
	  ((=cbeta		. isolated)	 "I-CB" 5 d)
	  ( =cbeta				   "CB" 5 d)
	  ((=hanziku-1		. isolated)  "I-HZK01-" 4 X)
	  ( =hanziku-1			       "HZK01-" 4 X)
	  ((=hanziku-2		. isolated)  "I-HZK02-" 4 X)
	  ( =hanziku-2			       "HZK02-" 4 X)
	  ((=hanziku-3		. isolated)  "I-HZK03-" 4 X)
	  ( =hanziku-3			       "HZK03-" 4 X)
	  ((=hanziku-4		. isolated)  "I-HZK04-" 4 X)
	  ( =hanziku-4			       "HZK04-" 4 X)
	  ((=hanziku-5		. isolated)  "I-HZK05-" 4 X)
	  ( =hanziku-5			       "HZK05-" 4 X)
	  ((=hanziku-6		. isolated)  "I-HZK06-" 4 X)
	  ( =hanziku-6			       "HZK06-" 4 X)
	  ((=hanziku-7		. isolated)  "I-HZK07-" 4 X)
	  ( =hanziku-7			       "HZK07-" 4 X)
	  ((=hanziku-8		. isolated)  "I-HZK08-" 4 X)
	  ( =hanziku-8			       "HZK08-" 4 X)
	  ((=hanziku-9		. isolated)  "I-HZK09-" 4 X)
	  ( =hanziku-9			       "HZK09-" 4 X)
	  ((=hanziku-10		. isolated)  "I-HZK10-" 4 X)
	  ( =hanziku-10			       "HZK10-" 4 X)
	  ((=hanziku-11		. isolated)  "I-HZK11-" 4 X)
	  ( =hanziku-11			       "HZK11-" 4 X)
	  ((=hanziku-12		. isolated)  "I-HZK12-" 4 X)
	  ( =hanziku-12			       "HZK12-" 4 X)
	  ((=jis-x0208@1990	. isolated)    "I-J90-" 4 X)
	  ((=jis-x0208@1983	. isolated)    "I-J83-" 4 X)
	  ((=jis-x0213-1@2000	. isolated)    "I-JX1-" 4 X)
	  ((=jis-x0213-2	. isolated)    "I-JX2-" 4 X)
	  ((=jis-x0213-1@2004	. isolated)    "I-JX3-" 4 X)
	  ((=jis-x0212		. isolated)    "I-JSP-" 4 X)
	  ((=jis-x0208@1978/1pr	. isolated)    "I-J78-" 4 X)
	  ( =jis-x0208@1990			 "J90-" 4 X)
	  ((=jis-x0208		. isolated)    "I-J90-" 4 X)
	  ( =jis-x0213-1@2000   		 "JX1-" 4 X)
	  ( =jis-x0213-2	   		 "JX2-" 4 X)
	  ( =jis-x0213-1@2004			 "JX3-" 4 X)
	  ( =jis-x0212				 "JSP-" 4 X)
	  ( =jis-x0208@1983			 "J83-" 4 X)
	  ((chinese-gb2312	. isolated)    	"I-G0-" 4 X)
	  ((=iso-ir165		. isolated)    "I-EGB-" 4 X)
	  ((chinese-cns11643-1	. isolated)     "I-C1-" 4 X)
	  ((chinese-cns11643-2	. isolated)     "I-C2-" 4 X)
	  ((chinese-cns11643-3	. isolated)     "I-C3-" 4 X)
	  ((chinese-cns11643-4	. isolated)     "I-C4-" 4 X)
	  ((chinese-cns11643-5	. isolated)     "I-C5-" 4 X)
	  ((chinese-cns11643-6	. isolated)     "I-C6-" 4 X)
	  ((chinese-cns11643-7	. isolated)     "I-C7-" 4 X)
	  ((korean-ksc5601	. isolated)    	"I-K0-" 4 X)
	  ((=big5-eten		. isolated)    	 "I-B-" 4 X)
	  ((latin-iso8859-1	. isolated) "I-LATIN1-" 2 X)
	  ((latin-iso8859-2	. isolated) "I-LATIN2-" 2 X)
	  ((latin-iso8859-3	. isolated) "I-LATIN3-" 2 X)
	  ((latin-iso8859-4	. isolated) "I-LATIN4-" 2 X)
	  ((cyrillic-iso8859-5	. isolated) "I-CYRILLIC-" 2 X)
	  ((greek-iso8859-7	. isolated)  "I-GREEK-" 2 X)
	  ((hebrew-iso8859-8	. isolated) "I-HEBREW-" 2 X)
	  ((latin-iso8859-9	. isolated) "I-LATIN5-" 2 X)
	  ((latin-jisx0201	. isolated) "I-LATINJ-" 2 X)
	  ((katakana-jisx0201	. isolated) "I-KATAKANA-" 2 X)
	  ((latin-tcvn5712	. isolated) "I-VSCII2-" 2 X)
	  ;; ((latin-viscii	. isolated) "I-VISCII-" 2 X)
	  ((latin-viscii-upper	. isolated) "I-MULE-VIET-U-" 2 X)
	  ((latin-viscii-lower	. isolated) "I-MULE-VIET-L-" 2 X)
	  ((thai-tis620		. isolated)   "I-THAI-" 2 X)
	  ((lao			. isolated) "I-MULE-LAO-" 2 X)
	  ((arabic-1-column	. isolated) "I-MULE-ARB1-" 2 X)
	  ((arabic-2-column	. isolated) "I-MULE-ARB2-" 2 X)
	  ((arabic-digit	. isolated) "I-MULE-ARBD-" 2 X)
	  ((ipa			. isolated) "I-MULE-IPA-" 2 X)
	  ((china3-jef		. isolated)    "I-JC3-" 4 X)
	  ((=hanyo-denshi/ja	. isolated)  "I-HD-JA-" 4 X)
	  ((=hanyo-denshi/jb	. isolated)  "I-HD-JB-" 4 X)
	  ((=hanyo-denshi/jc	. isolated)  "I-HD-JC-" 4 X)
	  ((=hanyo-denshi/jd	. isolated)  "I-HD-JD-" 4 X)
	  ((=hanyo-denshi/ft	. isolated)  "I-HD-FT-" 4 X)
	  ((=hanyo-denshi/ia	. isolated)  "I-HD-IA-" 4 X)
	  ((=hanyo-denshi/ib	. isolated)  "I-HD-IB-" 4 X)
	  ((=hanyo-denshi/hg	. isolated)  "I-HD-HG-" 4 X)
	  ((=hanyo-denshi/ip	. isolated)  "I-HD-IP-" 4 X)
	  ((=hanyo-denshi/jt	. isolated)  "I-HD-JT-" 4 X)
	  ((=hanyo-denshi/ks	. isolated)  "I-HD-KS-" 6 d)
	  ((=hanyo-denshi/ks/mf	. isolated)   "I-KSMF-" 5 d)
	  ((=hanziku-1		. isolated)   "I-HZK1-" 4 X)
	  ( =hanziku-1				"HZK1-" 4 X)
	  ((=hanziku-2		. isolated)   "I-HZK2-" 4 X)
	  ( =hanziku-2				"HZK2-" 4 X)
	  ( =hanyo-denshi/ja		       "HD-JA-" 4 X)
	  ( =hanyo-denshi/jb		       "HD-JB-" 4 X)
	  ( =hanyo-denshi/jc		       "HD-JC-" 4 X)
	  ( =hanyo-denshi/jd		       "HD-JD-" 4 X)
	  ( =hanyo-denshi/ft		       "HD-FT-" 4 X)
	  ( =hanyo-denshi/ia		       "HD-IA-" 4 X)
	  ( =hanyo-denshi/ib		       "HD-IB-" 4 X)
	  ( =hanyo-denshi/hg		       "HD-HG-" 4 X)
	  ( =hanyo-denshi/ip		       "HD-IP-" 4 X)
	  ( =hanyo-denshi/jt		       "HD-JT-" 4 X)
	  ( =hanyo-denshi/ks		       "HD-KS-" 6 d)
	  ( =hanyo-denshi/ks/mf                 "KSMF-" 5 d)
	  ( =jis-x0208@1978			 "J78-" 4 X)
	  ( chinese-cns11643-1                    "C1-" 4 X)
	  ( chinese-cns11643-2                    "C2-" 4 X)
	  ( chinese-cns11643-3                    "C3-" 4 X)
	  ( chinese-cns11643-4                    "C4-" 4 X)
	  ( chinese-cns11643-5                    "C5-" 4 X)
	  ( chinese-cns11643-6                    "C6-" 4 X)
	  ( chinese-cns11643-7                    "C7-" 4 X)
	  ( korean-ksc5601                    	  "K0-" 4 X)
	  ( chinese-gb2312		      	  "G0-" 4 X)
	  ( =iso-ir165			         "EGB-" 4 X)
	  ( latin-iso8859-1		      "LATIN1-" 2 X)
	  ( latin-iso8859-2	    	      "LATIN2-" 2 X)
	  ( latin-iso8859-3		      "LATIN3-" 2 X)
	  ( latin-iso8859-4		      "LATIN4-" 2 X)
	  ( cyrillic-iso8859-5              "CYRILLIC-" 2 X)
	  ( greek-iso8859-7		       "GREEK-" 2 X)
	  ( hebrew-iso8859-8		      "HEBREW-" 2 X)
	  ( latin-iso8859-9		      "LATIN5-" 2 X)
	  ( latin-jisx0201		      "LATINJ-" 2 X)
	  ( katakana-jisx0201		    "KATAKANA-" 2 X)
	  ( latin-tcvn5712                    "VSCII2-" 2 X)
	  ( latin-viscii                      "VISCII-" 2 X)
	  ( latin-viscii-upper		 "MULE-VIET-U-" 2 X)
	  ( latin-viscii-lower		 "MULE-VIET-L-" 2 X)
	  ( thai-tis620			        "THAI-" 2 X)
	  ( lao				    "MULE-LAO-" 2 X)
	  ( ethiopic		          "MULE-ETHIO-" 4 X)
	  ( arabic-1-column                "MULE-ARB1-" 2 X)
	  ( arabic-2-column                "MULE-ARB2-" 2 X)
	  ( arabic-digit		   "MULE-ARBD-" 2 X)
	  ( ipa                             "MULE-IPA-" 2 X)
	  (=>>>jis-x0208		       "g2-J0-" 4 X)
	  (=>>>jis-x0208		       "GI-J0-" 4 X)
	  (=>>>jis-x0213-1		      "g2-JX1-" 4 X)
	  (=>>>jis-x0213-1		      "GI-JX1-" 4 X)
	  (=>>>jis-x0213-2		      "g2-JX2-" 4 X)
	  (=>>>jis-x0213-1@2004		      "g2-JX3-" 4 X)
	  (=>>>jis-x0213-1@2004		      "GI-JX3-" 4 X)
	  (=>>>hanyo-denshi/jt		    "g2-HD-JT-" 4 X)
	  (=>>>gt			       "g2-GT-" 5 d)
	  (=>>gt				"G-GT-" 5 d)
	  (=>>jis-x0208				"G-J0-" 4 X)
	  (=>>jis-x0213-1@2000		       "G-JX1-" 4 X)
	  (=>>jis-x0213-2		       "G-JX2-" 4 X)
	  (=>>jis-x0213-1@2004		       "G-JX3-" 4 X)
	  (=>>adobe-japan1		       "G-AJ1-" 5 d)
	  (=>>jis-x0208@1978		       "G-J78-" 4 X)
	  (=>>big5-cdp			       "G-CDP-" 4 X)
	  (=>>gt-k			       "G-GT-K" 5 d)
	  (=>>ruimoku-v6		      "G-RUI6-" 4 X)
	  (=>>hanyo-denshi/ft		     "G-HD-FT-" 4 X)
	  (=>>hanyo-denshi/ia		     "G-HD-IA-" 4 X)
	  (=>>hanyo-denshi/ib		     "G-HD-IB-" 4 X)
	  (=>>hanyo-denshi/jt		     "G-HD-JT-" 4 X)
	  (=>>hanyo-denshi/ks		     "G-HD-KS-" 4 X)
	  (=>>cbeta   		           	 "G-CB" 5 d)
	  ( =>jis-x0208@usual			"o-J0-" 4 X)
	  ( =>jis-x0213-2@usual		       "o-JX2-" 4 X)
	  ( =>jis-x0208@1997			 "J97-" 4 X)
	  ( =>jis-x0208@1997			"A-J0-" 4 X)
	  ( =>jis-x0213-1@2000		       "A-JX1-" 4 X)
	  ( =>jis-x0213-2		       "A-JX2-" 4 X)
	  ( =>jis-x0213-1@2004		       "A-JX3-" 4 X)
	  ( =>gt				"A-GT-" 5 d)
	  ( =>gt-k			       "A-GT-K" 5 d)
	  ( =>zinbun-oracle		       "A-ZOB-" 4 d)
	  (==>ucs@bucs				"BUCS+" 4 X)
	  ( =>ucs@iso				"A-IU+" 4 X)
	  ( =>ucs@unicode			"A-UU+" 4 X)
	  ( =>ucs@jis				"A-JU+" 4 X)
	  ( =>ucs@cns				"A-CU+" 4 X)
	  ( =>ucs@JP				"o-JU+" 4 X)
	  (=>>ucs@iso				"G-IU+" 4 X)
	  (=>>ucs@unicode			"G-UU+" 4 X)
	  (=>>ucs@jis				"G-JU+" 4 X)
	  (=>>ucs@ks				"G-KU+" 4 X)
	  (=>>ucs@cns				"G-CU+" 4 X)
	  (=>>ucs@jis/2004		      "G-J04U+" 4 X)
	  (=>>ucs@jis/2000		      "G-J00U+" 4 X)
	  (=>>ucs@jis/1990		      "G-J90U+" 4 X)
	  (=>>ucs@JP			       "G-dJU+" 4 X)
	  (=>>>ucs@iso			       "g2-IU+" 4 X)
	  (=>>>ucs@iso			       "GI-IU+" 4 X)
	  (=>>>ucs@unicode		       "g2-UU+" 4 X)
	  (=>>>ucs@unicode		       "GI-UU+" 4 X)
	  (=>>>ucs@jis			       "g2-JU+" 4 X)
	  (=>>>ucs@jis			       "GI-JU+" 4 X)
	  (=>>>ucs@ks			       "g2-KU+" 4 X)
	  (=>>>ucs@ks			       "GI-KU+" 4 X)
	  (=>>>ucs@cns			       "g2-CU+" 4 X)
	  (=>>>ucs@cns			       "GI-CU+" 4 X)
	  (=>>>ucs@jis/2004		     "g2-J04U+" 4 X)
	  (=>>>ucs@jis/2004		     "GI-J04U+" 4 X)
	  ( =ucs@iso				   "U-" 8 X)
	  ( =ucs@unicode			  "UU+" 4 X)
	  ( =ucs@unicode			  "UU-" 8 X)
	  ( =ucs@iso				   "U+" 4 X)
	  ( =ucs@gb				  "GU+" 4 X)
	  ( =ucs@gb				  "GU-" 8 X)
	  ( =ucs@jis				  "JU+" 4 X)
	  ( =ucs@jis				  "JU-" 8 X)
	  ( =ucs@cns				  "CU+" 4 X)
	  ( =ucs@cns				  "CU-" 8 X)
	  ( =ucs@ks				  "KU+" 4 X)
	  ( =ucs@ks				  "KU-" 8 X)
	  ( =ucs@JP				 "dJU+" 4 X)
	  ( china3-jef				 "JC3-" 4 X)
	  ( =big5				   "B-" 4 X)
	  ( =big5				  "C0-" 4 X)
	  ( =big5-eten				  "BE-" 4 X)
	  ( =>big5-cdp			       "A-CDP-" 4 X)
	  ( =>daikanwa				 "A-M-" 5 d)
	  ( =jis-x0208@1978/i1		       "J78i1-" 4 X)
	  ( =shinjigen@rev			"SJG2-" 4 d)
	  ( =shinjigen@1ed			"SJG1-" 4 d)
	  ))

  (make-coding-system
   'utf-8-mcs-er 'utf-8
   "Coding-system of UTF-8 with entity-reference."
   '(mnemonic "MTF8r" use-entity-reference t))

  (make-coding-system
   'utf-8-mcs-no-composition 'utf-8
   "Coding-system of UTF-8 without composition."
   '(mnemonic "MTF8-nc" disable-composition t))

  (make-coding-system
   'utf-8-gb 'utf-8
   "Coding-system of UTF-8 using GB mapping."
   '(mnemonic "UTF8G"
	      charset-g0 ucs-gb
	      charset-g1 =>ucs-gb
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-gb-er 'utf-8
   "Coding-system of UTF-8 using GB mapping with entity-reference."
   '(mnemonic "UTF8Gr"
	      charset-g0 ucs-gb
	      charset-g1 =>ucs-gb
	      charset-g2 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-cns 'utf-8
   "Coding-system of UTF-8 using CNS mapping."
   '(mnemonic "UTF8C"
	      charset-g0 ucs-cns
	      charset-g1 =>ucs-cns
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-cns-er 'utf-8
   "Coding-system of UTF-8 using CNS mapping with entity-reference."
   '(mnemonic "UTF8Cr"
	      charset-g0 ucs-cns
	      charset-g1 =>ucs-cns
	      charset-g2 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-big5 'utf-8
   "Coding-system of UTF-8 using Big5 mapping."
   '(mnemonic "UTF8B"
	      charset-g0 ucs-big5
	      charset-g1 =>ucs-big5
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-big5-er 'utf-8
   "Coding-system of UTF-8 using Big5 mapping with entity-reference."
   '(mnemonic "UTF8Br"
	      charset-g0 ucs-big5
	      charset-g1 =>ucs-big5
	      charset-g2 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-jis 'utf-8
   "Coding-system of UTF-8 using JIS mapping."
   '(mnemonic "UTF8J"
	      charset-g0 =ucs@jis-2000
	      charset-g1 =>ucs-jis
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-jis-er 'utf-8
   "Coding-system of UTF-8 using JIS mapping with entity-reference."
   '(mnemonic "UTF8Jr"
	      charset-g0 =ucs@jis-2000
	      charset-g1 =>ucs-jis
	      charset-g2 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-jp 'utf-8
   "Coding-system of UTF-8 for common glyphs used in Japan."
   '(mnemonic "UTF8J"
	      charset-g0 =ucs@jp
	      charset-g1 =>ucs-jis
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-jp-er 'utf-8
   "Coding-system of UTF-8 using =ucs@jp mapping with entity-reference."
   '(mnemonic "UTF8Jr"
	      charset-g0 =ucs@jp
	      charset-g1 =>ucs-jis
	      charset-g2 =>ucs
	      use-entity-reference t))

  (make-coding-system
   'utf-8-ks 'utf-8
   "Coding-system of UTF-8 using KS mapping."
   '(mnemonic "UTF8K"
	      charset-g0 ucs-ks
	      charset-g1 =>ucs-ks
	      charset-g2 =>ucs))

  (make-coding-system
   'utf-8-ks-er 'utf-8
   "Coding-system of UTF-8 using KS mapping with entity-reference."
   '(mnemonic "UTF8Kr"
	      charset-g0 ucs-ks
	      charset-g1 =>ucs-ks
	      charset-g2 =>ucs
	      use-entity-reference t))

  (define-coding-system-alias 'utf-8 'utf-8-mcs)
  (define-coding-system-alias 'utf-8-er 'utf-8-mcs-er)
  )

(make-coding-system
 'euc-jisx0213 'iso2022
 "Coding-system of Japanese EUC based on JIS X 0213."
 '(charset-g0 ascii
   charset-g1 japanese-jisx0213-1
   charset-g2 katakana-jisx0201
   charset-g3 japanese-jisx0213-2
   short t
   mnemonic "Ja/EUC0213"
   ))

;; initialize the coding categories to something semi-reasonable
;; so that the remaining Lisp files can contain extended characters.
;; (They will be in ISO-7 format)
;; #### This list needs to be synched with the ones in mule-cmds.el.

(if (featurep 'utf-2000)
    (set-coding-priority-list '(iso-7
				no-conversion
				utf-8
				iso-8-1
				iso-8-2
				iso-8-designate
				iso-lock-shift
				shift-jis
				big5
				ucs-4))
  (set-coding-priority-list '(iso-7
			      no-conversion
			      ;; utf-8
			      iso-8-1
			      iso-8-2
			      iso-8-designate
			      iso-lock-shift
			      shift-jis
			      big5
			      ;; ucs-4
			      )))

(set-coding-category-system 'iso-7 'iso-2022-7)
(set-coding-category-system 'iso-8-designate 'ctext)
(set-coding-category-system 'iso-8-1 'ctext)
(set-coding-category-system 'iso-lock-shift 'iso-2022-lock)
(set-coding-category-system 'no-conversion 'no-conversion)

(setq-default buffer-file-coding-system 'iso-2022-8)

;;; mule-coding.el ends here
