;;------------------------------------------------------------------------------ 
;; Java Development Enviroment 
;;------------------------------------------------------------------------------ 
(add-to-list 'load-path (expand-file-name "~/my-site-lisp/jdee-2.4.0.1/lisp")) 
(add-to-list 'load-path (expand-file-name "~/my-site-lisp/cedet-1.0pre7/semantic"))
(add-to-list 'load-path (expand-file-name "~/my-site-lisp/cedet-1.0pre7/speedbar"))
(add-to-list 'load-path (expand-file-name "~/my-site-lisp/elib"))
;(add-to-list 'load-path (expand-file-name "~/my-site-lisp/ecb/ecb-snap"))
(add-to-list 'load-path (expand-file-name "~/my-site-lisp/cedet-1.0pre7/eieio"))
(load-file (expand-file-name "~/my-site-lisp/cedet-1.0pre7/common/cedet.el"))
(setq defer-loading-jde nil)

(if defer-loading-jde
    (progn
      (autoload 'jde-mode "jde" "JDE mode." t)
      (setq auto-mode-alist
	    (append
	     '(("\\.java\\'" . jde-mode))
	     auto-mode-alist)))
  (require 'jde))


;; Sets the basic indentation for Java source files
;; to two spaces.
(defun my-jde-mode-hook ()
  (setq c-basic-offset 4))

(add-hook 'jde-mode-hook 'my-jde-mode-hook)





