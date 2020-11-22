(defpackage webcam-autofocus
  (:use :cl :serapeum :focus-uf :config :gui)
  (:export #:main))
(in-package :webcam-autofocus)

(defun main ()
  (load-config)
  (load-state)
  (window)
  (save-state))

#+nil
(main)
