;;;
;;;
;;; doc live here
;;; https://lispcookbook.github.io/cl-cookbook/emacs-ide.html
;;;
(use-package slime-autoloads
             :ensure t)    

(use-package slime
             :init
             (progn
               (require 'slime-autoloads)
               (add-hook 'slime-mode-hook
                         (lambda ()
                           (unless (slime-connected-p)
                             (save-excursion (slime)))))
               ;; (add-hook 'slime-mode-hook
               ;;           (lambda ()
               ;;             )
               ;;  )
               )
             :config
             (progn
               (load (expand-file-name "~/.roswell/helper.el"))
               (setq inferior-lisp-program "ros -Q run")
               (load "~/.roswell/lisp/quicklisp/log4slime-setup.el")
               (global-log4slime-mode 1)
               ;; (setf inferior-lisp-program "sbcl")
               (slime-setup '(slime-fancy
                              slime-quicklisp
                              slime-asdf
                              helm-slime
                              slime-indentation
                              slime-tramp
                              slime-banner
                              slime-company
                              slime-mdot-fu
                              ;; slime-hyperspec-lookup
                              slime-repl))
               (setq slime-net-coding-system 'utf-8-unix)
               (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
               (setq slime-auto-select-connection 'always)
               (setq slime-kill-without-query-p t)
               (setq slime-fuzzy-explanation "")
               (setq slime-asdf-collect-notes t)
               (setq slime-inhibit-pipelining nil)
               (setq slime-load-failed-fasl 'always)
               (setq slime-repl-history-remove-duplicates t)
               (setq slime-repl-history-trim-whitespaces t)
               (setq slime-export-symbol-representation-auto t)
               (setq lisp-indent-function 'common-lisp-indent-function)
               (setq lisp-loop-indent-subclauses nil)
               (setq lisp-loop-indent-forms-like-keywords t)
               (setq lisp-lambda-list-keyword-parameter-alignment t)

               ;; keys

               (defun slime-repl-return-at-end ()
                 (interactive)
                 (if (<= (point-max) (point))
                     (slime-repl-return)
                     (slime-repl-newline-and-indent)))

               (define-key lisp-mode-map
                   (kbd "C-c C-q")
                 'slime-close-all-parens-in-sexp)
               (define-key slime-mode-indirect-map
                   (kbd "M-_")
                 'paredit-convolute-sexp)
               (define-key slime-repl-mode-map
                   (kbd "C-c C-z")
                 #'quit-window)
               (define-key slime-repl-mode-map
                   (read-kbd-macro paredit-backward-delete-key)
                 nil)
               (define-key slime-repl-mode-map
                   (kbd "RET")
                 'slime-repl-return-at-end)
               (define-key slime-repl-mode-map
                   (kbd "<return>")
                 'slime-repl-return-at-end)
               ))

(use-package slime-company
  :ensure t)

(use-package company-quickhelp
  :ensure t)

(use-package slime-autoloads)

(use-package rainbow-delimiters
  :ensure t)

(use-package lisp-mode
  :init
  (progn
    (add-hook 'lisp-mode-hook 'enable-paredit-mode)
    (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
    (add-hook 'lisp-mode-hook 'company-quickhelp-mode)
    ))

;; (cond
;;     ((file-exists-p (expand-file-name "~/.roswell/lisp/quicklisp/slime-helper.el"))
;;       (load (expand-file-name "~/.roswell/lisp/quicklisp/slime-helper.el")))
;;  ;; ((file-exists-p (expand-file-name "~/.roswell/impls/ALL/ALL/quicklisp/slime-helper.el"))
;;     ;;  (load (expand-file-name "~/.roswell/impls/ALL/ALL/quicklisp/slime-helper.el")))
;;     ((file-exists-p (expand-file-name "~/quicklisp/slime-helper.el"))
;;      (load (expand-file-name "~/quicklisp/slime-helper.el")))

;;     (T (require-or-install 'slime)))

;; (require-or-install 'slime-autoloads)

;; (require-or-install 'slime-company)
;; (setq slime-default-lisp 'sbcl)
;; (setq slime-lisp-implementations
;;       `((sbcl ("ros" "-L" "sbcl-bin" "-Q" "run") :coding-system utf-8-unix)
;;         (roswell ("ros" "dynamic-space-size=2000" "-Q" "-l" "~/.sbclrc" "run"))
;;         (ccl ("ros" "-L" "ccl-bin" "-Q" "run") :coding-system utf-8-unix)))

;; (add-hook 'slime-mode-hook
;;           (lambda ()
;;             (unless (slime-connected-p)
;;               (save-excursion (slime)))
;;             (global-set-key (kbd "C-c s") 'slime-selector)
;;             (define-key slime-scratch-mode-map (kbd "C-n") 'slime-eval-print-last-expression)
;;             (define-key slime-scratch-mode-map (kbd "C-j") 'next-line)))

;; (add-hook 'slime-repl-mode-hook
;;           (lambda ()
;;             (define-key slime-repl-mode-map (kbd "C-n") 'slime-repl-newline-and-indent)
;;             (define-key slime-repl-mode-map (kbd "C-j") 'next-line)
;;             (define-key slime-repl-mode-map (kbd "M-r") 'anything-for-files)))

;; (setq slime-autodoc-use-multiline-p t)

;; (setq slime-contribs
;;       '(slime-fancy slime-banner slime-indentation slime-tramp slime-asdf slime-company))
;; (slime-setup slime-contribs)

;; ;; (add-hook 'slime-repl-mode-hook
;; ;;           (lambda ()
;; ;;             (el-get 'sync 'slime-repl-ansi-color)
;; ;;             (slime-setup '(slime-repl-ansi-color))))

;; (require-or-install 'ac-slime)
;; (add-hook 'slime-mode-hook 'set-up-slime-ac)
;; (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;; (eval-after-load "auto-complete"
;;   '(add-to-list 'ac-modes 'slime-repl-mode))

;; (modify-syntax-entry ?\[ "(]" lisp-mode-syntax-table)
;; (modify-syntax-entry ?\] ")[" lisp-mode-syntax-table)
;; (modify-syntax-entry ?\{ "(}" lisp-mode-syntax-table)
;; (modify-syntax-entry ?\} "){" lisp-mode-syntax-table)

;; (font-lock-add-keywords 'lisp-mode '(("\\(?:^\\|[^,]\\)\\(@\\(?:\\sw\\|\\s_\\)+\\)" (1 font-lock-comment-face))))
;; (font-lock-add-keywords 'lisp-mode '(("\\(?:^\\|^,:]\\)\\(<\\(?:\\sw\\|\\s_\\)+>\\)" (1 font-lock-type-face))))

;; (eval-after-load "paredit"
;;   '(progn
;;      (define-key paredit-mode-map "[" 'paredit-open-bracket)
;;      (define-key paredit-mode-map "]" 'paredit-close-bracket)
;;      (define-key paredit-mode-map "(" 'paredit-open-parenthesis)
;;      (define-key paredit-mode-map ")" 'paredit-close-parenthesis)
;;      (define-key paredit-mode-map "{" 'paredit-open-curly)
;;      (define-key paredit-mode-map "}" 'paredit-close-curly)

;;      (global-set-key (kbd "M-l") 'paredit-forward-slurp-sexp)
;;      (global-set-key (kbd "M-h") 'paredit-forward-barf-sexp)
;;      (global-set-key (kbd "M-9") 'paredit-wrap-round)
;;      (define-key paredit-mode-map (kbd "C-j") 'next-line)
;;      (define-key paredit-mode-map (kbd "C-k") 'previous-line)))

;; (loop for mode in '(emacs-lisp-mode
;;                     lisp-mode
;;                     lisp-interaction-mode
;;                     scheme-mode)
;;       do (add-hook (intern (concat (symbol-name mode) "-hook"))
;;                    (lambda ()
;;                      (require-or-install 'paredit)
;;                      (paredit-mode t))))

;; (defun set-pretty-patterns (patterns)
;;   (loop for (glyph . pairs) in patterns do
;;         (loop for (regexp . major-modes) in pairs do
;;               (loop for major-mode in major-modes do
;;                     (let ((major-mode (intern (concat (symbol-name major-mode) "-mode")))
;;                           (n (if (string-match "\\\\([^?]" regexp) 1 0)))
;;                       (font-lock-add-keywords major-mode
;;                                               `((,regexp (0 (prog1 ()
;;                                                               (compose-region (match-beginning ,n)
;;                                                                               (match-end ,n)
;;                                                                               ,glyph)))))))))))

;; (set-pretty-patterns
;;  '((?λ ("\\<lambda\\>" lisp lisp-interaction emacs-lisp scheme))
;;    (?λ ("\\<function\\>" js2))))


;; ;; (require-or-install 'slime)
;; (slime-setup '(slime-fancy slime-tramp slime-asdf slime-company))
