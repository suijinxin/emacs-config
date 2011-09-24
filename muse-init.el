(add-to-list 'load-path "~/my-site-lisp/muse/lisp")
(require 'muse-mode)
(require 'muse-html)
(require 'muse-colors nil t)   ; load coloring/font-lock module
(require 'muse-wiki nil t)
(require 'muse-project)

;;; Custom variables
(custom-set-variables
 '(muse-colors-autogen-headings (quote outline))
 '(muse-colors-inline-image-method (quote muse-colors-use-publishing-directory))
 '(muse-completing-read-function (quote ido-completing-read))
)

(setq
 ;; 使用 lisp 标签时不在打开 muse 文件时求值
 muse-colors-evaluate-lisp-tags nil
 ;; 单独的项目名字不会成为 wiki 链接
 muse-wiki-ignore-bare-project-names t)
;;键绑定
(define-key global-map "\C-c\C-f" 'muse-project-find-file)
;设置编码方式为gbk
(setq muse-html-meta-content-type (concat "text/html; charset=gbk"))
;设置文件关联
(add-to-list 'auto-mode-alist '("\\.muse$" . muse-mode))
;; This uses a different header and footer than normal
;;(muse-derive-style "my-xhtml" "xhtml"
;;                   :header "~/personal-site/muse/header.html"
;;                   :footer "~/personal-site/muse/footer.html")


;设置工程
(setq muse-project-alist
      `(("WikiPlanner"
	 ("~/plans"
	  :default "TaskPool"
	  :major-mode planner-mode
	  :visit-link planner-visit-link)

	 (:base "html"
		:path "~/public_html/plans")
	 )
	
	("Mytest"
	 ("~/muse"
	  :default "index")
	 (:base "sjx-html" 
		:path "~/muse/html/publish"))))
;定义UT样式
(muse-derive-style "sjx-html" "html" 
;:strings 'kid-muse-markup-strings 
;:header 'kid-muse-html-header 
;:footer 'kid-muse-html-footer 
;:functions 'kid-muse-html-markup-functions 
;:after 'kid-muse-html-insert-contents 
:style-sheet 'sjx-muse-html-style-sheet)

(setq sjx-muse-html-style-sheet
"<link rel=\"stylesheet\" type=\"text/css\" charset=\"gbk\" media=\"all\" href=\"../common/stylesheets/core.css\" />"
; "<link rel=\"stylesheet\" type=\"text/css\" charset=\"gbk\" media=\"all\" href=\"../css/style.css\" />"
)