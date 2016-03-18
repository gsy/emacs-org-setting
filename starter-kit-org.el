
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))

;; short key
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done t)
(setq org-ditaa-jar-path (expand-file-name "~/.emacs.d/src/ditaa0_9.jar"))
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/src/plantuml.jar"))


;; babel
(org-babel-do-load-languages
 'org-babel-load-languages 
 '((ditaa . t)
   (plantuml .t)
   (dot . t)
   (python . t)))

;; inline image
(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")

(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))
