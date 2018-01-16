(require-or-install 'markdown-mode)
(require-or-install 'markdown-mode+)
(require-or-install 'markdown-toc)
(require-or-install 'markdown-preview-mode)
;; (unless (package-installed-p 'markdown-mode)
;;   (package-install 'markdown-mode))

(autoload 'markdown-mode "markdown-mode" nil t)

;;;
;;; disable whitespace cleaning
;;;
(eval-after-load 'whitespace-cleanup-mode
            (push 'markdown-mode whitespace-cleanup-mode-ignore-modes))

(eval-after-load "markdown-mode"
  '(progn
     (define-key markdown-mode-map (kbd "C-=") 'markdown-cycle)
     (define-key markdown-mode-map (kbd "<tab>") 'ac-expand)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (set (make-local-variable 'show-trailing-whitespace) nil)))
