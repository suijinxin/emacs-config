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
(require 'smart-compile)
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

;;;_+CC-mode-config
;; (require 'cc-mode)
;; ;; c-mode��������


;; (defun my-c-mode-common-hook ()
;; ;;;_+ hungry-delete and auto-newline

;; (c-toggle-hungry-state)
;; ;;;_+��������
;; ;�س����Զ����в�����
;;   (define-key c-mode-base-map [(return)] 'newline-and-indent)
;;   (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
;;   (define-key c-mode-base-map [(f7)] 'compile)
;;   (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
;;   ;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
;;   ;;  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
;;   (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu) 

;; ;;;_+Ԥ��������
;;   (setq c-macro-shrink-window-flag t)
;;   (setq c-macro-preprocessor "cpp")
;;   (setq c-macro-cppflags " ")
;;   (setq c-macro-prompt-flag t)
;;   (setq hs-minor-mode t)
;;   (setq c-basic-offset 4)
;;   (setq abbrev-mode t)
;; )


;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; (load-library "hideshow")
;; (add-hook 'c-mode-hook 'hs-minor-mode)
;; (add-hook 'c++-mode-hook 'hs-minor-mode)
;; (add-hook 'java-mode-hook 'hs-minor-mode)
;; (add-hook 'perl-mode-hook 'hs-minor-mode)
;; (add-hook 'php-mode-hook 'hs-minor-mode)
;; (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
;; ;;�ܰ�һ�����������������Ҫ��ʱ����չ��
;; ;;  M-x              hs-minor-mode
;; ;;  C-c @ ESC C-s    show all
;; ;;  C-c @ ESC C-h    hide all
;; ;;  C-c @ C-s        show block
;; ;;  C-c @ C-h        hide block
;; ;;  C-c @ C-c toggle hide/show

;; ;; CPP����
;; (defun my-c++-mode-hook ()
;;   (c-set-style "stroustrup"))
;; (add-hook 'c++-mode-hook 'my-c++-mode-hook)
;; ;; ������ʾC/C++�еĿ��ܵĴ���(CWarn mode)
;; (global-cwarn-mode 1)
;=========================================END==============================================;
;;������ߵ����ţ��ͻ��Զ���ȫ�ұߵĲ���.����(), "", [] , {} , �ȵȡ�
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

;=========================================END==============================================;w
;;;_auto-complete config
(add-to-list 'load-path "~/my-site-lisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/my-site-lisp/auto-complete/ac-dict")
(ac-config-default)

;;;_yasnippet config
(add-to-list 
 'load-path  "~/my-site-lisp/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/my-site-lisp/yasnippet-0.6.1c/snippets")


