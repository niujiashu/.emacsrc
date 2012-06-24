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
  '(
    (:name highlight-parentheses 
     :after (progn
              (define-globalized-minor-mode global-highlight-parentheses-mode
                highlight-parentheses-mode
                (lambda ()
                  (highlight-parentheses-mode t)))
              (global-highlight-parentheses-mode t)))

    (:name paredit
     :after (progn
              (add-hook 'emacs-lisp-mode-hook
                      (lambda ()
                        (paredit-mode t)))))

    ;; (:name undo-tree
    ;;  :type git
    ;;  :url "https://github.com/emacsmirror/undo-tree.git"
    ;;  :prepare (progn
    ;;             (autoload 'undo-tree-mode "undo-tree.el"
    ;;               "Undo tree mode; see undo-tree.el for details" t)
    ;;             (autoload 'global-undo-tree-mode "undo-tree.el"
    ;;               "Global undo tree mode" t))
    ;;  :after (progn
    ;;           (lambda ()
    ;;             (global-undo-tree-mode))))

    (:name buffer-move
     :after (progn
              (define-keys global-map 
                `(
                  ([C-S-up]     buf-move-up)
                  ([C-S-down]   buf-move-down)
                  ([C-S-left]   buf-move-left)
                  ([C-S-right]  buf-move-right)
             ))))

    (:name yasnippet
     :after (progn
              (yas/initialize)
              (yas/load-directory (concat rc-dir "snippets"))
              (yas/global-mode 1)))

    (:name emacs-w3m
     :after (progn
              (eval-after-load 'w3m
                '(progn
                   (setq w3m-default-display-inline-images t)
                   (setq browse-url-browser-function 'w3m-browse-url)
                   (setq w3m-use-cookies t)
                   (setq w3m-use-title-buffer-name t)))))

    (:name slime
     :after (progn
              (setq inferior-lisp-program "sbcl")
              (require 'slime-autoloads)
              (slime-setup)))

    ;; (:name color-theme
    ;;  :after (progn
    ;;           (load-file (concat rc-dir "themes/dhyana-theme.el"))
    ;;           (color-theme-dhyana)))

    ;; (:name sr-speedbar
    ;;  :after (progn
    ;;           (defalias 'sb 'sr-speedbar-toggle)))

    (:name coffee-mode
     :after (progn
              (define-keys coffee-mode-map
                `(
                  ("M-R" coffee-compile-region)
                  ("M-r" coffee-compile-buffer)
                  ("C-M-r" coffee-repl)
              ))))
    
    ;; (:name multi-web-mode
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

(provide 'plugins-config)
