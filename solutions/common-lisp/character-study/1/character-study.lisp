(defpackage :character-study
  (:use :cl)
  (:export
   :compare-chars
   :size-of-char
   :change-size-of-char
   :type-of-char))
(in-package :character-study)

(defun compare-chars (char1 char2)
  "Returns a comparison of CHAR1 to CHAR2."
  (cond ((char> char1 char2) :greater-than)
        ((char< char1 char2) :less-than)
        ((char= char1 char2) :equal-to)))
; (compare-chars #\c #\m) ; :less-than
; (compare-chars #\m #\c) ; :greater-than
; (compare-chars #\e #\e) ; :equal-to

(defun size-of-char (char)
  "Returns the size of the CHAR."
  (cond ((upper-case-p char) :big)
        ((lower-case-p char) :small)
        (t :no-size)))
; (size-of-char #\A) ; :big
; (size-of-char #\a) ; :small
; (size-of-char #\1) ; :no-size

(defun change-size-of-char (char wanted-size)
  "Returns the WANTED-SIZE of CHAR."
  (case wanted-size
    (:big (char-upcase char))
    (:small (char-downcase char))))
; (change-size-of-char #\a :big) ; #\A
; (change-size-of-char #\A :small) ; #\a

(defun type-of-char (char)
  "Returns the type of CHAR."
  (cond ((alpha-char-p char) :alpha)
        ((digit-char-p char) :numeric)
        ((char= #\space char) :space)
        ((char= #\newline char) :newline)
        (t :unknown)))
