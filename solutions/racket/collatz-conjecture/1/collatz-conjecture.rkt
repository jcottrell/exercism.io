#lang racket

(provide collatz)

(define (collatz n [step-count 0])
  (let ([error-out   '(collatz "only integers over 0 can be calculated")]
        [invalid?    (or (< n 1) (not (integer? n)))]
        [equals1?    (eq? n 1)])
    (cond [equals1?  step-count]
          [invalid?  (apply error error-out)]
          [(even? n) (collatz (/ n 2)        (add1 step-count))]
          [else      (collatz (add1 (* 3 n)) (add1 step-count))])))