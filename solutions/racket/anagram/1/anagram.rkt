#lang racket

(provide anagrams-for)

(define (is-anagram? ns ms)
  (cond [(and (empty? ns) (empty? ms)) #t]
        [(not (= (length ns) (length ms))) #f]
        [else (is-anagram? (cdr ns) (remove (car ns) ms))]))

(define (anagrams-for-case-insensitivity needle haystack [anagrams '()])
  (cond [(empty? haystack) anagrams]
        [(and (equal? needle (car haystack)) (> 1 (length anagrams))) '()]
        [(and (= (string-length needle) (string-length (car haystack)))
              (is-anagram? (string->list needle) (string->list (string-downcase (car haystack)))))
         (anagrams-for-case-insensitivity needle (cdr haystack) (append anagrams (list (car haystack))))]
        [else (anagrams-for-case-insensitivity needle (cdr haystack) anagrams)]))

(define (anagrams-for needle haystack)
  (anagrams-for-case-insensitivity (string-downcase needle) haystack))