(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defparameter *number-sound-pairs*
  '((3 "Pling")
    (5 "Plang")
    (7 "Plong")))

(defun convert (number)
  (let ((translation (translate-numbers-to-sounds number)))
    (if (zerop (length translation))
        (write-to-string number)
        translation)))

(defun translate-numbers-to-sounds (number)
  (reduce (make-number-sound-reducer number)
          *number-sound-pairs*
          :initial-value ""))

(defun make-number-sound-reducer (number)
  #'(lambda (so-far number-to-sound-pair)
      (if (zerop (mod number (first number-to-sound-pair)))
          (concatenate 'string so-far (second number-to-sound-pair))
          so-far)))
