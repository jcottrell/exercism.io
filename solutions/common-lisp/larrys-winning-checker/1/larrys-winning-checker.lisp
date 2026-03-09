(defpackage :larrys-winning-checker
  (:use :cl)
  (:export
   :make-empty-board
   :make-board-from-list
   :all-the-same-p
   :row
   :column))

(in-package :larrys-winning-checker)

(defun make-empty-board ()
  "Returns an empty 3x3 board."
  (make-array '(3 3) :initial-element nil))
; (make-empty-board)

(defun make-board-from-list (list)
  "Returns a 3x3 board populated with the contents of LIST."
  (make-array '(3 3) :initial-contents list))
; (make-board-from-list '((A B C) (D E F) (G H I)))
; ; #2A((A B C) (D E F) (G H I))

(defun all-the-same-p (row-or-col)
  "Returns T if all 3 of the elements of ROW-OR-COL are EQ."
  (and (eq (aref row-or-col 0)
           (aref row-or-col 1))
       (eq (aref row-or-col 1)
           (aref row-or-col 2))))
; (all-the-same-p #(A A A)) ;  T
; (all-the-same-p #(A B C)) ;  NIL
; (all-the-same-p #(A A B)) ;  NIL
; (all-the-same-p #(A B A)) ;  NIL
; (all-the-same-p #(B A A)) ;  NIL

(defun row (board row-num)
  "Returns an array of the elements in row ROW-NUM of BOARD."
  (make-array '(3)
              :initial-contents
              (list (aref board row-num 0)
                    (aref board row-num 1)
                    (aref board row-num 2))))
; (row #2A((1 2 3) (4 5 6) (7 8 9)) 1) ; #(4 5 6)

(defun column (board col-num)
  "Return an array of the elements in column COL-NUM of BOARD."
  (make-array '(3)
              :initial-contents
              (list (aref board 0 col-num)
                    (aref board 1 col-num)
                    (aref board 2 col-num))))
; (column #2A((1 2 3) (4 5 6) (7 8 9)) 1) ; #(2 5 8)
