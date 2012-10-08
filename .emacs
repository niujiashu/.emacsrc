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

(defun load-files (&rest files-lists)
  (dolist (files-list files-lists)
    (let ((root-path (symbol-value (car files-list)))
          (names-list (cdr files-list)))
      (dolist (name names-list)
        (load (concat root-path name))))))

(load-files
 ;; 一些小函数
 `(rc-dir "macro-lisp.el")
 `(conf-dir 
   ;; 全局设定
   "global-setting.el"
   ;; 插件配置
   "plugins-config.el"
   ;; el-get
   "el-get-config.el"
   ;; Hook
   "hooks-setting.el"
   ;; 快捷键设置
   "kbd-setting.el"
   ;; Mode 开关
   "mode-config.el"
   ;; 界面相关设置
   "face-config.el"
   )
 )
