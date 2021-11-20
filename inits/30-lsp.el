;; [2020-05-17 Sun] Disabling to prevent (lsp--auto-configure) from calling (lsp-ui-mode)
(use-package lsp-ui
  :disabled)

(use-package lsp-mode
  :demand t
  :config
  (defun md/lsp-setup ()
    (use-package which-key
        :ensure t)
    ;; recommended by LSP docs for performance
    (setq read-process-output-max (* 1024 1024)) ;; 1mb

    (lsp-enable-imenu)

    (setq
     lsp-auto-configure t
     lsp-enable-dap-auto-configure nil ; Don't try to auto-enable dap: this creates a lot of binding clashes
     lsp-auto-guess-root t ; Uses projectile to guess the project root.
     lsp-before-save-edits t
     lsp-eldoc-enable-hover t
     lsp-eldoc-render-all nil
     lsp-completion-enable t
     lsp-completion-show-detail t
     lsp-completion-show-kind t
     lsp-enable-file-watchers t
     lsp-enable-folding t
     lsp-enable-imenu t
     lsp-enable-indentation t
     lsp-enable-links t
     lsp-clients-python-library-directories `("/usr/" ,(expand-file-name "~/.virtualenvs")) ; This seems appropriate
     lsp-enable-on-type-formatting nil
     lsp-enable-snippet nil  ;; Not supported by company capf, which is the recommended company backend
     lsp-enable-symbol-highlighting nil
     lsp-enable-text-document-color nil
     lsp-enable-xref t
     lsp-flycheck-live-reporting nil
     lsp-idle-delay 0.5
     lsp-imenu-show-container-name t
     lsp-imenu-sort-methods '(position kind name)
     lsp-pylsp-plugins-flake8-enabled t
     lsp-signature-auto-activate t
     lsp-signature-render-documentation t
     lsp-signature-doc-lines 10)

    (setq-default lsp-pylsp-configuration-sources ["flake8"])

    (lsp-register-custom-settings
     '(("pyls.plugins.pyls_mypy.enabled" t t)
       ("pyls.plugins.pyls_mypy.live_mode" nil t)
       ("pyls.plugins.pyls_black.enabled" t t)
       ("pyls.plugins.pyls_isort.enabled" t t)

       ;; Disable these as they're duplicated by flake8
       ("pyls.plugins.pycodestyle.enabled" nil t)
       ("pyls.plugins.mccabe.enabled" nil t)
       ("pyls.plugins.pyflakes.enabled" nil t))))

  :hook
  ;; NOTE: we don't have a python-mode hook - it gets handled by pyvenv-track-virtualenv
  (;;(js-mode . lsp)
   (web-mode . lsp)
   (lsp-mode . lsp-enable-which-key-integration)
   (lsp-before-initialize . md/lsp-setup))
  ;; :bind (:map evil-normal-state-map
  ;;             ("gh" . lsp-describe-thing-at-point)
  ;;             ("gr" . lsp-find-references)
  ;;             ("gD" . xref-find-apropos)
  ;;             ("gd" . lsp-find-definition)
  ;;             :map md/leader-map
  ;;             ("Ni" . imenu)
  ;;             ("Ff" . lsp-format-buffer)
  ;;             ("FR" . lsp-rename))
  )
