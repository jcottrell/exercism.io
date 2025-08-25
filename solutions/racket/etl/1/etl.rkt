#lang racket

(provide (contract-out [etl (-> hash-old-format? hash?)]))

(define (hash-old-format? some-hash)
  (let ([values (hash-values some-hash)])
        (and (andmap positive? (hash-keys some-hash))
             (andmap list?     values)
             (andmap string?   (flatten values)))))

(define (etl hash-input)
  (make-hash (flatter (hash-map hash-input convert-values))))

(define (convert-values point-value character-list)
  (cond [(empty? character-list) '()]
        [else (cons (cons (string-downcase (car character-list)) point-value)
                    (convert-values point-value (cdr character-list)))]))
(define (flatter vals)
  (cond [(empty? vals) '()]
        [(list? (first vals)) (append (flatter (first vals)) (flatter (rest vals)))]
        ;; must be a list of pairs then...
        [else vals]))