(defpackage focus-uf
  (:use :cl :serapeum)
  (:export #:*focus-uf-pathname*
           #:*focus*
           #:*exposure*
           #:set-manual
           #:set-automatic
           #:set-focus
           #:set-exposure))
(in-package :focus-uf)

(defparameter *focus-uf-pathname* "C:/Users/samue/Documents/FocusUF/FocusUF.exe"
  "Chemin vers le programme pour contrôler la webcam.")

(defparameter *focus* nil
  "Focus courant.")

(defparameter *exposure* nil
  "Exposure courant.")

(defun focus-uf (&rest cmdline-args)
  "Exécute le programme focusUF."
  (uiop:run-program (string-join (cons *Focus-uf-pathname* cmdline-args) " ")
                    :output T))

(defun set-manual ()
  "Désactive l'ajustement automatique du focus et de l'exposure."
  (focus-uf "-fm")
  (focus-uf "-em"))

(defun set-automatic ()
  "Active l'ajustement automatique du focus et de l'exposure."
  (focus-uf "-fa")
  (focus-uf "-ea"))

(defun set-focus (&optional (x *focus*))
  (setf *focus* x)
  (focus-uf "-f" (write-to-string x)))

(defun set-exposure (&optional (x *exposure*))
  (setf *exposure* x)
  (focus-uf "-e" (write-to-string x)))
