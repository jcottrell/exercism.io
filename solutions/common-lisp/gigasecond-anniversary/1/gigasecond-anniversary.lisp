(defpackage :gigasecond-anniversary
  (:use :cl)
  (:export :from))
(in-package :gigasecond-anniversary)

(defun from (year month day hour minute second)
  "Returns the gigasecond anniversary of the date passed in.
The timezone needs to be specified and the same to encode and decode."
  (let* ((start-time (encode-universal-time second minute hour day month year 0))
         (end-time (+ 1000000000 start-time)))
    (multiple-value-bind (second minute hour day month year)
                         (decode-universal-time end-time 0)
      (list year month day hour minute second))))
; (from 2000 1  1  0  0  0) ; (2031 9  9  1 46 40)
; (from 1900 1  1  0  0  0) ; (1931 9 10  1 46 40)
; (from 1970 1  1  0  0  0) ; (2001 9  9  1 46 40)
; (from 2011 4 25 12  0  0) ; (2043 1  1 13 46 40)
; (from 1977 6 13 23 59 59) ; (2009 2 20  1 46 39)
; (from 1959 7 19 12 30 30) ; (1991 3 27 14 17 10)
