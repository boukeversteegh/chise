;;; autoload.el --- maintain autoloads in loaddefs.el.

;; Copyright (C) 1991, 1992, 1993, 1994, 1997 Free Software Foundation, Inc.
;; Copyright (C) 1995 Tinker Systems and INS Engineering Corp.
;; Copyright (C) 1996, 2000 Ben Wing.

;; Author: Roland McGrath <roland@gnu.ai.mit.edu>
;; Keywords: maint

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

;;; Synched up with: Not synched with FSF.

;;; Commentary:

;; This code helps GNU Emacs maintainers keep the loaddefs.el file up to
;; date.  It interprets magic cookies of the form ";;;###autoload" in
;; lisp source files in various useful ways.  To learn more, read the
;; source; if you're going to use this, you'd better be able to.

;; ChangeLog:

;; Sep-26-1997:  slb removed code dealing with customization.

;;; Code:

;; Need to load easy-mmode because we expand macro calls to easy-mmode
;; macros in make-autoloads below.
(require 'easy-mmode)

; Add operator definitions to autoload-operators.el in the xemacs-base
; package.
(eval-when-compile (load "cl-macs"))
(ignore-errors (require 'autoload-operators))

; As autoload-operators is new, provide stopgap measure for a while.
(if (not (boundp 'autoload-make-autoload-operators))
    (progn
      (defvar autoload-make-autoload-operators
	'(defun define-skeleton defmacro define-derived-mode define-generic-mode
	  easy-mmode-define-minor-mode easy-mmode-define-global-mode
	  define-minor-mode defun* defmacro*)
	"`defun'-like operators that use `autoload' to load the library.")
      
      (defvar autoload-make-autoload-complex-operators
	'(easy-mmode-define-minor-mode easy-mmode-define-global-mode
	  define-minor-mode)
	"`defun'-like operators to macroexpand before using `autoload'.")
      
      (put 'autoload 'doc-string-elt 3)
      (put 'defun    'doc-string-elt 3)
      (put 'defun*   'doc-string-elt 3)
      (put 'defvar   'doc-string-elt 3)
      (put 'defcustom 'doc-string-elt 3)
      (put 'defconst 'doc-string-elt 3)
      (put 'defmacro 'doc-string-elt 3)
      (put 'defmacro* 'doc-string-elt 3)
      (put 'defsubst 'doc-string-elt 3)
      (put 'define-skeleton 'doc-string-elt 2)
      (put 'define-derived-mode 'doc-string-elt 4)
      (put 'easy-mmode-define-minor-mode 'doc-string-elt 2)
      (put 'define-minor-mode 'doc-string-elt 2)
      (put 'define-generic-mode 'doc-string-elt 7)
      ;; defin-global-mode has no explicit docstring.
      (put 'easy-mmode-define-global-mode 'doc-string-elt 1000)))

(defun make-autoload (form file)
  "Turn FORM into an autoload or defvar for source file FILE.
Returns nil if FORM is not a special autoload form (i.e. a function definition
or macro definition or a defcustom)."
  (let ((car (car-safe form)) expand)
    (cond
     ;; For complex cases, try again on the macro-expansion.
     ((and (memq car autoload-make-autoload-complex-operators)
	   (setq expand (let ((load-file-name file)) (macroexpand form)))
	   (eq (car expand) 'progn)
	   (memq :autoload-end expand))
      (let ((end (memq :autoload-end expand)))
	;; Cut-off anything after the :autoload-end marker.
	(setcdr end nil)
	(cons 'progn
	      (mapcar (lambda (form) (make-autoload form file))
		      (cdr expand)))))

     ;; For special function-like operators, use the `autoload' function.
     ((memq car autoload-make-autoload-operators)
      (let* ((macrop (memq car '(defmacro defmacro*)))
	     (name (nth 1 form))
	     (body (nthcdr (get car 'doc-string-elt) form))
	     (doc (if (stringp (car body)) (pop body))))
	;; `define-generic-mode' quotes the name, so take care of that
	(list 'autoload (if (listp name) name (list 'quote name)) file doc
	      (or (and (memq car '(define-skeleton define-derived-mode
				    define-generic-mode
				    easy-mmode-define-global-mode
				    easy-mmode-define-minor-mode
				    define-minor-mode)) t)
		  (eq (car-safe (car body)) 'interactive))
	      (if macrop (list 'quote 'macro) nil))))

     ;; Convert defcustom to a simpler (and less space-consuming) defvar,
     ;; but add some extra stuff if it uses :require.
     ((eq car 'defcustom)
      (let ((varname (car-safe (cdr-safe form)))
	    (init (car-safe (cdr-safe (cdr-safe form))))
	    (doc (car-safe (cdr-safe (cdr-safe (cdr-safe form)))))
	    (rest (cdr-safe (cdr-safe (cdr-safe (cdr-safe form))))))
	(if (not (plist-get rest :require))
	    `(defvar ,varname ,init ,doc)
	  `(progn
	     (defvar ,varname ,init ,doc)
	     (custom-add-to-group ,(plist-get rest :group)
				  ',varname 'custom-variable)
	     (custom-add-load ',varname
			      ,(plist-get rest :require))))))
     ;; Coding systems. #### Would be nice to handle the docstring here too.
     ((memq car '(make-coding-system make-8-bit-coding-system))
      `(autoload-coding-system ,(nth 1 form) '(load ,file)))
     ;; nil here indicates that this is not a special autoload form.
     (t nil))))

(defvar generate-autoload-cookie ";;;###autoload"
  "Magic comment indicating the following form should be autoloaded.
Used by `update-file-autoloads'.  This string should be
meaningless to Lisp (e.g., a comment).

This string is used:

;;;###autoload
\(defun function-to-be-autoloaded () ...)

If this string appears alone on a line, the following form will be
read and an autoload made for it.  If it is followed by the string
\"immediate\", then the form on the following line will be copied
verbatim.  If there is further text on the line, that text will be
copied verbatim to `generated-autoload-file'.")

(defvar generate-autoload-section-header "\f\n;;;### "
  "String inserted before the form identifying
the section of autoloads for a file.")

(defvar generate-autoload-section-trailer "\n;;;***\n"
  "String which indicates the end of the section of autoloads for a file.")

(defvar autoload-package-name nil)

(defun autoload-trim-file-name (file)
  "Returns a relative pathname of FILE including the last directory."
  (setq file (expand-file-name file))
  (replace-in-string
   (file-relative-name file (file-name-directory
			     (directory-file-name
			      (file-name-directory file))))
   "\\\\" "/"))

;;;###autoload
(defun generate-file-autoloads (file &optional funlist)
  "Insert at point a loaddefs autoload section for FILE.
autoloads are generated for defuns and defmacros in FILE
marked by `generate-autoload-cookie' (which see).
If FILE is being visited in a buffer, the contents of the buffer
are used."
  (interactive "fGenerate autoloads for file: ")
  (generate-file-autoloads-1 file funlist))

(defun* generate-file-autoloads-1 (file funlist)
  "Insert at point a loaddefs autoload section for FILE.
autoloads are generated for defuns and defmacros in FILE
marked by `generate-autoload-cookie' (which see).
If FILE is being visited in a buffer, the contents of the buffer
are used."
  (let ((outbuf (current-buffer))
	(autoloads-done '())
	(load-name (replace-in-string (file-name-nondirectory file)
				      "\\.elc?$"
				      ""))
	(trim-name (autoload-trim-file-name file))
	(dofiles (not (null funlist)))
	(print-length nil)
	(print-readably t) ; XEmacs
	(float-output-format nil)
	;; (done-any nil)
	(visited (get-file-buffer file))
	output-end)

    ;; If the autoload section we create here uses an absolute
    ;; pathname for FILE in its header, and then Emacs is installed
    ;; under a different path on another system,
    ;; `update-autoloads-here' won't be able to find the files to be
    ;; autoloaded.  So, if FILE is in the same directory or a
    ;; subdirectory of the current buffer's directory, we'll make it
    ;; relative to the current buffer's directory.
    (setq file (expand-file-name file))

    (save-excursion
      (unwind-protect
	  (progn
	    (let ((find-file-hooks nil)
		  (enable-local-variables nil))
	      (set-buffer (or visited (find-file-noselect file)))
	      (set-syntax-table emacs-lisp-mode-syntax-table))
	    (save-excursion
	      (save-restriction
		(widen)
		(goto-char (point-min))
		(unless (search-forward generate-autoload-cookie nil t)
		  (message "No autoloads found in %s" trim-name)
		  (return-from generate-file-autoloads-1))

		(message "Generating autoloads for %s..." trim-name)
		(goto-char (point-min))
		(while (if dofiles funlist (not (eobp)))
		  (if (not dofiles)
		      (skip-chars-forward " \t\n\f")
		    (goto-char (point-min))
		    (re-search-forward
		     (concat "(def\\(un\\|var\\|const\\|macro\\) "
			     (regexp-quote (symbol-name (car funlist)))
			     "\\s "))
		    (goto-char (match-beginning 0)))
		  (cond
		   ((or dofiles
			(looking-at (regexp-quote generate-autoload-cookie)))
		    (if dofiles
			nil
		      (search-forward generate-autoload-cookie)
		      (skip-chars-forward " \t"))
		    ;; (setq done-any t)
		    (if (or dofiles (eolp))
			;; Read the next form and make an autoload.
			(let* ((form (prog1 (read (current-buffer))
				       (or (bolp) (forward-line 1))))
			       (autoload (make-autoload form load-name))
			       (doc-string-elt (get (car-safe form)
						    'doc-string-elt)))
			  (if autoload
			      (setq autoloads-done (cons (nth 1 form)
							 autoloads-done))
			    (setq autoload form))
			  (if (and doc-string-elt
				   (stringp (nth doc-string-elt autoload)))
			      ;; We need to hack the printing because the
			      ;; doc-string must be printed specially for
			      ;; make-docfile (sigh).
			      (let* ((p (nthcdr (1- doc-string-elt)
						autoload))
				     (elt (cdr p)))
				(setcdr p nil)
				(princ "\n(" outbuf)
				;; XEmacs change: don't let ^^L's get into
				;; the file or sorting is hard.
				(let ((print-escape-newlines t)
				      (p (save-excursion
					   (set-buffer outbuf)
					   (point)))
				      p2)
				  (mapcar (function (lambda (elt)
						      (prin1 elt outbuf)
						      (princ " " outbuf)))
					  autoload)
				  (save-excursion
				    (set-buffer outbuf)
				    (setq p2 (point-marker))
				    (goto-char p)
				    (save-match-data
				      (while (search-forward "\^L" p2 t)
					(delete-char -1)
					(insert "\\^L")))
				    (goto-char p2)
				    ))
				(princ "\"\\\n" outbuf)
				(let ((begin (save-excursion
					       (set-buffer outbuf)
					       (point))))
				  (princ (substring
					  (prin1-to-string (car elt)) 1)
					 outbuf)
				  ;; Insert a backslash before each ( that
				  ;; appears at the beginning of a line in
				  ;; the doc string.
				  (save-excursion
				    (set-buffer outbuf)
				    (save-excursion
				      (while (search-backward "\n(" begin t)
					(forward-char 1)
					(insert "\\"))))
				  (if (null (cdr elt))
				      (princ ")" outbuf)
				    (princ " " outbuf)
				    (princ (substring
					    (prin1-to-string (cdr elt))
					    1)
					   outbuf))
				  (terpri outbuf)))
			    ;; XEmacs change: another fucking ^L hack
			    (let ((p (save-excursion
				       (set-buffer outbuf)
				       (point)))
				  (print-escape-newlines t)
				  p2)
			      (print autoload outbuf)
			      (save-excursion
				(set-buffer outbuf)
				(setq p2 (point-marker))
				(goto-char p)
				(save-match-data
				  (while (search-forward "\^L" p2 t)
				    (delete-char -1)
				    (insert "\\^L")))
				(goto-char p2)
				))
			    ))
		      ;; Copy the rest of the line to the output.
		      (let ((begin (point)))
			;; (terpri outbuf)
			(cond ((looking-at "immediate\\s *$") ; XEmacs
			       ;; This is here so that you can automatically
			       ;; have small hook functions copied to
			       ;; loaddefs.el so that it's not necessary to
			       ;; load a whole file just to get a two-line
			       ;; do-nothing find-file-hook... --Stig
			       (forward-line 1)
			       (setq begin (point))
			       (forward-sexp)
			       (forward-line 1))
			      (t
			       (forward-line 1)))
			(princ (buffer-substring begin (point)) outbuf))))
		   ((looking-at ";")
		    ;; Don't read the comment.
		    (forward-line 1))
		   (t
		    (forward-sexp 1)
		    (forward-line 1)))
		  (if dofiles
		      (setq funlist (cdr funlist)))))))
	(unless visited
	    ;; We created this buffer, so we should kill it.
	    (kill-buffer (current-buffer)))
	(set-buffer outbuf)
	(setq output-end (point-marker))))
    (if t ;; done-any
	;; XEmacs -- always do this so that we cache the information
	;; that we've processed the file already.
	(progn
	  (insert generate-autoload-section-header)
	  (prin1 (list 'autoloads autoloads-done load-name trim-name)
		 outbuf)
	  (terpri outbuf)
	  ;;;; (insert ";;; Generated autoloads from "
	  ;;;;	  (autoload-trim-file-name file) "\n")
	  ;; Warn if we put a line in loaddefs.el
	  ;; that is long enough to cause trouble.
	  (when (< output-end (point))
	    (setq output-end (point-marker)))
	  (while (< (point) output-end)
	    ;; (let ((beg (point)))
	      (end-of-line)
	      ;; Emacs -- I still haven't figured this one out.
	      ;; (if (> (- (point) beg) 900)
		  ;; (progn
		    ;; (message "A line is too long--over 900 characters")
		    ;; (sleep-for 2)
		    ;; (goto-char output-end)))
	      ;; )
	    (forward-line 1))
	  (goto-char output-end)
	  (insert generate-autoload-section-trailer)))
    (or noninteractive ; XEmacs: only need one line in -batch mode.
	(message "Generating autoloads for %s...done" file))))


(defconst autoload-file-name "auto-autoloads.el"
  "Generic filename to put autoloads into.
Unless you are an XEmacs maintainer, it is probably unwise to change this.")

(defvar autoload-target-directory "../lisp/"
  "Directory to put autoload declaration file into.
Unless you know what you're doing, don't mess with this.")

(defvar generated-autoload-file
  (expand-file-name (concat autoload-target-directory
			    autoload-file-name)
		    data-directory)
  "*File `update-file-autoloads' puts autoloads into.
A .el file can set this in its local variables section to make its
autoloads go somewhere else.

Note that `batch-update-directory' binds this variable to its own value,
generally the file named `autoload-file-name' in the directory being
updated.")

(defconst cusload-file-name "custom-load.el"
  "Generic filename to put custom loads into.
Unless you are an XEmacs maintainer, it is probably unwise to change this.")

;;;###autoload
(defun update-file-autoloads (file)
  "Update the autoloads for FILE in `generated-autoload-file'
\(which FILE might bind in its local variables).
This function refuses to update autoloads files."
  (interactive "fUpdate autoloads for file: ")
  (setq file (expand-file-name file))
  (when (and (file-newer-than-file-p file generated-autoload-file)
	     (not (member (file-name-nondirectory file)
			  (list autoload-file-name))))

    (let ((load-name (replace-in-string (file-name-nondirectory file)
					"\\.elc?$"
					""))
	  (trim-name (autoload-trim-file-name file))
	  section-begin form)
      (save-excursion
	(let ((find-file-hooks nil))
	  (set-buffer (or (get-file-buffer generated-autoload-file)
			  (find-file-noselect generated-autoload-file))))
	;; Make sure we can scribble in it.
	(setq buffer-read-only nil)
	;; First delete all sections for this file.
	(goto-char (point-min))
	(while (search-forward generate-autoload-section-header nil t)
	  (setq section-begin (match-beginning 0))
	  (setq form (read (current-buffer)))
	  (when (string= (nth 2 form) load-name)
	    (search-forward generate-autoload-section-trailer)
	    (delete-region section-begin (point))))

	;; Now find insertion point for new section
	(block find-insertion-point
	  (goto-char (point-min))
	  (while (search-forward generate-autoload-section-header nil t)
	    (setq form (read (current-buffer)))
	    (when (string< trim-name (nth 3 form))
	      ;; Found alphabetically correct insertion point
	      (goto-char (match-beginning 0))
	      (return-from find-insertion-point))
	    (search-forward generate-autoload-section-trailer))
	  (when (eq (point) (point-min))	; No existing entries?
	    (goto-char (point-max))))	; Append.

	;; Add in new sections for file
	(generate-file-autoloads file))

      (when (interactive-p) (save-buffer)))))

;;;###autoload
(defun update-autoloads-here ()
  "Update sections of the current buffer generated by `update-file-autoloads'."
  (interactive)
  (let ((generated-autoload-file (buffer-file-name)))
    (save-excursion
      (goto-char (point-min))
      (while (search-forward generate-autoload-section-header nil t)
	(let* ((form (condition-case ()
			 (read (current-buffer))
		       (end-of-file nil)))
	       (file (nth 3 form)))
	  ;; XEmacs change: if we can't find the file as specified, look
	  ;; around a bit more.
	  (cond ((and (stringp file)
		      (or (get-file-buffer file)
			  (file-exists-p file))))
		((and (stringp file)
		      (save-match-data
			(let ((loc (locate-file (file-name-nondirectory file)
						load-path)))
			  (if (null loc)
			      nil
			    (setq loc (expand-file-name
				       (autoload-trim-file-name loc)
				       ".."))
			    (if (or (get-file-buffer loc)
				    (file-exists-p loc))
				(setq file loc)
			      nil))))))
		(t
		 (setq file
		       (if (y-or-n-p
			    (format
			     "Can't find library `%s'; remove its autoloads? "
			     (nth 2 form) file))
			   t
			 (condition-case ()
			     (read-file-name
			      (format "Find `%s' load file: "
				      (nth 2 form))
			      nil nil t)
			   (quit nil))))))
	  (if file
	      (let ((begin (match-beginning 0)))
		(search-forward generate-autoload-section-trailer)
		(delete-region begin (point))))
	  (if (stringp file)
	      (generate-file-autoloads file)))))))

;;;###autoload
(defun update-autoloads-from-directory (dir)
  "Update `generated-autoload-file' with all the current autoloads from DIR.
This runs `update-file-autoloads' on each .el file in DIR.
Obsolete autoload entries for files that no longer exist are deleted.
Note that, if this function is called from `batch-update-directory',
`generated-autoload-file' was rebound in that function."
  (interactive "DUpdate autoloads for directory: ")
  (setq dir (expand-file-name dir))
  (let ((simple-dir (file-name-as-directory
		     (file-name-nondirectory
		     (directory-file-name dir))))
	(enable-local-eval nil))
    (save-excursion
      (let ((find-file-hooks nil))
	(set-buffer (find-file-noselect generated-autoload-file)))
      (goto-char (point-min))
      (while (search-forward generate-autoload-section-header nil t)
	(let* ((begin (match-beginning 0))
	       (form (condition-case ()
			 (read (current-buffer))
		       (end-of-file nil)))
	       (file (nth 3 form)))
	  (when (and (stringp file)
		     (string= (file-name-directory file) simple-dir)
		     (not (file-exists-p
			   (expand-file-name
			    (file-name-nondirectory file) dir))))
	    ;; Remove the obsolete section.
	    (search-forward generate-autoload-section-trailer)
	    (delete-region begin (point)))))
      ;; Update or create autoload sections for existing files.
      (mapcar 'update-file-autoloads (directory-files dir t "^[^=].*\\.el$"))
      (unless noninteractive
	(save-buffer)))))

;;;###autoload
(defun batch-update-autoloads ()
  "Update the autoloads for the files or directories on the command line.
Runs `update-file-autoloads' on files and `update-directory-autoloads'
on directories.  Must be used only with -batch, and kills Emacs on completion.
Each file will be processed even if an error occurred previously.
For example, invoke `xemacs -batch -f batch-update-autoloads *.el'.
The directory to which the auto-autoloads.el file must be the first parameter
on the command line."
  (unless noninteractive
    (error "batch-update-autoloads is to be used only with -batch"))
  (let ((defdir (directory-file-name default-directory))
	(enable-local-eval nil))	; Don't query in batch mode.
    ;; (message "Updating autoloads in %s..." generated-autoload-file)
    (dolist (arg command-line-args-left)
      (setq arg (expand-file-name arg defdir))
      (cond
       ((file-directory-p arg)
	(message "Updating autoloads for directory %s..." arg)
	(update-autoloads-from-directory arg))
       ((file-exists-p arg)
	(update-file-autoloads arg))
       (t (error "No such file or directory: %s" arg))))
    (fixup-autoload-buffer (concat (if autoload-package-name
				       autoload-package-name
				     (file-name-nondirectory defdir))
				   "-autoloads"))
    (save-some-buffers t)
    ;; (message "Done")
    (kill-emacs 0)))

(defun fixup-autoload-buffer (sym)
  (save-excursion
    (set-buffer (find-file-noselect generated-autoload-file))
    (goto-char (point-min))
    (if (and (not (= (point-min) (point-max)))
	     (not (looking-at ";;; DO NOT MODIFY THIS FILE")))
	(progn
	  (insert ";;; DO NOT MODIFY THIS FILE\n")
	  (insert "(if (featurep '" sym ")")
	  (insert " (error \"Already loaded\"))\n")
	  (goto-char (point-max))
	  (insert "\n(provide '" sym ")\n")))))

(defvar autoload-package-name nil)

;; #### this function is almost identical to, but subtly different from,
;; batch-update-autoloads.  Both of these functions, unfortunately, are
;; used in various build scripts in xemacs-packages.  They should be
;; merged. (However, it looks like no scripts pass more than one arg,
;; making merging easy.) --ben

;;;###autoload
(defun batch-update-directory ()
  "Update the autoloads for the directories on the command line.
Runs `update-file-autoloads' on each file in the given directory, and must
be used only with -batch."
  (unless noninteractive
    (error "batch-update-directory is to be used only with -batch"))
  (let ((defdir default-directory)
	(enable-local-eval nil))	; Don't query in batch mode.
    (dolist (arg command-line-args-left)
      (setq arg (expand-file-name arg defdir))
      (let ((generated-autoload-file (expand-file-name autoload-file-name
							arg)))
	(cond
	 ((file-directory-p arg)
	  (message "Updating autoloads in directory %s..." arg)
	  (update-autoloads-from-directory arg))
	 (t (error "No such file or directory: %s" arg)))
	(fixup-autoload-buffer (concat (if autoload-package-name
					   autoload-package-name
					 (file-name-nondirectory arg))
				"-autoloads"))
	(save-some-buffers t))
      ;; (message "Done")
      ;; (kill-emacs 0)
      )
    (setq command-line-args-left nil)))

;; #### i created the following.  this one and the last should be merged into
;; batch-update-autoloads and batch-update-one-directory. --ben

;;;###autoload
(defun batch-update-one-directory ()
  "Update the autoloads for a single directory on the command line.
Runs `update-file-autoloads' on each file in the given directory, and must
be used only with -batch."
  (unless noninteractive
    (error "batch-update-directory is to be used only with -batch"))
  (let ((defdir default-directory)
	(enable-local-eval nil))	; Don't query in batch mode.
    (let ((arg (car command-line-args-left)))
      (setq command-line-args-left (cdr command-line-args-left))
      (setq arg (expand-file-name arg defdir))
      (let ((generated-autoload-file (expand-file-name autoload-file-name
							arg)))
	(cond
	 ((file-directory-p arg)
	  (message "Updating autoloads in directory %s..." arg)
	  (update-autoloads-from-directory arg))
	 (t (error "No such file or directory: %s" arg)))
	(fixup-autoload-buffer (concat (if autoload-package-name
					   autoload-package-name
					 (file-name-nondirectory arg))
				"-autoloads"))
	(save-some-buffers t))
      ;; (message "Done")
      )))

(provide 'autoload)

;;; autoload.el ends here
