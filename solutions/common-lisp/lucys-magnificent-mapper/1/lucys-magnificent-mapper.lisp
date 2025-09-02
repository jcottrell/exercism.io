(defpackage :lucys-magnificent-mapper
  (:use :cl)
  (:export :make-magnificent-maybe :only-the-best))

(in-package :lucys-magnificent-mapper)

(defun make-magnificent-maybe (fun number-list)
  (mapcar fun number-list))
; (defun square (x) (expt x 2))
; (make-magnificent-maybe #'square '(1 2 3)) ; (1 4 9)
; (make-magnificent-maybe #'1+ '(1 2 3))     ; (2 3 4)

(defun only-the-best (remover-fun number-list)
  (remove-if remover-fun
             (remove 1 number-list)))
; (only-the-best #'evenp '(1 2 3 4 5)) ; (3 5)
; (only-the-best #'oddp '(1 3 5)) ; ()
