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
  (labels ((get-next-factor (divisor factors-so-far)
             (if (<= divisor 0)
                 factors-so-far
                 (let* ((quotient (floor (/ number divisor)))
                        (divisor-to-add (when (= number (* divisor quotient))
                                          (list divisor)))
                        (quotient-to-add (when (and divisor-to-add (/= divisor quotient))
                                           (list quotient))))
                   (get-next-factor (1- divisor)
                                    (append factors-so-far divisor-to-add quotient-to-add))))))
    (get-next-factor (isqrt number) '())))
