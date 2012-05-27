;;;_+ 导入配置文件
(load "bookmarkplus")
;;(load "auctexconf")
(load "muse-init")
(load "planner-init")
(load "~/.mew.el")
(load "my-func")
(load "emacs-custom")
(load "org-init")
(require 'dired-single)
(require 'autopair)
(autopair-global-mode)
;;(load "my-speedbar")
;;(load "jdee-init")
;;(load "scheme")
;;(load "tabbar")
;;(tabbar-mode 1)
;;;_+ 设置中文日历
(require 'cal-china-x)
(setq mark-holidays-in-calendar t)
(setq cal-china-x-priority1-holidays cal-china-x-chinese-holidays)
(setq calendar-holidays cal-china-x-priority1-holidays)
;;;_+config holidays
(setq other-holidays '(  (holiday-fixed 3 8 "妇女节")
			 (holiday-fixed 3 12 "植树节")
		         (holiday-fixed 4 1 "愚人节")
			 (holiday-fixed 5 4 "青年节")
			 (holiday-fixed 6 1 "儿童节")
			 (holiday-float 5 0 2 "母亲节")
			 (holiday-fixed 9 10 "教师节")
             (holiday-float 6 0 3 "父亲节")
			 (holiday-chinese 4 30 "老于生日")
			 (holiday-chinese 7 7 "七夕节")
			 (holiday-chinese 7 14 "妈妈生日")
			 (holiday-chinese 9 9 "重阳节")
			 (holiday-chinese 10 23 "岳父生日")
			 (holiday-chinese 10 24 "老爸生日")
			 (holiday-chinese 11 15 "姥姥生日")
			 (holiday-chinese 11 27 "姥爷生日")
			 (holiday-chinese 12 17 "我生日" )
			 (holiday-chinese 12 30 "除夕")
			 (holiday-chinese 1 1 "大年初一")
			 (holiday-chinese 1 2 "大年初二")
			 (holiday-chinese 1 3 "大年初三")
			 (holiday-chinese 1 4 "大年初四")
			 (holiday-chinese 1 5 "大年初五")
			 (holiday-chinese 1 15 "正月十五元宵节")))
;(setq calendar-holidays
;        (append holidy-general-holidays other-holidays))
(setq calendar-holidays
        (append other-holidays
		cal-china-x-chinese-holidays
		general-holidays))


;;;_+ EMACS配色方案,菜单Tools->Color Theme 选择你需要的配色 
(add-to-list 'load-path "~/.emacs.d/my-elisp/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker)
;(color-theme-oswald)
;(color-theme-matrix)
;(color-theme-xp)
;(color-theme-robin-hood)
;(color-theme-gtk-ide)
;(color-theme-comidia)
;(color-theme-arjen)
;(color-theme-classic)
;(color-theme-deep-blue)

;; (add-to-list 'load-path "~/.emacs.d/my-elisp/zenburn.el")
;; (require 'zenburn)
;; (color-theme-zenburn)
;; (unless (zenburn-format-spec-works-p)
;;   (zenburn-define-format-spec))

;;;_+ 导出成html高亮显示
(require 'htmlize)
(add-to-list 'auto-mode-alist (cons  "\\.js\\'" 'javascript-mode))
   (autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
   (autoload 'css-mode "css-mode" nil t)

;(require 'tabbar)
;;;_+ 配置Emacs启动最大化(for windows)
(require 'maxframe)
(add-hook 'window-setup-hook 'maximize-frame t)

;;天气预报

(require 'cn-weather)
(display-cn-weather-mode t)
(setq cn-weather-city "哈尔滨")

;;;_+ 设置Tabbar
;; (require 'tabbar)
;; (tabbar-mode t)
;; (global-set-key (kbd "M--") 'tabbar-backward-group)
;; (global-set-key (kbd "M-=") 'tabbar-forward-group)
;; (global-set-key (kbd "M-1") 'tabbar-backward)
;; (global-set-key (kbd "M-2") 'tabbar-forward) 


