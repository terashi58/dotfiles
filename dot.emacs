;; packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; go-mode
(add-hook 'go-mode-hook
  '(lambda ()
     (setq tab-width 2)))
;; (add-hook 'go-mode-hook 'go-eldoc-setup)
(add-hook 'before-save-hook 'gofmt-before-save)
;; (add-to-list 'company-backends 'company-go)

;; ruby-mode
(setq ruby-insert-encoding-magic-comment nil)

;; web-mode
(add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))
(setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")))
(add-hook 'web-mode-hook
          '(lambda ()
             (setq web-mode-attr-indent-offset nil)
             (setq web-mode-markup-indent-offset 2)
             (setq web-mode-css-indent-offset 2)
             (setq web-mode-code-indent-offset 2)
             (setq web-mode-sql-indent-offset 2)
             (setq indent-tabs-mode nil)
             (setq tab-width 2)
             ))

;;
;;  kill-line-twice
;;
(defun kill-line-twice (&optional numlines)
  "Acts like normal kill except kills entire line if at beginning"
  (interactive "*p")
  (cond ((eobp) (signal 'end-of-buffer nil))
        ((or (bolp)
             (> numlines 1))
         (kill-line numlines))
        (t (kill-line))))
(global-set-key "\C-k" 'kill-line-twice)

;;; misc setting
(global-set-key "\C-xg" 'beginning-of-buffer)
(global-set-key "\C-xG" 'end-of-buffer)
(define-key global-map "\C-h" 'delete-backward-char)  ; Ctrl-H で BS にする
(show-paren-mode)  ; 対応する括弧を教える
(setq make-backup-files nil)  ; backup files は要らない。
(menu-bar-mode 0)  ; メニューバーいらない

