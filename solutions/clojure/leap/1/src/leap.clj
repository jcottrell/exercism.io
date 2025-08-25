(ns leap)

(defn leap-year? [year] ;; <- argslist goes here
  (cond (= 0 (mod year 400)) true
        (= 0 (mod year 100)) false
        (= 0 (mod year 4)) true
        :else false))

(comment
  (leap-year? 2000)
  (leap-year? 2100)
  (leap-year? 2024)
  (leap-year? 2010)
)
