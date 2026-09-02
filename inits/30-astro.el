;;;
;;; astro website generator
;;;

;;; major mode
;; (use-package astro-ts-mode
;;              :vc (:url "https://git.isincredibly.gay/srxl/astro-ts-mode" :rev :newest)
;;              :mode "\\.astro\\'")

;; (use-package astro-ts-mode
;;   :vc (:url "https://github.com/Sorixelle/astro-ts-mode" :rev :newest)
;;   :mode "\\.astro\\'"
;;   :init
;;   (with-eval-after-load 'treesit
;;     (dolist (grammar
;;              '((astro "https://github.com/virchau13/tree-sitter-astro")
;;                (css   "https://github.com/tree-sitter/tree-sitter-css")
;;                (tsx   "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))
;;       (add-to-list 'treesit-language-source-alist grammar))))

;;;
;;; astro el version 3.x
;;;
(use-package astro-ts-mode
             ;; :vc (:url "https://github.com/Sorixelle/astro-ts-mode" :rev :newest)
             :mode "\\.astro\\'"
             :init
             (with-eval-after-load 'treesit
               (dolist (grammar
                        '((astro      "https://github.com/virchau13/tree-sitter-astro")
                          (css        "https://github.com/tree-sitter/tree-sitter-css")
                          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
                          (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))
                 (add-to-list 'treesit-language-source-alist grammar))))

;;;
;;; astro el version 2.x
;;;
;; (use-package astro-ts-mode
;;              :vc (:url "https://github.com/Sorixelle/astro-ts-mode" :rev "v2.0.2")
;;              :mode "\\.astro\\'"
;;              :init
;;              (with-eval-after-load 'treesit
;;                (dolist (grammar
;;                         '((astro      "https://github.com/virchau13/tree-sitter-astro")
;;                           (css        "https://github.com/tree-sitter/tree-sitter-css")
;;                           (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
;;                           (tsx        "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")))
;;                  (add-to-list 'treesit-language-source-alist grammar))))

;;; install grammars if missing
(dolist (lang '(astro css typescript tsx))
  (unless (treesit-language-available-p lang)
    (treesit-install-language-grammar lang)))

;;; install LSP
(use-package eglot
             :ensure nil
             :straight nil
             :hook (astro-ts-mode . eglot-ensure)
             :config
             (add-to-list 'eglot-server-programs
                          '(astro-ts-mode . ("astro-ls" "--stdio"
                                             :initializationOptions
                                             (:typescript (:tsdk "./node_modules/typescript/lib"))))))

(use-package apheleia
             :ensure t
             :config
             (add-to-list 'apheleia-mode-alist '(astro-ts-mode . prettier))
             (setf (alist-get 'prettier apheleia-formatters)
                   '("prettier" "--parser=astro"))
             (apheleia-global-mode +1))
