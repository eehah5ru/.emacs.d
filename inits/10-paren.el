(require-or-install 'paren)

;; (require 'smartparens-config)

(show-paren-mode 1)

;;;
;;; disable paren mode for buffer
;;;
(defun endless/locally-disable-show-paren ()
  (interactive)
  (setq-local show-paren-mode nil))

(defun endless/locally-enable-show-paren ()
  (interactive)
  (setq-local show-paren-mode 1))


;;;
;;; keep only basic show-paren mode support
;;;
(defun endless/locally-keep-only-basic-paren ()
  (interactive)
  (setq-local show-paren-data-function #'show-paren--default))
