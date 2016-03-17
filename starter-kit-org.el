
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))

;; 画图
(org-babel-do-load-languages
 'org-babel-load-languages 
 '((dot . t)
   (python . t)))
