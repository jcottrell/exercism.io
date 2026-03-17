(defpackage :space-age
  (:use :cl)
  (:export :on-mercury
           :on-venus
           :on-earth
           :on-mars
           :on-jupiter
           :on-saturn
           :on-uranus
           :on-neptune))

(in-package :space-age)

(defmacro make-on-planet-function (planet-name orbital-period)
  (let ((function-name (read-from-string (format nil "ON-~a" (symbol-name planet-name))))
        (documentation (format nil "Returns the number of years on ~a equal to earth SECONDS." planet-name)))
    `(defun ,function-name (seconds)
       ,documentation
          (/ (round (* 100 (/ seconds (* 365.25 ,orbital-period 86400)))) 100.0))))

(make-on-planet-function mercury 0.2408467)
(make-on-planet-function venus 0.61519726)
(make-on-planet-function earth 1.0)
(make-on-planet-function mars 1.8808158)
(make-on-planet-function jupiter 11.862615)
(make-on-planet-function saturn 29.447498)
(make-on-planet-function uranus 84.016846)
(make-on-planet-function neptune 164.79132)
