;; (require-or-install 'css)
;; (require-or-install 'scss-mode)
;; (require-or-install 'sass-mode)

(autoload 'css-mode "css-mode" nil t)

(eval-after-load "css-mode"
  '(progn
     (setq cssm-indent-function 'cssm-c-style-indenter)
     (setq css-indent-offset 2)))


(use-package sass-mode
  :ensure t)

;; (unless (package-installed-p 'less-css-mode)
;;   (package-install 'less-css-mode))
;; (autoload 'less-css-mode "less-css-mode" nil t)

;; (unless (package-installed-p 'scss-mode)
;;   (package-install 'scss-mode))

;; (autoload 'scss-mode "scss-mode" nil t)

;; (eval-after-load "scss-mode"
;;   '(progn
;;      (setq scss-compile-at-save nil)))

;; (setq scss-compile-at-save nil)

;; (defun my-scss-mode-hook ()
;;   "Hooks for SCSS mode."
;;   (setq scss-mode-markup-indent-offset 2))

;; (add-hook 'scss-mode-hook  'my-scss-mode-hook)

;; (add-hook 'sass-mode-hook
;;     (lambda () (highlight-indentation-current-column-mode)))
