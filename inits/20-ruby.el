(use-package ruby-mode
  :ensure t
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'ruby-mode 'superword-mode)

  :bind
  (([(meta down)] . ruby-forward-sexp)
   ([(meta up)]   . ruby-backward-sexp)
   (("C-c C-e"    . ruby-send-region))))  ;; Rebind since Rubocop uses C-c C-r

(use-package web-mode
  :ensure t
  :mode "\\.erb\\'")

(use-package rvm
  :ensure t

  :config
  (defun rvm-setup ()
    (rvm-autodetect-ruby)
    (rvm-activate-corresponding-ruby)
    (message "rvm autodetect activated")
    )

  :hook
  (ruby-mode . rvm-setup)
  )


(use-package inf-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))


(use-package lsp-mode
  :ensure t

  :after (rvm)

  :config
  (setq lsp-solargraph-use-bundler t)

  :hook
  (ruby-mode . lsp)
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)



;; (use-package robe
;;              :ensure t)

;; ;(use-package company-robe
;; ;             :ensure t)

;; (use-package enh-ruby-mode
;;              :ensure t)

;; (use-package smartparens
;;              :ensure t)

;; ;(require-or-install 'robe)
;; ;; (require-or-install 'ruby-electric)
;; ;(require-or-install 'company-robe)
;; ;; (require-or-install 'ruby-additional)
;; ;; (require-or-install 'ruby-tools)
;; ;; (require-or-install 'yard-mode)
;; ;(require-or-install 'enh-ruby-mode)
;; ;(require-or-install 'smartparens)
;; ;;
;; ;;
;; ;; ruby and rails modes
;; ;;
;; ;;

;; (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;; ;;
;; ;; robe
;; ;;
;; ;; keybinding are:
;; ;; - M-. to jump to the definition
;; ;; - M-, to jump back
;; ;; - C-c C-d to see the documentation
;; ;; - C-c C-k to refresh Rails environment
;; ;; - C-M-i to complete the symbol at point

;; (add-hook 'ruby-mode-hook 'robe-mode)
;; ;;; FIXME: temporary disabled
;; ;; (add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; (eval-after-load 'company
;;   '(push 'company-robe company-backends))

;; ;;
;; ;; inf ruby
;; ;;
;; (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
;;   (rvm-activate-corresponding-ruby))

;; ;;
;; ;; ruby electic
;; ;;
;; ;; (add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
;; (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
;; (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; ;; Functions to help with refactoring
;; ;; (require 'ruby-refactor)
;; ;; (add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
;; ;; Easily toggle ruby's hash syntax
;; ;; (require 'ruby-hash-syntax)
;; ;; Ruby rdoc helpers mostly

;; ;; Helpers to deal with strings and symbols

;; ;; Support for YARD

;; ;;; FIXME: temporary disabled
;; ;; (add-hook 'ruby-mode-hook 'yard-mode)

;; ;; Support for running rspec tests
;; ;; (require 'rspec-mode)

;; (let ((hooks (lambda ()
;;                (highlight-indentation-current-column-mode)
;;                (smartparens-mode))))
;;   (add-hook 'ruby-mode-hook
;;             hooks)

;;   (add-hook 'enh-ruby-mode
;;             hooks))


;; ;;;
;; ;;; disable advanced paren-mode
;; ;;;
;; ;; (add-hook 'ruby-mode-hook
;; ;;           #'endless/locally-keep-only-basic-paren)


;; ;; (add-hook 'ruby-mode-hook '(lambda ()
;; ;;                                ;; make ruby-electric play nice with autopair
;; ;;                                (substitute-key-definition 'ruby-electric-curlies nil ruby-mode-map)
;; ;;                                (substitute-key-definition 'ruby-electric-matching-char nil ruby-mode-map)
;; ;;                                (substitute-key-definition 'ruby-electric-close-matching-char nil ruby-mode-map)))


;; (setq ruby-deep-indent-paren nil)
