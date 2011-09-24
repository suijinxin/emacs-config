;;;_+Scheme Programming Configure
(setq load-path (cons "~/my-site-lisp/scheme" load-path))
;;; .emacs Scheme support
(autoload 'scheme-mode "iuscheme" 
  "Major mode for Scheme." t)	
(autoload 'run-scheme "iuscheme" 
  "Switch to interactive Scheme buffer." t)
(autoload 'run-alt-scheme "iuscheme" 
  "Switch to interactive alternative Scheme buffer." t)

(setq auto-mode-alist (cons '("\\.ss$" . scheme-mode) auto-mode-alist))


