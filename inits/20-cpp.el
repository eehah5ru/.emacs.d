;;;
;;; configuration from here
;;;

(use-package
 lsp-mode
 :ensure t
 :hook
 ((c-mode . lsp)
  (c++-mode . lsp)
  (c-mode . which-key-mode)
  (c++-mode . which-key-mode)
  )
 :config
 (progn
   (defun c++-lsp-config ()
     (setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

     (with-eval-after-load 'lsp-mode
       (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
       (require 'dap-cpptools)
       (yas-global-mode)))

   (add-hook 'c-mode-hook #'c++-lsp-config)
   (add-hook 'c++-mode-hook #'c++-lsp-config)
     )
 )

(use-package yasnippet
             :ensure t)

(use-package lsp-treemacs
             :ensure t)

(use-package helm-lsp
             :ensure t)

(use-package projectile
             :ensure t)

(use-package hydra
             :ensure t)

(use-package flycheck
             :ensure t)

(use-package company
             :ensure t
             :init
             (progn
               (setq lsp-completion-provider :capf)))

(use-package avy
             :ensure t)

(use-package which-key
             :ensure t)

(use-package
 helm-xref
 :ensure t
 :init
 (progn
   (require 'helm-xref)
   (define-key global-map [remap find-file] #'helm-find-files)
   (define-key global-map [remap execute-extended-command] #'helm-M-x)
   (define-key global-map [remap switch-to-buffer] #'helm-mini))
 )

(use-package dap-mode
             :ensure t)



;;;
;;; old config below
;;;

;; (use-package helm-gtags
;;   :ensure t
;;   :hook ((c-mode . helm-gtags-mode)
;;          (c++-mode . helm-gtags-mode)
;;          (asm-mode . helm-gtags-mode))

;;   :bind (("M-t" . helm-gtags-find-tag)
;;          ("M-r" . helm-gtags-find-rtag)
;;          ("M-s" . helm-gtags-find-symbol)
;;          ("M-g M-p" . helm-gtags-parse-file)
;;          ("C-c <" . helm-gtags-previous-history)
;;          ("C-c >" . helm-gtags-next-history)
;;          ("M-," . helm-gtags-pop-stack)))
