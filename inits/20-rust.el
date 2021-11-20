(let ((my-pathes (list
                  (expand-file-name "~/.cargo/bin"))))
  (setenv "PATH" (concat (mapconcat 'identity my-pathes ":")
                         ":"
                         (getenv "PATH")))
  (mapcar (lambda (x) (add-to-list 'exec-path x)) my-pathes))

(use-package rustic
  :ensure t)
