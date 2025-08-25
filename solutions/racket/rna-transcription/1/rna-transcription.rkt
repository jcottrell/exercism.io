#lang racket

(provide to-rna)

(require threading)

(define (can-transcribe? x)
  (member x (string->list "GCTA")))
(define (transcribe x)
  (cond [(eq? #\G x) #\C]
        [(eq? #\C x) #\G]
        [(eq? #\T x) #\A]
        [(eq? #\A x) #\U]))
(define (transcribe-list xs)
  (cond [(empty? xs) '()]
        [(can-transcribe? (car xs)) (cons (transcribe      (car xs))
                                          (transcribe-list (cdr xs)))]
        [else (car xs)]))
(define (to-rna xs)
  (~>> (string->list xs)
       (transcribe-list)
       (list->string)))