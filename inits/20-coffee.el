(unless (package-installed-p 'coffee-mode)
  (package-install 'coffee-mode))
(autoload 'coffee-mode "coffee-mode" nil t)


(add-hook 'coffee-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))


(custom-set-variables '(coffee-tab-width 2)
          '(flycheck-coffeelintrc "~/.emacs.d/coffeelint.json"))


(require-or-install 'flymake-coffee)


(defun coffee-comment-dwim-3 (arg)
  "Comment or uncomment current line or region in a smart way.
For details, see `comment-dwim'."
  (interactive "*P")
  (require 'newcomment)
  (let ((deactivate-mark nil) (comment-start "###") (comment-end "###"))
    (comment-dwim arg)
    (deactivate-mark t)))

(add-hook 'coffee-mode-hook
  (lambda ()
    (flymake-coffee-load)
    (whitespace-mode)
    (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)
    (define-key coffee-mode-map (kbd "C-M-;") 'coffee-comment-dwim-3)
    (define-key coffee-mode-map (kbd "<C-tab>") 'coffee-indent-shift-right)
    (highlight-indentation-current-column-mode)
    ;; (load "coffee-doc.el")
    ;; (require 'coffee-doc)
    ))
