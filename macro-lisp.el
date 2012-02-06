;; -*- Emacs-Lisp -*-

;; * require-extensions
(defun require-extensions (action lst)
  "`require' plugins of list

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
          (unless (null group) 
                (funcall def-key key-def group))))))

(defun eval-body (forms)
  (if (listp forms)
      (dolist (form forms)
        (eval form))
    (eval forms)))

;; 如果是在 emacs-daemon 下，则在 after-make-frame-functions 事件后运行函数
(defun daemon-run (&rest body)
  "run func `after-make-frame-functions' if emacs daemon

\(fn (origin-form) (another-form) ...)"
    (if (and (fboundp 'daemonp) (daemonp))
        (add-hook 'after-make-frame-functions
                         (lambda (frame)
                           (with-selected-frame frame
                             (eval-body body))))
      (eval-body body)))

;; (eval '(tabbar-mode t))
;; (daemon-run '(tabbar-mode nil))
;; (let ((body '(tabbar-mode t)))
;;   (message "%s" `(add-hook 'after-make-frame-functions
;;                           (lambda (frame)
;;                             (with-selected-frame frame
;;                               (eval ,body))))))

;; 定义一个函数，如果表达式执行为真，则执行函数1，否则执行函数2
(defmacro do-if (exp if-do else-do &optional func-name)
  "defun a function eval if-do if exp is true else eval else-do,
default function name is \"if-do\"-or-\"else-do\"

\(fn exp 'if-do 'else-do [\"function-name\"])"
  (let ((if-do-name (symbol-name (eval if-do)))
        (else-do-name (symbol-name (eval else-do))))
    (let ((func-result-name (if (null func-name) 
                                (am-intern (concat if-do-name "-or-" else-do-name))
                              (intern func-name))))
      `(defun ,func-result-name ()
         ,(concat "if "  " than eval `" if-do-name "', else eval `" else-do-name "'")
         (interactive)
         (if (eval ,exp)
             (call-interactively ,if-do)
             (call-interactively ,else-do))))))

;; (let ((exp '(and (fboundp 'daemonp) (daemonp))))
;;   (message "%s" exp))

(defun am-intern (&rest strings)
  "`intern' use STRINGS. from dea"
  (intern 
   (apply 
    'concat 
    (mapcar (lambda (element)
              (if (stringp element) 
                  element 
                (symbol-name element)))
            strings))))

(provide 'macro-lisp)
