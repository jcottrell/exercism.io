(defpackage :allergies
  (:use :cl)
  (:shadow :list)
  (:export :allergic-to-p :list))

(in-package :allergies)

(defconstant +allergens+
  '("eggs" "peanuts" "shellfish" "strawberries" "tomatoes" "chocolate" "pollen" "cats")
  "List of known allergens.")

(defun allergic-to-p (score allergen)
  "Returns true if given allergy SCORE includes given ALLERGEN."
  (and (find allergen (list score) :test #'string=) t))

(defun list (score)
  "Returns a list of allergens for a given allergy SCORE."
  (let ((binary-allergen-pairs (mapcar #'cl:list (get-binary score) +allergens+)))
    (mapcar #'second
            (remove-if #'zerop binary-allergen-pairs :key #'first))))

(defun get-binary (score)
  "Returns ordered binary list, the presence (1) or absense (0) of the allergens in SCORE."
  (reverse (mapcar #'(lambda (digit) (parse-integer (string digit)))
                  (coerce (format nil "~b" score) 'cl:list))))
