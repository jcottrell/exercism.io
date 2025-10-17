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
  (apply #'+ (mapcar #'letter-in-value-pairs (coerce word 'list))))

(defun letter-in-value-pairs (letter)
  "Returns the LETTER value from all the letter-values."
  (second (assoc-member-in-letters-value-pairs letter)))

(defun assoc-member-in-letters-value-pairs (letter)
  "Returns the pair from an alist where letter exists in the first of the pair."
  (assoc letter *letters-value-pairs* :test #'member-in-list-equalp))

(defun member-in-list-equalp (needle haystack)
  "Returns the member result but with EQUALP."
  (member needle haystack :test #'equalp))
