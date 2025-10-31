(defpackage :triangle
  (:use :cl)
  (:export :triangle-type-p))

(in-package :triangle)

(defun triangle-type-p (type a b c)
  "Deterimines if a triangle (given by side lengths A, B, C) is of the given TYPE.
Possible types are :equilateral :isosceles and :scalene."
  (when (and (= 3 (length (remove-if #'zerop (list a b c))))
             (triangle-p a b c))
    (case type
      (:equilateral (equilateral-p a b c))
      (:isosceles (isosceles-p a b c))
      (:scalene (scalene-p a b c)))))

(defun triangle-p (a b c)
  "Return T if the lengths a, b, and c obey the rules for triangles."
  (and (<= c (+ a b))
       (<= a (+ b c))
       (<= b (+ a c))))

(defun equilateral-p (a b c)
  (= a b c))

(defun isosceles-p (a b c)
  (or (= a b) (= a c) (= b c)))

(defun scalene-p (a b c)
  (and (not (= a b)) (not (= a c)) (not (= b c))))
