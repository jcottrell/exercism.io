#lang racket

(provide armstrong-number?)

; num is the full number (e.g. 492)
; digit is the single number to be pulled out of num, from the right, starting at zero
;  so it's the 10^digit's place ("ones place", "tens place", "hundreds place", etc.)
; e.g. (get-digit-at 492 1) returns 9 and (get-digit-at 492 2) return 4
(define (get-digit-at num digit)
  (/ (- (modulo num (expt 10 (add1 digit)))
        (modulo num (expt 10 digit)))
     (expt 10 digit)))

(define (number-length n [length-so-far 0])
  (cond ([> (expt 10 length-so-far) n] length-so-far)
        (else (number-length n (add1 length-so-far)))))

(define (armstrong-number? n)
  (let ([length-of-n (number-length n)])
    (define (sum-of-digit-exponents tens-exponent total-so-far)
    (cond ([> (expt 10 tens-exponent) n] total-so-far)
          (else (sum-of-digit-exponents (add1 tens-exponent)
                                        (+ total-so-far (expt (get-digit-at n tens-exponent)
                                                              length-of-n))))))
    (equal? n (sum-of-digit-exponents 0 0))))