module SpaceAge ( Planet(..) , ageOn) where

data Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

getRatio :: Planet -> Float
getRatio Mercury = 0.2408467
getRatio Venus   = 0.61519726
getRatio Earth   = 1
getRatio Mars    = 1.8808158
getRatio Jupiter = 11.862615
getRatio Saturn  = 29.447498
getRatio Uranus  = 84.016846
getRatio Neptune = 164.79132

convertToEarthYears :: Float -> Float
convertToEarthYears = (* 31557600)

divideIntoPlanetYears :: Float -> (Float -> Float)
divideIntoPlanetYears = flip (/) . convertToEarthYears

ageOn :: Planet -> Float -> Float
ageOn = divideIntoPlanetYears . getRatio
