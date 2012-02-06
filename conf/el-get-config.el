(add-to-list 'load-path (concat elget-dir "el-get"))
(unless (require 'el-get nil t)
  (with-current-buffer 
    (url-retrieve-synchronously 
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el") 
    (end-of-buffer) 
    (eval-print-last-sexp)
  )
)

(setq my-packages
  (append
    '(;; local sources

      ;; base
      enclose ; 自动闭合对应标点
      folding ; 代码折叠
      htmlize ; 将当前的代码和高亮输出成 HTML
      package ; 包管理工具，ELPA
      doxymacs ; doxygen 风格的注释
      smart-tab ; tab
      sudo-save ; 可以使用 su 权限保存
      color-theme ; 配色方案
      yasnippet ; snippet
      switch-window ; 可视化的窗口选择
      auto-complete ; 自动补全
      auto-complete-yasnippet ; yasnippet 的自动补全
      highlight-parentheses ; 高亮对应的标点
      buffer-move ; 方便的移动 buffer
      undo-tree ; undo tree
      org-mode ; 我还是希望能够用上最新版本的 org-mode

      ;; project manager
      magit ; git 支持
      magithub ; github 支持

      ;; front
      html5 ; HTML5 支持
      haml-mode ; haml 支持
      hl-tags-mode ; 高亮对应的 html 标签
      zencoding-mode ; Zencoding 支持
      html-script-src ; 各大主流的 JavaScript 地址
      css-mode ; CSS 支持
      sass-mode ; Sass 支持
      scss-mode ; Scss 支持
      auto-complete-css ; CSS 补全
      coffee-mode ; CoffeeScirpt 支持
      js2-mode ; JavaScirpt 支持

      ;; coding
      slime ; Superior List Interaction Mode for Emacs
      ac-slime ; slime 补全
      ac-python ; Python 补全
      auto-complete-emacs-lisp ; Elisp 补全
      paredit ; 为了对付 Lisp 代码中无处不在的括号
      clojure-mode ; clojure 支持
      swank-clojure ; 让 slime 支持 clojure
      durendal ; A bucket of Emacs tricks for Clojure

      ;; mark language
      mustache-mode ; Mustache 模板语言支持
      markdown-mode ; Markdown 标记语言支持
      yaml-mode ; Yaml 标记语言支持
      ;rst-mode ; rst 标记语言支持， Emacs 23 内置

      ;; theme
      color-theme-zen-and-art

      ;; other
      erc ; irc 客户端
      gist ; 创建 gist
      g-client ; Google 服务客户端
      weblogger-el ; wordpress 本地客户端
      erc-highlight-nicknames ; irc 客户端的昵称高亮
      emacs-w3m ; w3m
      mingus ; MPD 前端
    )
    (mapcar 'el-get-source-name el-get-sources)
  )
)

(el-get 'sync my-packages)

(provide 'el-get-config)
