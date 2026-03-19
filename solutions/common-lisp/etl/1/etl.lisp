(defpackage :etl
  (:use :cl)
  (:export :transform))

(in-package :etl)

(defun transform (data)
  "Transforms hash values into keys with their keys as their values."
  (let ((one-to-one (make-hash-table)))
    (maphash #'(lambda (value chars)
                  (dolist (char chars)
                    (setf (gethash (char-downcase char) one-to-one)
                          value)))
            data)
    one-to-one))
