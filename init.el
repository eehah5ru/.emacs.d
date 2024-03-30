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

;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

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
;; (defvar *el-get-directory*
;;   (expand-file-name "el-get/el-get" *emacs-config-directory*))

;; (add-to-list 'load-path *el-get-directory*)

;; (unless (require 'el-get nil t)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (require 'el-get)

;; (setq el-get-recipe-path
;;       (list (expand-file-name "recipes" *el-get-directory*)
;;             (expand-file-name "el-get/user/recipes" *emacs-config-directory*)))

;; (setq el-get-user-package-directory
;;       (expand-file-name "el-get/user/init-files" *emacs-config-directory*))

;; (el-get 'sync)

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

(setq custom-file (expand-file-name "custom-vars.el" *emacs-config-directory*))

(when (file-exists-p custom-file)
  (load custom-file))
