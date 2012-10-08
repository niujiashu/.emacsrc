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
      enclose ; 自动闭合对应标点
      switch-window ; 可视化的窗口选择
      highlight-parentheses ; 高亮对应的标点
      ;; doxymacs ; doxygen 风格的注释
      ;; auto-complete-yasnippet ; yasnippet 的自动补全
      ;; org-mode ; 我还是希望能够用上最新版本的 org-mode ，可惜 clone 实在是太慢了
      ;; smart-tab ; tab
      ;; folding ; 代码折叠
      ;; sudo-save ; 可以使用 su 权限保存
      ;; vimpulse ; 为 Emacs 增加 Vim 的有用特性，比如可视模式

      ;; project manager
      magit ; git 支持
      magithub ; github 支持

      ;; front
      haml-mode ; haml 支持
      hl-tags-mode ; 高亮对应的 html 标签
      html-script-src ; 各大主流的 JavaScript 地址
      sass-mode ; Sass 支持
      scss-mode ; Scss 支持
      auto-complete-css ; CSS 补全
      js2-mode ; JavaScirpt 支持
      ;; html5 ; HTML5 支持
      zencoding-mode ; Zencoding 支持

      ;; Lisp
      ac-slime ; slime 补全
      auto-complete-emacs-lisp ; Elisp 补全
      clojure-mode ; clojure 支持
      swank-clojure ; 让 slime 支持 clojure
      durendal ; A bucket of Emacs tricks for Clojure

      ;; Python
      ;; ac-python ; Python 补全
      ;; python-pep8 ; minor mode for running `pep8'
      ;; virtualenv ; Virtualenv for Python

      ;; Ruby
      Enhanced-Ruby-Mode ; for ruby 1.9
      flymake-ruby ; flymake
      rails-el ; for editing Ruby On Rails code
      ruby-block ; Highlight matching block
      ruby-end ; Emacs minor mode for automatic insertion of end blocks for Ruby

      ;; ;; mark language
      mustache-mode ; Mustache 模板语言支持
      markdown-mode ; Markdown 标记语言支持
      yaml-mode ; Yaml 标记语言支持

      ;; ;; other
      erc ; irc 客户端
      erc-highlight-nicknames ; irc 客户端的昵称高亮
      ;; pkgbuild-mode ; PKGBUILD file support
      ;; gist ; 创建 gist
      ;; weblogger-el ; wordpress 本地客户端
      ;; mingus ; MPD 前端
    )
    (mapcar 'el-get-source-name el-get-sources)
  )
)

(el-get 'sync my-packages)

(provide 'el-get-config)
