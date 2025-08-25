(ns cars-assemble)

(def hourly-rate 221)
(def rates [
            {:min 0 :max 0 :rate 0.0}
            {:min 1 :max 4 :rate 1.0}
            {:min 5 :max 8 :rate 0.9}
            {:min 9 :max 9 :rate 0.8}
            {:min 10 :max hourly-rate :rate 0.77}])

(defn rate-lookup
  "Looks up the rate percentage in the list of rates according to the speed."
  [speed]
  (:rate (first (filterv (fn [r]
                           (and (<= (:min r) speed)
                                (>= (:max r) speed)))
                         rates)))
  )

(comment
  (rate-lookup 0)
  (rate-lookup 7)
)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (* speed hourly-rate (rate-lookup speed))
  )

(comment
  (rate-lookup 6)
  (* 6 hourly-rate)
  (- 1326 (* 1326 0.9))
  (production-rate 6)
)

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60)))

(comment
  (working-items 6)
)
