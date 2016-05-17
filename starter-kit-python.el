
(projectile-global-mode)

(require 'jedi)

(add-to-list 'ac-sources 'ac-sources-jedi-direct)

(add-hook 'python-mode-hook 'jedi:setup)

(setq jedi:complete-on-dot t)
