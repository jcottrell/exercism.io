(defpackage :atbash-cipher
  (:use :cl)
  (:export :encode :decode))

(in-package :atbash-cipher)

(defparameter *whole-alphabet*
  "abcdefghijklmnopqrstuvwxyz"
  "String of all alphabet characters.")
(defparameter *translate-as-is*
  "0123456789"
  "String of all characters that should not be translated but copied.")
(defparameter *untouched*
  (coerce *translate-as-is* 'list)
  "List of all characters that should not be translated.")
(defparameter *alphabet*
  (coerce *whole-alphabet* 'list)
  "List of all alphabet characters.")
(defparameter *cipher*
  (reverse *alphabet*)
  "List of the ciphered alphabet.")

(defun encode (plaintext)
  (let* ((lower-text (string-downcase plaintext))
         (char-list (coerce lower-text 'list))
         (translation (translate *alphabet* *cipher* *untouched* char-list))
         (chopped (chop-into-groups-of translation 5)))
    (concatenate 'string chopped)))

(defun decode (ciphertext)
  (let* ((char-list (coerce ciphertext 'list))
         (translation (translate *cipher* *alphabet* *untouched* char-list)))
    (concatenate 'string translation)))

(defun translate (from-alphabet to-alphabet untouched char-list)
  (labels ((translate-next (remaining result)
             (cond ((null remaining) result)
                   ((find (car remaining) from-alphabet)
                    (translate-next (cdr remaining)
                                    (append result
                                            (subseq to-alphabet
                                                    (position (car remaining)
                                                              from-alphabet)
                                                    (1+ (position (car remaining)
                                                                  from-alphabet))))))
                   ((find (car remaining) untouched)
                    (translate-next (cdr remaining)
                                    (append result
                                            (list (car remaining)))))
                   (t (translate-next (cdr remaining)
                                      result)))))
    (translate-next char-list '())))

(defun chop-into-groups-of (some-chars &optional (max-group-length 5))
  (labels ((next-chop (start result)
             (let ((end (+ start max-group-length)))
               (cond ((>= end (length some-chars))
                      (append result
                              (when result (list #\space))
                              (subseq some-chars start (min end (length some-chars)))))
                     (t (next-chop end
                                   (append result
                                           (when result (list #\space))
                                           (subseq some-chars start end))))))))
    (next-chop 0 '())))
