;; no splash screen on startup
(setq inhibit-splash-screen t)

;; line numbers and such
(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))
(setq display-fill-column-indicator-column 80)
(setq line-number-mode t)
(setq column-number-mode t)

;;(require 'fill-column-indicator)
;;(set-face-attribute 'fill-column-attribute nil :foreground "grey90")
(setq display-fill-column-indicator t)
(setq display-fill-column-indicator-character "#")

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

;;(require 'package)
;;(add-to-list 'package-archives
;;             '("melpa" . "https://melpa.org/packages/") t)
;;(package-initialize)
;;(package-refresh-contents)

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(global-set-key [f5] 'revert-buffer)
