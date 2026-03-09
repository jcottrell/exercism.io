(defpackage :armstrong-numbers
  (:use :cl)
  (:export :armstrong-number-p))
(in-package :armstrong-numbers)

;; thanks to verdammelt for flet and digit-char-p
(defun armstrong-number-p (number)
  "Returns T if NUMBER is an Armstrong number."
  (let* ((number-list (get-number-as-list number))
         (number-length (length number-list)))
    (flet ((number-raised-to-length (number)
             (expt number number-length)))
      (= number (apply #'+ (mapcar #'number-raised-to-length number-list))))))

(defun get-number-as-list (number)
  "Returns a list of the digits that make up NUMBER."
  (map 'list #'digit-char-p (write-to-string number)))
