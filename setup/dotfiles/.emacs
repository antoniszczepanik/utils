;; Include melpa package repository.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq inhibit-startup-screen t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(show-paren-mode 1)
(set-default-font "Ubuntu Mono-18")
(blink-cursor-mode 0)
(ido-mode 1)
(add-hook 'text-mode-hook #'auto-fill-mode)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gruber-darker)))
 '(custom-safe-themes
   (quote
    ("3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default)))
 '(package-selected-packages (quote (markdown-mode ## evil go-mode gruber-darker-theme)))
 '(send-mail-function (quote mailclient-send-it)))
