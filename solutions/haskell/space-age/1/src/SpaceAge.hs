module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

convertToEarthYears :: Float -> Float
convertToEarthYears = (* 31557600)

divideIntoPlanetYears :: Float -> (Float -> Float)
divideIntoPlanetYears = (flip (/)) . convertToEarthYears

ageOn :: Planet -> Float -> Float
ageOn Mercury = divideIntoPlanetYears 0.2408467
ageOn Venus   = divideIntoPlanetYears 0.61519726
ageOn Earth   = divideIntoPlanetYears 1
ageOn Mars    = divideIntoPlanetYears 1.8808158
ageOn Jupiter = divideIntoPlanetYears 11.862615
ageOn Saturn  = divideIntoPlanetYears 29.447498
ageOn Uranus  = divideIntoPlanetYears 84.016846
ageOn Neptune = divideIntoPlanetYears 164.79132
