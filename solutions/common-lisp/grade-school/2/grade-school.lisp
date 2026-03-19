(defpackage :grade-school
  (:use :cl)
  (:export :make-school :add :roster :grade))

(in-package :grade-school)

(defun make-school ()
  (make-array '(12) :initial-element '()))

(defun add (school name grade)
  (let ((current-students-in-grade (elt school (1- grade))))
    (unless (or (member name current-students-in-grade :test #'string=)
                (member name (roster school) :test #'string=))
        (setf (elt school (1- grade)) (sort (cons name current-students-in-grade) #'string<)))))

(defun roster (school)
  (let ((roster '()))
    (dotimes (grade-level (length school) roster)
      (setf roster (append roster (elt school grade-level))))))

(defun grade (school grade)
  (sort (elt school (1- grade))
        #'string<))
