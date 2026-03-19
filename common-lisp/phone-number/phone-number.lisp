(defpackage :phone-number
  (:use :cl)
  (:export :clean))

(in-package :phone-number)

(defun clean (phrase)
  "Converts a PHRASE string into a string of digits.
Will evaluate to \"0000000000\" in case of an invalid input."
  (let* ((invalid "0000000000")
         (digits (get-only-digits phrase))
         (valid-but-long (and (= 11 (length digits))
                              (string= "1" (subseq digits 0 1))))
         (fitted-number (if valid-but-long (subseq digits 1) digits)))
    (cond ((/= 10 (length fitted-number)) invalid)
          ((and (digit-at-least-2 (subseq fitted-number 0 1))
                (digit-at-least-2 (subseq fitted-number 3 4)))
           fitted-number)
          (t invalid))))

(defun get-only-digits (phrase)
  (remove-if-not 'digit-char-p phrase))

(defun digit-at-least-2 (str-digit)
  (>= (parse-integer str-digit) 2))
