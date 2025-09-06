(defpackage :anagram
  (:use :cl)
  (:export :anagrams-for))

(in-package :anagram)

(defun exactly-once-p (left-list right-list)
  "Returns T if all LEFT-LIST elements are EQUALP exactly once in RIGHT-LIST."
  (cond ((and (null left-list) (null right-list)) t)
        (t (and (= (length left-list) (length right-list))
                (exactly-once-p (cdr left-list)
                                (remove (car left-list) right-list :test #'equalp :count 1))))))

(defun keep-one-to-one-matches (subject-list possible-lists)
  "Returns lists in POSSIBLE-LISTS where SUBJECT-LIST is one-to-one EQUALP."
  (remove-if-not #'(lambda (possible-list)
                     (exactly-once-p subject-list possible-list))
                 possible-lists))

(defun anagrams-for (subject candidates)
  "Returns a sublist of candidates which are anagrams of the subject."
  (let* ((subject-chars (coerce subject 'list))
         (non-subject-candidates (remove subject candidates :test #'equalp))
         (same-length-candidates (remove-if-not #'(lambda (candidate)
                                                    (= (length subject) (length candidate)))
                                                non-subject-candidates))
         (remaining-candidates-as-chars (mapcar #'(lambda (candidate) (coerce candidate 'list))
                                                same-length-candidates)))
    (mapcar #'(lambda (chars) (coerce chars 'string))
            (keep-one-to-one-matches subject-chars remaining-candidates-as-chars))))
