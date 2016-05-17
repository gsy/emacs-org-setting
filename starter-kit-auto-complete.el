
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(setq ac-auto-start 2)

(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(add-to-list 'ac-user-dictionary "gtcxg@hotmail.com")

(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs
   '("~/.emacs.d/snippets"                 ;; personal snippets
     ))
