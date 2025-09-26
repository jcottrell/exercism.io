(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  (labels ((collatz-step (current-number number-of-steps)
             (if (= 1 current-number)
                 number-of-steps
                 (collatz-step (if (evenp current-number)
                                   (/ current-number 2)
                                   (1+ (* 3 current-number)))
                               (1+ number-of-steps)))))
    (when (> n 0) (collatz-step n 0))))
