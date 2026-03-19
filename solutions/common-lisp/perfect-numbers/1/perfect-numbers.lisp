(defpackage :perfect-numbers
  (:use :cl)
  (:export :classify))

(in-package :perfect-numbers)

(defun classify (number)
  (when (plusp number)
    (let* ((factors (get-factors number))
           (all-but-self (remove-if #'(lambda (factor) (= number factor)) factors))
           (aliquot-sum (reduce #'+ all-but-self)))
      (cond ((= aliquot-sum number) "perfect")
            ((> aliquot-sum number) "abundant")
            ((< aliquot-sum number) "deficient")))))

(defun get-factors (number)
  (do ((factors '())
       (divisor (isqrt number) (1- divisor)))
      ((<= divisor 0) factors)
    (let ((quotient (floor (/ number divisor))))
      (when (= number
               (* divisor quotient))
        (setf factors (cons divisor factors)
              factors (if (/= divisor quotient)
                          (cons quotient factors)
                          factors))))))
