(deftheme dhyana "dhyana theme color")

(custom-theme-set-variables
 'dhyana
 '(ansi-color-names-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"]))

(custom-theme-set-faces
 'dhyana
 '(default ((t (:background "gray15" :foreground "#e0e0e0"))))
 '(border ((t (:background "gray15"))))
 '(menu ((t (:foreground "#dcdccc" :background "#3f3f3f"))))
 '(button ((t (:underline t))))
 '(cursor ((t (:foreground "#dcdccc"))))
 '(highlight ((t (:background "#383838"))))
 '(match ((t (:background "#2b2b2b" :foreground "#dfaf8f" :weight bold))))
 ;; 和背景色类似，但是在背景无法企及的地方，比如行号和文件内容之间的颜色
 '(fringe ((t (:background "gray15" :foreground "#dcdccc"))))
 ;; 选中区域
 '(region ((t (:background "#364458"))))
 ;; linum
 '(linum ((t (:background "gray15" :foreground "gray80"))))
 ;; 顶部栏
 '(header-line ((t (:family "neep" :width condensed :box (:line-width 1 :style none) :background "grey20" :foreground "grey90" :box nil))))
 
 '(lazy-highlight ((t (:foreground "#f0dfaf" :background "#5f5f5f"))))
 '(minibuffer-prompt ((t (:foreground "#f0dfaf"))))
 '(secondary-selection ((t (:background "#5f5f5f"))))
 '(trailing-whitespace ((t (:background "#cc9393"))))
 '(vertical-border ((t (:foreground "#dcdccc"))))

 '(show-paren-mismatch ((t (:foreground "#9c6363" :background "#3f3f3f" :weight bold))))
 '(show-paren-match ((t (:foreground "#7cb8bb" :background "#3f3f3f" :weight bold))))

 '(link ((t (:foreground "#f0dfaf" :underline t :weight bold))))
 '(link-visited ((t (:foreground "#d0bf8f" :underline t :weight normal))))

 '(compilation-info ((t (:foreground "#bfebbf" :underline t))))
 '(compilation-line-number ((t (:foreground "#f0dfaf"))))

 '(isearch ((t (:foreground "#f0dfaf" :background "#2b2b2b"))))
 '(isearch-fail ((t (:foreground "#dcdccc" :background "#8c5353"))))

 '(flymake-errline ((t (:foreground "#bc8383" :weight bold :underline t))))
 '(flymake-warnline ((t (:foreground "#e0cf9f" :weight bold :underline t))))

 '(ido-first-match ((t (:foreground "#f0dfaf" :weight bold))))
 '(ido-only-match ((t (:foreground "#dfaf8f" :weight bold))))
 '(ido-subdir ((t (:foreground "#f0dfaf"))))

 ;; 引用内容
 '(font-lock-reference-face ((t (:foreground "LightSteelBlue"))))
 ;; 内建函数、类
 '(font-lock-builtin-face ((t (:foreground "#729fcf"))))
 ;; '(font-lock-builtin-face ((t (:foreground "#8cd0d3"))))
 ;; 注释
 '(font-lock-comment-face ((t (:foreground "#606060"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#606060"))))
 ;; '(font-lock-comment-face ((t (:foreground "#7f9f7f"))))
 ;; '(font-lock-comment-delimiter-face ((t (:foreground "#7f9f7f"))))
 ;; 常数
 '(font-lock-constant-face ((t (:foreground "Aquamarine"))))
 ;; '(font-lock-constant-face ((t (:foreground "#bfebbf"))))
 ;; 代码内文档
 '(font-lock-doc-face ((t (:foreground "#80c0d9"))))
 '(font-lock-doc-string-face ((t (:foreground "#80c0d9"))))
 ;; '(font-lock-doc-face ((t (:foreground "#8fb28f"))))
 ;; 定义的函数名
 '(font-lock-function-name-face ((t (:foreground "#edd400"))))
 ;; '(font-lock-function-name-face ((t (:foreground "#8cd0d3"))))
 ;; 关键词 defun if ...
 '(font-lock-keyword-face ((t (:foreground "#b3d38c"))))
 ;; '(font-lock-keyword-face ((t (:foreground "#f0dfaf" :weight bold))))
 ;; 否定
 '(font-lock-negation-char-face ((t (nil))))
 ;; '(font-lock-negation-char-face ((t (:foreground "#dcdccc"))))
 ;; 预处理内容
 '(font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
 ;; '(font-lock-preprocessor-face ((t (:foreground "#8cd0d3"))))
 ;; 字符串，如果不设置 doc-face ，则文档颜色同
 '(font-lock-string-face ((t (:foreground "#80c0d9"))))
 ;; '(font-lock-string-face ((t (:foreground "#cc9393"))))
 ;; 类名
 '(font-lock-type-face ((t (:foreground "#93d6a9"))))
 '(font-lock-other-type-face ((t (:foreground "Blue"))))
 ;; '(font-lock-type-face ((t (:foreground "#8cd0d3"))))
 ;; 变量名
 '(font-lock-variable-name-face ((t (:foreground "#e0e0e0"))))
 ;; '(font-lock-variable-name-face ((t (:foreground "#dfaf8f"))))
 ;; 警告文字
 '(font-lock-warning-face ((t (:bold t :foreground "Red" :weight bold))))
 ;; '(font-lock-warning-face ((t (:foreground "#e0cf9f" :weight bold :underline t))))
 ;; 正则
 '(font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
 '(font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))

 ;; org-mode 
 '(org-hide ((t (:foreground "gray15"))))

 '(rst-level-1-face ((t (:foreground "#dfaf8f"))))
 '(rst-level-2-face ((t (:foreground "#8fb28f"))))
 '(rst-level-3-face ((t (:foreground "#7cb8bb"))))
 '(rst-level-4-face ((t (:foreground "#d0bf8f"))))
 '(rst-level-5-face ((t (:foreground "#93e0e3"))))
 '(rst-level-6-face ((t (:foreground "#5f7f5f"))))

 ;; 激活状态 buffer 的 mode line
 '(mode-line ((t (:foreground "#e0e0e0" :background "#363946" :box nil))))
 ;; 非激活状态的 buffer 的 mode line
 '(mode-line-inactive ((t (:foreground "#767986" :background "#363946"))))
 ;; 当前 buffer 名
 '(mode-line-buffer-id ((t (:foreground "#e0e0e0" :background "#363946"))))
 ;; 鼠标移到字上后的效果
 '(mode-line-highlight ((t (:foreground "#b9fc6d"))))
 ;; 强调的部分
 '(mode-line-emphasis ((t (:bold t :weight bold))))
 ;; 可点击的部分
 '(mode-line-mousable ((t (:foreground "#e0e0e0" :background "#363946"))))
 '(mode-line-mousable-minor-mode ((t (:foreground "#e0e0e0" :background "#363946"))))
)

(provide-theme 'dhyana)
