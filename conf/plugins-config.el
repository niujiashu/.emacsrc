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
  ;; �� hack ���� eldoc
  'eldoc
  ;; ����ҵ �� desktop
  'wcy-desktop
;  'thing-edit
;  'second-sel
;  'browse-kill-ring+
;  'bbdb
;  'gnuplot
;  'muse-mode
;  'w3m-load
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

;; eldoc
(setq eldoc-echo-area-use-multiline-p t)
(custom-set-faces
 '(eldoc-highlight-function-argument ((t (:inherit bold :foreground "green3")))))

;; slime
(setq inferior-lisp-program "sbcl")
(require 'slime-autoloads)
(slime-setup)

;; color-theme �������
;(load-file "~/.emacs.d/plugins/themes/color-theme-colorful-obsolescence.el")
;(color-theme-colorful-obsolescence)
(load-file (concat emacs-rcdir "themes/color-theme-dhyana.el"))
(color-theme-dhyana)

;; YAsnippet ���������
(yas/initialize)
(yas/load-directory (concat el-get-dir "yasnippet/snippets"))

;; w3m �������
(eval-after-load 'w3m
  '(progn
     (setq w3m-default-display-inline-images t)
     (setq browse-url-browser-function 'w3m-browse-url)
     (setq w3m-use-cookies t)
     (setq w3m-use-title-buffer-name t)))

;; wcy-desktop-setting
(wcy-desktop-init)
(add-hook 'emacs-startup-hook
          (lambda ()
            (ignore-errors
              (wcy-desktop-open-last-opened-files))))

(provide 'plugins-config)
