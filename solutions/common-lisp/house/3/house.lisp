(defpackage :house
  (:use :cl)
  (:export :recite))

(in-package :house)

(defconstant +pieces+
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
          (reverse (subseq +pieces+ 0 verse))))

(defun recite (start-verse end-verse)
  (loop for i from start-verse to end-verse
        collect (get-verse i) into verses
        finally (return (format nil "~{~a~^~%~}" verses))))
