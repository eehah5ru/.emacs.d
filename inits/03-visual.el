(show-paren-mode t)

(use-package whitespace
             :ensure t)

;(use-package (intern "hl-line+")
;             :ensure t)

;(require-or-install 'whitespace)
;(require-or-install (intern "hl-line+"))
(set-face-foreground 'whitespace-space "DarkGoldenrod1")
(set-face-background 'whitespace-space nil)
(set-face-bold-p 'whitespace-space t)
(set-face-foreground 'whitespace-tab "DarkOliveGreen1")
(set-face-background 'whitespace-tab nil)
(set-face-underline 'whitespace-tab t)
(setq whitespace-style '(face tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
        (tab-mark ?\t [?\xBB ?\t])))

(global-whitespace-mode 1)
(column-number-mode t)
(setq-default line-spacing 0.1)

;;;
;;; font-size
;;;
(set-face-attribute 'default nil :height 160)


;;
;;
;; customize look'n'feel
;;
;;
;;(tooltip-mode      -1)
(menu-bar-mode     -1) ;; отключаем графическое меню
(tool-bar-mode     -1) ;; отключаем tool-bar
(scroll-bar-mode   -1) ;; отключаем полосу прокрутки
(blink-cursor-mode -1) ;; курсор не мигает
(setq use-dialog-box     nil) ;; никаких графических диалогов и окон - все через минибуфер
(setq redisplay-dont-pause t)  ;; лучшая отрисовка буфера
(setq ring-bell-function 'ignore) ;; отключить звуковой сигнал


;;
;;
;; line numbers
;;
;;
;; Linum plugin
(use-package linum
             :ensure t)

(require-or-install 'linum) ;; вызвать Linum
(line-number-mode   t) ;; показать номер строки в mode-line
(global-linum-mode  t) ;; показывать номера строк во всех буферах
(column-number-mode t) ;; показать номер столбца в mode-line
(setq linum-format " %d") ;; задаем формат нумерации строк


;;
;;
;; customization of line appereance
;;
;;
;; Fringe settings
(fringe-mode '(8 . 0)) ;; органичиталь текста только слева
(setq-default indicate-empty-lines t) ;; отсутствие строки выделить глифами рядом с полосой с номером строки
(setq-default indicate-buffer-boundaries 'left) ;; индикация только слева

;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-часовой временной формат в mode-line
(display-time-mode             t) ;; показывать часы в mode-line
(size-indication-mode          t) ;; размер файла в %-ах


;; Scrolling settings
(setq scroll-step               1) ;; вверх-вниз по 1 строке
(setq scroll-margin            10) ;; сдвигать буфер верх/вниз когда курсор в 10 шагах от верхней/нижней границы
(setq scroll-conservatively 10000)


;; Clipboard settings
(setq x-select-enable-clipboard t)


;; Highlight search results
(setq search-highlight        t)
(setq query-replace-highlight t)

;; Easy transition between buffers: M-arrow-keys
(if (equal nil (equal major-mode 'org-mode))
    (windmove-default-keybindings 'super))

;;; highlight current line
(global-hl-line-mode)



;;
;; cua mode
;;
;; (require-or-install 'cua)
(cua-mode 1)

;; (Global-Unset-Key (Kbd "C-c <timeout>"))

;; (Defface hlline-face
;;   '((((class color)
;;       (background dark))
;;      (:background "dark slate gray"))
;;     (((class color)
;;       (background light))
;;      (:background "ForestGreen"))
;;     (t
;;      ()))
;;   nil :group 'font-lock-highlighting-faces)
;; (setq hl-line-face 'hlline-face)

;; (loop for mode in '(undo-tree-mode auto-complete-mode whitespace-mode)
;;       do (assq-delete-all mode minor-mode-alist))



;; (setq eol-mnemonic-dos "(CRLF)"
;;       eol-mnemonic-mac "(CR)"
;;       eol-mnemonic-unix "(LF)")



;; (when window-system
;;   (server-start)
;;   (set-frame-parameter nil 'alpha 85)
;;   (menu-bar-mode -1)
;;   (tool-bar-mode -1)
;;   (toggle-scroll-bar nil))

;; ;;
;; ;; Japanese font

;; (defun set-jp-font (font)
;;   (when (display-graphic-p)
;;     (set-fontset-font
;;      (frame-parameter nil 'font)
;;      'japanese-jisx0208
;;      `(,font . "iso10646-1"))))

;; (when (mac-os-p)
;;   (add-hook 'window-setup-hook
;;             (lambda ()
;;               (custom-set-faces
;;                '(default ((t (:height 120 :family "Menlo")))))
;;               (set-jp-font "Hiragino Maru Gothic Pro"))))
