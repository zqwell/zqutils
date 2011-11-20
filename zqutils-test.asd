#|
  This file is a part of zqutils project.
|#

(in-package :cl-user)
(defpackage zqutils-test-asd
  (:use :cl :asdf))
(in-package :zqutils-test-asd)

(defsystem zqutils-test
  :author ""
  :license ""
  :depends-on (:zqutils
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:file "zqutils"))))
  :perform (load-op :after (op c) (asdf:clear-system c)))
