(defpackage :twelve-days
  (:use :cl)
  (:export :recite))

(in-package :twelve-days)

(defconstant +gifts+
  '("a Partridge in a Pear Tree"
    "two Turtle Doves"
    "three French Hens"
    "four Calling Birds"
    "five Gold Rings"
    "six Geese-a-Laying"
    "seven Swans-a-Swimming"
    "eight Maids-a-Milking"
    "nine Ladies Dancing"
    "ten Lords-a-Leaping"
    "eleven Pipers Piping"
    "twelve Drummers Drumming"))
;; hat tip: joaofnds for ~#[] in format
(defun get-verse (highest-day)
  "Return the verse for HIGHEST-DAY starting with its gift and receding."
  (let ((gifts-of-the-day (reverse (subseq +gifts+ 0 highest-day))))
    (format nil "On the ~:r day of Christmas my true love gave to me: ~{~a~^, ~#[~;and ~]~}."
            highest-day
            gifts-of-the-day)))
;; hat tip: blogscot for the default end value; improved now with length
(defun recite (&optional (begin 1 begin-set-p) (end (if begin-set-p begin (length +gifts+))))
  "Returns a string of the requested verses for the 12 Days of Christmas."
  (loop for day from begin to end
        collect (get-verse day) into days
        finally (return (format nil "~{~a~^~%~}" days))))
