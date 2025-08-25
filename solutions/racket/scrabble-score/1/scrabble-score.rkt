#lang racket

(provide score)

(define AEIOULNRST (string->list "AEIOULNRST"))
(define DG         (string->list "DG"))
(define BCMP       (string->list "BCMP"))
(define FHVWY      (string->list "FHVWY"))
(define K          (string->list "K"))
(define JX         (string->list "JX"))
(define QZ         (string->list "QZ"))

(define (get-letter-value c)
  (cond [(member c AEIOULNRST)  1]
        [(member c DG)          2]
        [(member c BCMP)        3]
        [(member c FHVWY)       4]
        [(member c K)           5]
        [(member c JX)          8]
        [(member c QZ)         10]
        [else                   0]))

(define (score-accumulator c running-score)
  (+ (get-letter-value c) running-score))

(define (score word)
  (foldl score-accumulator 0 (string->list (string-upcase word))))