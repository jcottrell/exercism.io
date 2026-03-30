(defpackage :prime-factors
  (:use :cl)
  (:export :factors))

(in-package :prime-factors)

(defun factors (n)
  "Gets the prime factors of N."
  (sort (get-next-factor n 2 '()) #'<))

(defun get-next-factor (remaining current-divisor so-far)
  (cond ((> current-divisor remaining) so-far)
        ((zerop (mod remaining current-divisor))
         (get-next-factor (/ remaining current-divisor) current-divisor (cons current-divisor so-far)))
        (t (get-next-factor remaining (1+ current-divisor) so-far))))
