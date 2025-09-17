(defpackage :twelve-days
  (:use :cl)
  (:export :recite))

(in-package :twelve-days)

(defconstant +gifts+
  '(
    "a Partridge in a Pear Tree"
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

(defun get-verse (highest-day)
  "Return the verse for HIGHEST-DAY starting with its gift and receding."
  (let ((gifts-of-the-day (reverse (subseq +gifts+ 0 highest-day))))
    (format nil "On the ~:r day of Christmas my true love gave to me: ~{~a,~^ ~}~a~a."
            highest-day
            (butlast gifts-of-the-day)
            (if (> (length gifts-of-the-day) 1) " and " "")
            (first (last gifts-of-the-day)))))

(defun recite (&optional (begin 1 begin-set-p) (end begin))
  "Returns a string of the requested verses for the 12 Days of Christmas."
  (loop for day from begin to (if begin-set-p end 12)
        collect (get-verse day) into days
        finally (return (format nil "~{~a~^~%~}" days))))
