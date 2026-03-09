(defpackage :acronym
  (:use :cl)
  (:export :acronym))

(in-package :acronym)

(defconstant +allowed-characters+
  (coerce "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" 'list))

(defconstant +word-separators+
  '(#\tab #\newline #\space #\-))

(defun get-only-first-letters (phrase)
  (let ((previous-char-was-separator-p t)
        (first-chars-so-far '()))
    (second (reduce #'(lambda (so-far character)
                        (let ((previous-char-was-separator-p (first so-far))
                              (first-chars-so-far (second so-far))
                              (allowed-character-p (find character +allowed-characters+))
                              (word-separator-p (find character +word-separators+)))
                          (cond ((and previous-char-was-separator-p allowed-character-p)
                                 (list nil (append first-chars-so-far (list character))))
                                (word-separator-p (list t first-chars-so-far))
                                (t so-far))))
                      (coerce phrase 'list)
                      :initial-value (list previous-char-was-separator-p
                                           first-chars-so-far)))))

(defun acronym (phrase)
    (string-upcase (coerce (get-only-first-letters phrase) 'string)))
