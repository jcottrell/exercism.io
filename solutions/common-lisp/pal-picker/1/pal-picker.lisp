(defpackage :pal-picker
  (:use :cl)
  (:export :pal-picker :habitat-fitter :feeding-time-p
           :pet :play-fetch))

(in-package :pal-picker)

(defun pal-picker (personality)
  "Returns the animal associated with the given PERSONALITY."
  (case personality
    (:lazy "Cat")
    (:energetic "Dog")
    (:quiet "Fish")
    (:hungry "Rabbit")
    (:talkative "Bird")
    (otherwise "I don't know... A dragon?")))
; (pal-picker :lazy) ; "Cat"

(defun habitat-fitter (weight)
  "Returns the habitat size suited for WEIGHT."
  (cond ((>= weight 40) :massive)
        ((>= weight 20) :large)
        ((>= weight 10) :medium)
        ((>= weight 1) :small)
        (t :just-your-imagination)))
; (habitat-fitter 43) ; :massive

(defun feeding-time-p (fullness)
  "Returns whether it is feeding time according to the FULLNESS of the feeder."
  (if (> fullness 20)
      "All is well."
      "It's feeding time!"))
; (feeding-time-p 23) ; "All is well."

(defun pet (pet)
  "Returns if the PET can be stroked."
  (when (string= pet "Fish")
      "Maybe not with this pet..."))
; (pet "Dog") ; NIL

(defun play-fetch (pet)
  (when (not (string= pet "Dog"))
    "Maybe not with this pet..."))
; (play-fetch "Fish") ; "Maybe not with this pet..."
