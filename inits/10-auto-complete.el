;; (require-or-install 'auto-complete)
;; (global-auto-complete-mode t)

(setq ac-ignore-case nil)
(setq company-dabbrev-downcase nil)

(require-or-install 'company)
(add-hook 'after-init-hook 'global-company-mode)
;;(add-hook 'haskell-mode-hook 'company-mode)

(put 'downcase-region 'disabled nil)
