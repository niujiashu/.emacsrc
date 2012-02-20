(defun color-theme-dhyana ()
  "Color theme like lucius theme of vim"
  (interactive)
  (color-theme-install
   '(color-theme-dhyana
     ((background-mode . dark)
      (background-color . "#202020")
      (foreground-color . "#e0e0e0")
      (border-color . "#202020")
      (cursor-color . "#a3e3ed")
      ;; (mouse-color . "SteelBlue")
     )

     
     ;; (border ((t (:background "black"))))
     ;; (cursor ((t (:background "SteelBlue"))))
     ;; (mouse ((t (:background "SteelBlue"))))

     (scroll-bar ((t (:background "grey75"))))
     (tool-bar ((t (:background "grey75" :foreground "black" ))))
     (tooltip ((t (:background "lightyellow" :foreground "black"))))
     (menu ((t (nil))))

     (default ((t 
      (:stipple nil 
       :background "Black" 
       :foreground "SteelBlue" 
       :inverse-video nil 
       :box nil 
       :strike-through nil 
       :overline nil 
       :underline nil 
       :slant normal 
       :weight normal 
       :width semi-condensed 
       :family "misc-fixed"))))
     


     ;; 选中的部分
     (region ((t (:background "#364458"))))

     ;; 和背景色类似，但是在背景无法企及的地方，比如行号和文件内容之间的颜色
     (fringe ((t (:background "#202020"))))

     ;; 高亮
     (highlight ((t (:background "#66ffff"))))

     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (italic ((t (:italic t :slant italic))))
     (underline ((t (:underline t))))

     
     ; 内建函数、类
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     ; 定义的函数名
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     ; 关键词 defun if ...
     (font-lock-keyword-face ((t (:foreground "#b3d38c"))))
     ; 类名
     (font-lock-type-face ((t (:foreground "#93d6a9"))))
     ;; (font-lock-other-type-face ((t (:foreground "Blue"))))
     ; 变量名
     ;; (font-lock-variable-name-face ((t (:foreground "#e0e0e0"))))
     ; 警告文字
     (font-lock-warning-face ((t (:bold t :foreground "Red" :weight bold))))
     ; 常数
     (font-lock-constant-face ((t (:foreground "Aquamarine"))))
     ; 字符串，如果不设置 doc-face ，则文档颜色同
     (font-lock-string-face ((t (:foreground "#80c0d9"))))
     ; 预处理内容
     (font-lock-preprocessor-face ((t (:foreground "Aquamarine"))))
     ; 引用内容
     (font-lock-reference-face ((t (:foreground "LightSteelBlue"))))
     ; 注释
     (font-lock-comment-face ((t (:foreground "#606060"))))
     (font-lock-comment-delimiter-face ((t (:foreground "#606060"))))
     ; 代码内文档
     ;; (font-lock-doc-face ((t (:foreground "#80c0d9"))))
     ;; (font-lock-doc-string-face ((t (:foreground "#80c0d9"))))
     ; 否定
     (font-lock-negation-char-face ((t (nil))))
     ; 正则
     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
     

     
     ; 激活状态 buffer 的 mode line
     (mode-line ((t (:foreground "#e0e0e0" :background "#363946"))))
     ; 非激活状态的 buffer 的 mode line
     (mode-line-inactive ((t (:foreground "#767986" :background "#363946"))))
     ; 当前 buffer 名
     (mode-line-buffer-id ((t (:foreground "#e0e0e0" :background "#363946"))))
     ; 鼠标移到字上后的效果
     (mode-line-highlight ((t (:foreground "#b9fc6d"))))
     ; 强调的部分
     (mode-line-emphasis ((t (:bold t :weight bold))))
     ; 可点击的部分
     (mode-line-mousable ((t (:foreground "#e0e0e0" :background "#363946"))))
     (mode-line-mousable-minor-mode ((t (:foreground "#e0e0e0" :background "#363946"))))
     

     
     ; 强调的部分
     (minibuffer-noticeable-prompt ((t (:foreground "#777"))))
     (minibuffer-prompt ((t (:foreground "#777"))))
     

     
     (fixed-pitch ((t (:family "courier"))))
     (header-line ((t (:family "neep" :width condensed :box (:line-width 1 :style none) :background "grey20" :foreground "grey90" :box nil))))
     (primary-selection ((t (:background "blue3"))))
     (secondary-selection ((t (:background "SkyBlue4"))))
     (trailing-whitespace ((t (:background "red"))))
     (variable-pitch ((t (:family "helv"))))
     (zmacs-region ((t (:background "blue3"))))

     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))

     (isearch ((t (:background "palevioletred2" :foreground "brown4"))))
     (isearch-lazy-highlight-face ((t (:background "paleturquoise4"))))

     (widget-button-face ((t (:bold t :weight bold))))
     (widget-button-pressed-face ((t (:foreground "red"))))
     (widget-documentation-face ((t (:foreground "lime green"))))
     (widget-field-face ((t (:background "dim gray"))))
     (widget-inactive-face ((t (:foreground "light gray"))))
     (widget-single-line-field-face ((t (:background "dim gray"))))

     (message-cited-text-face ((t (:foreground "red"))))
     (message-header-cc-face ((t (:bold t :foreground "green4" :weight bold))))
     (message-header-name-face ((t (:foreground "DarkGreen"))))
     (message-header-newsgroups-face ((t (:italic t :bold t :foreground "yellow" :slant italic :weight bold))))
     (message-header-other-face ((t (:foreground "#b00000"))))
     (message-header-subject-face ((t (:foreground "green3"))))
     (message-header-to-face ((t (:bold t :foreground "green2" :weight bold))))
     (message-header-xheader-face ((t (:foreground "blue"))))
     (message-mml-face ((t (:foreground "ForestGreen"))))
     (message-separator-face ((t (:foreground "blue3"))))

     ;; 不知道为什么，这个会报 Wrong type argument 的错
     ;; ((display-time-mail-face . mode-line)
     ;;  (gnus-mouse-face . highlight)
     ;;  (gnus-summary-selected-face . gnus-summary-selected-face)
     ;;  (help-highlight-face . underline)
     ;;  (ispell-highlight-face . highlight)
     ;;  (list-matching-lines-face . bold)
     ;;  (view-highlight-face . highlight)
     ;;  (widget-mouse-face . highlight))
     

     
     (gnus-group-mail-1-empty-face ((t (:foreground "aquamarine1"))))
     (gnus-group-mail-1-face ((t (:bold t :foreground "aquamarine1" :weight bold))))
     (gnus-group-mail-2-empty-face ((t (:foreground "aquamarine2"))))
     (gnus-group-mail-2-face ((t (:bold t :foreground "aquamarine2" :weight bold))))
     (gnus-group-mail-3-empty-face ((t (:foreground "aquamarine3"))))
     (gnus-group-mail-3-face ((t (:bold t :foreground "aquamarine3" :weight bold))))
     (gnus-group-mail-low-empty-face ((t (:foreground "aquamarine4"))))
     (gnus-group-mail-low-face ((t (:bold t :foreground "aquamarine4" :weight bold))))

     (gnus-group-news-1-empty-face ((t (:foreground "PaleTurquoise"))))
     (gnus-group-news-1-face ((t (:bold t :foreground "PaleTurquoise" :weight bold))))
     (gnus-group-news-2-empty-face ((t (:foreground "turquoise"))))
     (gnus-group-news-2-face ((t (:bold t :foreground "turquoise" :weight bold))))
     (gnus-group-news-3-empty-face ((t (nil))))
     (gnus-group-news-3-face ((t (:bold t :weight bold))))
     (gnus-group-news-4-empty-face ((t (nil))))
     (gnus-group-news-4-face ((t (:bold t :weight bold))))
     (gnus-group-news-5-empty-face ((t (nil))))
     (gnus-group-news-5-face ((t (:bold t :weight bold))))
     (gnus-group-news-6-empty-face ((t (nil))))
     (gnus-group-news-6-face ((t (:bold t :weight bold))))
     (gnus-group-news-low-empty-face ((t (:foreground "DarkTurquoise"))))
     (gnus-group-news-low-face ((t (:bold t :foreground "DarkTurquoise" :weight bold))))

     (gnus-summary-cancelled-face ((t (:background "black" :foreground "yellow"))))
     (gnus-summary-high-ancient-face ((t (:bold t :foreground "SkyBlue" :weight bold))))
     (gnus-summary-high-read-face ((t (:bold t :foreground "PaleGreen" :weight bold))))
     (gnus-summary-high-ticked-face ((t (:bold t :foreground "pink" :weight bold))))
     (gnus-summary-high-unread-face ((t (:bold t :weight bold))))
     (gnus-summary-low-ancient-face ((t (:italic t :foreground "SkyBlue" :slant italic))))
     (gnus-summary-low-read-face ((t (:italic t :foreground "PaleGreen" :slant italic))))
     (gnus-summary-low-ticked-face ((t (:italic t :foreground "pink" :slant italic))))
     (gnus-summary-low-unread-face ((t (:italic t :slant italic))))
     (gnus-summary-normal-ancient-face ((t (:foreground "SkyBlue"))))
     (gnus-summary-normal-read-face ((t (:foreground "PaleGreen"))))
     (gnus-summary-normal-ticked-face ((t (:foreground "pink"))))
     (gnus-summary-normal-unread-face ((t (nil))))
     (gnus-summary-selected-face ((t (:underline t))))

     (gnus-splash-face ((t (:foreground "Brown"))))
     

     
     (erc-action-face ((t (:bold t :weight bold))))
     (erc-bold-face ((t (:bold t :weight bold))))
     (erc-dangerous-host-face ((t (:foreground "red"))))
     (erc-default-face ((t (nil))))
     (erc-direct-msg-face ((t (:foreground "IndianRed"))))
     (erc-error-face ((t (:background "Red" :foreground "White"))))
     (erc-fool-face ((t (:foreground "dim gray"))))
     (erc-input-face ((t (:foreground "brown"))))
     (erc-inverse-face ((t (:background "Black" :foreground "White"))))
     (erc-keyword-face ((t (:bold t :foreground "pale green" :weight bold))))
     (erc-notice-face ((t (:bold t :foreground "SlateBlue" :weight bold))))
     (erc-pal-face ((t (:bold t :foreground "Magenta" :weight bold))))
     (erc-prompt-face ((t (:bold t :background "lightBlue2" :foreground "Black" :weight bold))))
     (erc-timestamp-face ((t (:bold t :foreground "green" :weight bold))))
     (erc-underline-face ((t (:underline t))))

     (fg:erc-color-face0 ((t (:foreground "White"))))
     (fg:erc-color-face1 ((t (:foreground "black"))))
     (fg:erc-color-face2 ((t (:foreground "blue4"))))
     (fg:erc-color-face3 ((t (:foreground "green4"))))
     (fg:erc-color-face4 ((t (:foreground "red"))))
     (fg:erc-color-face5 ((t (:foreground "brown"))))
     (fg:erc-color-face6 ((t (:foreground "purple"))))
     (fg:erc-color-face7 ((t (:foreground "orange"))))
     (fg:erc-color-face8 ((t (:foreground "yellow"))))
     (fg:erc-color-face9 ((t (:foreground "green"))))
     (fg:erc-color-face10 ((t (:foreground "lightblue1"))))
     (fg:erc-color-face11 ((t (:foreground "cyan"))))
     (fg:erc-color-face12 ((t (:foreground "blue"))))
     (fg:erc-color-face13 ((t (:foreground "deeppink"))))
     (fg:erc-color-face14 ((t (:foreground "gray50"))))
     (fg:erc-color-face15 ((t (:foreground "gray90"))))

     (bg:erc-color-face0 ((t (:background "White"))))
     (bg:erc-color-face1 ((t (:background "black"))))
     (bg:erc-color-face2 ((t (:background "blue4"))))
     (bg:erc-color-face3 ((t (:background "green4"))))
     (bg:erc-color-face4 ((t (:background "red"))))
     (bg:erc-color-face5 ((t (:background "brown"))))
     (bg:erc-color-face6 ((t (:background "purple"))))
     (bg:erc-color-face7 ((t (:background "orange"))))
     (bg:erc-color-face8 ((t (:background "yellow"))))
     (bg:erc-color-face9 ((t (:background "green"))))
     (bg:erc-color-face10 ((t (:background "lightblue1"))))
     (bg:erc-color-face11 ((t (:background "cyan"))))
     (bg:erc-color-face12 ((t (:background "blue"))))
     (bg:erc-color-face13 ((t (:background "deeppink"))))
     (bg:erc-color-face14 ((t (:background "gray50"))))
     (bg:erc-color-face15 ((t (:background "gray90"))))
     
     
     ;; rst level face (inherit outline)
     (rst-level-1-face ((t (:inherit font-lock-function-name-face))))
     (rst-level-2-face ((t (:inherit font-lock-variable-name-face))))
     (rst-level-3-face ((t (:inherit font-lock-keyword-face))))
     (rst-level-4-face ((t (:inherit font-lock-comment-face))))
     (rst-level-5-face ((t (:inherit font-lock-type-face))))
     (rst-level-6-face ((t (:inherit font-lock-constant-face))))

     ;; org-mode 
     (org-hide ((t (:foreground "#202020"))))
)))

(provide 'color-theme-dhyana)