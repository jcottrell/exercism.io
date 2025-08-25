#lang racket
(struct robot (name))
(define robots (make-hash))
(define (random-char)
  (integer->char (random 65 91)))
(define (make-robot)
  (let ((made-robot (robot
                      (string-append
                       (string (random-char) (random-char))
                       (~r #:min-width 3 #:pad-string "0" (random 1000))))))
    (cond ((hash-has-key? robots (robot-name made-robot)) (make-robot))
          (else (hash-set! robots (robot-name made-robot) made-robot)
                made-robot))))
(define (name some-robot)
  (robot-name some-robot))
(define (reset! some-robot)
  (hash-remove! robots (robot-name some-robot))
  (make-robot))
(define (reset-name-cache!)
  (hash-clear! robots))

(provide make-robot
         name
         reset!
         reset-name-cache!)
