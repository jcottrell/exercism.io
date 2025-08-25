#lang racket

(provide meetup-day)

(require racket/date gregor)

(define (get-search-direction-function day-ordinal)
  (cond [(eq? day-ordinal 'last) sub1]
        [else add1]))

(define (get-search-start-day year month day-ordinal)
  (cond [(eq? day-ordinal 'teenth) 13]
        [(eq? day-ordinal 'last) (->day (-days (date (if (= month 12) (add1 year) year)
                                                     (if (= month 12) 1 (add1 month))
                                                     1)
                                               1))]
        [else 1]))

(define (get-right-day-name-predicate day-name)
  (cond [(eq? 'Sunday    day-name) sunday?]
        [(eq? 'Monday    day-name) monday?]
        [(eq? 'Tuesday   day-name) tuesday?]
        [(eq? 'Wednesday day-name) wednesday?]
        [(eq? 'Thursday  day-name) thursday?]
        [(eq? 'Friday    day-name) friday?]
        [(eq? 'Saturday  day-name) saturday?]))

(define (ordinal->number o)
  (cond [(or (eq? 'first  o)
             (eq? 'teenth o)
             (eq? 'last   o)) 1]
        [(eq? 'second o)      2]
        [(eq? 'third  o)      3]
        [(eq? 'fourth o)      4]
        [(eq? 'fifth  o)      5]))

(define (find-date-number year month is-right-day-name? day-change-fun next-calendar-number ordinal-number)
  (let ([test-date (date year month next-calendar-number)])
    (cond [(and (is-right-day-name? test-date) (eq? ordinal-number 1)) next-calendar-number]
          [else (find-date-number year
                                  month
                                  is-right-day-name?
                                  day-change-fun
                                  (day-change-fun next-calendar-number)
                                  (if (is-right-day-name? test-date)
                                      (sub1 ordinal-number)
                                      ordinal-number))])))

(define (meetup-day year month day-name day-ordinal)
  (let* ([is-right-day-name? (get-right-day-name-predicate day-name)]
         [search-direction-fun (get-search-direction-function day-ordinal)]
         [search-start-day (get-search-start-day year month day-ordinal)]
         [ordinal-number (ordinal->number day-ordinal)]
         [calendar-day-number (find-date-number year
                                                month
                                                is-right-day-name?
                                                search-direction-fun
                                                search-start-day
                                                ordinal-number)])
    (seconds->date (find-seconds 0 0 0 calendar-day-number month year #f) #f)))