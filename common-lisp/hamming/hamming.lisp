(defpackage :hamming
  (:use :cl)
  (:export :distance))

(in-package :hamming)

(defun distance (strand1 strand2)
  "Returns the hamming distance between STRAND1 and STRAND2."
  (when (= (length strand1) (length strand2))
        (count t (map 'list #'char/= strand1 strand2))))

; (distance "GAGCCTACTAACGGGAT" "CATCGTAATGACGGCCT")
