
;; set language as Japanese
(set-language-environment 'Japanese)
;; coding UTF8
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)

;; パッケージ管理
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
         '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(setq package-user-dir "~/.emacs.d/elisp/package")
(package-initialize)

; ----
; preferences
; ----
; 括弧を自動で補完する
(electric-pair-mode 1)
;; tabにスペース４つを利用
(setq-default tab-width 4 indent-tabs-mode nil)
;; デフォルトの起動時のメッセージを表示しない
(setq inhibit-startup-message t)
;; 列の番号
(column-number-mode t)
;; 行番号の表示
(global-linum-mode t)
;; 1行ごとの改ページ
(setq scroll-conservatively 1)
;; 対応する括弧を光らせる
(show-paren-mode 1)
;; メニューバーの非表示
(menu-bar-mode -1)
;; ツールバーの非表示
(tool-bar-mode -1)


;; 全角スペースなどを可視化
(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil)
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil)
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-u-1 'my-face-u-1)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(
     ("¡¡" 0 my-face-b-1 append)
     ("[ ]+$" 0 my-face-u-1 append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks
          '(lambda ()
             (if font-lock-mode nil
               (font-lock-mode t))) t)

;; クリップボード共有
(setq x-select-enable-clipboard t)

;;BEEP disable
(setq ring-bell-function 'ignore)
;; delete old back up files automatically
(setq delete-old-versions t)

;;
;; backup の保存先
;;
(setq backup-directory-alist
  (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
        backup-directory-alist))


(setq auto-save-file-name-transforms
  `((".*", (expand-file-name "~/.emacs.d/backup/") t)))
