(require-extensions 'require
 (list 
  ;; Emacs Buffer 的标签
  'tabbar-config
  ;; 模仿 Vim 中 (.) 的功能
  'dot-mode
  ;; 给 buffer 上所有窗口编号
  'window-numbering
  ;; Change cursor smartly
  'cursor-change
  ;; 我 hack 过的 eldoc
  'eldoc
  ;; 王纯业 的 desktop
  'wcy-desktop
;  'thing-edit
;  'second-sel
;  'browse-kill-ring+
;  'bbdb
;  'gnuplot
;  'rect-mark
;  'multi-term
;  'lusty-explorer
;  'oddmuse
;  'emaci
;  'move-text
;  'uniquify
;  'hide-region
))

;; el-get
(setq el-get-dir elget-dir)
(setq el-get-sources
  '(
    (:name highlight-parentheses 
     :after (lambda ()
              (define-globalized-minor-mode global-highlight-parentheses-mode
                highlight-parentheses-mode
                (lambda ()
                  (highlight-parentheses-mode t)))
              (global-highlight-parentheses-mode t)))

    (:name paredit
     :after (lambda ()
              (add-hook 'emacs-lisp-mode-hook
                      (lambda () 
                        (paredit-mode t)))))

    (:name undo-tree
     :after (lambda ()
              (global-undo-tree-mode)))

    (:name buffer-move
     :after (lambda ()
              (global-set-key (kbd "<C-S-up>")     'buf-move-up)
              (global-set-key (kbd "<C-S-down>")   'buf-move-down)
              (global-set-key (kbd "<C-S-left>")   'buf-move-left)
              (global-set-key (kbd "<C-S-right>")  'buf-move-right)))

    (:name yasnippet 
     :after (lambda ()
              (yas/initialize)
              (yas/load-directory (concat el-get-dir "yasnippet/snippets"))))

    (:name emacs-w3m
     :after (lambda ()
              (eval-after-load 'w3m
                '(progn
                   (setq w3m-default-display-inline-images t)
                   (setq browse-url-browser-function 'w3m-browse-url)
                   (setq w3m-use-cookies t)
                   (setq w3m-use-title-buffer-name t)))))

    (:name slime
     :after (lambda ()
              (setq inferior-lisp-program "sbcl")
              (require 'slime-autoloads)
              (slime-setup)))

    (:name color-theme
     :after (lambda ()
              (load-file (concat emacs-rcdir "themes/color-theme-dhyana.el"))
              (color-theme-dhyana)))

    (:name sr-speedbar
     :after (lambda ()
              (defalias 'sb 'sr-speedbar-toggle)
              (sr-speedbar-toggle)))

))

;; eldoc
(setq eldoc-echo-area-use-multiline-p t)
(custom-set-faces
 '(eldoc-highlight-function-argument ((t (:inherit bold :foreground "green3")))))

;; wcy-desktop-setting
(wcy-desktop-init)
(add-hook 'emacs-startup-hook
          (lambda ()
            (ignore-errors
              (wcy-desktop-open-last-opened-files))))

(provide 'plugins-config)
