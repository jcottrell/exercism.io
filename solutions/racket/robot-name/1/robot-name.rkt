#lang racket
(struct robot (name))
(define robots '())
(define (random-char)
  (integer->char (random 65 91)))
(define (make-robot)
  (define (robot-maker)
    (robot
     (string-append
      (string (random-char) (random-char))
      (~r (random 1000)))))
  (set! robots (cons (robot-maker) robots))
  (car robots))
(define (name some-robot)
  (robot-name some-robot))
(define (reset! some-robot)
  (set! robots (filter (lambda (r) (not (string=? (robot-name r) (robot-name some-robot)))) robots))
  (make-robot))
(define (reset-name-cache!)
  (set! robots '()))

(provide make-robot
         name
         reset!
         reset-name-cache!)
