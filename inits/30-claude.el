;; Load PATH from shell
(use-package exec-path-from-shell
             :ensure t
             :if (memq window-system '(mac ns x))
             :config (exec-path-from-shell-initialize))

;; Git Interface
;; (use-package magit
;;   :ensure t
;;   :bind ("C-x g" . magit-status))

;; terminal Backend
;; (use-package vterm
;;   :ensure t)

(use-package ghostel
             :ensure t)

;; Claude Code Agent Setup
;; (use-package claude-code-ide
;;   :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
;;   :bind ("C-c c" . claude-code-ide-menu)
;;   :config
;;   (setq claude-code-ide-terminal-backend 'ghostel)
;;   (setq claude-code-ide-enable-mcp-server t)
;;   (claude-code-ide-emacs-tools-setup))

(use-package claude-code-ide
             :straight (:type git :host github :repo "manzaltu/claude-code-ide.el")
             :bind ("C-c C-'" . claude-code-ide-menu) ; Set your favorite keybinding
             :config
             (claude-code-ide-emacs-tools-setup))
