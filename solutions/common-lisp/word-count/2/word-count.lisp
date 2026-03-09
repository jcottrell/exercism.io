(defpackage :word-count
  (:use :cl
        :uiop/utility) ; split-string
  (:export :count-words))


(in-package :word-count)

(defconstant +word-borders+
  '(#\space #\tab #\newline #\, #\? #\! #\. #\: #\& #\@ #\$ #\% #\^ #\&))

(defun add-word (word-list word)
  "Returns a new word-list with a new '(WORD . 1) entry or its increment."
  (let ((found (assoc word word-list :test #'string=)))
    (if found
        (acons word (1+ (cdr found))
               (remove word word-list :key 'car :test #'string=))
        (acons word 1 word-list))))

(defun scan-for-words (letters &optional (words '()) (working-word '()))
  "Returns a list of words from LETTERS split on +word-borders+."
  (cond ((zerop (length letters))
         (cons (coerce working-word 'string) words))
        ((member (aref letters 0) +word-borders+)
         (scan-for-words (subseq letters 1)
                         (cons (coerce working-word 'string) words)
                         '()))
        (t (scan-for-words (subseq letters 1)
                           words
                           (append working-word (list (aref letters 0)))))))

(defun split-into-words (sentence)
  "Returns a list of words from SENTENCE, split on whitespace but including apostrophes."
  (remove-if #'(lambda (word) (zerop (length word)))
             (mapcar #'(lambda (word) (string-trim '(#\' #\" #\space) word))
                     (scan-for-words sentence))))

(defun count-words (sentence)
  "Returns an alist of words and the number of occurances in SENTENCE."
  (let* ((lowered (string-downcase sentence))
         (word-list (split-into-words lowered)))
    (reduce #'add-word word-list :initial-value '())))
