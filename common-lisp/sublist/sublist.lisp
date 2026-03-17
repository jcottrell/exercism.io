(defpackage :sublist
  (:use :cl)
  (:export :sublist))

(in-package :sublist)

(defun sublist (list-one list-two)
  "Returns the relationship between LIST-ONE and LIST-TWO.
Possible relationships: :equal :unequal :sublist :superlist"
  (cond ((and (null list-one) (null list-two)) :equal)
        ((null list-two) :superlist)
        ((null list-one) :sublist)
        ((equalp list-one list-two) :equal)
        ((contains list-two list-one) :sublist)
        ((contains list-one list-two) :superlist)
        (t :unequal)))

(defun contains (left right)
  "Returns T if the LEFT list equals or contains the RIGHT list in order."
  (let* ((match-to-end (member (car right) left))
         (search-result (subseq match-to-end
                                0
                                (min (length right)
                                     (length match-to-end)))))
    (cond ((equal right search-result) t)
          ((null search-result) nil)
          (t (contains (cdr match-to-end) right)))))
