(defpackage :scrabble-score
  (:use :cl)
  (:export :score-word))

(in-package :scrabble-score)

(defparameter *letters-value-pairs*
  '(((#\A #\E #\I #\O #\U #\L #\N #\R #\S #\T) 1)
    ((#\D #\G) 2)
    ((#\B #\C #\M #\P) 3)
    ((#\F #\H #\V #\W #\Y) 4)
    ((#\K) 5)
    ((#\J #\X) 8)
    ((#\Q #\Z) 10))
  "An alist of letters with their score.")

(defun score-word (word)
  "Returns the totalled value of all letters in WORD."
  (let* ((word-letters (coerce word 'list))
         (scores (mapcar #'letter-in-value-pairs word-letters)))
    (apply #'+ scores)))

(defun letter-in-value-pairs (letter)
  "Returns the LETTER value from all the letter-values."
  (labels ((find-letter-in-pairs (remaining-letters-value-pairs)
             (cond ((null remaining-letters-value-pairs) 0)
                   ((member letter (first (car remaining-letters-value-pairs)) :test #'equalp)
                    (second (car remaining-letters-value-pairs)))
                   (t (find-letter-in-pairs (cdr remaining-letters-value-pairs))))))
    (find-letter-in-pairs *letters-value-pairs*)))
