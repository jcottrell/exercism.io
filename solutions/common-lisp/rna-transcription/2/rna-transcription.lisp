(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(defun get-rna-complement (nucleotide)
  "Returns the rna complement to NUCLEOTIDE."
  (ecase nucleotide
    (#\A #\U)
    (#\C #\G)
    (#\G #\C)
    (#\T #\A)))
; (get-rna-complement #\A) ; #\U

(defun to-rna (dna)
  "Transcribes a string representing DNA nucleotides to RNA."
  (map 'string #'get-rna-complement dna))
; (to-rna "GCTA") ; "CGAU"
