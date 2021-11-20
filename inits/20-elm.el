(use-package flycheck
             :ensure t)

(use-pcakage flycheck-elm
             :ensure t)

(use-package company
             :ensure t)

(use-package elm-mode
             :ensure t)

;(require-or-install 'flycheck)
;(require-or-install 'flycheck-elm)
;(require-or-install 'company)
;(require-or-install 'elm-mode)
;; (require-or-install 'elm-oracle)

(with-eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-elm-setup))

(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-elm))

(add-hook 'elm-mode-hook
          (lambda ()
            (nvm-use-for-buffer)
            (elm-oracle-setup-completion)))

;; (add-hook 'elm-mode-hook
;;           (lambda ()
;;             (setq company-backends '(company-elm))))
