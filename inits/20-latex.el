(package-install-with-refresh 'auctex)
(require-or-install 'company-auctex)
(require-or-install 'latex-extra)

(require 'flymake)

(let ((texbin-path "/usr/texbin"))
  (setenv "PATH" (concat texbin-path ":" (getenv "PATH")))
  (add-to-list 'exec-path texbin-path))

(defun flymake-get-tex-args (file-name)
  (list "/usr/texbin/xelatex"
        (list "-file-line-error" "-draftmode" "-interaction=nonstopmode" file-name)))

(add-hook 'LaTeX-mode-hook 'flymake-mode)



(defun turn-on-outline-minor-mode ()
  (outline-minor-mode 1))

(add-hook 'LaTeX-mode-hook 'turn-on-outline-minor-mode)
(add-hook 'latex-mode-hook 'turn-on-outline-minor-mode)
(setq outline-minor-mode-prefix "\C-c \C-o")



(setq-default TeX-master "master")
