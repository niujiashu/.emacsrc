;; * tabbar
(require 'tabbar)
(daemon-run (tabbar-mode t))

(custom-set-variables
 '(tabbar-home-button (quote (("[o]") "[X]")))
 '(tabbar-scroll-left-button (quote ((" <") " =")))
 '(tabbar-scroll-right-button (quote ((" >") " =")))
; '(tabbar-separator (quote (0.5)))
 '(tabbar-use-images nil))

;; the symbol around active tab
(setq tabbar-around-current-tab-left "[")
(setq tabbar-around-current-tab-right "]")

;; * face
(defmacro tabbar-customize-faces-macro (foreground background sforeground sbackground uforeground ubackground)
`(custom-set-faces
  '(tabbar-button-face ((t (:inherit tabbar-default-face))))
  '(tabbar-default-face ((((class color grayscale) (background dark)) (:background ,background :foreground ,foreground :height 1.0))))
  '(tabbar-selected-face ((t (:inherit tabbar-default-face :background ,sbackground :foreground ,sforeground))))
  '(tabbar-separator-face ((t (:inherit tabbar-default-face :height 0.5))))
  '(tabbar-unselected-face ((t (:inherit tabbar-default-face :background ,ubackground :foreground ,uforeground)))))
)

;; can custom tabber face
(tabbar-customize-faces-macro
 "gray50" ; foreground
 "gray15" ; background
 "gray60" ; selected foreground
 "gray25" ; selected background
 "gray50" ; unselected foreground
 "gray15" ; unselected background
)

;; * tabber 快捷键设置
(define-keys global-map
  `(
    ("C-M-;" tabbar-backward-group)
    ("C-M-'" tabbar-forward-group)
    ("C-;"   tabbar-backward)
    ("C-'"   tabbar-forward)
))

;; * group rules
(defun tabbar-buffer-groups (buffer)
  "自定义的 tabbar 分组策略"
  (with-current-buffer (get-buffer buffer)
    (cond
     ((string-equal "*magit" (substring (buffer-name) 0 6)) '("Magit"))
     ((member (buffer-name) '("*scratch*")) '("User"))
     ((string-equal "*" (substring (buffer-name) 0 1)) '("Common"))
     ((or (string-equal ".org" (substring (buffer-name) -4))
          (eq major-mode 'org-mode)) 
      '("Org"))
     (t '("User")))))

(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(provide 'tabbar-config)
