(unless (package-installed-p 'js2-mode)
  (package-install 'js2-mode))

(autoload 'js2-mode "js2" nil t)

(eval-after-load "js2-mode"
  '(progn
     (setq js2-basic-offset 2
           js2-mirror-mode nil)))

(require-or-install 'js-doc)

(add-hook 'js2-mode-hook
          (lambda ()
              (define-key js2-mode-map "\C-ci" 'js-doc-insert-function-doc)
              (define-key js2-mode-map "@" 'js-doc-insert-tag)))
