(defpackage :high-scores
  (:use :cl)
  (:export :make-high-scores-table :add-player
           :set-score :get-score :remove-player))

(in-package :high-scores)

(defun make-high-scores-table ()
  "Create and return a newly created high score table."
  (make-hash-table))

(defun add-player (high-scores player)
  "Add a new player to the high scores list with score of zero."
  (setf (gethash player high-scores) 0))
; (add-player (make-high-scores-table) :louis) ; 0
; (add-player (make-high-scores-table) :lilly) ; 0

(defun set-score (high-scores player score)
  "Sets the score of a player on the high score list."
  (setf (gethash player high-scores) score))
; (set-score (make-high-scores-table) :louis 1234) ; => 1234

(defun get-score (high-scores player)
  "Returns the score of the PLAYER on the HIGH-SCORES table."
  (if (nth-value 1 (gethash player high-scores))
      (gethash player high-scores)
      0))
; (setf *hs* (make-high-scores-table))
; (add-player *hs* :joe)
; (set-score *hs* :joe 15)
; (get-score *hs* :joe) ; 15

(defun remove-player (high-scores player)
  (when (nth-value 1 (gethash player high-scores))
    (remhash player high-scores)))
; (set-score *hs* :louis 1234)           ; 1234
; (remove-player *hs* :louis)            ; T
; (get-score *hs* :louis)                ; 0
;
; (remove-player *hs* :not-in-the-table) ; NIL
