(defpackage :hamming
  (:use :cl)
  (:export :distance))

(in-package :hamming)

(defun distance (strand1 strand2 &optional (distance 0))
  (cond ((or (null strand1)
             (null strand2)
             (not (= (length strand1)
                     (length strand2))))
         nil)
        ((> (length strand1) 0)
         (distance (subseq strand1 1)
                   (subseq strand2 1)
                   (if (eql (aref strand1 0)
                            (aref strand2 0))
                       distance
                       (1+ distance))))
        (t distance)))

; (distance "GAGCCTACTAACGGGAT" "CATCGTAATGACGGCCT")
