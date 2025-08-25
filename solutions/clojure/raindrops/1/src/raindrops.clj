(ns raindrops)

(def factor-pairs [{:factor 3 :name "Pling"}
                   {:factor 5 :name "Plang"}
                   {:factor 7 :name "Plong"}])

(defn factor-pair-funs
  "Takes 1 factor-name pair, returns a naming function."
  [factor-pair]
  (fn [possible-factor]
    (let [result (mod possible-factor (:factor factor-pair))]
      (if (zero? result) (:name factor-pair) ""))))

(defn convert
  "Converts a given number into a string based on its factors."
  [num]
  (let [tests (map factor-pair-funs factor-pairs)
        result (clojure.string/join (map (fn [fun] (fun num)) tests))]
    (if (empty? result) (str num) result)))

(comment
  (convert 28)
  (convert 30)
  (convert 34)
  )
