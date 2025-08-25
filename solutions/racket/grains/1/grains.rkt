#lang racket
(define (square x)
  (expt 2 (- x 1)))
(define (total)
  (define (adder square-number running-total)
    (cond ((zero? square-number) running-total)
          (else (adder (- square-number 1) (+ running-total (square square-number))))))
  (adder 64 0))
(provide square total)
