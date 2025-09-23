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
  (let* ((adjusted-score (extract-score-for-only-known-allergens score))
         (binary-score (reduce-decimal-to-binary adjusted-score))
         (all-allergen-pairs (mapcar #'cl:list +allergens+ binary-score))
         (allergen-pairs-in-score (remove-if #'(lambda (pair) (zerop (second pair)))
                                             all-allergen-pairs)))
    (mapcar #'first allergen-pairs-in-score)))

(defun extract-score-for-only-known-allergens (score)
  "Returns a score that remains within the known allergens."
  (mod score (expt 2 (length +allergens+))))

(defun reduce-decimal-to-binary (decimal-remaining &optional (current-exponent (1- (length +allergens+))) (binary-digits '()))
  "Returns a reversed list of binary digits, the reduction of DECIMAL-REMAINING."
  (if (< current-exponent 0)
      binary-digits
      (let* ((current-2-raised (expt 2 current-exponent))
             (times-into-remaining (floor (/ decimal-remaining current-2-raised)))
             (to-subtract (* current-2-raised times-into-remaining)))
        (reduce-decimal-to-binary (- decimal-remaining to-subtract)
                                  (1- current-exponent)
                                  (cons times-into-remaining binary-digits)))))
