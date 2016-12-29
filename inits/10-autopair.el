;;
;;
;; autopair
;;
;;
(require-or-install 'autopair)
(autopair-global-mode)

(defvar autopair-modes '(r-mode js-mode c++-mode arduino-mode))

(defvar not-autopair-modes '(ruby-mode enh-ruby-mode structured-haskell-mode haskell-mode clojure-mode clojurescript-mode))

(defun turn-on-autopair-mode () (autopair-mode 1))

(defun turn-off-autopair-mode () (autopair-mode -1))

(dolist (mode autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-on-autopair-mode))
(dolist (mode not-autopair-modes) (add-hook (intern (concat (symbol-name mode) "-hook")) 'turn-off-autopair-mode))
