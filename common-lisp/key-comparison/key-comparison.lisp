(defpackage :key-comparison
  (:use :cl)
  (:export
   :key-object-identity
   :key-numbers
   :key-numbers-of-different-types
   :key-characters
   :key-characters-case-insensitively
   :key-strings
   :key-strings-case-insensitively
   :key-conses-of-symbols
   :key-conses-of-characters
   :key-conses-of-numbers
   :key-conses-of-characters-case-insensitively
   :key-conses-of-numbers-of-different-types
   :key-arrays
   :key-arrays-loosely))
(in-package :key-comparison)

(defun key-object-identity (x y)
  "Returns T if X and Y are the same string at the same location."
  (eql x y))
; (setf a "pizza")
; (setf b "pizza")
; (key-object-identity a b) ; NIL
; (key-object-identity a a) ; T

(defun key-numbers (x y)
  "Returns T if X and Y are equal number values and types."
  (eql x y))
; (setf a 13)
; (setf b 13.0)
; (setf c 13)
; (key-numbers a b) ; NIL
; (key-numbers a c) ; T
(defun key-numbers-of-different-types (x y)
  (equalp x y))
; (key-numbers-of-different-types a b) ; => T

(defun key-characters (x y)
  (eql x y))
; (setf a #\X)
; (setf b #\x)
; (setf c #\X)
; (key-characters a b) ; NIL
; (key-characters a c) ; T
(defun key-characters-case-insensitively (x y)
  (equalp x y))
; (key-characters-case-insensitively a b) ; T

(defun key-strings (x y)
  (equal x y))
; (setf a "pizza")
; (setf b "PIZZA")
; (setf c "pizza")
; (key-strings a b) ; NIL
; (key-strings a c) ; T
(defun key-strings-case-insensitively (x y)
  (equalp x y))
; (key-strings-case-insensitively a b) ; T

; (setf syms-a '(left . right))
; (setf syms-b '(up . down))
; (setf syms-c '(left . right))
; (setf chars-a '(#\x . #\y))
; (setf chars-b '(#\x . #\Y))
; (setf chars-c '(#\x . #\y))
; (setf nums-a '(13 . 23))
; (setf nums-b '(13 . 23.0))
; (setf nums-c '(13 . 23))
(defun key-conses-of-symbols (x y)
  (and (eql (car x) (car y))
       (eql (cdr x) (cdr y))))
; (key-conses-of-symbols syms-a syms-b) ; NIL
; (key-conses-of-symbols syms-a syms-c) ; T
(defun key-conses-of-characters (x y)
  (and (key-characters (car x) (car y))
       (key-characters (cdr x) (cdr y))))
; (key-conses-of-characters chars-a chars-b) ; NIL
; (key-conses-of-characters chars-a chars-c) ; T
(defun key-conses-of-numbers (x y)
  (and (key-numbers (car x) (car y))
       (key-numbers (cdr x) (cdr y))))
; (key-conses-of-numbers nums-a nums-b) ; NIL
; (key-conses-of-numbers nums-a nums-c) ; T
(defun key-conses-of-characters-case-insensitively (x y)
  (and (key-characters-case-insensitively (car x) (car y))
       (key-characters-case-insensitively (cdr x) (cdr y))))
; (key-conses-of-characters-case-insensitively chars-a chars-b) ; T
(defun key-conses-of-numbers-of-different-types (x y)
  (and (key-numbers-of-different-types (car x) (car y))
       (key-numbers-of-different-types (cdr x) (cdr y))))
; (key-conses-of-numbers-of-different-types nums-a nums-b) ; T

; (setf a #(13 23))
; (setf b #(13 23))
; (setf c #(13 23.0))
(defun key-arrays (x y)
  (eql x y))
; (key-arrays a b) ; NIL
; (key-arrays a c) ; NIL
(defun key-arrays-loosely (x y)
  (equalp x y))
; (key-arrays-loosely a b) ; T
; (key-arrays-loosely a c) ; T
