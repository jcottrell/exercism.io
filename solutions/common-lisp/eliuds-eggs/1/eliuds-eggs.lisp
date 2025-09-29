(defpackage :eliuds-eggs
  (:use :cl)
  (:export :egg-count))

(in-package :eliuds-eggs)

(defun egg-count (number)
  (count #\1 (coerce (format nil "~b" number) 'list)))
