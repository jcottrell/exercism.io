#lang racket

(provide response-for)

(define (any? fun xs)
  (cond [(null? xs) #f]
        [(fun (first xs)) #t]
        [else (any? fun (rest xs))]))

(define (any-characters? ss)
  (any? (lambda (c) (char-alphabetic? c))
        (string->list ss)))

(define (response-for statement)
  (let* ([only-statement (string-trim statement)]
         [is-empty       (equal? (string-length only-statement) 0)]
         [is-question    (string-suffix? only-statement "?")]
         [is-yelling     (and (equal? only-statement (string-upcase only-statement))
                              (any-characters? only-statement))])
    (cond [is-empty                     "Fine. Be that way!"]
          [(and is-question is-yelling) "Calm down, I know what I'm doing!"]
          [is-question                  "Sure."]
          [is-yelling                   "Whoa, chill out!"]
          [else                         "Whatever."])))