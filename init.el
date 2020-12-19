;; no splash screen on startup
(setq inhibit-splash-screen t)

;; line numbers and such
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))
(setq line-number-mode t)
(setq column-number-mode t)

;; highlight any characters over 80 character limit per line
(require 'whitespace)
(setq whitespace-line-column 80) ;; set line limit
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)

;; org-mode uses auto-fill-mode
(setq-default fill-column 80) ;; 80 not 70 chars per line
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; set EOL characters to *nix so we have LF even when working on Windows
(setq default-buffer-file-coding-system 'utf-8-unix)

;; auto-revert buffers on file update (such as with git)
;;(global-auto-revert-mode 1)
(global-set-key [f5] 'revert-buffer)

;; Rust stuff
(require 'rust-mode)
(add-hook 'rust-mode-hook ;; when in Rust, no using tabs, sadly...
          (lambda () (setq indent-tabs-mode nil)))

;; custom variables set by other items... probably shouldn't touch this
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(package-selected-packages (quote (rust-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)
