;;
;;
;; tramp
;;
;;
;; (require 'tramp)
;; (setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

;; (use-package tramp-term
;;              :ensure t)

;; (use-package helm-tramp
;;              :ensure t)

(setq tramp-shell-prompt-pattern "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")

;;; speed up tramp by disabling remote VC
;;; from here: https://www.gnu.org/software/emacs/manual/html_node/tramp/Frequently-Asked-Questions.html
(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

;; (add-to-list 'backup-directory-alist
;;    (cons tramp-file-name-regexp nil))


(add-to-list 'tramp-remote-path 'tramp-own-remote-path)

(setq enable-remote-dir-locals t)

;; (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
