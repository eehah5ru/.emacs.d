(defvar --backup-directory (concat user-emacs-directory "backups"))

(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))

(setq backup-directory-alist `(("." . ,--backup-directory)))

(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(setq auto-save-file-name-transform
      `((".*" ,temporary-file-directory t)))

(setq create-lockfiles nil)

;; (setq backup-directory-alist
;;       `((".*" . ,"~/.emacs.d/tmp")))

;; (setq auto-save-file-name-transforms
;;       `((".*" ,"~/.emacs.d/tmp" t)))

;; (setq delete-old-versions t
;;   kept-new-versions 6
;;   kept-old-versions 2
;;   version-control t)

(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
