;; Include melpa package repository.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Get use-package functionality
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

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
(setq-default tab-width 4)

;; y/n except yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(global-set-key (kbd "C-c C-c") 'recompile)

;; Allow scrolling with C-u, like in vim.
(setq evil-want-C-u-scroll t)
(setq evil-want-minibuffer t)
(require 'evil)
(evil-mode 1)

;; Make _ a part of words, like in vim.
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    (setq-default evil-symbol-word-search t))

(require 'evil-mc)
(global-evil-mc-mode 1) 
;; Visual mode creates multiple cursors.
(evil-define-key 'visual evil-mc-key-map
  "A" #'evil-mc-make-cursor-in-visual-selection-end
  "I" #'evil-mc-make-cursor-in-visual-selection-beg)

;; Use firefox except DocView to open pdfs.
(require 'openwith)
(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "firefox" (file))))

;; Replace gofmt with goimports.
(setq gofmt-command "goimports")
(add-hook 'before-save-hook 'gofmt-before-save)

;; Use 4 spaces for a tab in Python.
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
		(setq python-indent-guess-indent-offset nil)
        (setq tab-width 4)
        (setq python-indent-offset 4)))

;; Scala mode does not use global tab width
(setq scala-indent:step 4) 
;; (add-hook 'scala-mode-hook
;;       (lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

;; lsp-mode configuration
(setq lsp-headerline-breadcrumb-enable nil)
(setq lsp-modeline-code-actions-enable nil)
(setq lsp-eldoc-enable-hover nil)
(setq lsp-enable-symbol-highlighting nil)

;; company-mode completion configuration
(global-set-key "\t" 'company-complete-common)
(setq company-idle-delay nil)

;; lsp-metals for Scala
(use-package lsp-metals
  :ensure t
  :custom
  ;; Metals claims to support range formatting by default but it supports range
  ;; formatting of multiline strings only. You might want to disable it so that
  ;; emacs can use indentation provided by scala-mode.
  (lsp-metals-server-args '("-J-Dmetals.allow-multiline-string-formatting=off"))
  :hook (scala-mode . lsp))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (gruber-darker)))
 '(custom-safe-themes
   (quote
	("3d2e532b010eeb2f5e09c79f0b3a277bfc268ca91a59cdda7ffd056b868a03bc" default)))
 '(package-selected-packages
   (quote
	(sml-mode company use-package lsp-ui flycheck lsp-metals lsp-mode scala-mode evil-collection magit htmlize terraform-mode evil-mc markdown-mode ## evil go-mode gruber-darker-theme)))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
