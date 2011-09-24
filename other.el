;;;_+ ���������ļ�
(load "bookmarkplus")
;;(load "auctexconf")
(load "muse-init")
(load "planner-init")
(load "~/.mew.el")
(load "my-func")
(load "emacs-custom")
(load "org-init")
(load "google-c-style")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)
;;(load "my-speedbar")
;;(load "jdee-init")
;;(load "scheme")
;;(load "tabbar")
;;(tabbar-mode 1)
;;;_+ ������������
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-priority1-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-priority1-holidays)
;;;_+config holidays
(setq other-holidays '(  (holiday-fixed 3 8 "��Ů��")
			 (holiday-fixed 3 12 "ֲ����")
		         (holiday-fixed 4 1 "���˽�")
			 (holiday-fixed 5 4 "�����")
			 (holiday-fixed 6 1 "��ͯ��")
			 (holiday-float 5 0 2 "ĸ�׽�")
			 (holiday-fixed 9 10 "��ʦ��")
             (holiday-float 6 0 3 "���׽�")
			 (holiday-chinese 4 30 "��������")
			 (holiday-chinese 7 7 "��Ϧ��")
			 (holiday-chinese 7 14 "��������")
			 (holiday-chinese 9 9 "������")
			 (holiday-chinese 10 23 "��������")
			 (holiday-chinese 10 24 "�ϰ�����")
			 (holiday-chinese 11 15 "��������")
			 (holiday-chinese 11 27 "��ү����")
			 (holiday-chinese 12 17 "������" )
			 (holiday-chinese 12 30 "��Ϧ")
			 (holiday-chinese 1 1 "�����һ")
			 (holiday-chinese 1 2 "�������")
			 (holiday-chinese 1 3 "�������")
			 (holiday-chinese 1 4 "�������")
			 (holiday-chinese 1 5 "�������")
			 (holiday-chinese 1 15 "����ʮ��Ԫ����")))
;(setq calendar-holidays
;        (append holidy-general-holidays other-holidays))
(setq calendar-holidays
        (append other-holidays
		cal-china-x-chinese-holidays
		general-holidays))


;;;_+ EMACS��ɫ����,�˵�Tools->Color Theme ѡ������Ҫ����ɫ 
(add-to-list 'load-path "~/my-site-lisp/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-oswald)
;(color-theme-matrix)
;(color-theme-xp)
;(color-theme-robin-hood)
;(color-theme-gtk-ide)
;(color-theme-comidia)
;(color-theme-arjen)
;(color-theme-classic)
;(color-theme-deep-blue)

;; (add-to-list 'load-path "~/my-site-lisp/zenburn.el")
;; (require 'zenburn)
;; (color-theme-zenburn)
;; (unless (zenburn-format-spec-works-p)
;;   (zenburn-define-format-spec))

;;;_+ ������html������ʾ
(require 'htmlize)
(add-to-list 'auto-mode-alist (cons  "\\.js\\'" 'javascript-mode))
   (autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
   (autoload 'css-mode "css-mode" nil t)

;(require 'tabbar)
;;;_+ ����Emacs�������(for windows)
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Setting msf-abbrev                                                  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/my-site-lisp/msf-abbrev.el")

;Then, I do the following in my ~/.emacs:

;; ensure abbrev mode is always on
(setq-default abbrev-mode t)

;; do not bug me about saving my abbreviations
(setq save-abbrevs nil)

;; load up modes I use
;;(require 'cc-mode)
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
(setq msf-abbrev-verbose t) ;; optional
(setq msf-abbrev-root "~/my-site-lisp/mode-abbrevs")
(global-set-key (kbd "C-c l") 'msf-abbrev-goto-root)
(global-set-key (kbd "C-c a") 'msf-abbrev-define-new-abbrev-this-mode)
(msf-abbrev-load)
;;����Ԥ��

(require 'cn-weather)
(display-cn-weather-mode t)
(setq cn-weather-city "������")

;;;_+ ����Tabbar
;; (require 'tabbar)
;; (tabbar-mode t)
;; (global-set-key (kbd "M--") 'tabbar-backward-group)
;; (global-set-key (kbd "M-=") 'tabbar-forward-group)
;; (global-set-key (kbd "M-1") 'tabbar-backward)
;; (global-set-key (kbd "M-2") 'tabbar-forward) 
;;;_+����JDEE
(add-to-list 'load-path "~/my-site-lisp/jdee-2.4.0.1/lisp")
(add-to-list 'load-path "~/my-site-lisp/cedet-1.0pre7/common")
(add-to-list 'load-path "~/my-site-lisp/cedet-1.0pre7/contrib/")
(add-to-list 'load-path "~/my-site-lisp/elib/")



