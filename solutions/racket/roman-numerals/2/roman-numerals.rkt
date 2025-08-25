#lang racket

(provide to-roman)

(define (to-roman i [answer ""])
  (cond [(zero? i) answer]
        [(>= i 1000) (to-roman (- i 1000) (string-append answer "M"))]
        [(>= i 900)  (to-roman (- i 900)  (string-append answer "CM"))]
        [(>= i 500)  (to-roman (- i 500)  (string-append answer "D"))]
        [(>= i 400)  (to-roman (- i 400)  (string-append answer "CD"))]
        [(>= i 100)  (to-roman (- i 100)  (string-append answer "C"))]
        [(>= i 90)   (to-roman (- i 90)   (string-append answer "XC"))]
        [(>= i 50)   (to-roman (- i 50)   (string-append answer "L"))]
        [(>= i 40)   (to-roman (- i 40)   (string-append answer "XL"))]
        [(>= i 10)   (to-roman (- i 10)   (string-append answer "X"))]
        [(>= i 9)    (to-roman (- i 9)    (string-append answer "IX"))]
        [(>= i 5)    (to-roman (- i 5)    (string-append answer "V"))]
        [(>= i 4)    (to-roman (- i 4)    (string-append answer "IV"))]
        [(>= i 1)    (to-roman (- i 1)    (string-append answer "I"))]
        [else        answer]))
