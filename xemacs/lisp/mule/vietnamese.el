;;; vietnamese.el --- Support for Vietnamese -*- coding: iso-2022-7bit; -*-

;; Copyright (C) 1995 Electrotechnical Laboratory, JAPAN.
;; Licensed to the Free Software Foundation.
;; Copyright (C) 1997,2000 MORIOKA Tomohiko

;; Keywords: multilingual, Vietnamese

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
;; along with XEmacs; see the file COPYING.  If not, write to the Free
;; Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Commentary:

;; For Vietnames, the character sets VISCII and VSCII are supported.

;;; Code:

(when (featurep 'utf-2000)
  (make-coding-system
   'vscii-2 'iso2022
   "TCVN 5712 (VSCII 2)."
   '(charset-g0 ascii
		charset-g1 latin-tcvn5712
		charset-g2 t ;; unspecified but can be used later.
		short t
		mnemonic "VIET/ISO8"))
  (define-coding-system-alias 'tcvn-5712 'vscii-2)
  )

;;; [tomo] CCL based implementations were moved into viet-ccl.el.

(make-coding-system
 'viqr 'no-conversion
 "Coding-system used for VIQR."
 '(mnemonic "VIQR"
   eol-type lf
   post-read-conversion viqr-post-read-conversion
   pre-write-conversion viqr-pre-write-conversion))

;; (make-coding-system
;;  'vietnamese-viqr 0 ?q
;;  "Vietnamese latin transcription (VIQR)"
;;  nil
;;  '((safe-charsets ascii vietnamese-viscii-lower vietnamese-viscii-upper)
;;    (post-read-conversion . viqr-post-read-conversion)
;;    (pre-write-conversion . viqr-pre-write-conversion)
;;    (charset-origin-alist
;;     (vietnamese-viscii-lower "VISCII" viet-encode-viscii-char)
;;     (vietnamese-viscii-upper "VISCII" viet-encode-viscii-char))))

;; (define-coding-system-alias 'viqr 'vietnamese-viqr)

(set-language-info-alist
 "Vietnamese" `((charset vietnamese-viscii-lower vietnamese-viscii-upper)
		,(if (find-coding-system 'vscii-2)
		     ;; viscii will be supported in UTF-2000
		     '(coding-system vscii-2 viqr)
		   '(coding-system viscii vscii viqr))
		,(if (find-coding-system 'vscii-2)
		     '(coding-priority vscii-2)
		   '(coding-priority viscii))
		(input-method . "vietnamese-viqr")
		(features viet-util)
		(sample-text . "Vietnamese (Ti,1*(Bng Vi,1.(Bt)	Ch,A`(Bo b,1U(Bn")
		(documentation . "\
For Vietnamese, Emacs uses special charsets internally.
They can be decoded from and encoded to VISCC, VSCII, and VIQR.
Current setting put higher priority to the coding system VISCII than VSCII.
If you prefer VSCII, please do: (prefer-coding-system 'vietnamese-vscii)")
		))

;;; vietnamese.el ends here
