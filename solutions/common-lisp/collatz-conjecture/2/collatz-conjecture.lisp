(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  "Returns the number of collatz steps to get from N to 1."
  (when (plusp n) (collatz-count-steps n 0)))

(defun collatz-count-steps (current-number number-of-steps)
  "Calculates one step of counting the collatz number CURRENT-STEPS."
  (cond ((= 1 current-number) number-of-steps)
        ((evenp current-number (collatz-count-steps (/ current-number 2) (1+ number-of-steps))))
        (t (collatz-count-steps (1+ (* 3 current-number))))))
