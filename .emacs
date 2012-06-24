;; .emacs.d 文件地址
(defconst rc-dir "~/.emacsrc/")
;; emacs 配置文件地址
(defconst conf-dir (concat rc-dir "conf/"))
;; el-get 安装地址
(defconst elget-dir "~/.emacs.d/el-get/")
;; 配色地址
(defconst theme-dir (concat rc-dir "theme/"))

(add-to-list 'load-path rc-dir)
(add-to-list 'load-path conf-dir)

;; ;; 一些小函数
;; (require 'macro-lisp)
;; ;; 全局设定
;; (require 'global-setting)
;; ;; 插件配置
;; (require 'plugins-config)
;; ;; el-get
;; (require 'el-get-config)
;; ;; Hook
;; (require 'hooks-setting)
;; ;; 快捷键设置
;; (require 'kbd-setting)
;; ;; Mode 开关
;; (require 'mode-config)

(defun load-files (&rest files-lists)
  (dolist (files-list files-lists)
    (let ((root-path (symbol-value (car files-list)))
          (names-list (cdr files-list)))
      (dolist (name names-list)
        (load (concat root-path name))))))

(load-files 
 `(rc-dir "macro-lisp.el")
 `(conf-dir 
   "global-setting.el" 
   "plugins-config.el"
   "el-get-config.el" 
   "hooks-setting.el"
   "kbd-setting.el"
   "mode-config.el"
   "face-config.el"
   )
 )
