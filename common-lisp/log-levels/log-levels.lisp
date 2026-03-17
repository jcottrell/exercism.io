(defpackage :log-levels
  (:use :cl)
  (:export :log-message :log-severity :log-format))

(in-package :log-levels)

(defconstant +whitespace+ '(#\Space #\Tab))
(defconstant +level-from-message-delimiter+ #\:)
(defconstant +level-beginning-delimiter+ #\[)
(defconstant +level-ending-delimiter+ #\])

(defun log-message (log-string)
  "Returns the message contained in the LOG-STRING."
  (let* ((delimiter-position (position +level-from-message-delimiter+ log-string))
         (log-after-delimiter (subseq log-string (1+ delimiter-position))))
    (string-trim +whitespace+ log-after-delimiter)))
; (log-message "[ohno]: whoops!") ; "whoops!"

(defun log-severity (log-string)
  "Returns the severity of the LOG-STRING level."
  (let* (
         (beginning-delimiter-position (position +level-beginning-delimiter+ log-string))
         (ending-delimiter-position (position +level-ending-delimiter+ log-string))
         (level-between-delimiters (subseq log-string
                                           (1+ beginning-delimiter-position)
                                           ending-delimiter-position))
         (level (string-downcase level-between-delimiters)))
    (cond ((string= "info" level) :everything-ok)
          ((string= "warn" level) :getting-worried)
          ((string= "ohno" level) :run-for-cover)
          (t level))))
; (log-severity "[warn]: might want to get that checked") ; :getting-worried
; (log-severity "[WaRn]: string case system failing") ; :getting-worried

(defun log-format (log-string)
  "Returns the proper casing of the message in LOG-STRING."
  (let ((severity (log-severity log-string))
        (message (log-message log-string)))
    (case severity
      (:everything-ok (string-downcase message))
      (:getting-worried (string-capitalize message))
      (:run-for-cover (string-upcase message)))))
; (log-format "[ohno]: whoops!") ; "WHOOPS!"
