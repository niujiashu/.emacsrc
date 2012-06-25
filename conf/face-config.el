(custom-set-variables
 ;; 主题 dhyana
 '(custom-enabled-themes '(dhyana))
 '(custom-safe-themes (quote ("bf7c796d293fbc2e30bc5ad050c56a74b8fac3da72eeed85b8fa232d24495847" default)))
 ;; 配色方案载入地址
 '(custom-theme-load-path '(custom-theme-directory t "~/.emacsrc/themes"))
 ;; 不显示菜单栏
 '(menu-bar-mode nil)
 ;; 不显示工具栏
 '(tool-bar-mode nil)
 ;; eldoc 高亮参数的颜色
 '(eldoc-highlight-function-argument ((t (:inherit bold :foreground "green3"))))
)

(provide 'face-config)
