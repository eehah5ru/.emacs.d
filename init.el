(defvar *emacs-config-directory* (file-name-directory load-file-name))

(setq debug-on-error t)

(require 'package)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defun package-install-with-refresh (package)
  (unless (assq package package-alist)
    (progn
      (package-refresh-contents)))
  (unless (package-installed-p package)
    (progn
      (message (format "Installing %s" package))
      (package-install package))))

(defun require-or-install (package)
  (or (require package nil t)
      (progn
       (package-install-with-refresh package)
       (require package))))

(require-or-install 'init-loader)

(setq init-loader-show-log-after-init t)

(init-loader-load
 (expand-file-name "inits/" *emacs-config-directory*))

;; el-get
(defvar *el-get-directory*
  (expand-file-name "el-get/el-get" *emacs-config-directory*))

(add-to-list 'load-path *el-get-directory*)

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(require 'el-get)

(setq el-get-recipe-path
      (list (expand-file-name "recipes" *el-get-directory*)
            (expand-file-name "el-get/user/recipes" *emacs-config-directory*)))

(setq el-get-user-package-directory
      (expand-file-name "el-get/user/init-files" *emacs-config-directory*))

(el-get 'sync)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(flycheck-coffeelintrc "~/.emacs.d/coffeelint.json")
 '(package-selected-packages
   (quote
    (clojure-mode-extra-font-locking ac-cider clojure-mode cider helm-cider helm-cider-history helm helm-ag helm-company helm-ghc yard-mode yaml-mode web-mode smartparens slime-company slim-mode shm scss-mode scheme-complete sass-mode ruby-tools ruby-electric ruby-additional robe recentf-ext racket-mode popwin paredit org-bullets markdown-toc magit-annex js2-mode js-doc jade-mode init-loader hindent highlight-indentation helm-swoop helm-projectile helm-descbinds gist geiser flymake-coffee flycheck-elm evil enh-ruby-mode elm-mode direx csv-mode company-ghci company-ghc color-theme-solarized coffee-mode autopair auto-save-buffers-enhanced anzu ac-slime ac-helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
