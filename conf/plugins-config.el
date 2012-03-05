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
  ;; 我做过一点小 hack 的 eldoc
  'eldoc
  ;; 王纯业 的 desktop
  'wcy-desktop
  ;; face
  'face-config
  ;; 
  'eval-after-load
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
              (define-keys global-map 
                `(
                  ([C-S-up]     buf-move-up)
                  ([C-S-down]   buf-move-down)
                  ([C-S-left]   buf-move-left)
                  ([C-S-right]  buf-move-right)
             ))))

    (:name yasnippet 
     :after (lambda ()
              (yas/initialize)
              (yas/load-directory (concat el-get-dir "yasnippet/snippets"))
              ;; (cons
              ;;                           (concat emacs-rcdir "snippets")))
              (yas/global-mode 1)))

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
              (defalias 'sb 'sr-speedbar-toggle)))

    (:name coffee-mode
     :after (lambda ()
              (define-keys coffee-mode-map
                `(
                  ("M-R" coffee-compile-region)
                  ("M-r" coffee-compile-buffer)
                  ("C-M-r" coffee-repl)
              ))))
    
    (:name multi-web-mode
     :after (lambda ()
              (setq mweb-default-major-mode 'html-mode)
              (setq mweb-tags '(;;(php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                                (js-mode "<script[\\( +\\)\\(type=\"text/javascript\"\\|language=\"javascript\"\\)]*[^>]*>" "</script>")
                                (css-mode "<style[\\( +type=\"text/css\"\\)]*[^>]*>" "</style>")))
              (setq mweb-filename-extensions '("htm" "html" "jsp"))))

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
