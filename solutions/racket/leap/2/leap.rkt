#lang racket

;(define (leap-year? n)
;  (if (zero? (modulo n 100)) (zero? (modulo n 400))
;      (if (zero? (modulo n 4)) #t
;          #f)))
(require math)
(define (leap-year? n)
  (cond [(divides? 400 n) #t]
        [(divides? 100 n) #f]
        [(divides?   4 n) #t]
        [else             #f]))
;(define (leap-year? n)
;  (define (div? x)
;    (zero? (modulo n x)))
;  (cond [(div? 400) #t]
;        [(div? 100) #f]
;        [(div?   4) #t]
;        [else       #f]))
;(define (leap-year? n)
;  (and (zero? (modulo n 4))
;       (or (not (zero? (modulo n 100)))
;           (zero? (modulo n 400)))))
;(define (leap-year? n)
;  (cond ((zero? (modulo n 4))
;         (cond ((zero? (modulo n 100)) (zero? (modulo n 400)))
;               (else #t)))
;        (else #f)))

(provide leap-year?)

; A B C
;------
; T T T
; T F F
; F F T
; F x T
;
; (or (not A) B)