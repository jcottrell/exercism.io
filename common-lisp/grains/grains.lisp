(defpackage :grains
  (:use :cl)
  (:export :square :total))
(in-package :grains)

(defun square (n)
  "Returns the number of grains on square N."
  (expt 2 (1- n)))

(defun total ()
  "Returns the total number of grains for the entire chess board."
  (loop for square-number from 1 to 64
        sum (square square-number)))
