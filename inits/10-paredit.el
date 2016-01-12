(require-or-install 'paredit)


;; (define-key )
;; (global-unset-key (kbd "M-<up>"))
;; (global-unset-key (kbd "M-<down>"))

(defun my-paredit-mode-config ()
  "modify keymaps in paredit mode"
  (local-set-key (kbd "M-<up>") 'windmove-up)
  (local-set-key (kbd "M-<down>") 'windmove-down))

(add-hook 'paredit-mode-hook 'my-paredit-mode-config)
