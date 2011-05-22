;;; csv.el --- Parser and utility for CSV (Comma Separated Value).

;; Copyright (C) 2001 MORIOKA Tomohiko

;; Author: MORIOKA Tomohiko <tomo@kanji.zinbun.kyoto-u.ac.jp>
;; Keywords: CSV, table, database

;; This file is a part of Tomoyo-Tools.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;; Code:

(defun csv-parse-quoted-string (string)
  (let ((len (length string))
	(i 1))
    (when (and (>= len 2)
	       (eq (aref string 0) ?\"))
      (setq len (1- len))
      (while (and (< i len)
		  (not (eq (aref string i) ?\")))
	(setq i (1+ i)))
      (when (eq (aref string i) ?\")
	(cons (substring string 1 i)
	      (substring string (1+ i)))))))

(defun csv-parse-atom (string)
  (let ((len (length string))
	(i 0))
    (if (= len 0)
	'("")
      (when (not (eq (aref string 0) ?\"))
	(while (and (< i len)
		    (not (eq (aref string i) ?,))
		    (not (eq (aref string i) ?\")))
	  (setq i (1+ i)))
	(cons (substring string 0 i)
	      (substring string i))))))

(defun csv-parse-separator (string)
  (let ((len (length string)))
    (when (and (>= len 1)
	       (eq (aref string 0) ?,))
      (cons (substring string 0 1)
	    (substring string 1)))))

(defun csv-parse-string* (string)
  (let (ret dest)
    (while (and string
		(prog1
		    (setq ret (or (csv-parse-quoted-string string)
				  (csv-parse-atom string)))
		  (setq string (cdr ret)))
		(setq dest (cons (car ret) dest))
		(setq ret (csv-parse-separator string)))
      (setq string (cdr ret)))
    (cons (nreverse dest)
	  (if (> (length string) 0)
	      string))))

;;;###autoload
(defun csv-parse-string (string)
  (let (ret dest)
    (while (and string
		(prog1
		    (setq ret (or (csv-parse-quoted-string string)
				  (csv-parse-atom string)))
		  (setq string (cdr ret)))
		(setq dest (cons (car ret) dest))
		(setq ret (csv-parse-separator string)))
      (setq string (cdr ret)))
    (if (> (length string) 0)
	nil
      (nreverse dest))))


;;; @ End.
;;;

(provide 'csv)

;;; csv.el ends here
