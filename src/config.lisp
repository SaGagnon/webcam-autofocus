(defpackage config
  (:use :cl :serapeum)
  (:export #:load-config
           #:save-state
           #:load-state))
(in-package :config)

(defun load-config ()
  (with-open-file (file-stream #P"config.txt")
    (let ((config (read file-stream)))
      (setf focus-uf:*focus*             (getf config :focus)
            focus-uf:*exposure*          (getf config :exposure)
            focus-uf:*focus-uf-pathname* (getf config :focus-uf-pathname)
            ltk:*wish-pathname*          (getf config :wish-pathname)))))

(defun save-state ()
  (with-open-file (file-stream #P"state.txt" :direction :output
                                             :if-exists :supersede
                                             :if-does-not-exist :create)
    (prin1 (list :focus focus-uf:*focus*
                 :exposure focus-uf:*exposure*)
           file-stream)))

(defun load-state ()
  (with-open-file (file-stream #P"state.txt" :if-does-not-exist nil)
    (if file-stream
        (let ((state (read file-stream)))
          (setf focus-uf:*focus*    (getf state :focus)
                focus-uf:*exposure* (getf state :exposure)))
        (progn
          (setf focus-uf:*focus* 14)
          (setf focus-uf:*exposure* -6)))))




