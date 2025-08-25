#lang racket

(provide rebase)

;; parse a list of digit representing a number in base "in-base"
;; returns a base-10 number
(define (parse-in-base digit-list in-base [total 0])
  (cond [(empty? digit-list) total]
        [else (parse-in-base (rest digit-list)
                             in-base
                             (+ total
                                (* (first digit-list)
                                   (expt in-base (sub1 (length digit-list))))))]))

;; finds the highest exponent in number-base "base"
;; returns a base-10 number of the highest base^exponent that will fit in "n"
(define (highest-exponent n base [length-so-far 0])
  (cond [(> (expt base length-so-far) n) (max 0 (sub1 length-so-far))]
        [else (highest-exponent n base (add1 length-so-far))]))
;; converts a base-10 number to list of numbers representing the number in base "out-base"
(define (convert-to-base out-base current-exponent num)
  (cond [(zero? current-exponent) (list num)]
        [else   (let ([next-digit (quotient num (expt out-base current-exponent))])
                  (cons next-digit
                        (convert-to-base out-base
                                         (sub1 current-exponent)
                                         (- num (* next-digit (expt out-base current-exponent))))))]))

;; changes a number (represented as a list of digits) in one base ("in-base") to another base ("out-base")
(define (rebase digit-list in-base out-base)
  (cond [(>= 1 in-base)  #f]
        [(>= 1 out-base) #f]
        [(not (andmap (lambda (n) (>= n 0)) digit-list)) #f]
        [(not (andmap (lambda (n) (> in-base n)) digit-list)) #f]
        [else (let ([intermediate-base-10 (parse-in-base digit-list in-base)])
                (convert-to-base out-base
                                 (highest-exponent intermediate-base-10 out-base)
                                 intermediate-base-10))]))