;;Info-directory config  ---2009��11��11�� 14:37:05 
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
;;��������
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
;;��������

(define-ibuffer-sorter file-name
  "Sort buffers by associated file name"
  (:description "file name")
  (apply 'string<
         (mapcar (lambda (buf)
                   (with-current-buffer (car buf)
                     (or buffer-file-name default-directory)))
                 (list a b))))
(define-key ibuffer-mode-map "sf" 'ibuffer-do-sort-by-file-name)

;;;_+ �Զ������ʱ���ʽ����ݼ�
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%Y��%m��%e�� %T " (current-time))))
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
;; ���س�����C-j�Ĺ��ܣ����е�ͬʱ����
  (define-key c-mode-map [return] 'newline-and-indent)
  (interactive) 
;; ����C����Ķ�����
;; (c-set-style "K&R") 
  (c-set-style "cc-mode") 
;; �Զ�ģʽ���ڴ���ģʽ�µ������{ʱ�����Զ����������õĶ��������
;;  (c-toggle-auto-state)
;; ��ģʽ�£�����Backspaceʱ��ɾ�����Ŀո�
  (c-toggle-hungry-state)
;; �ڲ˵��м��뵱ǰBuffer�ĺ�������
  (imenu-add-menubar-index)
;;�Զ�����
  (filladapt-mode t)
;; ��״̬������ʾ��ǰ������ĸ��������ڲ�
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
;; ����imenu������ʽΪ����������
(setq imenu-sort-function 'imenu--sort-by-name)

;;;_+������ߵ����ţ��ͻ��Զ���ȫ�ұߵĲ���.����(), "", [] , {} , ��
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
