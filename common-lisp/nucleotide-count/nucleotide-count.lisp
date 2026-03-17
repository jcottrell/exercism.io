(defpackage :nucleotide-count
  (:use :cl)
  (:export :nucleotide-counts))

(in-package :nucleotide-count)

;; Works but not in-place so simple equalp test fails
;;(defun nucleotide-counts (strand)
;;  "Returns an alist of each nucleotide and the total times found in STRAND."
;;  (when (= (length strand)
;;           (length (remove-if-not #'nucleotide-p strand)))
;;    (reduce #'(lambda (nucleotide-count nucleotide)
;;                (let ((previous-count (cdr (assoc nucleotide nucleotide-count))))
;;                  (acons nucleotide
;;                         (1+ previous-count)
;;                         (remove nucleotide nucleotide-count :key 'car))))
;;            strand
;;            :initial-value '((#\A . 0) (#\C . 0) (#\G . 0) (#\T . 0)))))

(defun nucleotide-counts (strand)
  "Returns an alist of each nucleotide and the total times found in STRAND."
  (when (= (length strand)
           (length (remove-if-not #'nucleotide-p strand)))
    (list (cons #\A (count #\A strand))
          (cons #\C (count #\C strand))
          (cons #\G (count #\G strand))
          (cons #\T (count #\T strand)))))

(defun nucleotide-p (nucleotide)
  (find nucleotide '(#\A #\C #\G #\T)))

;; Add this function to the nucleotide-count-test.lisp for the first solution
;; above to work. The problem is that alists should be equal even if they are
;; not in the same order.
;; https://github.com/exercism/common-lisp/blob/main/exercises/practice/nucleotide-count/nucleotide-count-test.lisp
;; https://github.com/jcottrell/common-lisp/commit/225c3addaebd5bed518e6635063628ac1ff8ce17
(defun alists-equal (left right)
  "Returns T if all contents of LEFT are EQUAL to all contents of RIGHT."
  (let ((first-left-key (caar left)))
    (cond ((null left) (null right))
          ((equal (assoc first-left-key left)
                  (assoc first-left-key right))
           (alists-equal (cdr left)
                         (remove first-left-key right :key 'car))))))
