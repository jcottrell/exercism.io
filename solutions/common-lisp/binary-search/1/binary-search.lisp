(defpackage :binary-search
  (:use :cl)
  (:export :binary-find :value-error))

(in-package :binary-search)

(defun binary-find (arr el)
  (let ((length (length arr)))
    (labels ((find-in-part (current-min current-max)
               (when (and (<= 0 current-min current-max) (> length current-max))
                 (let* ((middle-index (floor (/ (+ current-min current-max) 2)))
                        (middle-value (aref arr middle-index)))
                   (cond ((= el middle-value) middle-index)
                         ((>= current-min current-max) nil); not found
                         ((> el middle-value) (find-in-part (1+ middle-index) current-max))
                         (t (find-in-part current-min (1- middle-index))))))))
      (find-in-part 0 (1- length)))))
