#lang racket
(require math)

(provide classify)

(define (classify n)
  (let ([total (sum (remove n (divisors n)))])
    (cond [(= total n) 'perfect]
          [(> total n) 'abundant]
          [else        'deficient])))
