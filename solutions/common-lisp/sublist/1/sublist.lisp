(defpackage :sublist
  (:use :cl)
  (:export :sublist))

(in-package :sublist)

(defun sublist (list-one list-two)
  "Returns the relationship between LIST-ONE and LIST-TWO.
Possible relationships: :equal :unequal :sublist :superlist"
  (cond ((and (null list-one)
              (null list-two)) :equal)
        ((null list-two) :superlist)
        ((null list-one) :sublist)
        ((equalp list-one list-two) :equal)
        ((contains list-two list-one) :sublist)
        ((contains list-one list-two) :superlist)
        (t :unequal)))

(defun contains (left right)
  "Returns T if the LEFT list contains the RIGHT list in order."
  (let ((search-result (member (car right) left)))
    (cond ((= (length left) (length right)) (equal left right))
          ((or (null left)
               (null search-result)) nil)
          ((equal right
                  (subseq search-result
                          0
                          (min (length right)
                               (length search-result))))
           t)
          (t (contains (cdr (member (car right) left))
                       right)))))

;(sublist '() '()); :EQUAL
;(sublist '(1 2 3) '()); :SUPERLIST
;(sublist '() '(1 2 3)); :SUBLIST
;(sublist '(1 2 3) '(1 2 3 4 5)); :SUBLIST
;(sublist '(1 2 3 4 5) '(2 3)); :SUPERLIST
;(sublist '(1 2 4) '(1 2 3 4 5)); :UNEQUAL
;(sublist '(1 2 3) '(1 3 2)); :UNEQUAL
;(sublist '(1 3 1 2 3) '(1 2 3)); :SUPERLIST
;(sublist '(1 2 3) '(1 3 1 2 3)); :SUBLIST
