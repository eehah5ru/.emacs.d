(use-package string-inflection
  :ensure t)

(use-package undo-tree
  :ensure t)

;(require-or-install 'string-inflection)

(global-set-key (kbd "C-c C-u") 'string_inflection_all_cycle)

(global-undo-tree-mode)
