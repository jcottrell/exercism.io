(defpackage :hamming
  (:use :cl)
  (:export :distance))

(in-package :hamming)

(defun distance (strand1 strand2 &optional (distance 0))
  (when (= (length strand1) (length strand2))
    (if (> (length strand1) 0)
        (let* ((left-first (aref strand1 0))
               (right-first (aref strand2 0))
               (left-rest (subseq strand1 1))
               (right-rest (subseq strand2 1))
               (distance (if (eql left-first right-first)
                             distance
                             (1+ distance))))
          (distance left-rest right-rest distance))
        distance)))



; (distance "GAGCCTACTAACGGGAT" "CATCGTAATGACGGCCT")
