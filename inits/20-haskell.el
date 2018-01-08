(require-or-install 'haskell-mode)
(require-or-install 'hindent)
(require-or-install 'haskell-process)
(require-or-install 'haskell-interactive-mode)
(require-or-install 'haskell)

(require-or-install 'shm)

(require-or-install 'intero)

(require-or-install 'haskell-font-lock)
(require-or-install 'haskell-debug)

(require-or-install 'ghci-script-mode)

;;
;;
;; paths
;;
;;

(let ((my-cabal-path (list
                      (expand-file-name "~/.local/bin")
                      (expand-file-name "/usr/local/bin"))))
  (setenv "PATH" (concat (mapconcat 'identity my-cabal-path ":")
                         ":"
                         (getenv "PATH")))
  (mapcar (lambda (x) (add-to-list 'exec-path x)) my-cabal-path))


;;;
;;;
;;; functions
;;;
;;;
(defun haskell-move-right ()
  (interactive)
  (haskell-move-nested 1))

(defun haskell-move-left ()
  (interactive)
  (haskell-move-nested -1))

;;
;;
;; hooks
;;
;;

(add-hook 'haskell-mode-hook 'hl-line-unhighlight-now)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(remove-hook 'haskell-mode-hook 'interactive-haskell-mode)
(remove-hook 'haskell-mode-hook 'stack-mode)
(add-hook 'haskell-interactive-mode-hook 'structured-haskell-repl-mode)


;;;
;;;
;;; parameters
;;;
;;;

(setq haskell-process-type 'ghci)
(setq haskell-process-path-ghci "stack")
(setq haskell-process-use-ghci t)
(setq haskell-process-args-ghci '("ghci" "--with-ghc" "intero" "--no-load" "--no-build"))

(set-face-background 'shm-current-face "#eee8d5")
(set-face-background 'shm-quarantine-face "lemonchiffon")

(custom-set-variables
 '(haskell-process-type 'cabal-repl)
 '(haskell-process-args-ghci '())
 '(haskell-notify-p t)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save nil)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-use-presentation-mode t)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-process-do-cabal-format-string ":!cd %s && unset GHC_PACKAGE_PATH && %s")
 '(shm-use-hdevtools t)
 '(shm-use-presentation-mode t)
 '(shm-auto-insert-skeletons t)
 '(shm-auto-insert-bangs t)
 '(haskell-process-show-debug-tips nil)
 '(haskell-process-suggest-hoogle-imports nil)
 '(haskell-process-suggest-haskell-docs-imports t)
 '(hindent-style "chris-done"))



;;;
;;;
;;;
;;; keybindings
;;;
;;;
;; (define-key shm-repl-map (kbd "TAB") 'shm-repl-tab)
;; (define-key shm-map (kbd "C-c C-p") 'shm/expand-pattern)
;; (define-key shm-map (kbd ",") 'shm-comma-god)
;; (define-key shm-map (kbd "C-c C-s") 'shm/case-split)
;; (define-key shm-map (kbd "SPC") 'shm-contextual-space)
;; (define-key shm-map (kbd "C-\\") 'shm/goto-last-point)
;; (define-key shm-map (kbd "C-c C-f") 'shm-fold-toggle-decl)
;; (define-key shm-map (kbd "C-c i") 'shm-reformat-decl)

(define-key intero-mode-map (kbd "C-?") 'intero-uses-at)
(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
(define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
(define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
(define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
(define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
(define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
(define-key haskell-mode-map (kbd "C-<return>") 'haskell-simple-indent-newline-indent)
(define-key haskell-mode-map (kbd "C-<right>") 'haskell-move-right)
(define-key haskell-mode-map (kbd "C-<left>") 'haskell-move-left)
(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
(define-key haskell-mode-map (kbd "C-c C-c") 'comment-region)


;; (eval-after-load 'haskell-mode
;;   '(progn
;;      (define-key intero-mode-map (kbd "C-?") 'intero-uses-at)
;;      (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;;      (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
;;      (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
;;      (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)
;;      (define-key haskell-mode-map (kbd "C-c C-n C-c") 'haskell-process-cabal-build)
;;      (define-key haskell-mode-map (kbd "C-c C-n c") 'haskell-process-cabal)
;;      (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
;;      (define-key haskell-mode-map (kbd "C-c C-c") 'comment-region)
;;      ;; (define-key haskell-mode-map [remap shm/splice] 'helm-swoop)
;;      (define-key haskell-mode-map (kbd "M-s") nil) ; disable shm/splice
;;      (define-key haskell-mode-map (kbd "M-s o") 'helm-swoop)))
