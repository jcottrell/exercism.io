(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n)
  "Returns the number of collatz steps to get from N to 1."
  (labels ((count-steps (current-number number-of-steps)
             (if (= 1 current-number)
                 number-of-steps
                 (count-steps (if (evenp current-number)
                                  (/ current-number 2)
                                  (1+ (* 3 current-number)))
                              (1+ number-of-steps)))))
    (when (plusp n) (count-steps n 0))))
