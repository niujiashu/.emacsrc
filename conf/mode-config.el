;; -*- Emacs-Lisp -*-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Mode 开关
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; 外观

;; 控制是否显示行号和内容容器直接的间隔
(set-fringe-style t)

;; 控制 tip 是否在 minibuffer 显示（-1 为显示）
(tooltip-mode t)

;; 没有 toolbar
(tool-bar-mode -1)

;; 没有 menubar,用 f12 呼出
(menu-bar-mode -1)

;; 光标不闪，不恍花眼睛
;; (daemon-run )
(blink-cursor-mode -1)
(transient-mark-mode t)

;;括号匹配时显示另外一边的括号，而不是烦人的跳到另一个括号。
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;;让 Emacs 可以直接打开和显示图片。
(auto-image-file-mode t)

;;显示列号
(column-number-mode t)

;; 没有滚动条 24.1
(scroll-bar-mode -1)

;; number window 给 buffer 上所有窗口编号
(window-numbering-mode t)

;; 行号 emacs23 支持
(global-linum-mode t)

;;光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;; Change cursor smartly
(cursor-change-mode t)


;;;; 其他
;; folding
;; (folding-mode t)

;; 自动闭合标点
(enclose-global-mode t)

;;语法加亮
(global-font-lock-mode t)

;; ido-mode,强化 C+x C+f
(ido-mode t)

;; 打开就启用 text 模式
(set-default major-mode 'text-mode)

(delete-selection-mode -1)
(setq-default indent-tabs-mode nil)

(provide 'mode-config)
