(defpackage :all-your-base
  (:use :cl)
  (:export :rebase))

(in-package :all-your-base)

(defun rebase (list-digits in-base out-base)
  "Returns the LIST-DIGITS converted from base IN-BASE to base OUT-BASE."
  (cond ((or (< in-base 2) (< out-base 2)) nil)
        ((not list-digits) '(0))
        ((some (invalid-digit in-base) list-digits) nil)
        (t (let* ((target (get-base-10 list-digits in-base))
                  (max-out-exponent (if (zerop target) 0
                                        (floor (log target out-base)))))
             (get-base-digits-from-base-10 target out-base max-out-exponent)))))

(defun invalid-digit (base)
  "Returns a function that compares BASE to a NUMBER.
The function return T if NUMBER is invalid in the given BASE."
  #'(lambda (number) (or (< number 0) (>= number base))))

(defun get-base-10 (list-digits base)
  "Returns the base 10 representation of LIST-DIGITS in BASE."
  (loop for exponent from (1- (length list-digits)) downto 0
        for current-digit in list-digits
        collect (* current-digit (expt base exponent)) into base-10-digits
        finally (return (apply #'+ base-10-digits))))

(defun get-base-digits-from-base-10 (target base max-exponent)
  "Returns the list of digits of the TARGET in base BASE."
  (labels ((next-out-digit (remaining-target current-exponent result-digits)
             (let* ((base-raised (expt base current-exponent))
                    (times-it-goes-into-target (floor (/ remaining-target base-raised))))
               (if (< current-exponent 0)
                   (reverse result-digits)
                   (next-out-digit (- remaining-target (* times-it-goes-into-target base-raised))
                                   (1- current-exponent)
                                   (cons times-it-goes-into-target result-digits))))))
    (next-out-digit target max-exponent '())))
