
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
         :section-numbers 3
         :table-of-contents nil
         )
        ("org-static"
         :base-directory "~/blog/org/"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/blog/assets/img/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("org" :components ("org-notes" "org-static"))))

(setq org-src-preserve-indentation nil)
(setq org-src-fontify-natively t)

(defvar jekyll-directory "~/blog/" "Jekyll根目录")
(defvar jekyll-posts-dir "org/" "Jekyll发布目录")
(defvar jekyll-post-ext ".org" "发布文件后缀")

(defun jekyll-publish-post ()
  "将当前编辑的org文件复制到jekyll的发布文件夹，并且修改文件名为yyyy-mm-dd-title.org的格式"
  (interactive)
  (cond
   ((buffer-modified-p)
    (message "Can't publish post; buffer has modifications."))
   (t
    (let ((filename
           (concat jekyll-directory jekyll-posts-dir
                   (format-time-string "%Y-%m-%d-")
                   (file-name-nondirectory
                    (buffer-file-name (current-buffer)))))
          (old-point (point)))
      (rename-file (buffer-file-name (current-buffer))
                   filename)
      (kill-buffer nil)
      (find-file filename)
      (set-window-point (selected-window) old-point)))))
