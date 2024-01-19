(use-package tide
  :ensure t
  :init
  (set-variable 'indent-tabs-mode nil)
  ;; (setq tide-format-options
        ;; ;; details:
        ;; ;; https://github.com/Microsoft/TypeScript/blob/v3.3.1/src/server/protocol.ts#L2858-L2890
        ;; '(
        ;;   :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
        ;;   :placeOpenBraceOnNewLineForFunctions nil
        ;;   :indentSize 2
        ;;   :tabSize 2))
  )

(use-package typescript-mode
  :ensure t
  :config
  (setq typescript-indent-level 2)
  ;; (defun my-custom-settings-fn ()
  ;;   (setq indent-tabs-mode nil)
  ;;   (setq tab-stop-list (number-sequence 2 200 2))
  ;;   (setq tab-width 2)
  ;;   (setq indent-line-function 'indent-relative))
  ;; (add-hook 'typescript-mode-hook 'my-custom-settings-fn)

  )

(use-package company :ensure t)
(use-package flycheck :ensure t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
