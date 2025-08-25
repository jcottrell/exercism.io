#lang racket
(require threading)
(require (only-in math sum))

(provide sum-of-squares square-of-sum difference)

(define (square n)
  (expt n 2))

(define (sum-of-squares n)
  (~>> (add1 n)
       (range 1)
       (map square)
       (sum)))

(define (square-of-sum n)
  (~>> (add1 n)
       (range 1)
       (sum)
       (square)))

(define (difference n)
  (- (square-of-sum n) (sum-of-squares n)))