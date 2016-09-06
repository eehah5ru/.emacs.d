(require-or-install 'haskell-mode)
(require-or-install 'ghc)
(require-or-install 'shm)
(require-or-install 'hindent)
(require-or-install 'company-ghc)
(require-or-install 'company-ghci)

;;
;;
;; haskell stuff
;;
;;

(let ((my-cabal-path (list
                      (expand-file-name "~/.local/bin")
                      (expand-file-name "/usr/local/bin"))))
  (setenv "PATH" (concat (mapconcat 'identity my-cabal-path ":")
                         ":"
                         (getenv "PATH")))
  (mapcar (lambda (x) (add-to-list 'exec-path x)) my-cabal-path))

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

(setq hindent-style "chris-done")
;; (setq hindent-style "gibiansky")
;; (setq hindent-style "johan-tibell")

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
             ;;    (ghc-comp-init)
             ;;    (setq my-ghc-initialized t))
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
 '(company-ghc-show-info t)
 '(haskell-process-type 'stack-ghci)
 '(haskell-interactive-mode-hide-multi-line-errors nil)
 '(haskell-interactive-popup-errors nil))


(add-to-list 'company-backends 'company-ghc)
;; (add-to-list 'company-backends 'slime-company)


(eval-after-load 'haskell-mode '(progn
          (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
          (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
          (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
          (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
          (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
          (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
          (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
          (define-key haskell-mode-map (kbd "C-c C-c") 'comment-region)
          ;; (define-key haskell-mode-map [remap shm/splice] 'helm-swoop)
          (define-key haskell-mode-map (kbd "M-s") nil) ; disable shm/splice
          (define-key haskell-mode-map (kbd "M-s o") 'helm-swoop)))
