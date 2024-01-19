;;;
;;;
;;; info is here
;;; https://www.racket-mode.com/
;;; https://www.linw1995.com/en/blog/Write-Racket-With-Emacs/
;;;
(use-package racket-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.rkt$" . racket-mode))
  (add-hook 'racket-mode-hook #'racket-xp-mode)
  
  :config
  (defun my-racket-mode-hook ()
    (require 'racket-xp))
  (add-hook 'racket-mode-hook 'my-racket-mode-hook)

  :bind ("C-c ." . racket-describe-search)
  :hook ((racket-mode . racket-xp-mode)
         (racket-mode . paredit-mode))
  :config
  (setq dash-at-point-docset "racket")
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
  :hook
  ((racket-mode . paredit-mode)
   (racket-repl-mode . paredit-mode)))


(use-package company
  :config
  (setq company-minimum-prefix-length 2)
  (setq company-idle-delay 0.1)
  (setq company-tooltip-align-annotations t)
  :hook
  ((racket-mode . company-mode)
   (racket-repl-mode . company-mode)))


(use-package rainbow-delimiters
  :ensure t
  :hook
  ((racket-mode . rainbow-delimiters-mode)
   (racket-repl-mode . rainbow-delimiters-mode)))


;;;
;;; dash integration
;;; more info here https://github.com/stanaka/dash-at-point#readme
;; (add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))

;; (add-to-list 'dash-at-point-mode-alist '(racket-mode . "racket"))

(custom-set-variables '(dash-at-point-legacy-mode t))

(add-hook 'racket-mode-hook
          (lambda ()
            (enable-paredit-mode)
            (racket-xp-mode)
            ))
