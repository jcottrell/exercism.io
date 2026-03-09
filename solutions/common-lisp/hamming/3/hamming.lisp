(defpackage :hamming
  (:use :cl)
  (:export :distance))

(in-package :hamming)

(defun distance (strand1 strand2)
  "Returns the hamming distance between STRAND1 and STRAND2."
  (when (= (length strand1) (length strand2))
    (let ((left (coerce strand1 'list))
          (right (coerce strand2 'list)))
        (count t (mapcar #'char/= left right)))))

; (distance "GAGCCTACTAACGGGAT" "CATCGTAATGACGGCCT")
