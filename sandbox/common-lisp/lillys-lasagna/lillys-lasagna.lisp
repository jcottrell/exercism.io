(defpackage :lillys-lasagna
  (:use :cl)
  (:export :expected-time-in-oven
           :remaining-minutes-in-oven
           :preparation-time-in-minutes
           :elapsed-time-in-minutes))

(in-package :lillys-lasagna)

(defconstant expected-time-in-oven 337)
(defconstant preparation-time-per-layer 19)

(defun expected-time-in-oven ()
  "Returns the number of minutes Lisp Alien Lasagna needs to cook."
  expected-time-in-oven)
; (expected-time-in-oven) ; 337

(defun remaining-minutes-in-oven (time-so-far)
  "Returns remaining minutes needed in the oven after TIME-SO-FAR has elapsed."
  (- (expected-time-in-oven) time-so-far))
; (remaining-minutes-in-oven 100) ; 237

(defun preparation-time-in-minutes (layers)
  "Returns the number of minutes needed to prepare LAYERS of lasagna."
  (* preparation-time-per-layer layers))
; (preparation-time-in-minutes 3) ; 57

(defun elapsed-time-in-minutes (layers time-so-far)
  "Returns the total time spent preparing a lasagna of LAYERS size after TIME-SO-FAR minutes."
  (+ time-so-far (preparation-time-in-minutes layers)))
; (elapsed-time-in-minutes 3 100) ; 157
