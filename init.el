; no splash screen on startup
(setq inhibit-splash-screen t)

; define variables
(defvar max-line-width 120)
(defvar tab-indent-default 4)
(defvar tab-indent-c tab-indent-default)

; uncomment this if you ever have to use spaces over tabs
;(setq indent-tabs-mode nil)

; set default window size
(if (display-graphic-p)
	(progn
	  (setq initial-frame-alist
			'(
			  (width . 132) ; width in characters
			  (height . 40) ; height in lines
			  ))))

; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

; install packages if they're not installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

; line numbers and such
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode)) ; show line numbers on left hand side
(setq line-number-mode t) ; show line numbers
(setq column-number-mode t) ; show column numbers

; highlight any characters over character limit per line
(require 'whitespace)
(setq whitespace-line-column max-line-width) ;; set line limit
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)

; set default tab size
(setq-default tab-width tab-indent-default)
(setq-default c-basic-offset tab-indent-c)

;; button mapping
; esc = get out of anything
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key [f5] 'revert-buffer) ; use this to press key to revert on external changes (i.e. git)
;(global-auto-revert-mode 1) ; use this to auto-revert on external changes (i.e. git)
(global-set-key [(control c) (a)] 'company-complete) ; initiate manual completion via company

; org-mode uses auto-fill-mode
(setq-default fill-column max-line-width) ; not 70 chars per line
(add-hook 'org-mode-hook 'turn-on-auto-fill)

; set EOL characters to *nix so we have LF even when working on Windows
(setq default-buffer-file-coding-system 'utf-8-unix)

; always enable company mode
(add-hook 'after-init-hook 'global-company-mode)

; Rust stuff
(require 'rust-mode) ; require rust-mode
(add-hook 'rust-mode-hook ; when in Rust, no using tabs, sadly...
          (lambda () (setq indent-tabs-mode nil)))

; custom variables set by other items... probably shouldn't touch this
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes '(spacemacs-dark))
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages
   '(spacemacs-theme company-c-headers company magit go-mode use-package rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

