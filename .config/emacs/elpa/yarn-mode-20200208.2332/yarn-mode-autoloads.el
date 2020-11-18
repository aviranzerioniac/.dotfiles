;;; yarn-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "yarn-mode" "yarn-mode.el" (0 0 0 0))
;;; Generated autoloads from yarn-mode.el

(autoload 'yarn-mode "yarn-mode" "\
Simple mode to highlight yarn.lock files.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("yarn\\.lock\\'" . yarn-mode))

(register-definition-prefixes "yarn-mode" '("yarn-mode-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; yarn-mode-autoloads.el ends here
