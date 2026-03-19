(defpackage :triangle
  (:use :cl)
  (:export :triangle-type-p))

(in-package :triangle)

;; @dsletten for every; Triangle inequality link
(defun triangle-type-p (type a b c)
  "Deterimines if a triangle (given by side lengths A, B, C) is of the given TYPE.
Possible types are :equilateral :isosceles and :scalene."
  (when (triangle-p a b c)
    (case type
      (:equilateral (= a b c))
      (:isosceles (or (= a b) (= a c) (= b c)))
      (:scalene (and (/= a b) (/= a c) (/= b c))))))

(defun triangle-p (a b c)
  "Return T if the lengths A B C obey the rules for triangles."
  (and (every #'plusp (list a b c))
       (< (* 2 (max a b c)) (+ a b c)))); Triangle inequality
