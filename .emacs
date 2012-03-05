(defconst emacs-rcdir "~/.emacsrc/")
(defconst emacs-confdir (concat emacs-rcdir "conf/"))
(defconst elget-dir "~/.emacs.d/el-get/")

(add-to-list 'load-path emacs-rcdir)
(add-to-list 'load-path emacs-confdir)

;; 一些小函数
(require 'macro-lisp)
;; 全局设定
(require 'global-setting)
;; 插件配置
(require 'plugins-config)
;; el-get
(require 'el-get-config)
;; Hook
(require 'hooks-setting)
;; 快捷键设置
(require 'kbd-setting)
;; Mode 开关
(require 'mode-config)

;; (defun load-files (&rest files-lists)
;;   (dolist (files-list files-lists)
;;     (let ((root-path (symbol-value (car files-list)))
;;           (names-list (cdr files-list)))
;;       (print root-path names-list)
;;       ;; (dolist (name names-list)
;;       ;;   (load (concat root-path name)))
;; )
;; )
;; )

;; (load-files 
;;  `(emacs-rcdir "macro-lisp.el")
;;  `(emacs-confdir 
;;   (
;;    "global-setting.el" 
;;    "plugins-setting.el"
;;    "el-get-config.el" 
;;    "hooks-setting.el"
;;    "kbd-setting.el"
;;    "mode-config.el"
;;    ))
;; )
