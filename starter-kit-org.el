
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-log-done t)

;; short key
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; babel
(org-babel-do-load-languages
 'org-babel-load-languages 
 '((ditaa . t)
   (plantuml .t)
   (dot . t)
   (python . t)))

;; drawing
(setq org-ditaa-jar-path (expand-file-name "~/.emacs.d/src/ditaa0_9.jar"))
(setq org-plantuml-jar-path (expand-file-name "~/.emacs.d/src/plantuml.jar"))
(add-to-list 'org-src-lang-modes (quote ("dot" . graphviz-dot)))

;; inline image
(add-hook 'org-babel-after-execute-hook 'bh/display-inline-images 'append)
                                        ; Make babel results blocks lowercase
(setq org-babel-results-keyword "results")
(defun bh/display-inline-images ()
  (condition-case nil
      (org-display-inline-images)
    (error nil)))


;; publish blog
(setq org-publish-project-alist
      '(("org-notes"
         :base-directory "~/blog/org/"
         :base-extension "org"
         :publishing-directory "~/blog/_posts/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         :body-only t ;; Only export section between <body> </body>
         :section-numbers nil    
         )
        ("org-static"
         :base-directory "~/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/blog/_posts/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))))
