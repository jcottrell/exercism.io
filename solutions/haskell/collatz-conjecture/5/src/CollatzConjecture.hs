module CollatzConjecture (collatz) where

import Data.List (genericLength)

processStep :: Integer -> Integer
processStep x
  | even x    = x `div` 2
  | otherwise = x * 3 + 1

processCollatz :: Integer -> Integer
processCollatz = genericLength . takeWhile (1 /=) . iterate processStep

makeValid :: Integer -> Maybe Integer
makeValid x = if x > 0 then Just x else Nothing

collatz :: Integer -> Maybe Integer
collatz x = processCollatz <$> makeValid x
