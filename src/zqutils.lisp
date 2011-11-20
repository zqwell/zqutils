#|
  This file is a part of zqutils project.
|#

(in-package :cl-user)
(defpackage zqutils
  (:use :cl :annot.doc))
(in-package :zqutils)

(annot:enable-annot-syntax)

@export
@doc "return a string which is the concatenation of the strings in the `strings'.
The separator between elements is the string (also character) in the `expr'.
e.g. (join-string \",\" \"abc\" \"123\") => \"abc,123\" "
(defun join-string (expr &rest strings)
  (format nil (format nil "~~{~~a~~^~a~~}" expr) strings))

@export
@doc "each slice the `source' list into lists containing `n' elements.
e.g. (group '(a b c d e f) 3) => ((a b c) (d e f))"
(defun group (source n)
	 (loop for x = source then (nthcdr n x)
	       while x
	       collect (subseq x 0 n)))

@export
@doc "return a string which is the concatenation of the objects in the `obj'
if the `objects' objects contains keyword-symbol, there is used a string as downcase."
(defun string+ (&rest objects)
  (let ((*print-case* :downcase))
    (format nil "~{~a~}" objects)))
