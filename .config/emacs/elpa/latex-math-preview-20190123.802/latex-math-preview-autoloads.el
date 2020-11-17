;;; latex-math-preview-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "latex-math-preview" "latex-math-preview.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from latex-math-preview.el

(let ((loads (get 'latex-math-preview 'custom-loads))) (if (member '"latex-math-preview" loads) nil (put 'latex-math-preview 'custom-loads (cons '"latex-math-preview" loads))))

(defvar cl-struct-latex-math-preview-symbol-tags)

(cl-defsubst latex-math-preview-symbol-p (cl-x) (declare (side-effect-free error-free)) (and (memq (type-of cl-x) cl-struct-latex-math-preview-symbol-tags) t))

(eval-and-compile (put 'latex-math-preview-symbol 'cl-deftype-satisfies 'latex-math-preview-symbol-p))

(cl-defsubst latex-math-preview-symbol-source (cl-x) "\
Access slot \"source\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 1)))

(cl-defsubst latex-math-preview-symbol-display (cl-x) "\
Access slot \"display\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 2)))

(cl-defsubst latex-math-preview-symbol-func (cl-x) "\
Access slot \"func\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 3)))

(cl-defsubst latex-math-preview-symbol-args (cl-x) "\
Access slot \"args\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 4)))

(cl-defsubst latex-math-preview-symbol-image (cl-x) "\
Access slot \"image\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 5)))

(cl-defsubst latex-math-preview-symbol-math (cl-x) "\
Access slot \"math\" of `latex-math-preview-symbol' struct CL-X." (declare (side-effect-free t)) (progn (or (latex-math-preview-symbol-p cl-x) (signal 'wrong-type-argument (list 'latex-math-preview-symbol cl-x))) (aref cl-x 6)))

(autoload 'copy-latex-math-preview-symbol "latex-math-preview" nil nil nil)

(cl-defsubst make-latex-math-preview-symbol (&cl-defs (nil (cl-tag-slot) (source) (display) (func) (args) (image) (math)) &key source display func args image math) "\
Constructor for objects of type `latex-math-preview-symbol'." (declare (side-effect-free t)) (record 'latex-math-preview-symbol source display func args image math))

(autoload 'latex-math-preview-expression "latex-math-preview" "\
Preview a TeX maths expression at (or surrounding) point.
The `latex-math-preview-function' variable controls the viewing method.
The LaTeX notations which can be matched are $...$, $$...$$ or
the notations which are stored in `latex-math-preview-match-expression'." t nil)

(autoload 'latex-math-preview-save-image-file "latex-math-preview" "\


\(fn USE-CUSTOM-CONVERSION &optional OUTPUT)" t nil)

(autoload 'latex-math-preview-insert-mathematical-symbol "latex-math-preview" "\
Insert LaTeX mathematical symbols with displaying.

\(fn &optional NUM)" t nil)

(autoload 'latex-math-preview-insert-text-symbol "latex-math-preview" "\
Insert symbols for text part with displaying.

\(fn &optional NUM)" t nil)

(autoload 'latex-math-preview-insert-symbol "latex-math-preview" "\
Insert LaTeX mathematical symbols with displaying.

\(fn &optional NUM)" t nil)

(autoload 'latex-math-preview-last-symbol-again "latex-math-preview" "\
Insert last symbol which is inserted by `latex-math-preview-insert-symbol'" t nil)

(autoload 'latex-math-preview-beamer-frame "latex-math-preview" "\
Display beamer frame at current position." t nil)

(register-definition-prefixes "latex-math-preview" '("latex-math-preview-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; latex-math-preview-autoloads.el ends here
