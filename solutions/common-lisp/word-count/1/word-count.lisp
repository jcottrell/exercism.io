(defpackage :word-count
  (:use :cl
        :uiop/utility) ; split-string
  (:export :count-words))

;; ppcre::all-matches-as-strings
(ql:quickload "cl-ppcre")

(in-package :word-count)

(defun add-word (word-list word)
  "Returns a new word-list with a new '(WORD . 1) entry or its increment."
  (let ((found (assoc word word-list :test #'string=)))
    (if found
        (acons word (1+ (cdr found))
               (remove word word-list :key 'car :test #'string=))
        (acons word 1 word-list))))

(defun split-into-words (sentence)
  "Returns a list of words from SENTENCE, split on whitespace but including apostrophes."
  (remove-if #'(lambda (word) (zerop (length word)))
             (mapcar #'(lambda (word) (string-trim '(#\') word))
                     (ppcre:all-matches-as-strings
                       "[a-zA-Z0-9']+"
                       sentence))))

(defun count-words (sentence)
  "Returns an alist of words and the number of occurances in SENTENCE."
  (let ((word-list (split-into-words (string-downcase sentence))))
    (reduce #'add-word word-list :initial-value '())))
