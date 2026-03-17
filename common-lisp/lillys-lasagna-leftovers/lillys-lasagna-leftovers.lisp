(defpackage :lillys-lasagna-leftovers
  (:use :cl)
  (:export
   :preparation-time
   :remaining-minutes-in-oven
   :split-leftovers))

(in-package :lillys-lasagna-leftovers)

(defconstant preparation-per-layer 19)
(defconstant family-cook-time 337)

(defun preparation-time (&rest layers)
  "Returns the preparation time needed for the number of LAYERS."
  (* preparation-per-layer (length layers)))
; (preparation-time 'sauce 'cheese 'right-handed-macaroni 'cheese 'sauce 'left-handed-macaroni 'sauce 'cheese ) ; 190

(defun remaining-minutes-in-oven (&optional (variation :normal variation-supplied-p))
  "Returns the total (not remaining) cook time with an optional VARIATION."
  (case variation
    (:normal family-cook-time)
    (:shorter (- family-cook-time 100))
    (:very-short (- family-cook-time 200))
    (:longer (+ family-cook-time 100))
    (:very-long (+ family-cook-time 200))
    ;(otherwise family-cook-time)
    (otherwise (if variation-supplied-p 0 family-cook-time))))
; (remaining-minutes-in-oven) ; 337
; (remaining-minutes-in-oven :normal) ; 337
; (remaining-minutes-in-oven :shorter) ; 237
; (remaining-minutes-in-oven :very-short) ; 137
; (remaining-minutes-in-oven :longer) ; 437
; (remaining-minutes-in-oven :very-long) ; 537
; (remaining-minutes-in-oven nil) ; 0

(defun split-leftovers (&key (alien 10) (human 10) (weight nil weight-supplied-p))
  (cond ((not weight-supplied-p) :just-split-it)
        ((null weight) :looks-like-someone-was-hungry)
        (t (- weight (+ human alien)))))
; (split-leftovers :weight 20 :human 10 :alien 5) ; 5
; (split-leftovers :weight 20 :alien 10 :human 2) ; 8
; (split-leftovers :alien 12 :weight 20 :human 4) ; 4
; (split-leftovers :weight 20 :human 5) ; 5
; (split-leftovers :weight 20 :alien 5) ; 5
; (split-leftovers :weight 20) ; 0
; (split-leftovers :human 5 :alien 5) ; :JUST-SPLIT-IT
; (split-leftovers :weight nil :human 5 :alien 5) ; :JUST-SPLIT-IT
