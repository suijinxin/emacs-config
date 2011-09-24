;;for speedbar
;;{{{  speedbar within frame
(require 'speedbar)
(defvar my-speedbar-buffer-name
  (if (buffer-live-p speedbar-buffer)
      (buffer-name speedbar-buffer)
    "*SpeedBar*"))
(defun my-speedbar-no-separate-frame ()
  (interactive)
  (when (not (buffer-live-p speedbar-buffer))
    (setq speedbar-buffer (get-buffer-create my-speedbar-buffer-name)
          speedbar-frame (selected-frame)
          dframe-attached-frame (selected-frame)
          speedbar-select-frame-method 'attached
          speedbar-verbosity-level 0
          speedbar-last-selected-file nil)
    (set-buffer speedbar-buffer)
    (speedbar-mode)
    (speedbar-reconfigure-keymaps)
    (speedbar-update-contents)
    (speedbar-set-timer 1)
    (make-local-hook 'kill-buffer-hook)
    (add-hook 'kill-buffer-hook
              (lambda () (when (eq (current-buffer) speedbar-buffer)
                           (setq speedbar-frame nil
                                 dframe-attached-frame nil
                                 speedbar-buffer nil)
                           (speedbar-set-timer nil)))))
  (set-window-buffer (selected-window)
                     (get-buffer my-speedbar-buffer-name)))
;;}}}

(defun my-speedbar ()
   "Display the speedbar in another window"
  (interactive)
;;  (delete-other-windows)
  (split-window-horizontally ( / ( * (window-width) 3) 4))
  (if (buffer-live-p speedbar-buffer)
      ;;true
      (switch-to-buffer-other-window speedbar-buffer)
    ;;forth
    (progn (other-window 1)
           (my-speedbar-no-separate-frame)
           ))
)

;;(global-set-key [f8] 'my-speedbar)
(define-key speedbar-file-key-map "u" 'speedbar-up-directory)
(define-key speedbar-file-key-map "." 'speedbar-up-directory)

;;speedbar end