
(setq user-full-name "Guang")
(setq user-mail-address "gtcxg@hotmail.com")

(setq inhibit-splash-screen t
  initial-scratch-message nil
  initial-major-mode 'org-mode)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(linum-mode 1)

(setenv "PATH"
        (concat "/usr/local/bin/:"
                (getenv "PATH")))
(setq exec-path (append exec-path '("/usr/local/bin/")))

(setq backup-directory-alist '(("." . "~/.emacs-backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
