module CollatzConjecture (collatz) where

import Control.Conditional (select)

afterEven :: Integer -> Integer
afterEven x = x `div` 2

afterOdd :: Integer -> Integer
afterOdd x = x * 3 + 1

processStep :: (Integer, Integer) -> (Integer, Integer)
processStep (1, count) = (1, count)
processStep (x, count) = (select even afterEven afterOdd x, count + 1)

processCollatz :: Integer -> Integer
processCollatz x = snd $ until ((1 ==).fst) processStep (x, 0)

makeValid :: Integer -> Maybe Integer
makeValid x = if x > 0 then Just x else Nothing

collatz :: Integer -> Maybe Integer
collatz x = fmap processCollatz (makeValid x)
