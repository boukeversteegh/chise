;;; DO NOT MODIFY THIS FILE
(if (featurep 'utf-2000-autoloads) (error "Already loaded"))

;;;### (autoloads (what-char-definition) "char-db-util" "utf-2000/char-db-util.el")

(autoload 'what-char-definition "char-db-util" nil t nil)

;;;***

;;;### (autoloads (chise-string< define-char-after define-char-before map-char-family char-id char-ucs char-attribute-name< expand-char-feature-name) "chise-subr" "utf-2000/chise-subr.el")

(autoload 'expand-char-feature-name "chise-subr" nil nil nil)

(autoload 'char-attribute-name< "chise-subr" "\
Return t if symbol KA is less than KB in feature-name sorting order." nil nil)

(autoload 'char-ucs "chise-subr" "\
Return code-point of UCS." nil nil)

(autoload 'char-id "chise-subr" nil nil nil)

(autoload 'map-char-family "chise-subr" nil nil nil)

(autoload 'define-char-before "chise-subr" "\
Define CHAR-SPEC and insert it before NEXT-CHAR." nil nil)

(autoload 'define-char-after "chise-subr" "\
Define CHAR-SPEC and insert it after PREV-CHAR." nil nil)

(autoload 'chise-string< "chise-subr" nil nil nil)

;;;***

;;;### (autoloads (char-total-strokes char-total-strokes-from-domains char-ideographic-strokes char-ideographic-strokes-from-domains char-ideographic-radical ideographic-radical) "ideograph-subr" "utf-2000/ideograph-subr.el")

(autoload 'ideographic-radical "ideograph-subr" "\
Return character corresponding with Kangxi-radical number." nil nil)

(autoload 'char-ideographic-radical "ideograph-subr" nil nil nil)

(autoload 'char-ideographic-strokes-from-domains "ideograph-subr" nil nil nil)

(autoload 'char-ideographic-strokes "ideograph-subr" nil nil nil)

(autoload 'char-total-strokes-from-domains "ideograph-subr" nil nil nil)

(autoload 'char-total-strokes "ideograph-subr" nil nil nil)

;;;***

;;;### (autoloads (ideographic-structure-find-char ideograph-char< char-daikanwa char-representative-of-daikanwa update-ideograph-radical-table) "ideograph-util" "utf-2000/ideograph-util.el")

(autoload 'update-ideograph-radical-table "ideograph-util" nil t nil)

(autoload 'char-representative-of-daikanwa "ideograph-util" nil nil nil)

(autoload 'char-daikanwa "ideograph-util" nil nil nil)

(autoload 'ideograph-char< "ideograph-util" nil nil nil)

(autoload 'ideographic-structure-find-char "ideograph-util" nil nil nil)

;;;***

;;;### (autoloads (jp-jouyou-read-file ucs-compat-read-file mapping-table-read-file) "read-maps" "utf-2000/read-maps.el")

(autoload 'mapping-table-read-file "read-maps" "\
Read mapping table." t nil)

(autoload 'ucs-compat-read-file "read-maps" nil t nil)

(autoload 'jp-jouyou-read-file "read-maps" nil t nil)

;;;***

(provide 'utf-2000-autoloads)
