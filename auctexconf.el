(setq load-path (cons "~/my-site-lisp/auctex-11.86/site-lisp/site-start.d" load-path))

(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)
(if (string-equal system-type "windows-nt")
    (require 'tex-mik))
;;为LaTeX模式hook自动换行，数学公式，reftex 和显示行号的功能
(mapc (lambda (mode)
      (add-hook 'LaTeX-mode-hook mode))
      (list 'auto-fill-mode
            'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))
;;在LaTeX mode中，默认开启PDF mode，即默认使用 xelatex 直接生成pdf文件，而不用每次用'C-c C-t C-p'进行切换。
;;设置'Tex-show-compilation' 为 t，在另一个窗口显示编译信息，对于错误的排除很方便。
;;另外，编译时默认直接保存文件，绑定补全符号到 TAB 键。
(add-hook 'LaTeX-mode-hook
          (lambda ()
            (setq TeX-auto-untabify t     ; remove all tabs before saving
                  TeX-engine 'xetex       ; use xelatex default
                  TeX-show-compilation t) ; display compilation windows
            (TeX-global-PDF-mode t)       ; PDF mode enable, not plain
            (setq TeX-save-query nil)
            (imenu-add-menubar-index)
            (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)))
;;
;; (setq TeX-view-program-list
;;      '(("SumatraPDF" "SumatraPDF.exe %o")
;;        ("Gsview" "c:/Program Files/gs/gs9.00/bin/gsview32.exe %o")
;;        ("Okular" "okular --unique %o")
;;        ("Evince" "evince %o")
;;        ("Firefox" "firefox %o")))

(cond
 ((eq system-type 'windows-nt)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "gsview32c.exe")
                                                 (output-dvi "Yap"))))))

 ((eq system-type 'gnu/linux)
  (add-hook 'LaTeX-mode-hook
            (lambda ()
              (setq TeX-view-program-selection '((output-pdf "Okular")
                                                 (output-dvi "Okular")))))))
