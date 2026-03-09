(defpackage :sieve
  (:use :cl)
  (:export :primes-to)
  (:documentation "Generates a list of primes up to a given limit."))

(in-package :sieve)

(defstruct markable-digit
  digit (marked nil))

(defun primes-to (n)
  "List primes up to `n' using sieve of Eratosthenes."
  (let* ((all-digits (get-initial-sieve n))
         (eratosthenes-digits (strain-digits all-digits))
         (prime-eratosthenes-digits (remove-if #'markable-digit-marked
                                                   eratosthenes-digits)))
    (mapcar #'markable-digit-digit prime-eratosthenes-digits)))

(defun get-initial-sieve (last-number &optional (results '()))
  "Returns a sieve starting at 2 and including LAST-NUMBER."
  (cond ((> 2 last-number) results)
        (t (get-initial-sieve (1- last-number)
                              (cons (make-markable-digit :digit last-number)
                                    results)))))

(defun strain-digits (all-digits &optional (current-number (and all-digits (markable-digit-digit (first all-digits)))))
  "Returns the Eratosthenes list with marked and unmarked digits."
  (let ((current-digit (find-digit current-number all-digits)))
    (cond ((or (null all-digits)
               (null current-digit)
               (> current-number (markable-digit-digit (first (last all-digits)))))
           all-digits)
          ((markable-digit-marked current-digit)
           (strain-digits all-digits
                          (1+ current-number)))
          (t (strain-digits (mark-digit-additions current-digit all-digits)
                            (1+ current-number))))))

(defun find-digit (number-of-digit-to-find digits)
  "Returns the digit from DIGITS where its number = NUMBER-OF-DIGIT-TO-FIND."
  (find number-of-digit-to-find digits :key #'markable-digit-digit))

(defun mark-digit-additions (digit all-digits)
  "Returns ALL-DIGITS except additions of DIGIT are marked."
  (let ((base-number (markable-digit-digit digit))
        (highest-number (markable-digit-digit (first (last all-digits)))))
    (labels ((process-next-digit (number-to-mark in-process-digits)
               (cond ((> number-to-mark highest-number) in-process-digits)
                     (t (process-next-digit (+ base-number number-to-mark)
                                            (update-digit (make-markable-digit :digit number-to-mark :marked t)
                                                          in-process-digits))))))
      (process-next-digit (+ base-number base-number) all-digits))))

(defun update-digit (updated-digit digits)
  "Returns DIGITS except that UPDATED-DIGIT replaces the matching digit."
  (let ((number-to-update (markable-digit-digit updated-digit)))
    (labels ((process-next-digit (remaining-digits previous-digits)
               (cond ((null remaining-digits) previous-digits)
                     ((= number-to-update (markable-digit-digit (car remaining-digits)))
                      (append previous-digits
                              (list updated-digit)
                              (cdr remaining-digits)))
                     (t (process-next-digit (cdr remaining-digits)
                                            (append previous-digits (list (car remaining-digits))))))))
      (process-next-digit digits '()))))
