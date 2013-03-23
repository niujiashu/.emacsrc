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
  ;; 形象化矩形操作区域
  'rect-mark
;  'thing-edit
;  'second-sel
;  'browse-kill-ring+
;  'bbdb
;  'gnuplot
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
  '(;; base
    (:name highlight-parentheses 
     :description "高亮对应的标点"
     :after (progn
              (define-globalized-minor-mode global-highlight-parentheses-mode
                highlight-parentheses-mode
                (lambda ()
                  (highlight-parentheses-mode t)))
              (global-highlight-parentheses-mode t)))
    ;; 
    (:name buffer-move
     :description "方便的移动 buffer"
     :after (progn
              (define-keys global-map 
                `(
                  ([C-S-up]     buf-move-up)
                  ([C-S-down]   buf-move-down)
                  ([C-S-left]   buf-move-left)
                  ([C-S-right]  buf-move-right)
             ))))

    (:name auto-complete
     :description "自动补全"
     :after (progn
              ;; (global-auto-complete-mode t)
              (setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
              (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
              (add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
              ;; (set-face-background 'ac-candidate-face "lightgray")
              ;; (set-face-underline 'ac-candidate-face "darkgray")
              ;; (set-face-background 'ac-selection-face "steelblue") ;; 设置一个更好看的背景颜色
              ;; (define-key ac-completing-map "\M-n" 'ac-next)       ;; 列表中通过按M-n来向下移动
              ;; (define-key ac-completing-map "\M-p" 'ac-previous)
              ;; (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
              (setq ac-auto-start t)
              (setq ac-dwim t)))

    ;; (:name yasnippet
    ;;  :after (progn
    ;;           (yas/initialize)
    ;;           (yas/load-directory (concat rc-dir "snippets"))
    ;;           (yas/global-mode 1)))

    ;; front
    (:name coffee-mode
     :description "CoffeeScirpt 支持"
     :after (progn
              (define-keys coffee-mode-map
                `(
                  ("M-R" coffee-compile-region)
                  ("M-r" coffee-compile-buffer)
                  ("C-M-r" coffee-repl)
              ))))

    ;; lisp
    (:name paredit
     :description "为了对付 Lisp 代码中无处不在的括号"
     :after (progn
              (add-hook 'emacs-lisp-mode-hook
                      (lambda ()
                        (paredit-mode t)))
              (add-hook 'lisp-mode-hook
                      (lambda ()
                        (paredit-mode t)))))

    (:name slime
     :description "Superior List Interaction Mode for Emacs"
     :after (progn
              (setq inferior-lisp-program "sbcl")
              (require 'slime-autoloads)
              (slime-setup)))

    ;; front
    (:name css-mode :type elpa)

    ;; Ruby
    ;; (:name ruby-mode
    ;;  :type elpa
    ;;  :load "ruby-mode.el")

    (:name inf-ruby :type elpa)

    (:name ruby-compilation :type elpa)

    ;; (:name rvm
    ;;  :type git
    ;;  :url "http://github.com/djwhitt/rvm.el.git"
    ;;  :load "rvm.el"
    ;;  :compile ("rvm.el")
    ;;  :after (progn () (rvm-use-default)))

    ;; other
    ;; (:name emacs-w3m
    ;;  :description "w3m 的 Emacs 前端"
    ;;  :after (progn
    ;;           (eval-after-load 'w3m
    ;;             '(progn
    ;;                (setq w3m-default-display-inline-images t)
    ;;                (setq browse-url-browser-function 'w3m-browse-url)
    ;;                (setq w3m-use-cookies t)
    ;;                (setq w3m-use-title-buffer-name t)))))

    (:name undo-tree
     :type git
     :url "https://github.com/emacsmirror/undo-tree.git"
     :prepare (progn
                (autoload 'undo-tree-mode "undo-tree.el"
                  "Undo tree mode; see undo-tree.el for details" t)
                (autoload 'global-undo-tree-mode "undo-tree.el"
                  "Global undo tree mode" t))
     :after (progn
              (global-undo-tree-mode)
              (lambda ())))

    ;; (:name sr-speedbar
    ;;  :description "让 speedbar 显示在 frame 而不是另外出现一个窗口"
    ;;  :after (progn
    ;;           (defalias 'sb 'sr-speedbar-toggle)))

    ;; (:name multi-web-mode
    ;;  :description "多个 major mode"
    ;;  :after (progn
    ;;           (setq mweb-default-major-mode 'html-mode)
    ;;           (setq mweb-tags '(;;(php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
    ;;                             (js-mode "<script[\\( +\\)\\(type=\"text/javascript\"\\|language=\"javascript\"\\)]*[^>]*>" "</script>")
    ;;                             (css-mode "<style[\\( +type=\"text/css\"\\)]*[^>]*>" "</style>")))
    ;;           (setq mweb-filename-extensions '("htm" "html" "jsp"))))

))

;; RSence
(setq rsense-home (expand-file-name "~/.RSense"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(require 'rsense)
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))
;; Complete by C-c .
(add-hook 'ruby-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'ac-complete-rsense)))

;; eldoc
(setq eldoc-echo-area-use-multiline-p t)

;; wcy-desktop-setting
(wcy-desktop-init)
(add-hook 'emacs-startup-hook
          (lambda ()
            (ignore-errors
              (wcy-desktop-open-last-opened-files))))

;; coffee-mode
(setq coffee-tab-width 2)

(provide 'plugins-config)
