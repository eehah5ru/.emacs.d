;;;
;;;
;;; docs https://opensourcelibs.com/lib/terminal-here
;;;
(use-package terminal-here
  :ensure t

  :bind (("C-<f5>" . terminal-here-launch)
         ("C-<f6>" . terminal-here-project-launch)))
