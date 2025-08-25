(ns reverse-string
  (:require clojure.string))

(defn reverse-string
  "Reverses the given string."
  [s]
  (->> s seq reverse (apply str))
  ;(apply str (reverse (seq s)))
)

(comment
  (reverse-string "cool")
  (= (clojure.string/reverse "cool") (reverse-string "cool")))
