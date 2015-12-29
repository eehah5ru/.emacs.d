(require-or-install 'wdired)
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)))

(require-or-install 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

;; (evil-declare-key 'normal direx:direx-mode-map (kbd "RET") 'direx:maybe-find-item)

(setq dired-recursive-copies (quote always)) ; “always” means no asking
(setq dired-recursive-deletes (quote top)) ; “top” means ask once
(setq dired-dwim-target t) ; copy from one dired dir to the next dired dir shown in a split window
