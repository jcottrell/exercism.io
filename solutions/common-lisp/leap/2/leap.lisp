(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))

(in-package :leap)

(defun evenly-divisible-p (dividend divisor)
  (zerop (mod dividend divisor)))

(defun leap-year-p (year)
  (if (evenly-divisible-p year 100)
      (evenly-divisible-p year 400)
      (evenly-divisible-p year 4)))

; (leap-year-p 1997) ; NIL
; (leap-year-p 1900) ; NIL
; (leap-year-p 2000) ; T
