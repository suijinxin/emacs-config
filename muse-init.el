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
 ;; ʹ�� lisp ��ǩʱ���ڴ� muse �ļ�ʱ��ֵ
 muse-colors-evaluate-lisp-tags nil
 ;; ��������Ŀ���ֲ����Ϊ wiki ����
 muse-wiki-ignore-bare-project-names t)
;;����
(define-key global-map "\C-c\C-f" 'muse-project-find-file)
;���ñ��뷽ʽΪgbk
(setq muse-html-meta-content-type (concat "text/html; charset=gbk"))
;�����ļ�����
(add-to-list 'auto-mode-alist '("\\.muse$" . muse-mode))
;; This uses a different header and footer than normal
;;(muse-derive-style "my-xhtml" "xhtml"
;;                   :header "~/personal-site/muse/header.html"
;;                   :footer "~/personal-site/muse/footer.html")


;���ù���
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
;����UT��ʽ
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