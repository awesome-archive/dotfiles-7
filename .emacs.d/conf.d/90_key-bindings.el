;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Key settings
;;;;;;;;;;;;;;;;;;;;;;;;;;

(keyboard-translate ?\C-h ?\C-?)
(add-hook 'after-make-frame-functions
          (lambda (f) (with-selected-frame f
                        (keyboard-translate ?\C-h ?\C-?)
                        )))

(setq kill-whole-line t)
(bind-key "M-k" 'copy-whole-line)

(bind-key "C-x C-k" 'kill-this-buffer)
(bind-key "C-x k" 'kill-this-buffer)

;; I never use C-x C-c
(bind-key "C-x C-c" 'nil)
(defalias 'exit 'save-buffers-kill-emacs)

(bind-key* "C-x C-q" 'delete-frame)
(bind-key* "M-g" 'goto-line)

;; vim 'd t' compatible
(bind-key "M-z" 'zap-up-to-char)
(bind-key "C-c ," 'er/expand-region)
(bind-key "M-j" 'join-line)

;; Japanese input
(bind-key* "C-j" 'mozc-start)
(bind-key "q" 'mozc-end mozc-mode-map)
(bind-key* "C-x C-s" 'save-buffer)

;; Application
(bind-key* "C-x g" 'magit-status)
(bind-key "M-y" 'browse-kill-ring)

;; Helm
(bind-key* "C-x C-b" 'helm-mini)
(bind-key* "M-x" 'helm-M-x)
(bind-key* "C-x p" 'helm-do-ag-project-root)
(bind-key* "C-x b" 'helm-do-ag-buffers)
(bind-key* "C-x f" 'helm-do-ag-this-file)
(bind-key* "C-x a" 'helm-do-ag)


(global-undo-tree-mode t)
(bind-key* "M-/" 'undo-tree-redo)
(bind-key* "C-c C-x" 'xclip-add-region)
(bind-key* "C-c C-r" 'mc/edit-lines)

;; open-junk
(bind-key "C-x j" 'open-junk-file)

(bind-key "C-c 0" 'org-shiftright)
