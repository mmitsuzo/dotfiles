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

