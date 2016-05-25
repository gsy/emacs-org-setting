;; backup file setup
(setq backup-directory-alist '(("." . "~/.emacs-backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; yes-or-no quertion
(defalias 'yes-or-no-p 'y-or-n-p)




(provide 'init-basic-setup)
