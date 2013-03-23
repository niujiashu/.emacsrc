(require-extensions 'require
 (list 
  ;; Emacs Buffer �ı�ǩ
  'tabbar-config
  ;; ģ�� Vim �� (.) �Ĺ���
  'dot-mode
  ;; �� buffer �����д��ڱ��
  'window-numbering
  ;; Change cursor smartly
  'cursor-change
  ;; ������һ��С hack �� eldoc
  'eldoc
  ;; ����ҵ �� desktop
  'wcy-desktop
  ;; face
  'face-config
  ;; 
  'eval-after-load
  ;; ���󻯾��β�������
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
     :description "������Ӧ�ı��"
     :after (progn
              (define-globalized-minor-mode global-highlight-parentheses-mode
                highlight-parentheses-mode
                (lambda ()
                  (highlight-parentheses-mode t)))
              (global-highlight-parentheses-mode t)))
    ;; 
    (:name buffer-move
     :description "������ƶ� buffer"
     :after (progn
              (define-keys global-map 
                `(
                  ([C-S-up]     buf-move-up)
                  ([C-S-down]   buf-move-down)
                  ([C-S-left]   buf-move-left)
                  ([C-S-right]  buf-move-right)
             ))))

    (:name auto-complete
     :description "�Զ���ȫ"
     :after (progn
              ;; (global-auto-complete-mode t)
              (setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
              (add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
              (add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
              ;; (set-face-background 'ac-candidate-face "lightgray")
              ;; (set-face-underline 'ac-candidate-face "darkgray")
              ;; (set-face-background 'ac-selection-face "steelblue") ;; ����һ�����ÿ��ı�����ɫ
              ;; (define-key ac-completing-map "\M-n" 'ac-next)       ;; �б���ͨ����M-n�������ƶ�
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
     :description "CoffeeScirpt ֧��"
     :after (progn
              (define-keys coffee-mode-map
                `(
                  ("M-R" coffee-compile-region)
                  ("M-r" coffee-compile-buffer)
                  ("C-M-r" coffee-repl)
              ))))

    ;; lisp
    (:name paredit
     :description "Ϊ�˶Ը� Lisp �������޴����ڵ�����"
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
    ;;  :description "w3m �� Emacs ǰ��"
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
    ;;  :description "�� speedbar ��ʾ�� frame �������������һ������"
    ;;  :after (progn
    ;;           (defalias 'sb 'sr-speedbar-toggle)))

    ;; (:name multi-web-mode
    ;;  :description "��� major mode"
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
