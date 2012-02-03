;; * require-extensions
(defun require-extensions (action lst)
  "require plugins of list

\(fn 'require '(aaa bbb ccc ...))"
  (mapcar (lambda(ext)
    (funcall action ext)) lst))

;; 批量映射快捷键
;; TODO: 测试第二第三种定义方式是否完成
(defun define-keys (keymap key-defs &optional group)
  "\(define-keys global-map '((\"C-a\" 'some-command) (\"C-b\" 'another-command)))
\(define-keys global-map '(\"a\" \"b\" \"c\" ...) 'group-command)
\(define-keys global-map '(\"a\" (\"C-a\" 'some-command)) 'group-command)

See also `def-keys'."
  (let ((def-key (lambda (key func-or-command)
                   (define-key keymap (eval `(kbd ,key)) func-or-command))))
    (dolist (key-def key-defs)
      (if (listp key-def)
          (funcall def-key (car key-def) (nth 1 key-def))
          (when (not (eq group nil))
                (funcall def-key key-def group))))))

;; 如果是在 emacs-daemon 下，则在 after-make-frame-functions 事件后运行函数
;; (defmacro daemon-run (func &rest args)
;;   "run func `after-make-frame-functions' if emacs in daemon mode

;; \(fn 'any-func [some-args])"
;;   `(if (and (fboundp 'daemonp) (daemonp))
;;       (add-hook 'after-make-frame-functions
;;                 (lambda (frame)
;;                   (with-selected-frame frame
;;                     (apply ,func ',args))))
;;      (apply ,func ',args)))

;; 真是讨厌 Elisp 不支持闭包啊……
(defun eval-body (body)
  "eval form like ((some-func) (some-func1))"
  (dolist (body-part body)
    (eval body-part)))

(defun daemon-run (&rest body)
  "run func `after-make-frame-functions' if emacs in daemon mode

\(fn (origin form))"
  (if (and (fboundp 'daemonp) (daemonp))
      (add-hook 'after-make-frame-functions
                (lambda (frame)
                  (with-selected-frame frame
                    (eval-body body))))
    (eval-body body)))

;; 如果是有 region 则执行函数1，否则执行函数2
;; TODO: 完成这个
;; (defmacro do-if-region (if-do &optional else-do)
;;   `(defun ,(am-intern if-do "-or-" else-do) ()
;;      ,(concat "if `mark-actice' than run `" 'if-do "', else run `" 'else-do "'")
;;      (interactive)
;;      (if mark-active
;;          (call-interactively ',if-do)
;;          (when (not (null else-do))
;;                (call-interactively ',else-do)))))

;; (macroexpand (do-if-region kill-region backward-kill-word))
;; (message "%s" (concat "show" kill-region))

;; (defun do-if-region (if-do &optional else-do)
;;   "if `mark-active' than run if-do, else run else-do"
;;   (interactive)
;;   (if mark-active
;;       (call-interactively if-do)
;;       (if (not (null else-do))
;;           (call-interactively else-do))))

;; (defun am-intern (&rest strings)
;;   "`intern' use STRINGS."
;;   (intern
;;    (apply
;;     'concat
;;     (mapcar
;;      (lambda (element)
;;        (if (stringp element) element (symbol-name element)))
;;      strings))))

;(am-intern "just-" `("test1" "test2"))
;(message "%s" )

;; (defmacro do-if-region (if-do else-do)
;;   `(interactive)
;;   `(if mark-active
;;        (call-interactively ,if-do)
;;        (call-interactively ,else-do)))

;(def-keys "C-#" (do-if-region 'eval-region 'eval-last-sexp))

(provide 'macroFunc)
