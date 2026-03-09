(defpackage :difference-of-squares
  (:use :cl)
  (:export :sum-of-squares
           :square-of-sum
           :difference))

(in-package :difference-of-squares)

(defun square-of-sum (n)
  "Calculates the square of the sum for a given number."
  (expt (apply #'+ (get-range 1 n)) 2))


(defun sum-of-squares (n)
  "Calculates the sum of squares for a given number."
  (apply #'+ (mapcar #'(lambda (number) (expt number 2)) (get-range 1 n))))


(defun difference (n)
  "Finds the diff. between the square of the sum and the sum of the squares."
  (- (square-of-sum n) (sum-of-squares n)))

(defun get-range (low high)
  "Returns a range of numbers from LOW to HIGH (inclusive)."
  (when (<= low high)
      (cons low (get-range (1+ low) high))))
