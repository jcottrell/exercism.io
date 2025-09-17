(defpackage :acronym
  (:use :cl)
  (:export :acronym))

(in-package :acronym)

(defconstant +allowed-characters+
  (coerce "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" 'list))

(defconstant +word-separators+
  '(#\tab #\newline #\space #\-))

(defun acronym (phrase)
    (string-upcase (get-only-first-letters phrase)))

(defun get-only-first-letters (phrase)
  (coerce (get-only-first-characters (coerce phrase 'list)) 'string))

(defun get-only-first-characters (characters)
  (let ((previous-char-was-separator-p t)
        (first-chars-so-far '()))
    (second (reduce #'(lambda (so-far current-character)
                        (let ((previous-char-was-separator-p (first so-far))
                              (first-chars-so-far (second so-far))
                              (allowed-character-p (find current-character +allowed-characters+))
                              (word-separator-p (find current-character +word-separators+)))
                          (cond ((and previous-char-was-separator-p allowed-character-p
                                  (list nil (append first-chars-so-far (list current-character)))))
                                (word-separator-p (list t first-chars-so-far))
                                (t so-far))))
                    characters
                    :initial-value (list previous-char-was-separator-p
                                         first-chars-so-far)))))
