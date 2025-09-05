(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))

(in-package :leap)

(defun leap-year-p (year)
  (or (zerop (mod year 400))
      (and (zerop (mod year 4))
           (not (zerop (mod year 100))))))
; (leap-year-p 1997) ; NIL
; (leap-year-p 1900) ; NIL
; (leap-year-p 2000) ; T
