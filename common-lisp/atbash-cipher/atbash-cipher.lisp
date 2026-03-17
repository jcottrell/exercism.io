(defpackage :atbash-cipher
  (:use :cl)
  (:export :encode :decode))

(in-package :atbash-cipher)

;;;; For future iteractions?
;;; also simpler grouping, group-with-x
;;; https://exercism.org/tracks/common-lisp/exercises/atbash-cipher/solutions/kisp
;;; SO simple, uses ONLY format for grouping (less interested in obscure, hard
;;; to change character shifting)
;;; (format nil "~{~5@{~a~}~^ ~}" (coerce "abcdef" 'list))
;;; https://exercism.org/tracks/common-lisp/exercises/atbash-cipher/solutions/hading
;;; also SO simple, great use of data structures (assoc) and format for grouping
;;; (format nil "~{~5@{~c~^~}~^ ~}" (coerce "abcdef" 'list))
;;; https://exercism.org/tracks/common-lisp/exercises/atbash-cipher/solutions/aidanhamilton

(defparameter *alphabet*
  (coerce "abcdefghijklmnopqrstuvwxyz" 'list)
  "List of all alphabet characters.")
(defparameter *cipher*
  (reverse *alphabet*)
  "List of the ciphered alphabet.")
(defparameter *untouched*
  (coerce "0123456789" 'list)
  "List of all characters that should not be translated.")

(defun encode (plaintext)
  "Returns PLAINTEXT encoded via *CIPHER* and *UNTOUCHED*."
  (translate *alphabet* *cipher* *untouched* (string-downcase plaintext) :after (chop-into-groups-of 5)))

(defun decode (ciphertext)
  "Returns PLAINTEXT decoded from *CIPHER* and *UNTOUCHED*."
  (translate *cipher* *alphabet* *untouched* ciphertext))

(defun translate (from-alphabet to-alphabet untouched text &key (after (lambda (x) x)))
  "Returns the TEXT translated from FROM-ALPHABET to TO-ALPHABET.
The characters in UNTOUCHED are kept without change."
  (let ((char-list (coerce text 'list)))
    (do ((remaining-chars char-list (cdr remaining-chars))
         (from-position (position (first char-list) from-alphabet)
                        (position (second remaining-chars) from-alphabet))
         (result '()))
        ((null remaining-chars) (string-trim '(#\space #\newline #\tab)
                                             (concatenate 'string (funcall after result))))
      (cond (from-position
             (setf result (append result (list (nth from-position to-alphabet)))))
            ((find (first remaining-chars) untouched)
             (setf result (append result (list (first remaining-chars)))))))))

(defun chop-into-groups-of (max-group-length)
  "Returns a function that takes a character list and intersperses spaces.
The spaces are inserted after every MAX-GROUP-LENGTH character."
  (lambda (some-chars)
    (do ((chars-length (length some-chars))
         (start 0 (+ max-group-length start))
         (result '()))
        ((> start chars-length) result)
      (setf result
            (append result
                    (when result (list #\space))
                    (subseq some-chars
                            start
                            (min chars-length (+ start max-group-length))))))))
