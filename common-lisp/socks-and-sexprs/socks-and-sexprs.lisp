(defpackage :socks-and-sexprs
  (:use :cl)
  (:export :lennys-favorite-food :lennys-secret-keyword
           :is-an-atom-p :is-a-cons-p :first-thing :rest-of-it))

(in-package :socks-and-sexprs)

(defun lennys-favorite-food ()
  "Evaluates to symbol :moon-rocks"
  'moon-rocks)

(defun lennys-secret-keyword ()
  "Evaluates to keyword :smooth"
  :smooth)


(defun is-an-atom-p (thing)
  "Returns T if THING is an atom, NIL otherwise."
  (atom thing))

(defun is-a-cons-p (thing)
  "Return T if THING is an cons list, NIL otherwise."
  (consp thing))

(defun first-thing (cons)
  "Returns the first thing in CONS."
  (car cons))

(defun rest-of-it (cons)
  "Return everything except the first thing."
  (cdr cons))
