#lang racket

(define (leap-year? n)
  (and (zero? (modulo n 4))
       (or (not (zero? (modulo n 100)))
           (zero? (modulo n 400)))))
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