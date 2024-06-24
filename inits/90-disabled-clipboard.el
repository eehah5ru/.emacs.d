;;;
;;;
;;; working around hanging clipboard on X in vagrant
;;; from here: https://superuser.com/questions/231667/deleting-slow-on-x11-emacs
;;; minor mode from here:
;;; https://www.reddit.com/r/emacs/comments/dh9gq6/project_specific_commands/
;;;

;;;autoload

(define-minor-mode disabled-clipboard-mode
  nil
  :lighter " -clpbrd"
  ;; :keymap (let ((map (make-sparse-keymap)))
  ;;           (define-key map (kbd "s-x x") 'function-1)
  ;;           (define-key map (kbd "s-x c") 'function-2)
  ;;           (define-key map (kbd "s-x e") 'function-3)
  ;;           map)
  :after-hook (lambda ()
                (setq interprogram-cut-function nil)
                (setq interprogram-paste-function nil))
  )

;; (defun project-init-functions ()
;;   (interactive)
;;   (nyan-mode 1)
;;   (setq mode-line-format nil)
;;   (function-2))
