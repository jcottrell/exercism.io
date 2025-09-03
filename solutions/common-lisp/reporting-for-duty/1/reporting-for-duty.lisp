(defpackage :reporting-for-duty
  (:use :cl)
  (:export :format-quarter-value :format-two-quarters
           :format-two-quarters-for-reading))

(in-package :reporting-for-duty)

(defun format-quarter-value (calendar-quarter value)
  "Returns a string explaining the VALUE for the CALENDAR-QUARTER."
  (format nil "The value ~a quarter: ~a" calendar-quarter value))
; (format-quarter-value "last" 3.14); "The value last quarter: 3.14"
; (format-quarter-value "this" 0); "The value this quarter: 0"

(defun format-two-quarters (stream quarter-one value-one quarter-two value-two)
  "Sends the formatted quarters to the STREAM."
  (format stream
          "~%~a~%~a~%"
          (format-quarter-value quarter-one value-one)
          (format-quarter-value quarter-two value-two)))
; (format-two-quarters t "last" 3.14 "this" 0);

;; Define format-two-quarters-for-reading function.
(defun format-two-quarters-for-reading (stream quarter-one value-one quarter-two value-two)
  "Sends the formatted quarters to the STREAM in a readable format."
  (let ((result-one (format-quarter-value quarter-one value-one))
        (result-two (format-quarter-value quarter-two value-two)))
    (format stream "~s" (list result-one result-two))))
; (format-two-quarters-for-reading nil "last" 3.14 "this" 0);
