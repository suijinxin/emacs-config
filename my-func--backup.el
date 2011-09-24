;;Info-directory config  ---2009年11月11日 14:37:05 
(require 'info)
;(setq Info-directory-list
;	  (cons (expand-file-name "~/my-info/my-dir")
;			Info-directory-list))
;(setq Info-default-directory-list (append Info-default-directory-list (list "~/my-info/")))

(setq Info-directory-list '(
    "~/info/" 
    "~/my-info/"
)) 
;;;_+ Ibuffers config
;;分组设置
(require 'ibuf-ext)
(setq ibuffer-mode-hook
      (lambda ()
	(setq ibuffer-filter-groups
	      '(
		("*buffer*" (name . "\\*.*\\*"))
		("dired" (mode . dired-mode))
		("perl" (or (mode . cperl-mode)
			    (mode . sepia-mode)
			    (mode . perl-mode)))
		("elisp" (or (mode . emacs-lisp-mode)
			     (mode . lisp-interaction-mode)))
		("prog" (or (mode . c++-mode)
			    (mode . c-mode)
			    (mode . java-mode)))
		("tags" (name . "^TAGS"))))))
;;排序设置

(define-ibuffer-sorter file-name
  "Sort buffers by associated file name"
  (:description "file name")
  (apply 'string<
         (mapcar (lambda (buf)
                   (with-current-buffer (car buf)
                     (or buffer-file-name default-directory)))
                 (list a b))))
(define-key ibuffer-mode-map "sf" 'ibuffer-do-sort-by-file-name)

;;;_+ 自定义插入时间格式及快捷键
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y年%m月%e日 %T " (current-time))))
(global-set-key "\C-xt" 'insert-date)

;;;_+ Setup Programming environment
;;;_+Common Config
(require 'cc-mode)
(require 'filladapt)
(autoload 'awk-mode "cc-mode" nil t)
(defun my-c-mode-common-hook ()
  (setq default-tab-width 4)
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (hs-minor-mode t))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(defun linux-c-mode() 
;; 将回车代替C-j的功能，换行的同时对齐
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive) 
;; 设置C程序的对齐风格
;; (c-set-style "K&R") 
  (c-set-style "cc-mode") 
;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
;;  (c-toggle-auto-state)
;; 此模式下，当按Backspace时会删除最多的空格
  (c-toggle-hungry-state)
;; 在菜单中加入当前Buffer的函数索引
  (imenu-add-menubar-index)
;;自动缩进
  (filladapt-mode t)
;; 在状态条上显示当前光标在哪个函数体内部
  (which-function-mode) 
 )
(add-hook 'c-mode-hook 'linux-c-mode)
;;;_+cpp config 
(defun linux-cpp-mode() 
  (define-key c++-mode-map [return] 'newline-and-indent)
  (define-key c++-mode-map [(control c) (c)] 'compile)
  (interactive) 
;;  (c-set-style "K&R") 
  (c-set-style "stroustrup")
;;  (c-toggle-auto-state)
  (c-toggle-hungry-state)
  (setq c-basic-offset 4)
  (imenu-add-menubar-index)
  (which-function-mode)
  )
(add-hook 'c++-mode-hook 'linux-cpp-mode)
;; 设置imenu的排序方式为按名称排序
(setq imenu-sort-function 'imenu--sort-by-name)

;;;_+输入左边的括号，就会自动补全右边的部分.包括(), "", [] , {} , 等
(defun my-c-mode-auto-pair ()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist  '(
    (?` ?` _ "''")
    (?\( ?  _ " )")
    (?\[ ?  _ " ]")
    (?{ \n > _ \n ?} >)))
  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'my-c-mode-auto-pair)
(add-hook 'c++-mode-hook 'my-c-mode-auto-pair)

;----------------------------------------------------------------
