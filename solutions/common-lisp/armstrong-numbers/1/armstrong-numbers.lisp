(defpackage :armstrong-numbers
  (:use :cl)
  (:export :armstrong-number-p))
(in-package :armstrong-numbers)

(defun armstrong-number-p (number)
  (let* ((number-list (get-number-as-list number))
         (raised-number-list (raise-number-list number-list)))
    (= number (apply #'+ raised-number-list))))

(defun get-number-as-list (number)
  (mapcar #'(lambda (character)
              (parse-integer (string character)))
          (coerce (write-to-string number) 'list)))

(defun raise-number-list (number-list)
  (let ((number-length (length number-list)))
    (mapcar #'(lambda (number)
                (expt number number-length))
            number-list)))
