;; (require-or-install 'haskell-mode)
;; (require-or-install 'hindent)
;; (require-or-install 'haskell-process)
;; (require-or-install 'haskell-interactive-mode)
;; (require-or-install 'haskell)

;; (require-or-install 'shm)

;; (require-or-install 'intero)

;; (require-or-install 'haskell-font-lock)
;; (require-or-install 'haskell-debug)

;; (require-or-install 'ghci-script-mode)



;;
;;
;; paths
;;
;;

(let ((my-pathes (list
                  (expand-file-name "~/.ghcup/bin")
                  (expand-file-name "~/.local/bin")
                  (expand-file-name "/usr/local/bin")
                  (expand-file-name "~/.nix-profile/bin"))))
  (setenv "PATH" (concat (mapconcat 'identity my-pathes ":")
                         ":"
                         (getenv "PATH")))
  (mapcar (lambda (x) (add-to-list 'exec-path x)) my-pathes))


;;;
;;;
;;; SASS library
;;;
;;;
(setenv "LD_LIBRARY_PATH"
  (concat
   "/usr/local/Cellar/libsass/3.5.5/lib/" ";"
   (getenv "LD_LIBRARY_PATH")
  )
)

;;
;;
;; 2021 november config
;; based on http://abailly.github.io/posts/a-modern-haskell-env.html
;; haskell lang server installation via ghcup https://www.haskell.org/ghcup/

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;; (use-package yasnippet
;;   :ensure t)
(use-package lsp-mode
  :ensure t
  :hook (haskell-mode . lsp)
  :commands lsp)
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-haskell
  :ensure t
  :config
  (setq lsp-haskell-server-path "haskell-language-server-wrapper")
  (setq lsp-auto-guess-root nil)
 (setq lsp-haskell-server-args ())
   ;; Comment/uncomment this line to see interactions between lsp client/server.
  (setq lsp-log-io t))


;;;
;;;
;;; new config 2019
;;;
;;;

;;;
;;; some ideas
;;;
;; http://magnus.therning.org/posts/2019-09-19-000-haskell--ghcide--and-spacemacs.html
;; (defun dotspacemacs/user-config ()
;;   (setq lsp-haskell-process-args-hie '("exec" "ghcide" "--" "--lsp")
;;         lsp-haskell-process-path-hie "stack"
;;         lsp-haskell-process-wrapper-function (lambda (argv) (cons (car argv) (cddr argv)))
;;         )
;;   (add-hook 'haskell-mode-hook
;;             #'lsp)
;;   )



;; LSP
;; (use-package nix-sandbox
;;   :ensure t
;;   )

;; (use-package flycheck
;;   :ensure t
;;   :init
;;   (global-flycheck-mode t))
;; (use-package yasnippet
;;   :ensure t)

;; (use-package lsp-mode
;;   :ensure t
;;   :hook (haskell-mode . lsp)
;;   :commands lsp)

;; ;; (use-package nix-haskell-mode
;; ;;   :ensure t
;; ;;   :init
;; ;;   (setenv "NIX_PATH" (expand-file-name "~/.nix-defexpr/channels"))
;; ;;   :hook (haskell-mode . nix-haskell-mode))

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)

;; (use-package lsp-haskell
;;   :ensure t
;;   :init
;;   (setenv "NIX_PATH" (expand-file-name "~/.nix-defexpr/channels"))
;;   :config
;;   ;;
;;   ;; nix
;;   ;;
;;   ;; (setq lsp-haskell-process-path-hie (nix-executable-find (nix-current-sandbox) "ghcide"))
;;   ;; (setq lsp-haskell-process-args-hie '())
;;   ;;
;;   ;; without nix
;;   ;;
;;   (setq lsp-haskell-process-args-hie '("exec" "ghcide" "--" "--lsp")
;;         lsp-haskell-process-path-hie "stack"
;;         lsp-haskell-process-wrapper-function (lambda (argv) (cons (car argv) (cddr argv)))
;;   )

;;   ;; Comment/uncomment this line to see interactions between lsp client/server.
;;   (setq lsp-log-io t)
;;   )

(use-package haskell-mode
  :ensure t
  :custom
  (haskell-process-type 'cabal-new-repl)
  (haskell-process-suggest-remove-import-lines t)
  (haskell-process-auto-import-loaded-modules t)
  (haskell-process-log t)
  (haskell-tags-on-save t)

  (haskell-indentation-layout-offset 2)
  (haskell-indentation-starter-offset 2)
  (haskell-indentation-left-offset 2)
  (haskell-indentation-where-pre-offset 2)
  (haskell-indentation-where-post-offset 2)

  :config
  (defun haskell-mode-setup ()
    (interactive-haskell-mode)
    (setq tab-width 2)
    ;; (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)
    ;; (define-key evil-normal-state-map (kbd "C-]") 'haskell-mode-goto-loc)
    ;; (define-key evil-normal-state-map (kbd "C-c C-]") 'haskell-mode-tag-find)
    ;; (define-key evil-normal-state-map (kbd "C-c C-t") 'haskell-mode-show-type-at)
    )
  :hook
  (haskell-mode . haskell-mode-setup)

  ;;
  ;; nix
  ;;
  ;; :config  
  ;; (setq default-nix-wrapper
  ;;       (lambda (args)
  ;;         (append (list "nix-shell" "-I" (nix-current-sandbox))
  ;;                 (list "--command" (concat "\""
  ;;                                           (mapconcat 'identity args " ")
  ;;                                           "\""))
  ;;                 )

  ;;         )
  ;;       )
  ;; (setq haskell-nix-wrapper
  ;;       (lambda (args)
  ;;         (apply default-nix-wrapper (list (append args (list "--ghc-option" "-Wwarn"))))
  ;;         )
  ;;       )
  ;;
  ;; end of nix
  ;;

  ;; Flycheck is for error checking
  ;; (setq flycheck-command-wrapper-function default-nix-wrapper
  ;;       flycheck-executable-find
  ;;       (lambda (cmd) (nix-executable-find (nix-current-sandbox) cmd)))
  ;; Haskell repl session that runs in the background
  ;;
  ;; nix
  ;;
  ;; (setq haskell-process-wrapper-function haskell-nix-wrapper)
  ;; ;; Haskell-ide-engine process
  ;; (setq lsp-haskell-process-wrapper-function default-nix-wrapper)
  ;;
  ;; end of nix
  ;;

  )

;;;
;;;
;;; old config
;;;
;;;

;;;
;;;
;;; dante
;;;
;;;
;; (use-package dante
;;   :ensure t
;;   :after haskell-mode
;;   :commands 'dante-mode
;;   :init
;;   (add-hook 'haskell-mode-hook 'flycheck-mode)
;;   ;; OR:
;;   ;; (add-hook 'haskell-mode-hook 'flymake-mode)
;;   (add-hook 'haskell-mode-hook 'dante-mode)
;;   )

;;;
;;; OLD STUFF BELOW
;;;


;;;
;;;
;;; functionsb
;;;
;;;
;; (defun haskell-move-right ()
;;   (interactive)
;;   (haskell-move-nested 1))

;; (defun haskell-move-left ()
;;   (interactive)
;;   (haskell-move-nested -1))

;;
;;
;; hooks
;;
;;

;; (add-hook 'haskell-mode-hook 'hl-line-unhighlight-now)
;; (add-hook 'haskell-mode-hook 'structured-haskell-mode)
;; (remove-hook 'haskell-mode-hook 'interactive-haskell-mode)
;; (remove-hook 'haskell-mode-hook 'stack-mode)
;; (add-hook 'haskell-interactive-mode-hook 'structured-haskell-repl-mode)


;;;
;;;
;;; parameters
;;;
;;;

;; (setq haskell-process-type 'ghci)
;; (setq haskell-process-path-ghci "stack")
;; (setq haskell-process-use-ghci t)
;; (setq haskell-process-args-ghci '("ghci" "--with-ghc" "intero" "--no-load" "--no-build"))

;; (set-face-background 'shm-current-face "#eee8d5")
;; (set-face-background 'shm-quarantine-face "lemonchiffon")

;; (custom-set-variables
;;  '(haskell-process-type 'cabal-repl)
;;  '(haskell-process-args-ghci '())
;;  '(haskell-notify-p t)
;;  '(haskell-stylish-on-save nil)
;;  '(haskell-tags-on-save nil)
;;  '(haskell-process-suggest-remove-import-lines t)
;;  '(haskell-process-auto-import-loaded-modules t)
;;  '(haskell-process-log t)
;;  '(haskell-process-reload-with-fbytecode nil)
;;  '(haskell-process-use-presentation-mode t)
;;  '(haskell-interactive-mode-include-file-name nil)
;;  '(haskell-interactive-mode-eval-pretty nil)
;;  '(haskell-process-do-cabal-format-string ":!cd %s && unset GHC_PACKAGE_PATH && %s")
;;  '(shm-use-hdevtools t)
;;  '(shm-use-presentation-mode t)
;;  '(shm-auto-insert-skeletons t)
;;  '(shm-auto-insert-bangs t)
;;  '(haskell-process-show-debug-tips nil)
;;  '(haskell-process-suggest-hoogle-imports nil)
;;  '(haskell-process-suggest-haskell-docs-imports t)
;;  '(hindent-style "chris-done"))



;; ;;;
;; ;;;
;; ;;;
;; ;;; keybindings
;; ;;;
;; ;;;
;; ;; (define-key shm-repl-map (kbd "TAB") 'shm-repl-tab)
;; ;; (define-key shm-map (kbd "C-c C-p") 'shm/expand-pattern)
;; ;; (define-key shm-map (kbd ",") 'shm-comma-god)
;; ;; (define-key shm-map (kbd "C-c C-s") 'shm/case-split)
;; ;; (define-key shm-map (kbd "SPC") 'shm-contextual-space)
;; ;; (define-key shm-map (kbd "C-\\") 'shm/goto-last-point)
;; ;; (define-key shm-map (kbd "C-c C-f") 'shm-fold-toggle-decl)
;; ;; (define-key shm-map (kbd "C-c i") 'shm-reformat-decl)

;; (define-key intero-mode-map (kbd "C-?") 'intero-uses-at)
;; (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;; (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;; (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
;; (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
;; (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
;; (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
;; (define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent)
;; (define-key haskell-mode-map (kbd "C-<right>") 'haskell-move-right)
;; (define-key haskell-mode-map (kbd "C-<left>") 'haskell-move-left)
;; (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
;; (define-key haskell-mode-map (kbd "C-c C-c") 'comment-region)


;; ;; (eval-after-load 'haskell-mode
;; ;;   '(progn
;; ;;      (define-key intero-mode-map (kbd "C-?") 'intero-uses-at)
;; ;;      (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;; ;;      (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;; ;;      (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
;; ;;      (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
;; ;;      (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
;; ;;      (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
;; ;;      (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
;; ;;      (define-key haskell-mode-map (kbd "C-c C-c") 'comment-region)
;; ;;      ;; (define-key haskell-mode-map [remap shm/splice] 'helm-swoop)
;; ;;      (define-key haskell-mode-map (kbd "M-s") nil) ; disable shm/splice
;; ;;      (define-key haskell-mode-map (kbd "M-s o") 'helm-swoop)))
