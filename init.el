(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
(package-initialize)
(package-refresh-contents)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq truncate-lines t)
(setq truncate-partial-width-windows t)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; install use-package if it does not exist
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(setq use-package-always-ensure t)
(require 'use-package)
(use-package go-mode)
(use-package company)
(use-package company-go)
(use-package cargo)
(use-package rust-mode)
(use-package dockerfile-mode)
(use-package magit)
(use-package docker-compose-mode)
(use-package markdown-mode)

(global-company-mode)

(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)))
