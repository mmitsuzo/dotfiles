(require 'package)

;; HTTP
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)
(package-initialize)


;; ubuntu package 'fonts-takao' needs to be installed
;; (150% scaling display assumed)
(add-to-list 'default-frame-alist
             '(font . "TakaoGothic-16"))
;(set-fontset-font t 'japanese-jisx0208 "TakaoGothic")
(set-fontset-font t 'japanese-jisx0208 "TakaoGothic-16")
(prefer-coding-system 'utf-8)
(set-language-environment "UTF-8")
;(set-language-environment "Japanese")
(setq default-input-method "japanese-skk")
(setq explicit-shell-file-name "/bin/bash")
(keyboard-translate ?\C-h ?\C-?)
(setq visible-bell t)

;;;
;;; https://emacs-lsp.github.io/lsp-mode/tutorials/CPP-guide/
;;;
;(require 'package)
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(package-initialize)

(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp
    projectile hydra flycheck company avy which-key helm-xref dap-mode))

(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))

;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))

