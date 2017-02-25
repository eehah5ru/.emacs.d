;;
;;
;; tramp
;;
;;
;; (require 'tramp)
;; (setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")

(require-or-install 'helm-tramp)
(setq tramp-shell-prompt-pattern "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")

;; (eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
