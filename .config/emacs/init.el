;;; init.el  --- sphaghetti emacs config
;;; Configuring emacs from scratch is like using super glue to attach parts
;; that don't actually want to work together peacefully. But there is fun to
;; be had in that.
;;; And if it works in the end, somehow, who am I to cry.
;;; @ Lokesh Dhakal 2020

;;;; Custom emacs config

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(doom-dark+))
 '(custom-safe-themes
   '("f2927d7d87e8207fa9a0a003c0f222d45c948845de162c885bf6ad2a255babfd" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "76bfa9318742342233d8b0b42e824130b3a50dcc732866ff8e47366aed69de11" default))
 '(inhibit-startup-screen t)
 '(package-archives
   '(("melpa" . "https://melpa.org/packages/")
     ("MELPA Stable" . "http://stable.melpa.org/packages/")
     ("gnu" . "https://elpa.gnu.org/packages/")))
 '(package-selected-packages
   '(latex-math-preview lsp-latex fortune-cookie lsp-pyright lsp-mode lsp-java lsp-org ivy-fuz magit all-the-icons-ivy-rich doom-modeline company-lsp eglot dashboard org-edit-latex org-mode doom-themes python-mode counsel ivy-posframe)))

;; User
(setq user-full-name "Lokesh Dhakal"
      user-mail-address "aviranzerioniac@gmail.com")

;; Disable All Fluff
(unless (eq window-system 'ns)
    (menu-bar-mode -1))
  (when (fboundp 'tool-bar-mode)
    (tool-bar-mode -1))
  (when (fboundp 'scroll-bar-mode)
    (scroll-bar-mode -1))
  (when (fboundp 'horizontal-scroll-bar-mode)
    (horizontal-scroll-bar-mode -1))
(blink-cursor-mode -1)

(show-paren-mode 1)

;; yes or no -> y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Line Wrapping
(add-hook 'org-mode-hook
	    '(lambda ()
	       (visual-line-mode 1)))

;; Line numbers
(global-display-line-numbers-mode)

;; Garbage Collector
(setq gc-cons-threshold (* 300 1024 1024))


;; ;; ;; Loading Modules ;; ;; ;;

;; LSP for emacs & its servers

 (require 'lsp-mode)
(lsp-mode 1)
;; (add-hook 'prog-mode-hook #'lsp) ;; general hook for langs lsp
(lsp-treemacs-sync-mode 1)

(require 'dap-mode)
(dap-mode 1)

;; eglot C++/C
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)

;; Java
(require 'lsp-java)
(add-hook 'java-mode-hook #'lsp)
(add-hook 'java-mode-hook 'flycheck-mode)

;; Python
(require 'lsp-pyright)
;;(setq lsp-python-ms-auto-install-server t)
(add-hook 'python-mode-hook #'lsp) ; or lsp-deferred

;; Haskell
(require 'lsp-haskell)
;; Hooks so haskell and literate haskell major modes trigger LSP setup
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-literate-mode-hook #'lsp)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
 
(require 'flycheck)
(global-flycheck-mode)

(require 'ivy)
(ivy-mode 1)

(require 'counsel)
(counsel-mode 1)

(require 'ivy-rich)
(ivy-rich-mode 1)

(require 'ivy-fuz)
(setq ivy-sort-matches-functions-alist '((t . ivy-fuz-sort-fn)))
(setq ivy-re-builders-alist '((t . ivy-fuz-regex-fuzzy)))
(with-eval-after-load 'ivy
  (require 'ivy-fuz)
  (add-to-list 'ivy-highlight-functions-alist '(ivy-fuz-regex-fuzzy . ivy-fuz-highlight-fn)))

(require 'ivy-posframe)
;; display at `ivy-posframe-style'
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
 (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
(ivy-posframe-mode 1)

(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; projectile with ability to call make

(require 'projectile)
(global-set-key (kbd "<f5>") 'projectile-compile-project)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
;;(setq projectile-project-search-path '("~/Development/orgs:md" "~/Development/github/java-testing-example" "~/Development/github/awesome-piracy" "~/Development/github/linuxKernel"))

;;; Dashboard

(require 'dashboard)
(dashboard-setup-startup-hook)
;; Dashboard in frames with emacsclient -c
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
;; Dashboard title
(setq dashboard-banner-logo-title "")
;; Set the banner
(setq dashboard-startup-banner '(shell-command-to-string "splashcii"))
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever image/text you would prefer
;; Content is not centered by default. To center, set
(setq dashboard-center-content t)
;; To disable shortcut "jump" indicators for each section, set
(setq dashboard-show-shortcuts nil)
;; Dashboard Items
(setq dashboard-items '((recents  . 5)
                      ;; (bookmarks . 5)
                       (projects . 5)
                       (agenda . 5)))
                       ;; (registers . 5)))       
;; A random footer
(setq dashboard-set-footer t)

;; Packages loaded $ init time
(setq dashboard-set-init-info t)

;; flycheck
(require 'flycheck)
(flycheck-mode 1)

;; magit
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; DOOM modeline
(require 'doom-modeline)
(doom-modeline-mode 1)
(setq doom-modeline-icon (display-graphic-p))
(setq doom-modeline-major-mode-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-enable-word-count t)
(setq doom-modeline-continuous-word-count-modes '(markdown-mode org-mode latex-mode text-mode))
(setq doom-modeline-buffer-encoding nil)


(require 'latex-math-preview)

;;; org-mode ;;;

;; global keybindings
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

;; ;; ;; TODO ;; ;; ;;

;; Others
(setq org-support-shift-select t)
;; (setq org-)


;; utf-8 hide from the modeline

(defun doom-modeline-conditional-buffer-encoding ()
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

;;; Keybindings ;;;
(global-set-key (kbd "C-x e") 'eww)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
