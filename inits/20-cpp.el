;;;
;;;
;;;

(use-package helm-gtags
  :ensure t
  :hook ((c-mode . helm-gtags-mode)
         (c++-mode . helm-gtags-mode)
         (asm-mode . helm-gtags-mode))

  :bind (("M-t" . helm-gtags-find-tag)
         ("M-r" . helm-gtags-find-rtag)
         ("M-s" . helm-gtags-find-symbol)
         ("M-g M-p" . helm-gtags-parse-file)
         ("C-c <" . helm-gtags-previous-history)
         ("C-c >" . helm-gtags-next-history)
         ("M-," . helm-gtags-pop-stack)))
