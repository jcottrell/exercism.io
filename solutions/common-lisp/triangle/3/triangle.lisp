(defpackage :triangle
  (:use :cl)
  (:export :triangle-type-p))

(in-package :triangle)

;; @dsletten for every and not isosceles; Triangle inequality link
(defun triangle-type-p (type a b c)
  "Deterimines if a triangle (given by side lengths A, B, C) is of the given TYPE.
Possible types are :equilateral :isosceles and :scalene."
  (when (triangle-p a b c)
    (case type
      (:equilateral (equilateral-p a b c))
      (:isosceles (isosceles-p a b c))
      (:scalene (scalene-p a b c)))))

(defun triangle-p (a b c)
  "Return T if the lengths A B C obey the rules for triangles."
  (and (every #'plusp (list a b c))
       (< (* 2 (max a b c)) (+ a b c)))); Triangle inequality

(defun equilateral-p (a b c)
  "Returns T when A B C are equal."
  (= a b c))

(defun isosceles-p (a b c)
  "Returns T when at least two of A B C are equal."
  (or (= a b) (= a c) (= b c)))

(defun scalene-p (a b c)
  "Returns T when no combination of A B C is equal."
  (not (isosceles-p a b c)))
