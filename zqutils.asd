#|
  This file is a part of zqutils project.
|#

(in-package :cl-user)
(defpackage zqutils-asd
  (:use :cl :asdf))
(in-package :zqutils-asd)

(defsystem zqutils
  :version "0.1-SNAPSHOT"
  :author "zqwell <zqwell.ss@gmail.com>"
  :license "LLGPL"
  :depends-on (:alexandria :cl-annot :anaphora)
  :components ((:module "src"
                :components
                ((:file "zqutils"))))
  :description "trivial utilities for common lisp"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op zqutils-test))))
