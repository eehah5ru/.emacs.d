(use-package racket-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.rkt$" . racket-mode))
  (add-hook 'racket-mode-hook #'racket-xp-mode)
  
  :config
  (defun my-racket-mode-hook ()
    (require 'racket-xp))
  (add-hook 'racket-mode-hook 'my-racket-mode-hook)
  )

(use-package geiser-racket
            :ensure t)

(use-package scheme-complete
             :ensure t)

(use-package rainbow-delimiters
  :ensure t)

(use-package dash-at-point
  :ensure t)

(use-package paredit
  :ensure t)



;(require-or-install 'racket-mode)
;(require-or-install 'geiser)
;(require-or-install 'scheme-complete)
;(require-or-install 'dash-at-point)


;;;
;;; dash integration
;;; more info here https://github.com/stanaka/dash-at-point#readme
(add-to-list 'dash-at-point-mode-alist '(racket-mode . "racket"))

(custom-set-variables '(dash-at-point-legacy-mode t))

(add-hook 'racket-mode-hook
          (lambda ()
            (enable-paredit-mode)
            (setq dash-at-point-docset "racket")))
