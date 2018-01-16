(require-or-install 'whitespace-cleanup-mode)

(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)

;; automatically clean up bad whitespace
;; (setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
