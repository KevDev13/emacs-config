;; no splash screen on startup
(setq inhibit-splash-screen t)

;; line numbers and such
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))
;;(setq display-fill-column-indicator-column 80)
(setq line-number-mode t)
(setq column-number-mode t)

;; going over 80 columns == not good
(require 'whitespace)
(setq whitespace-line-column 80) ;; line limit
;;(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)

;; auto-revert buffers on file update (such as with git)
;;(global-auto-revert-mode 1)
(global-set-key [f5] 'revert-buffer)

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

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)
;;(package-refresh-contents)
