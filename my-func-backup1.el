; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Setting msf-abbrev                                                  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/my-elisp/msf-abbrev.el")
;Then, I do the following in my ~/.emacs:
;; ensure abbrev mode is always on
(setq-default abbrev-mode t)
;; do not bug me about saving my abbreviations
(setq save-abbrevs nil)
;; load up modes I use
(require 'cc-mode)
;(require 'perl-mode)
;(require 'cperl-mode)
;(require 'sh-script)
;(require 'shell)
;(require 'tex-site) ;; I use AUCTeX
;(require 'latex)    ;; needed to define LaTeX-mode-hook under AUCTeX
;(require 'tex)      ;; needed to define TeX-mode-hook under AUCTeX
;; (require 'python)   ;; I use python.el from Emacs CVS, uncomment if you do also

;; load up abbrevs for these modes
(require 'msf-abbrev)
;(global-msf-abbrev-mode t) ;; for all modes with abbrevs
(setq msf-abbrev-verbose t) ;; optional
(setq msf-abbrev-root "~/.emacs.d/my-elisp/mode-abbrevs")
(global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
(global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
(msf-abbrev-load)


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

;=========================================END==============================================;
;;;_+����JDEE
;;(add-to-list 'load-path "~/.emacs.d/my-elisp/jdee-2.4.0.1/lisp")
;;(add-to-list 'load-path "~/.emacs.d/my-elisp/cedet-1.0pre7/common")
;;(add-to-list 'load-path "~/.emacs.d/my-elisp/cedet-1.0pre7/contrib/")
;;(add-to-list 'load-path "~/.emacs.d/my-elisp/elib/")
;=========================================END==============================================;
;;;_auto-complete config

(add-to-list 'load-path "~/.emacs.d/my-elisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/my-elisp/auto-complete/ac-dict")
(ac-config-default)
;=========================================END==============================================;
;;;_yasnippet config
(add-to-list 
 'load-path  "~/.emacs.d/my-elisp/yasnippet-0.6.1c")
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/my-elisp/yasnippet-0.6.1c/snippets")
;=========================================END==============================================;
;;google-c-style config
;(load "google-c-style")
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;;;_+CC-mode-config
;; ;; c-mode��������
(require 'cc-mode)

(defun my-c-mode-common-hook ()
  (c-set-style "k&r")
;  (c-set-style "stroustrup")
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "c")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq abbrev-mode t)
  (setq hs-minor-mode t)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq indent-tabs-mode t)
  (c-toggle-auto-hungry-state t)
  (c-toggle-auto-state)
  (setq c-cleanup-list '(brace-else-brace
                        brace-elseif-brace
                        one-liner-defun
                        empty-defun-braces
                        list-close-comma))

  (c-offsets-alist . ((substatement . 0)
		      (func-decl-cont . 0)
		      ))
)
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

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

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
;;Info-directory config  ---2009��11��11�� 14:37:05 
;(require 'info)
;(setq Info-directory-list
;	  (cons (expand-file-name "~/my-info/my-dir")
;			Info-directory-list))
;(setq Info-default-directory-list (append Info-default-directory-list (list "~/my-info/")))

;;;;;(setq Info-directory-list '(
;;    "~/info/" 
;;    "~/my-info/"
;;))
