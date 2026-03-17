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
  (let ((exponent (position allergen +allergens+ :test #'string=)))
    (not (zerop (logand (expt 2 exponent) score)))))

(defun list (score)
  "Returns a list of allergens for a given allergy SCORE."
  (remove-if-not #'(lambda (allergen)
                     (allergic-to-p score allergen))
                 +allergens+))
