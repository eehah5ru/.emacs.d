;; (require-or-install 'psgml)

;; (require-or-install 'mmm-mode)

;; (setq mmm-global-mode 'maybe)

;; (mmm-add-mode-ext-class 'web-mode "\\.php3?\\'" 'html-php)
;; (mmm-add-mode-ext-class 'web-mode "\\.php?\\'" 'html-php)

;; (mmm-add-classes
;;  '((html-php
;;     :submode php-mode
;;     :front "<\\?\\(php\\)?"
;;     :back "\\?>")))
;; (autoload 'php-mode "php-mode" "PHP editing mode" t)

(use-package web-mode
  :config
  (setq web-mode-engines-alist '(("php" . "\\.html\\'"))))

(add-to-list 'auto-mode-alist '("\\.php3?\\'" . web-mode) t)
(add-to-list 'auto-mode-alist '("\\.php?\\'" . web-mode) t)


