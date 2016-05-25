
(projectile-global-mode)

(require 'jedi)

(add-to-list 'ac-sources 'ac-sources-jedi-direct)

(add-hook 'python-mode-hook 'jedi:setup)

(setq jedi:complete-on-dot t)

(defun annotate-pdb ()
  (interactive)
  (highlight-lines-matching-regexp "import ipdb")
  (highlight-lines-matching-regexp "ipdb.set_trace()"))
(add-hook 'python-mode-hook 'annotate-pdb)
