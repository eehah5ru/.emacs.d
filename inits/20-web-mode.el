(require-or-install 'web-mode)

(appendf auto-mode-alist
         '(("\\.\\(html?\\|emb\\|tmpl\\|tt\\|erb\\|haml\\)$" . web-mode)
           ("\\.jsx$" . web-mode)))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2))

(add-hook 'web-mode-hook  'my-web-mode-hook)
