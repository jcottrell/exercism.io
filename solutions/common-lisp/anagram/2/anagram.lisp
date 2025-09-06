(defpackage :anagram
  (:use :cl)
  (:export :anagrams-for))

(in-package :anagram)

(defun anagrams-for (subject candidates)
  "Returns a sublist of candidates which are anagrams of the subject."
  (let ((clean-subject (sort (string-downcase subject) #'string<))
        (non-subject-candidates (remove subject candidates :test #'equalp)))
    (remove-if-not #'(lambda (candidate)
                       (string= clean-subject (sort (string-downcase candidate) #'string<)))
                   non-subject-candidates)))
