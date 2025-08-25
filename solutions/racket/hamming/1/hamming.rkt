#lang racket

(provide hamming-distance)

(define (string-empty? ss)
  (eq? 0 (string-length ss)))
(define (string-car ss)
  (substring ss 0 1))
(define (string-cdr ss)
  (substring ss 1))

(define (hamming-distance first-strand second-strand [distance 0])
  (cond [(and (string-empty? first-strand)
              (string-empty? second-strand))
         distance]
        [(not (eq? (string-length first-strand)
                   (string-length second-strand)))
         (error 'hamming-distance "strands must be of equal length")]
        [(equal? (string-car first-strand)
                 (string-car second-strand))
         (hamming-distance (string-cdr first-strand)
                           (string-cdr second-strand)
                           distance)]
        [else (hamming-distance (string-cdr first-strand)
                           (string-cdr second-strand)
                           (add1 distance))]))