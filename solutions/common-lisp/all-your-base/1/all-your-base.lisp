(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun rebase (list-digits in-base out-base)
  (cond ((< in-base 2) nil)
        ((< out-base 2) nil)
        ((not list-digits) '(0))
        ((some (invalid-digit in-base) list-digits) nil)
        (t (let* ((target (get-base-10 list-digits in-base))
                  (max-out-exponent (if (zerop target) 0
                                        (floor (log target out-base)))))
             (reverse
              (get-next-out-digit target out-base max-out-exponent '()))))))

(defun invalid-digit (base)
  #'(lambda (number) (or (< number 0) (>= number base))))

(defun get-base-10 (list-digits base)
  (let ((reversed-digits (reverse list-digits))
        (last-index (1- (length list-digits))))
    (loop for digit from 0 to last-index
          collect (* (first (subseq reversed-digits digit (1+ digit)))
                     (expt base digit)) into old-based-digits
          finally (return (apply #'+ old-based-digits)))))

(defun get-next-out-digit (target base exponent result-digits)
  (let* ((base-raised (expt base exponent))
         (times-it-goes-into-target (floor (/ target base-raised)))
         (to-subtract (* times-it-goes-into-target base-raised)))
    (cond ((< exponent 0) result-digits)
          ((>= target to-subtract)
           (get-next-out-digit (- target to-subtract)
                               base
                               (1- exponent)
                               (cons times-it-goes-into-target result-digits)))
          (t (get-next-out-digit target
                                 base
                                 (1- exponent)
                                 (cons 0 result-digits))))))
