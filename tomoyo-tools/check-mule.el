(defconst mule-charset-mapping-table-alist
  '((arabic-digit "http://www.m17n.org/mule/mappings/arabic0.txt")
    (arabic-1-column "http://www.m17n.org/mule/mappings/arabic1.txt")
    (arabic-2-column "http://www.m17n.org/mule/mappings/arabic2.txt")
    (ipa "http://www.m17n.org/mule/mappings/ipa.txt")
    ))

(defvar mule-charset-http-url-root "~/pub/http/")

(defun mule-charset-url-to-filename (url)
  (when (string-match "http://" url)
    (expand-file-name (substring url (match-end 0))
		      mule-charset-http-url-root)))

(defun mule-charset-maybe-retrieve-url (url)
  (call-process "wget" nil nil nil
		"-q" "-P" (expand-file-name
			   mule-charset-http-url-root) "-m" url))

(defun mule-charset-check-mapping (coded-charset &optional url)
  (unless url
    (setq url
	  (car (cdr (assq coded-charset mule-charset-mapping-table-alist)))))
  (mule-charset-maybe-retrieve-url url)
  (let ((file (mule-charset-url-to-filename url))
	buf)
    (if (file-exists-p file)
	(progn
	  (setq buf (find-file-noselect file))
	  (with-current-buffer buf
	    (goto-char (point-min))
	    (let (code ucs chr ret)
	      (while
		  (re-search-forward
		   "^0x\\([0-9A-F]+\\)\t\\(0x[0-9A-F]+\\( 0x[0-9A-F]+\\)\\)"
		   nil t)
		(setq code (string-to-int (match-string 1) 16)
		      ucs (match-string 2))
		(if (string-match " " ucs)
		    (define-char
		      (list (cons coded-charset code)
			    (cons '->decomposition
				  (mapcar (lambda (str)
					    (string-to-int
					     (substring str 2) 16))
					  (split-string ucs " ")))))
		  (setq ucs (string-to-int ucs 16))
		  (setq chr (decode-char coded-charset code))
		  (if (or (setq ret (get-char-attribute chr 'ucs))
			  (setq ret (get-char-attribute chr 'ucs-mule))
			  (setq ret (get-char-attribute chr '=>ucs))
			  (setq ret (get-char-attribute chr '->ucs)))
		      (unless (= ret ucs)
			(put-char-attribute chr 'ucs-mule ucs))
		    (put-char-attribute (decode-char 'ucs ucs)
					coded-charset code))))))
	  (kill-buffer buf))
      (with-current-buffer "*scratch*"
	(insert (format "%s is not found!!!\n" file))))))

(dolist (cell mule-charset-mapping-table-alist)
  (mule-charset-check-mapping (car cell)(cadr cell)))
