#lang racket

(require (only-in math
                  divides?))

(provide leap-year?)

(define (evenly-divides? dividend devisor)
  (divides? devisor dividend))

(define (leap-year? year)
  (and (evenly-divides? year 4)
       (or (not (evenly-divides? year 100))
           (evenly-divides? year 400))))
