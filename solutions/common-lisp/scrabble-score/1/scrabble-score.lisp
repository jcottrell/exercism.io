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
    ((#\Q #\Z) 10)))

(defun score-word (word)
  (let* ((word-letters (coerce word 'list))
         (scores (mapcar #'letter-in-value-pairs word-letters)))
    (apply #'+ scores)))

(defun letter-in-value-pairs (letter)
  (find-letter-in-pairs letter *letters-value-pairs*))

(defun find-letter-in-pairs (letter remaining-letters-value-pairs)
  (cond ((null remaining-letters-value-pairs) 0)
        ((member letter (first (car remaining-letters-value-pairs)) :test #'equalp)
         (second (car remaining-letters-value-pairs)))
        (t (find-letter-in-pairs letter (cdr remaining-letters-value-pairs)))))
