;;;
;;; provide path to solc binary
;;; it should be in the SOLC_BINARY ENV var
(if (not (getenv "TERM_PROGRAM"))
    (setq solidity-solc-path
          (shell-command-to-string "source $HOME/.zshrc && printf $SOLC_BINARY")))

(if (not solidity-solc-path)
    (message "you should set SOLC_BINARY in $HOME/.zshrc"))





;;;
;;; require necessary plugins
;;;
(require-or-install 'solidity-mode)
(require-or-install 'flymake-solidity)


;;;
;;; hooks
;;;
(add-hook 'solidity-mode-hook
          (lambda ()
            (setq comment-start "//"
                  comment-end   "")
            (flycheck-mode)))
