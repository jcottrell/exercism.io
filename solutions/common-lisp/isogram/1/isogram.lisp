(defpackage :isogram
  (:use :cl)
  (:export :isogram-p))

(in-package :isogram)

(defun isogram-p (string)
  "Returns T if STRING is an isogram."
  (let* ((lowercase (string-downcase string))
         (chars (coerce lowercase 'list))
         (clean (remove-if-not #'alpha-char-p chars)))
    (= (length clean)
       (length (remove-duplicates clean)))))
