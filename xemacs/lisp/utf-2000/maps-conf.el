(require 'read-maps)

(dolist (file '("J90-to-UCS.txt" "JSP-to-UCS.txt"
		"JX1-to-UCS.txt" "JX2-to-UCS.txt"
		"K0-to-UCS.txt"
		"G0-to-UCS.txt"
		"C2-to-UCS.txt"
		"C3-to-UCS.txt" "C4-to-UCS.txt"
		"C5-to-UCS.txt" "C6-to-UCS.txt"
		"B-to-UCS.txt" "JC3-to-UCS.txt"))
  (mapping-table-read-file (expand-file-name file "../etc/char-data/")))

(ucs-compat-read-file "../etc/char-data/UCS-compat.txt")

(jp-jouyou-read-file "../etc/char-data/jp-jouyou.txt")

(let ((ucs #xE000)
      big5 chr
      ret)
  (while (<= ucs #xF848)
    (setq chr (decode-char 'ucs ucs))
    (when (setq big5 (get-char-attribute chr '=big5-pua))
      (when (setq chr (decode-char '=big5-cdp big5))
	(unless (get-char-attribute chr '=big5-cdp)
	  (put-char-attribute chr '=big5-cdp big5))))
    (setq ucs (1+ ucs))))


(setq gt-pj-1-and-jis-x0208-1990-different-code-points
      '(#x5C37 #x5C52 #x3521 #x5D62 #x5F4A
	#x5F5B #x6062 #x4849 #x6173 #x306B
	#x6328 #x6352 #x6362 #x6471 #x6524
	#x6530 #x6549 #x6628 #x4356 #x665C
	#x665D #x6661 #x6660 #x6663 #x4F38
	#x666B #x4C2E #x6724 #x3D58 #x682B
	#x427B #x4978 #x694A #x303A #x6A44
	#x6B43 #x6B78 #x6C2E #x6C57 #x6D36
	#x6D3A #x3D34 #x4A56 #x3063 #x3D3F
	#x6E60 #x6F52 #x6F5C #x3458 #x4262
	#x4E59 #x6F58 #x7051 #x7056 #x375B
	#x7123 #x712A #x3142 #x3B41 #x7149
	#x7165 #x7227 #x7233 #x733B #x4E6F
	#x7366 #x7367 #x7368 #x736C #x5423
	#x342A #x3476 #x5877 #x592D #x5A61
	#x3522 #x334C #x657D #x657E #x6621
	#x335C #x6D7D #x507C #x417C #x5371
	#x3766 #x3E7D #x555D #x5739 #x5831
	#x3F78 #x5973 #x5A33 #x5970 #x5A49
	#x3F22 #x6026 #x4D32 #x612E #x4D63
	#x4E57 #x316A #x4A43 #x723C #x6A64
	#x6B36 #x6E43 #x3D36 #x6E44 #x3C60
	#x6E45 #x6E46 #x6E48 #x6E4B #x6E4A
	#x6E4F #x6E52 #x6E51 #x4830 #x6E54
	#x6E55 #x395A #x724D #x737D #x3973
	#x5379 #x5879 #x3D5D #x3C21 #x4C60
	#x5267 #x722F #x3C39 #x3848 #x5578
	#x4742 #x6950 #x697C #x6A24 #x5350
	#x3326 #x5575 #x5A4B #x3647 #x343F
	#x4337 #x492D #x3F6C #x6E4D #x4F3F
	#x353D #x4324 #x475B #x6E47 #x4371
	#x3F5D #x6E49 #x4D6F #x3C72 #x3D37
	#x6E4C #x3B44 #x734E #x5567 #x545A
	#x3071 #x332A #x516A #x476D #x3675
	#x5734 #x552D #x565A #x564B #x5B79
	#x5C74 #x5C27 #x5B5E #x3564 #x3823
	#x6131 #x4A4D #x632E #x635E #x3729
	#x3951 #x6967 #x704B #x3C38 #x6B26
	#x4749 #x4428 #x3A47 #x6E4E #x4269
	#x4043 #x6E56 #x6132 #x5C54 #x3557
	#x5827 #x4C68 #x505B #x514A #x5D27
	#x5563 #x5D7A #x4575 #x5F7C #x3B38
	#x3237 #x3B51))

(map-char-attribute
 (lambda (c v)
   (unless (memq v gt-pj-1-and-jis-x0208-1990-different-code-points)
     (put-char-attribute (decode-char 'japanese-jisx0208-1990 v)
			 '=gt-pj-1 v))
   nil)
 '=gt-pj-1)

(let ((default-coded-charset-priority-list
	'(=gt-pj-1
	  =gt-pj-2
	  =gt-pj-3
	  =gt-pj-4
	  =gt-pj-5
	  =gt-pj-6
	  =gt-pj-7
	  =gt-pj-8
	  =gt-pj-9
	  =gt-pj-10
	  =gt-pj-11
	  =gt-pj-k1
	  =gt-pj-k2))
      (i 1)
      chr ret)
  (while (<= i 12000)
    (when (and (setq ret (decode-char '=gt-k i))
	       (setq ret (split-char ret))
	       (memq (car ret) default-coded-charset-priority-list))
      (when (setq chr (apply (function make-char) ret))
	(put-char-attribute chr '=gt-k i)))
    (setq i (1+ i))))

(let (gt)
  (dolist (ccs '(=gt-pj-1
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
    (map-char-attribute
     (lambda (c v)
       (when (setq gt (encode-char c '=gt))
	 (put-char-attribute c '=gt gt)
	 (put-char-attribute (decode-char ccs v) '=gt gt))
       nil)
     ccs)))

;; (let (ret)
;;   (dolist (feature
;;            (let (dest)
;;              (dolist (feature (char-attribute-list))
;;                (when (string-match "\\*sources\\($\\|@[^\\*]+$\\)"
;;                                    (symbol-name feature))
;;                  (setq dest (cons feature dest))))
;;              dest))
;;     (map-char-attribute
;;      (lambda (c v)
;;        (when (setq ret (memq 'shinjigen-1 v))
;;          (setcar ret 'shinjigen@1ed))
;;        (when (setq ret (memq 'shinjigen-2 v))
;;          (setcar ret 'shinjigen@rev))
;;        nil)
;;      feature)))

;; (map-char-attribute
;;  (lambda (c v)
;;    (when (eq (encode-char c '=shinjigen@rev) v)
;;      (put-char-attribute c '=shinjigen v)
;;      (remove-char-attribute c '=shinjigen@1ed)
;;      (remove-char-attribute c '=shinjigen@rev)
;;      )
;;    nil)
;;  '=shinjigen@1ed)

;; (let (ret)
;;   (dolist (feature
;;            (let (dest)
;;              (dolist (feature (char-attribute-list))
;;                (when (string-match "\\*sources\\($\\|@[^\\*]+$\\)"
;;                                    (symbol-name feature))
;;                  (setq dest (cons feature dest))))
;;              dest))
;;     (map-char-attribute
;;      (lambda (c v)
;;        (cond ((setq ret (memq 'shinjigen@1ed v))
;;               (when (memq 'shinjigen@rev ret)
;;                 (setcar ret 'shinjigen)
;;                 (delq 'shinjigen@rev ret)
;;                 ))
;;              ((setq ret (memq 'shinjigen@rev v))
;;               (when (memq 'shinjigen@1ed ret)
;;                 (setcar ret 'shinjigen)
;;                 (delq 'shinjigen@1ed ret)
;;                 )))
;;        nil)
;;      feature)))

(dolist (ccs '(=jis-x0208 =jis-x0208@1990))
  (map-char-attribute
   (lambda (c v)
     (unless (eq (encode-char c '=jis-x0213-1@2000) v)
       (put-char-attribute c '=jis-x0213-1 v))
     nil)
   ccs))

(with-temp-buffer
  (buffer-disable-undo)
  (insert-file-contents "../etc/char-data/JX3-JX1-rep-diff.txt")
  (goto-char (point-min))
  (let (ku ten char code ucs)
    (while (re-search-forward "^1-\\([0-9]+\\)-\\([0-9]+\\)[ \t]+" nil t)
      (setq ku (string-to-number (match-string 1))
	    ten (string-to-number (match-string 2)))
      (setq char (make-char '=jis-x0213-1@2000 (+ ku 32)(+ ten 32)))
      (setq code (encode-char char '=jis-x0213-1@2000))
      (put-char-attribute char '=jis-x0213-1@2000 code)
      (remove-char-attribute char '=jis-x0213-1)
      (remove-char-attribute char '=jis-x0213-1@2004)
      (setq ucs (encode-char char '=ucs@jis/2000))
      (remove-char-attribute char '=ucs@jis)
      (remove-char-attribute char '=ucs@jis/2004)
      (when (setq char (decode-char '=jis-x0213-1@2004 code))
	(unless (eq (encode-char char '=ucs@jis/2004) ucs)
	  (put-char-attribute char '=ucs@jis/2004 ucs)))
      (unless (eq code #x332A)
	(when (setq char (decode-char '=>jis-x0208@1997 code 'defined-only))
	  (unless (eq (encode-char char '=>>jis-x0208) code)
	    (put-char-attribute char '=>jis-x0208 code)
	    (remove-char-attribute char '=>jis-x0208@1997))))
      )))

(map-char-attribute
 (lambda (c v)
   (unless (eq (encode-char c '=>jis-x0213-1) v)
     (put-char-attribute c '=>jis-x0213-1 v))
   nil)
 '=>jis-x0208)
