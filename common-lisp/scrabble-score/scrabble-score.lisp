(defpackage :scrabble-score
  (:use :cl)
  (:export :score-word))

(in-package :scrabble-score)

(defparameter *letters-value-pairs*
  '(("AEIOULNRST" 1)
    ("DG" 2)
    ("BCMP" 3)
    ("FHVWY" 4)
    ("K" 5)
    ("JX" 8)
    ("QZ" 10))
  "An alist of letters with their score.")

(defun score-word (word)
  "Returns the totalled value of all letters in WORD."
  (apply #'+ (map 'list #'letter-in-value-pairs word)))

(defun letter-in-value-pairs (letter)
  "Returns the LETTER value from all the letter-values."
  (second (assoc (char-upcase letter) *letters-value-pairs* :test #'find)))
