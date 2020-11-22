(defpackage gui
  (:use :cl :serapeum :ltk :focus-uf)
  (:export #:window))
(in-package :gui)

(defun window ()
  (with-ltk ()
    (let* ((focus-text       (make-instance 'label :master nil :text "focus [0,40]: "))
           (focus-spinbox    (make-instance 'spinbox 
                                            :master nil :from 0 :to 40 :increment 1
                                            :command (lambda (x) (set-focus x))))
           (exposure-text    (make-instance 'label :master nil :text "exposure [-11,-1]: "))
           (exposure-spinbox (make-instance 'spinbox 
                                            :master nil :from -11 :to -1 :increment 1
                                            :command (lambda (x) (set-exposure x))))
           (button-manual    (make-instance 'button
                                            :master nil :text "APPLY MANUAL"
                                            :command (lambda ()
                                                       (set-manual)
                                                       (set-focus)
                                                       (set-exposure))))
           (button-auto      (make-instance 'button
                                            :master nil :text "AUTOFOCUS"
                                            :command (lambda ()
                                                       (set-automatic)))))
      ;; layout
      (pack focus-text)
      (pack focus-spinbox :padx 50)
      (pack exposure-text)
      (pack exposure-spinbox)
      (pack button-manual :pady 10)
      (pack button-auto :pady 7)
      
      ;; default values
      (setf (text focus-spinbox) *focus*)
      (setf (text exposure-spinbox) *exposure*))))
