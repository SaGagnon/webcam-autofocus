;; Loader à partir en partant sbcl dans le shell de emacs
(load "C:/Users/samue/portacle/config/sbcl-init.lisp")
(ql:quickload "webcam-autofocus")
(sb-ext:save-lisp-and-die #p"webcam-autofocus.exe" :toplevel #'webcam-autofocus:main
                                                   :executable t
                                                   :compression 9
                                                   :application-type :gui)
