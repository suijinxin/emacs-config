; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                Setting Planner                                                   ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setq load-path (add-to-list 'load-path  "~/my-site-lisp/muse/lisp"))
(add-to-list 'load-path "~/my-site-lisp/planner")
(add-to-list 'load-path "~/my-site-lisp/remember")
(require 'planner)
;(require 'planner-diary)
;(require 'planner-cyclic)
;(add-hook 'diary-display-hook 'fancy-diary-display)
;(setq planner-diary-use-diary t)
;(planner-diary-insinuate)
(setq planner-day-page-template
      "* Tasks\n\n\n* Schedule\n\n\n* Diary\n\n\n* Notes")

(setq planner-project "WikiPlanner")

;<------------when emacs start,open plan------------------------>
;(plan)
