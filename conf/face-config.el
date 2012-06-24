(custom-set-variables
 ;; 主题 dhyana
 '(custom-enabled-themes '(dhyana))
 '(custom-safe-themes '("7d05c02577c008519e5e197281e34a809dbfd30d59c067fb7baaae5b0f7406cb" default))
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
