(defpackage :pizza-pi
  (:use :cl)
  (:export :dough-calculator :pizzas-per-cube
           :size-from-sauce :fair-share-p))

(in-package :pizza-pi)

(defparameter dough-for-middle 200)
(defparameter crust-per-dough 20)
(defparameter dough-per-crust 45) ; struct for measurements?

(defun dough-calculator (pizzas diameter)
  (values
   (round
    (* pizzas (+ (/ (* dough-per-crust diameter pi) crust-per-dough) dough-for-middle)))))
;; (dough-calculator 4 30) ; 1648
;; (dough-calculator 2 35) ; 895

(defparameter sauce-splash 40)

(defun size-from-sauce (sauce)
  (sqrt (/ (* sauce-splash sauce) (* 3 pi))))
;; (size-from-sauce 250) ; 32.5735

(defun pizzas-per-cube (cube-size diameter)
  (values
   (truncate
    (/ (* 2 (expt cube-size 3)) (* 3 (expt diameter 2) pi)))))
; (pizzas-per-cube 25 30) ; 3

(defparameter slices-per-pizza 8)

(defun fair-share-p (pizzas friends)
  (integerp
   (/ (* pizzas slices-per-pizza) friends)))
; (fair-share-p 3 4) ; T
; (fair-share-p 2 3) ; NIL
