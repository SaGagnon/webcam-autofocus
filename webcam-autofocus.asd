(defsystem "webcam-autofocus"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on (uiop serapeum ltk)
  :components ((:module "src"
                :components
                ((:file "focus-uf")
                 (:file "config")
                 (:file "gui")
                 (:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "webcam-autofocus/tests"))))

(defsystem "webcam-autofocus/tests"
  :author ""
  :license ""
  :depends-on ("webcam-autofocus"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for webcam-autofocus"
  :perform (test-op (op c) (symbol-call :rove :run c)))
