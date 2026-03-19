(defpackage :phone-number
  (:use :cl)
  (:export :clean))

(ql:quickload "cl-ppcre")

(in-package :phone-number)

(defun clean (phrase)
  "Converts a PHRASE string into a string of digits.
Will evaluate to \"0000000000\" in case of an invalid input."
  (let* ((invalid "0000000000")
         (digits (ppcre:all-matches-as-strings "\\d+" phrase))
         (whole-number (reduce (lambda (so-far current)
                                 (concatenate 'string so-far current))
                               digits))
         (valid-but-long (and (= 11 (length whole-number))
                              (string= "1" (subseq whole-number 0 1))))
         (fitted-number (if valid-but-long (subseq whole-number 1) whole-number)))
    (cond ((/= 10 (length fitted-number)) invalid)
          ((or (string= "0" (subseq fitted-number 0 1))
               (string= "1" (subseq fitted-number 0 1)))
           invalid)
          ((or (string= "0" (subseq fitted-number 3 4))
               (string= "1" (subseq fitted-number 3 4)))
           invalid)
          (t fitted-number))))
  
