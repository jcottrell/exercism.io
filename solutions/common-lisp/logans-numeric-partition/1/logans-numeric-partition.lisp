(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

(defun categorize-number (odd-even-pair number-to-classify)
  "Returns a new ODD-EVEN-PAIR with NUMBER-TO-CLASSIFY classified in the pair."
  (if (oddp number-to-classify)
      (cons (cons number-to-classify (car odd-even-pair))
            (cdr odd-even-pair))
      (cons (car odd-even-pair)
            (cons number-to-classify (cdr odd-even-pair)))))
; (categorize-number '((1) . (2)) 23); ((23 1) . (2))
; (categorize-number '((1) . (2)) 42); ((1) . (42 2))

(defun partition-numbers (number-list)
  "Partitions NUMBER-LIST into a pair with an odd and even list."
  (reduce #'categorize-number number-list :initial-value '(() . ())))
; (partition-numbers '(1 2 3 4)); ((3 1) . (4 2))
; (partition-numbers '(42 31 24 13)); ((13 31) . (24 42))
