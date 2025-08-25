#lang racket

(provide hamming-distance)

(define (characters-not-equal? x y)
  (not (equal? x y)))

(define (hamming-distance first-strand second-strand)
  (count characters-not-equal?
         (string->list first-strand)
         (string->list second-strand)))

;; These go from oldest (bottom) to newest (top); kept for posterity
#;(define (hamming-distance first-strand second-strand)
  (length (filter-map (lambda (x y) (not (equal? x y)))
                             (string->list first-strand)
                             (string->list second-strand))))

#;(define (hamming-distance first-strand second-strand)
  (apply + (map (lambda (x y) (if (equal? x y) 0 1))
                (string->list first-strand)
                (string->list second-strand))))

#;(define (hamming-distance first-strand second-strand)
  (cond [(not (eq? (string-length first-strand)
                   (string-length second-strand)))
         (error 'hamming-distance "strands must be of equal length")]
        [else (foldl (lambda (x y total)
                       (cond [(equal? x y) total]
                             [else (add1 total)]))
                     0
                     (string->list first-strand)
                     (string->list second-strand))]))

#;(define (hamming-distance first-strand second-strand)
  (cond [(not (eq? (string-length first-strand)
                   (string-length second-strand)))
         (error 'hamming-distance "strands must be of equal length")]
        [else (for/sum ([a first-strand]
                        [b second-strand]
                        #:unless (equal? a b))
                1)]))