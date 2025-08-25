#lang racket

(provide convert)

(define factor-name-pairs
  '((3 . "Pling")
    (5 . "Plang")
    (7 . "Plong")))

(define (factor->name pair)
  (lambda (possible)
    (if (zero? (remainder possible (car pair)))
        (cdr pair)
        "")))

(define (convert number)
  (let* ([tests (map factor->name factor-name-pairs)]
         [result (apply string-append (map (lambda (test)
                                             (test number))
                                           tests))])
    (if (non-empty-string? result)
        result
        (number->string number))))
