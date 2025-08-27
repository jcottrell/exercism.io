(defpackage :leslies-lists
  (:use :cl)
  (:export :new-list
           :list-of-things
           :add-to-list
           :first-thing
           :second-thing
           :third-thing
           :twenty-third-thing
           :remove-first-item
           :on-the-list-p
           :list-append
           :just-how-long
           :part-of-list
           :list-reverse))

(in-package :leslies-lists)

(defun new-list ()
  "Returns an empty list."
  '())

(defun list-of-things (thing1 thing2 thing3)
  "Returns a list of THING1 THING2 and THING3"
  (list thing1 thing2 thing3))

(defun add-to-list (item list)
  "Prepends ITEM to LIST"
  (cons item list))

(defun first-thing (list)
  "Returns the first item in LIST"
  (car list))

(defun second-thing (list)
  "Returns the second item in LIST"
  (second list))

(defun third-thing (list)
  "Returns the third item in LIST"
  (third list))

(defun twenty-third-thing (list)
  "Returns the 23rd item in LIST"
  (nth 22 list))

(defun remove-first-item (list)
  "Returns all but the first item of the LIST"
  (cdr list))

(defun list-append (list1 list2)
  "Returns a list from the items of LIST1 followed by the items of LIST2."
  (append list1 list2))

(defun just-how-long (list)
  "Returns the length of LIST."
  (length list))
