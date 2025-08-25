#lang racket
(require threading)

(provide my-reverse)

(define (my-reverse s)
  (~> s string->list
        reverse
        list->string))