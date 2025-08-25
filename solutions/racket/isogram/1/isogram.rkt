#lang racket

(provide isogram?)

(require threading)

(define (isogram? word/s)
  (~>> (string-downcase word/s)
       (string->list)
       (filter char-alphabetic?)
       ((lambda (word-list)
         (~>> (list->set word-list)
              (set->list)
              ((lambda (set-list)
                (= (length set-list) (length word-list)))))))))