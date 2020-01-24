; emacs init
;(require 'eldav)
(setq c-basic-offset 8)

(add-to-list 'load-path "~/.elisp")
(require 'writegood-mode)

(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-variable-name-face ((((type tty) (class color)) (:foreground "black" :weight normal)))))

(require 'xcscope)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require 'tss)

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)

;
; C stuff
;
(setq-default comment-column 79)
(setq-default fill-column 79)

(setq tex-dvi-view-command "xdvi")
(setq tex-dvi-print-commnad "dvips")


;(define-key global-map "s-q" 'fill-paragraph)

(define-key global-map "\M-y" 'kill-ring-save)
(define-key global-map "\M-$" 'ispell-word)
(define-key global-map "\M-g" 'goto-line)
(define-key global-map "\M-f" 'what-line)
(define-key global-map "\C-w" 'copy-region-as-kill)
(define-key global-map "\M-w" 'kill-region)
(define-key global-map "\M-s" 'search-forward-regexp)
(define-key global-map "\M-z" 'repeat-complex-command)
(define-key global-map "\M-n" 'forward-word)

(global-set-key "\M-i" 'indent-region)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-DEL" 'delete-region)


(line-number-mode 1)
(column-number-mode 1)

(global-set-key "[D" (quote backward-char))
(global-set-key "[C" (quote forward-char))
(global-set-key "[A" (quote previous-line))
(global-set-key "[b" (quote next-line))
(global-set-key "\M-s" (quote save-buffer))

(tool-bar-mode nil)
(menu-bar-mode nil)
;(load "desktop")
;(desktop-load-default)
;(desktop-read)
;(define-key c-mode-map "\^M" 'newline-and-indent)

(global-font-lock-mode t)


;(setq font-lock-support-mode 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)
(add-hook 'c-mode-hook '(c-toggle-auto-hungry-state -1))

(add-hook 'latex-mode-hook 'writegood-mode)
(add-hook 'TeX-mode-hook 'writegood-mode)

(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'TeX-mode-hook 'flyspell-mode)

(add-hook 'latex-mode-hook 'flyspell-buffer)
(add-hook 'TeX-mode-hook 'flyspell-buffer)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (## markdown-mode tss))))

(tool-bar-mode -1)
(setq c-basic-offset 8
	      tab-width 8
	      indent-tabs-mode t)
(setq c-default-style "linux")

(line-number-mode 1)
(column-number-mode 1)
(setq standard-indent 8)

(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/src/linux-trees")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                (c-set-style "linux-tabs-only")))))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
