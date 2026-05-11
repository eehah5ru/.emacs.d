
(use-package ansible-vault
             :ensure t)
;; (use-package ansible-vault
;;   :ensure t
;;   :init
;;   ;; Auto-activate on encrypted vault files
;;   (add-to-list 'magic-mode-alist
;;                (cons #'ansible-vault--is-encrypted-vault-file
;;                      #'ansible-vault-mode))
;;   ;; (add-hook 'hack-local-variables-hook
;;   ;;           (lambda ()
;;   ;;             (when (ansible-vault--is-encrypted-vault-file)
;;   ;;               (ansible-vault-mode 1))))             
;;   :config
;;   ;; Optional: map vault IDs to password files
;;   ;; (setq ansible-vault-vault-id-alist
;;   ;;       '(("dev"  . "~/.vault_pass_dev.txt")
;;   ;;         ("prod" . "~/.vault_pass_prod.txt")))
;;              )

;; ;; Security: no backups or autosaves leaking secrets
;; (add-hook 'ansible-vault-mode-hook
;;           (lambda ()
;;             (setq-local make-backup-files nil)
;;             (setq-local auto-save-default nil)))
