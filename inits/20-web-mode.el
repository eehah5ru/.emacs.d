;; (require-or-install 'web-mode)


;; (appendf auto-mode-alist
;;          '(("\\.\\(html?\\|emb\\|tmpl\\|tt\\|erb\\|haml\\)$" . web-mode)
;;            ("\\.jsx$" . web-mode)))

;;;
;;; setting //-like comments for javascript code
;;;

(use-package web-mode
  :ensure t)

(setq-default web-mode-comment-formats
              '(("java"       . "/*")
                ("javascript" . "//")
                ("php"        . "/*")))


;;;
;;;
;;;
(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-indent-style 2)
  (setq web-mode-script-padding 2)

  (setq indent-tabs-mode nil
      js-indent-level 2))


(with-eval-after-load 'web-mode
  (my-web-mode-hook))

;; (add-hook 'web-mode-hook  'my-web-mode-hook)
