(custom-set-variables
 ;; 主题 dhyana
 '(custom-enabled-themes '(dhyana))
 '(custom-safe-themes (quote ("a31184e4bd946d561ba73fe91a08bc24ce00c47e9bbf683196b362e214613f78" default)))
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
