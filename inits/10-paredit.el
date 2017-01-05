(require-or-install 'paredit)


;; (define-key )
;; (global-unset-key (kbd "M-<up>"))
;; (global-unset-key (kbd "M-<down>"))

(defun my-paredit-mode-config ()
  "modify keymaps in paredit mode"
  ;; remove bindings
  ;; (local-unset-key (kbd "M-<up>"))
  ;; (local-unset-key (kbd "M-<down>"))
  ;; ;; add new ones
  ;; (local-set-key (kbd "M-<up>") 'windmove-up)
  ;; (local-set-key (kbd "M-<down>") 'windmove-down)
  (local-set-key (kbd "C-k") 'paredit-kill))

(add-hook 'paredit-mode-hook 'my-paredit-mode-config)
