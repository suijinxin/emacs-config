;;��������
(setq load-path (cons "~/.emacs.d/my-elisp/org-mode/lisp" load-path))
(require 'org-install)
(require 'org)
(require 'org-mouse)
(setq org-agenda-files (list "~/org/work.org" 
			     "~/org/life.org"    
			     "~/org/study.org"
			     "~/org/test.org"
				 "~/org/todo.org")) 
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;(global-set-key "\C-c\C-l" 'org-store-link)
;(global-set-key "\C-c\C-a" 'org-agenda)
;(global-set-key "\C-c\C-b" 'org-iswitchb)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; OrgMode & Remember
(setq org-directory "~/org")
(setq org-default-notes-file "~/org/.notes")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
;; open appt message function
(appt-activate t)
(setq appt-display-format 'window)
(add-hook 'diary-hook 'appt-make-list)
 ;; org to appt
(setq appt-display-duration 30)
(setq appt-audible t)
(setq appt-display-mode-line t)

(setq appt-msg-countdown-list '(10 0))
;(org-agenda)
;(org-agenda-to-appt)
(setq org-agenda-include-diary t) ;;��������������
(setq org-log-done t)
;;;�������ע
(setq org-log-done 'note)

;;;ʱ��� 
(setq org-log-done 'time) 
;;;�Զ���TAG���Ƽ���ݷ�ʽ
(setq org-tag-alist '(("@work" . ?w) ("@study" . ?s)))
;;;������������
(setq org-publish-project-alist
      '(("org"
	 :base-directory "~/org/"
	 :publishing-directory "~/public_html/org/"
	 :section-numbers nil
	 :table-of-contents nil
	 :style "<link rel=\"stylesheet\"
                     href=\"../common/stylesheets/style.css\"
                     type=\"text/css\">"
)))
;�Զ���todo����
;; (setq org-todo-keywords
;;       '((sequence "�ƻ�(t)" "�ȴ�(w@/!)" "��ʼ(s!)" "|" "����(c@/!)" "���(d!)")))
;; (setq org-archive-tag "���Ͽ�"
;;       org-closed-string "����ر�"
;;       org-comment-string "��ע"
;;       org-deadline-string "��ֹʱ��"
;;       org-quote-string "����"
;;       org-scheduled-string "�ƻ�ʱ��"
;;       org-time-stamp-custom-formats (quote ("<%Y��%m��%d�� %A>" . "<%Y��%m��%d�� %A %H:%M>"))
;;       org-todo-interpretation (quote sequence)
;; )
;; (setq org-todo-keyword-faces
;;       '(("�ȴ�" . (:foreground "gray" :weight bold)))
;; )
(setq org-todo-keywords (quote ((sequence "TODO(t)" "STARTED(s!)" "|" "DONE(d!/!)")
 (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "OPEN(O@)" "|" "CANCELLED(c@/!)")
 (sequence "QUOTE(q!)" "QUOTED(Q!)" "|" "APPROVED(A@)" "EXPIRED(E@)" "REJECTED(R@)"))))

(setq org-todo-keyword-faces (quote (("TODO" :foreground "red" :weight bold)
 ("STARTED" :foreground "blue" :weight bold)
 ("DONE" :foreground "forest green" :weight bold)
 ("WAITING" :foreground "orange" :weight bold)
 ("SOMEDAY" :foreground "magenta" :weight bold)
 ("CANCELLED" :foreground "forest green" :weight bold)
 ("QUOTE" :foreground "red" :weight bold)
 ("QUOTED" :foreground "magenta" :weight bold)
 ("APPROVED" :foreground "forest green" :weight bold)
 ("EXPIRED" :foreground "forest green" :weight bold)
 ("REJECTED" :foreground "forest green" :weight bold)
 ("OPEN" :foreground "blue" :weight bold))))


;;����鿴
(setq org-agenda-sorting-strategy
      '((agenda priority-down time-up)
	(todo priority-down category-keep)
	(tags priority-down category-keep))
)

;(setq debug-on-error t)
;;quick open org files
(defun o-todo()
  (interactive)
  (find-file "~/org/todo.org")
)
(defun o-test ()
   (interactive)
   (find-file "~/org/test.org")
 )
(defun o-work ()
  (interactive)
  (find-file "~/org/work.org")
)
(defun o-life ()
  (interactive)
  (find-file "~/org/life.org")
)
(defun o-study ()
  (interactive)
  (find-file "~/org/study.org")
)
;;
;; (eval-after-load "htmlize"
;;   '(progn
;;      (defadvice htmlize-faces-in-buffer (after org-no-nil-faces activate)
;;        "Make sure there are no nil faces"
;;        (setq ad-return-value (delq nil ad-return-value)))))
