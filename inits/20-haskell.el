;;
;;
;; haskell stuff
;;
;;
(let ((my-cabal-path (expand-file-name "~/Library/Haskell/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))
(custom-set-variables '(haskell-tags-on-save t))

;;(setq tags-table-list
;;      '("~/emacs"))


;; (defadvice find-tag (before c-tag-file activate)
;;   "Automatically create tags file."
;;   (let ((tag-file (concat default-directory "TAGS")))
;;     (unless (file-exists-p tag-file)
;;       (shell-command "etags *.[ch] -o TAGS 2>/dev/null"))
;;     (visit-tags-table tag-file)))

(setq ghc-debug t)

(setq ghc-interactive-command "ghc-modi")

(load "haskell-mode-autoloads.el")

(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)

(require 'shm)			       
;; (structured-haskell-mode)

;;
;; haskell mode hook
;;
(add-hook 'haskell-mode-hook (lambda ()
			       (ghc-init)
			       ;; (turn-on-haskell-doc-mode)
			       ;; (interactive-haskell-mode)
			       ;; (ghc-abbrev-init)
			       ;; (ghc-type-init)
			       ;; (unless my-ghc-initialized
			       ;; 	 (ghc-comp-init)
			       ;; 	 (setq my-ghc-initialized t))			    
			       ;; (ghc-import-module)
			       ))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(set-face-background 'shm-current-face "#eee8d5")
(set-face-background 'shm-quarantine-face "lemonchiffon")


;; indentation
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)


;; (set-face-background 'shm-current-face "#eee8d5")
;; (set-face-background 'shm-quarantine-face "lemonchiffon")


(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-type 'cabal-repl))


(add-to-list 'company-backends 'company-ghc)
;; (add-to-list 'company-backends 'slime-company)
(custom-set-variables '(company-ghc-show-info t))

(custom-set-variables
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-interactive-mode-hide-multi-line-errors nil)
 '(haskell-process-type (quote cabal-repl))
 '(haskell-interactive-popup-errors nil))


(eval-after-load 'haskell-mode '(progn
				  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
				  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
				  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
				  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
				  (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
				  (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
				  (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
				  (define-key haskell-mode-map (kbd "C-c C-c") 'comment-region)))
