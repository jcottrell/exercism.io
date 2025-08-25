#lang racket
(define (square x)
  (expt 2 (sub1 x)))
(define (total)
  (let adder ([square-number 64]
              [running-total 0])
    (cond ((zero? square-number) running-total)
          (else (adder (sub1 square-number) (+ running-total (square square-number)))))))
(provide square total)