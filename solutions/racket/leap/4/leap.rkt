#lang racket

(provide leap-year?)

(define (evenly-divides? dividend divisor)
  (zero? (remainder dividend divisor)))

(define (leap-year? year)
  (and (evenly-divides? year 4)
       (or (not (evenly-divides? year 100))
           (evenly-divides? year 400))))
