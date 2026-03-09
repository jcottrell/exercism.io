(defpackage :grade-school
  (:use :cl)
  (:export :make-school :add :roster :grade))

(in-package :grade-school)

(defun make-school ()
  '())

(defun add (school name grade)
  (if (assoc name school)
      school
      (push (cons name grade) school)))

(defun roster (school)
  (mapcar #'car school))
;(roster '(("George" . 2) ("Joe" . 2)))

(defun grade (school grade)
  (format t "~%~S" school)
  (sort (roster (remove-if-not (lambda (student)
                                 (= grade (cdr student)))
                               school))
        #'string-lessp))
;(grade '(("George" . 2) ("Joe" . 2) ("Jim" . 1) ("Dan" . 1)) 1)

(let ((school (make-school)))
  (add school "Franklin" 5)
  (add school "Bradley" 5)
  (add school "Jeff" 1)
  (grade school 5))
