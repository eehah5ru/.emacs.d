(use-package cl-lib)

(cl-loop for (mode . ext) in '((emacs-lisp-mode . "\\.el$")
                            (lisp-mode . "\\.\\(cl\\|lisp\\)$")
                            (scheme-mode . "\\.scm$")
                            ;; (racket-mode . "\\.rkt$")
                            (clojure-mode . "\\.clj$")
                            (clojurescript-mode . "\\.cljs$")
                            (perl-model . "\\.\\(pl\\|t\\|psgi\\)$")
                            (go-mode . "\\.go$")
                            (yaml-mode . "\\.ya?ml$")
                            (js2-mode . "\\.js$")
                            (coffee-mode . "\\.coffee$")
                            (ruby-mode . "\\.rb$")
                            (org-mode . "\\.org$")
                            (css-mode . "\\.css$")
                            (less-css-mode . "\\.less$")
                            (markdown-mode . "\\.\\(md\\|markdown\\)$")
                            (hatena-diary-mode . "\\.htn$")
                            ;(web-mode . "\\.\\(htm\\|html\\)$")
                            )
      do (add-to-list 'auto-mode-alist (cons ext mode)))
