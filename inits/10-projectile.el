(use-package projectile
  :ensure t)

(use-package ag
  :ensure t)

;;;
;;;
;;; kill non all non project buffers
;;;
;;;
(defun modi/kill-non-project-buffers (&optional kill-special)
  "Kill buffers that do not belong to a `projectile' project.

With prefix argument (`C-u'), also kill the special buffers."
  (interactive "P")
  (let ((bufs (buffer-list (selected-frame))))
    (dolist (buf bufs)
      (with-current-buffer buf
        (let ((buf-name (buffer-name buf)))
          (when (or (null (projectile-project-p))
                    (and kill-special
                         (string-match "^\*" buf-name)))
            ;; Preserve buffers with names starting with *scratch or *Messages
            (unless (string-match "^\\*\\(\\scratch\\|Messages\\)" buf-name)
              (message "Killing buffer %s" buf-name)
              (kill-buffer buf))))))))

;;;
;;;
;;; kill all current project buffers
;;;
;;;
(defun modi/kill-project-buffers (&optional kill-special)
  "Kill buffers that do not belong to a `projectile' project.

With prefix argument (`C-u'), also kill the special buffers."
  (interactive "P")
  (let ((bufs (buffer-list (selected-frame))))
    (dolist (buf bufs)
      (with-current-buffer buf
        (let ((buf-name (buffer-name buf)))
          (when (projectile-project-p)
            ;; Preserve buffers with names starting with *scratch or *Messages
            (unless (string-match "^\\*\\(\\scratch\\|Messages\\)" buf-name)
              (message "Killing buffer %s" buf-name)
              (kill-buffer buf))))))))
