(ns log-levels
  (:require [clojure.string :as str]))

(defn log-separator
  "Take a string representing a log line and returns its pieces, level and
  message"
  [log-line]
  (let [[level message] (-> log-line
                            str/trim
                            (str/split #": "))]
    {
     :level (-> level
                (str/replace #"\[|\]" "")
                str/trim
                str/lower-case)
     :message (str/trim message)
     }))

(comment
  (str/split "things: more" #": ")
  (str/replace "[Something]" #"\[|\]" "")
  (log-separator " [Something]: else")
  (log-separator " [UPPER]: case"))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (-> s log-separator :message))

(comment
  (message "  [WARNING]: Too much whitespace!     "))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (-> s log-separator :level))

(comment
  (log-level " [IMPORTANT]: Need to lowercase"))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (let [log (log-separator s)]
    (str/join [(:message log) " " "(" (:level log) ")"])))

(comment
  (reformat "[FIRST]: Last will be"))
