(require-or-install 'robe)
(require-or-install 'ruby-electric)
(require-or-install 'company-robe)
(require-or-install 'ruby-additional)
(require-or-install 'ruby-tools)
(require-or-install 'yard-mode)
(require-or-install 'enh-ruby-mode)
;;
;;
;; ruby and rails modes
;;
;;

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))

;;
;; robe
;;
;; keybinding are:
;; - M-. to jump to the definition
;; - M-, to jump back
;; - C-c C-d to see the documentation
;; - C-c C-k to refresh Rails environment
;; - C-M-i to complete the symbol at point

(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(eval-after-load 'company
  '(push 'company-robe company-backends))

;;
;; inf ruby
;;
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;;
;; ruby electic
;;
;; (add-hook 'ruby-mode-hook 'ruby-electric-mode)

;; (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
;; (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
;; (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

;; Functions to help with refactoring
;; (require 'ruby-refactor)
;; (add-hook 'ruby-mode-hook 'ruby-refactor-mode-launch)
;; Easily toggle ruby's hash syntax
;; (require 'ruby-hash-syntax)
;; Ruby rdoc helpers mostly

;; Helpers to deal with strings and symbols

;; Support for YARD

(add-hook 'ruby-mode-hook 'yard-mode)
;; Support for running rspec tests
;; (require 'rspec-mode)


(add-hook 'ruby-mode-hook
    (lambda () (highlight-indentation-current-column-mode)))

(add-hook 'ruby-mode-hook '(lambda ()
                               ;; make ruby-electric play nice with autopair
                               (substitute-key-definition 'ruby-electric-curlies nil ruby-mode-map)
                               (substitute-key-definition 'ruby-electric-matching-char nil ruby-mode-map)
                               (substitute-key-definition 'ruby-electric-close-matching-char nil ruby-mode-map)))

(setq ruby-deep-indent-paren nil)
