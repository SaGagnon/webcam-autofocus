(defpackage webcam-autofocus/tests/main
  (:use :cl
        :webcam-autofocus
        :rove))
(in-package :webcam-autofocus/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :webcam-autofocus)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
