(require-or-install 'helm)
(require-or-install 'helm-swoop)
(require-or-install 'helm-config)
(require-or-install 'helm-projectile)
(require-or-install 'ac-helm)
(require-or-install 'helm-descbinds)
(require-or-install 'helm-ag)


;; HELM plugin
(setq helm-ff-transformer-show-only-basename nil
      helm-adaptive-history-file             "~/.emacs.d/data/helm-history"
      helm-yank-symbol-first                 t
      helm-move-to-line-cycle-in-source      t
      helm-buffers-fuzzy-matching            t
      helm-ff-auto-update-initial-value      t)

(autoload 'helm-descbinds      "helm-descbinds" t)
(autoload 'helm-eshell-history "helm-eshell"    t)
(autoload 'helm-esh-pcomplete  "helm-eshell"    t)


(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "TAB")     #'helm-esh-pcomplete)
              (define-key eshell-mode-map (kbd "C-c C-l") #'helm-eshell-history)))

(helm-mode t)
(helm-adaptive-mode t)

(global-set-key (kbd "C-h a")    #'helm-apropos)
(global-set-key (kbd "C-h i")    #'helm-info-emacs)
(global-set-key (kbd "C-h b")    #'helm-descbinds)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-x C-m") #'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-r") #'helm-recentf)
(global-set-key (kbd "C-x r l") #'helm-filtered-bookmarks)
(global-set-key (kbd "M-y")     #'helm-show-kill-ring)
;;;
;;; swoop keys
;;;
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

;; (global-set-key (kbd "M-s o")   #'helm-swoop)
;; (global-set-key (kbd "M-s /")   #'helm-multi-swoop)
(global-set-key (kbd "C-x c!")   #'helm-calcul-expression)
(global-set-key (kbd "C-x c:")   #'helm-eval-expression-with-eldoc)
(define-key helm-map (kbd "M-o") #'helm-previous-source)
(global-set-key (kbd "M-s s")   #'helm-ag)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action

(setq helm-projectile-sources-list (cons 'helm-source-projectile-files-list
                                         (remove 'helm-source-projectile-files-list
                                              helm-projectile-sources-list)))
;; (helm-projectile-on)

;; (define-key projectile-mode-map (kbd "C-c p /")
;; #'(lambda ()
;;     (interactive)
;;     (helm-ag (projectile-project-root)))


;;;
;;;
;;; SWOOP config
;;;
;;;
;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;; ;; Go to the opposite side of line from the end or beginning of line
(setq helm-swoop-move-to-line-cycle t)

;; Optional face for line numbers
;; Face name is `helm-swoop-line-number-face`
(setq helm-swoop-use-line-number-face t)
(helm-mode 1)
