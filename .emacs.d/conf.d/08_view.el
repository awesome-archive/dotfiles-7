;;;;;;;;;;;;;;;;;;;;;;;;;;
;; View
;;;;;;;;;;;;;;;;;;;;;;;;;;

; Don't show tool-bar and menu-bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-linum-mode t)
(setq linum-format "%4d ")
(set-face-attribute 'linum nil
                    :foreground "#ccc"
                    :background "Gray23")

;; Hilight current line
(global-hl-line-mode)
(set-face-background 'hl-line "Gray23")
(set-face-foreground 'highlight nil)

;; カーソル位置の桁数をモードライン行に表示する
(column-number-mode 1)

;; スクロールバー非表示
(scroll-bar-mode 0)