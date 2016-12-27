(require-or-install 'solidity-mode)
(require-or-install 'flymake-solidity)



(add-hook 'solidity-mode-hook
          (lambda () (setq comment-start "//"
                      comment-end   "")))
