(defconst emacs-rcdir "~/.emacsrc/")
(defconst elget-dir "~/.emacs.d/el-get/")

(add-to-list 'load-path emacs-rcdir)
(add-to-list 'load-path (concat emacs-rcdir "conf/"))

;; 一些小函数
(require 'macro-lisp)
;; 全局设定
(require 'global-setting)
;; el-get
(require 'el-get-config)
;; 插件配置
(require 'plugins-config)
;; Hook
(require 'hooks-setting)
;; 快捷键设置
(require 'kbd-setting)
;; Mode 开关
(require 'mode-config)
