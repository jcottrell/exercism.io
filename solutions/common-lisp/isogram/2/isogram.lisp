(defpackage :isogram
  (:use :cl)
  (:export :isogram-p))

(in-package :isogram)

(defun isogram-p (string)
  "Returns T if STRING is an isogram."
  (let ((cleaned (remove-if-not #'alpha-char-p string)))
    (equalp cleaned (remove-duplicates cleaned :test #'equalp))))
