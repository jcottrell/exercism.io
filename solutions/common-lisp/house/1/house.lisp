(defpackage :house
  (:use :cl)
  (:export :recite))

(in-package :house)

(defconstant pieces
  '("the house that Jack built."
    "the malt that lay in"
    "the rat that ate"
    "the cat that killed"
    "the dog that worried"
    "the cow with the crumpled horn that tossed"
    "the maiden all forlorn that milked"
    "the man all tattered and torn that kissed"
    "the priest all shaven and shorn that married"
    "the rooster that crowed in the morn that woke"
    "the farmer sowing his corn that kept"
    "the horse and the hound and the horn that belonged to"))

(defun get-verse (verse)
  (format nil "This is ~{~a~^ ~}"
          (loop for line-number from verse downto 1
                collect (nth (1- line-number) pieces))))

(defun recite (start-verse end-verse)
  (format nil "~{~a~^~%~}"
          (loop for i from start-verse to end-verse
                collect (get-verse i))))
