(defvar *emacs-config-directory* (file-name-directory load-file-name))

(setq debug-on-error t)

(require 'package)

;;;
;;; fix broken https
;;;
(when (and (version<  "25" emacs-version)
           (version< emacs-version "26.3"))
  ;; backport fix for https://debbugs.gnu.org/cgi/bugreport.cgi?bug=34341
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3"))

;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

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

;;;
;;; load inits-mail in env var EMACS_MAIL is set
;;;
(let ((inits (if (getenv "EMACS_MAIL")
                 "inits-mail/"
               "inits/")))
  (init-loader-load
   (expand-file-name inits *emacs-config-directory*)))


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

;;
;;
;; straight bootstrapping
;;
;;
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)


(custom-set-variables
 ;; custom-set-variables was added sdfby Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(company-ghc-show-info t)
 '(dash-at-point-legacy-mode t)
 '(flycheck-coffeelintrc "~/.emacs.d/coffeelint.json")
 '(haskell-interactive-mode-eval-pretty nil)
 '(haskell-interactive-mode-hide-multi-line-errors nil)
 '(haskell-interactive-mode-include-file-name nil)
 '(haskell-interactive-popup-errors nil)
 '(haskell-notify-p t)
 '(haskell-process-args-ghci 'nil)
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-do-cabal-format-string ":!cd %s && unset GHC_PACKAGE_PATH && %s")
 '(haskell-process-log t)
 '(haskell-process-reload-with-fbytecode nil)
 '(haskell-process-show-debug-tips nil)
 '(haskell-process-suggest-haskell-docs-imports t)
 '(haskell-process-suggest-hoogle-imports nil)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type 'stack-ghci)
 '(haskell-process-use-presentation-mode t)
 '(haskell-stylish-on-save nil)
 '(haskell-tags-on-save t)
 '(helm-follow-mode-persistent t)
 '(hindent-style "chris-done")
 '(org-agenda-files
   '("~/works/childrens-futures/childrensfutures-trade/docs/todo.org"))
 '(package-selected-packages
   '(po-mode sphinx-doc processing-2-mode helm-lsp elpy rainbow-mode nix-sandbox nix-haskell-mode nix-mode lsp-haskell lsp-ui lsp-mode smartparens dired-git helm-ls-git dante ag company-pollen pollen-mode dash-at-point graphviz-dot-mode hyperbole arduino-mode mutt-mode applescript-mode psgml mmm-mode ruby-end nvm whitespace-cleanup-mode markdown-mode-plus markdown-preview-mode markdown-mode+ muttrc-mode ssass-mode gnuplot gnuplot-mode hl-line+ hl-mode+ haskell-snippets outline-magic latex-extra company-auctex auctex nginx-mode helm-clojuredocs helm-tramp less-css-mode company-shell helm-mt multi-term flymake-solidity clojure-mode-extra-font-locking ac-cider clojure-mode cider helm-cider helm-cider-history helm helm-ag helm-company helm-ghc yard-mode slim-mode shm scss-mode scheme-complete sass-mode ruby-tools ruby-electric ruby-additional robe recentf-ext racket-mode popwin paredit org-bullets markdown-toc magit-annex js2-mode js-doc jade-mode init-loader hindent highlight-indentation helm-swoop helm-projectile helm-descbinds gist geiser flymake-coffee flycheck-elm evil enh-ruby-mode elm-mode direx csv-mode company-ghci company-ghc color-theme-solarized coffee-mode autopair auto-save-buffers-enhanced anzu ac-slime ac-helm))
 '(shm-auto-insert-bangs t)
 '(shm-auto-insert-skeletons t)
 '(shm-use-hdevtools t)
 '(shm-use-presentation-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
