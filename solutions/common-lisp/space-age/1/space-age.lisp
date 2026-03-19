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

(defparameter *planet-orbital-period-map*
  '((mercury . 0.2408467)
    (venus . 0.61519726)
    (earth . 1.0)
    (mars . 1.8808158)
    (jupiter . 11.862615)
    (saturn . 29.447498)
    (uranus . 84.016846)
    (neptune . 164.79132))
  "Simple associate between planet name and orbital period in earth years.")

(defun on-mercury (seconds)
  (on-what-planet 'mercury seconds))

(defun on-venus (seconds)
  (on-what-planet 'venus seconds))

(defun on-earth (seconds)
  (on-what-planet 'earth seconds))

(defun on-mars (seconds)
  (on-what-planet 'mars seconds))

(defun on-jupiter (seconds)
  (on-what-planet 'jupiter seconds))

(defun on-saturn (seconds)
  (on-what-planet 'saturn seconds))

(defun on-uranus (seconds)
  (on-what-planet 'uranus seconds))

(defun on-neptune (seconds)
  (on-what-planet 'neptune seconds))

(defun on-what-planet (planet seconds)
  "Returns the number of years on PLANET equal to earth SECONDS."
  (let ((period (cdr (assoc planet *planet-orbital-period-map*))))
    (/ (round (* 100 (/ seconds (* 365.25 period 86400)))) 100.0)))
