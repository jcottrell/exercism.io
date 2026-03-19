(defpackage :strain
  (:use :cl)
  (:export :keep :discard))

(in-package :strain)

; @bennydictor solution (so I can keep it for reference)
(setf (symbol-function 'keep) #'remove-if-not)
(setf (symbol-function 'discard) #'remove-if)
