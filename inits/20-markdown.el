(use-package markdown-mode
             :ensure t)

;(use-package markdown-mode+
;             :ensure t)

(use-package markdown-toc
             :ensure t)

(use-package markdown-preview-mode
             :ensure t)

;(require-or-install 'markdown-mode)
;(require-or-install 'markdown-mode+)
;(require-or-install 'markdown-toc)
;(require-or-install 'markdown-preview-mode)
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


;;;
;;;
;;; hugo shortcodes
;;;
;;;
(defun schnouki/markdown-maybe-add-shortcode-keyword ()
  "Enable fontifying Hugo shortcodes if in the ~/blog/ directory."
  (let ((shortcode-regexp
         (rx (group "{{" (or "<" "%") (1+ space))            ; opening {{< or {{%
             (group (1+ (not space)))                        ; shortcode name
             (group (*? any))                                ; parameters
             (group (1+ space) (? "/") (or ">" "%") "}}")))) ; closing >}}, %}}, />}} or /%}}
    (font-lock-add-keywords nil `((,shortcode-regexp . ((1 'markdown-markup-face)
                                                        (2 'markdown-metadata-key-face)
                                                        (3 'markdown-metadata-value-face)
                                                        (4 'markdown-markup-face)))))))

(add-hook 'markdown-mode-hook #'schnouki/markdown-maybe-add-shortcode-keyword)
