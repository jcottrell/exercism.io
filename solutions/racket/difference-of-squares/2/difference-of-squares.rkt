#lang racket

; mostly just showing my work instead of just searching for a reducer and finding foldl
;  but foldl is cleaner so I still used it in the end
(define (my-own-foldl fun init ls)
  (define (reducer ls so-far)
    (cond [(null? ls) so-far]
          [else (fun (reducer (cdr ls) so-far) (car ls))]))
  (reducer ls init))

(define (square n)
  (expt n 2))

(define (sum-of-squares n)
;  (my-own-foldl + 0 (map square (range 1 (add1 n)))))
  (foldl + 0 (map square (range 1 (add1 n)))))

(define (square-of-sum n)
;  (square (my-own-foldl + 0 (range 1 (add1 n)))))
   (square (foldl + 0 (range 1 (add1 n)))))

(define (difference n)
  (- (square-of-sum n) (sum-of-squares n)))

(provide sum-of-squares square-of-sum difference)