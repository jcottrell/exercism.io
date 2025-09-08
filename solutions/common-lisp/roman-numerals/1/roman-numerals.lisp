(defpackage :roman-numerals
  (:use :cl)
  (:export :romanize))

(in-package :roman-numerals)

(defconstant +arabic-roman-conversion-map+
   '((1000 . "M")
     (900 . "CM")
     (500 . "D")
     (400 . "CD")
     (100 . "C")
     (90 . "XC")
     (50 . "L")
     (40 . "XL")
     (10 . "X")
     (9 . "IX")
     (5 . "V")
     (4 . "IV")
     (1 . "I")))

(defun romanize (number &optional (remaining +arabic-roman-conversion-map+) (roman-numeral ""))
  "Returns the Roman numeral representation for a given number."
  (cond ((or (>= 0 number) (null remaining)) roman-numeral)
        ((>= number (caar remaining)) (romanize (- number (caar remaining))
                                                (if (> (/ number (caar remaining)) 1)
                                                    remaining
                                                    (cdr remaining))
                                                (concatenate 'string roman-numeral (cdar remaining))))
        (t (romanize number (cdr remaining) roman-numeral))))
; (romanize 1) ; "I"
; (romanize 4) ; "IV"
; (romanize 105) ; "CV"
; (romanize 18) ; "XVIII"
; (romanize 106) ; "CVI"
; (romanize 104) ; "CIV"
; (romanize 1996) ; "MCMXCVI"
