(defpackage :pascals-triangle
  (:use :cl)
  (:export :rows))

(in-package :pascals-triangle)

(defun rows (count)
  (do* ((current-row '() (build-next-row current-row))
        (result '() (append result
                            (list current-row)))
        (rows-so-far 0 (1+ rows-so-far)))
      ((>= rows-so-far count) result)))

;(rows 0); '()
;(rows 1); '((1))
;(rows 2); '((1) (1 1))
;(rows 3); '((1) (1 1) (1 2 1))
;(rows 4); '((1) (1 1) (1 2 1) (1 3 3 1))
;(rows 5); '((1) (1 1) (1 2 1) (1 3 3 1) (1 4 6 4 1))

(defun build-next-row (previous-row)
  (if previous-row
      (append '(1)
              (build-middle-of-row previous-row)
              '(1))
      '(1)))

;(build-next-row '()); '(1)
;(build-next-row '(1)); '(1 1)
;(build-next-row '(1 1)); '(1 2 1)
;(build-next-row '(1 2 1)); '(1 3 3 1)

(defun build-middle-of-row (remaining-in-row &optional (result '()))
  (cond ((<= 0 (length remaining-in-row) 1) result)
        (t (build-middle-of-row (rest remaining-in-row)
                                (append result
                                        (list (+ (car remaining-in-row)
                                                 (cadr remaining-in-row))))))))

;(build-middle-of-row '(1)); '()
;(build-middle-of-row '(1 1)); '(2)
;(build-middle-of-row '(1 2 1)); '(3 3)
