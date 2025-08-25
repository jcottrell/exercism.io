#lang racket

(provide add-gigasecond)

(require racket/date)
(require threading)

(define (add-gigasecond some-date)
  (~>> (date->seconds some-date)
       (+ 1000000000)
       (seconds->date)))