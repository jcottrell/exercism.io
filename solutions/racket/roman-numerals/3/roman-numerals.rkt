#lang racket

(provide to-roman)

(struct roman-set (latin arabic))
(define roman-sets-desc `#(
  ,(roman-set "M" 1000) ,(roman-set "CM" 900) ,(roman-set "D" 500) ,(roman-set "CD" 400)
  ,(roman-set "C" 100) ,(roman-set "XC" 90) ,(roman-set "L" 50) ,(roman-set "XL" 40)
  ,(roman-set "X" 10) ,(roman-set "IX" 9) ,(roman-set "V" 5) ,(roman-set "IV" 4)
  ,(roman-set "I" 1)))

(define (first-not-bigger bigger pairs)
  (for/first ([pair pairs]
              #:when (>= bigger (roman-set-arabic pair)))
    pair))

(define (to-roman i [answer ""])
  (cond [(> i 0) (let ([next (first-not-bigger i roman-sets-desc)])
                   (to-roman (- i (roman-set-arabic next))
                             (string-append answer (roman-set-latin next))))]
        [else answer]))
;(to-roman 105) ; CV
;(to-roman 106) ; CVI
;(to-roman 104) ; CIV
;(to-roman 1996); MCMXCVI
