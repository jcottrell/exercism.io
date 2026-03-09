(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(defun get-rna-complement (nucleotide)
  "Returns the rna complement to NUCLEOTIDE."
  (cond ((eql #\A nucleotide) #\U)
        ((eql #\C nucleotide) #\G)
        ((eql #\G nucleotide) #\C)
        ((eql #\T nucleotide) #\A)))
; (get-rna-complement #\A)

(defun to-rna (dna)
  "Transcribes a string representing DNA nucleotides to RNA."
  (coerce (map 'list #'get-rna-complement dna) 'string))
; (to-rna "GCTA") ; "CGAU"
