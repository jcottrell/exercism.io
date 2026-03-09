(defpackage :larrys-winning-checker
  (:use :cl)
  (:export
   :make-empty-board
   :make-board-from-list
   :all-the-same-p
   :row
   :column))

(in-package :larrys-winning-checker)

(defconstant +board-dimensions+ '(3 3))

(defun make-empty-board ()
  "Returns an empty board (using +board-dimensions+)."
  (make-array +board-dimensions+ :initial-element nil))
; (make-empty-board)

(defun make-board-from-list (list)
  "Returns a board populated populated with LIST (using +board-dimensions+)."
  (make-array +board-dimensions+ :initial-contents list))
; (make-board-from-list '((A B C) (D E F) (G H I)))
; ; #2A((A B C) (D E F) (G H I))

(defun all-the-same-p (row-or-col)
  "Returns T if all of the elements of ROW-OR-COL are EQ."
  (cond ((<= (length row-or-col) 1) t)
        ((eq (aref row-or-col 0) (aref row-or-col 1))
         (all-the-same-p (subseq row-or-col 1)))))

; (all-the-same-p #(A A A)) ;  T
; (all-the-same-p #(A B C)) ;  NIL
; (all-the-same-p #(A A B)) ;  NIL

(defun row (board row-num)
  "Returns array of elements in row ROW-NUM of BOARD (uses +board-dimensions+)."
  (let ((number-of-rows (first +board-dimensions+)))
    (make-array (list number-of-rows)
                :initial-contents
                (loop for y from 0 to (1- number-of-rows) collect (aref board row-num y)))))
; (row #2A((1 2 3) (4 5 6) (7 8 9)) 1) ; #(4 5 6)

(defun column (board col-num)
  "Return array of elements in column COL-NUM of BOARD (use +board-dimensions+)."
  (let ((number-of-columns (second +board-dimensions+)))
    (make-array (list number-of-columns)
                :initial-contents
                (loop for x from 0 to (1- number-of-columns) collect (aref board x col-num)))))
; (column #2A((1 2 3) (4 5 6) (7 8 9)) 1) ; #(2 5 8)
