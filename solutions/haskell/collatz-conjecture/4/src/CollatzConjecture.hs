module CollatzConjecture (collatz) where

import Control.Conditional (select)

afterEven :: Integer -> Integer
afterEven x = x `div` 2

afterOdd :: Integer -> Integer
afterOdd x = x * 3 + 1

processStep :: Integer -> Integer
processStep = select even afterEven afterOdd

processCollatz :: Integer -> Integer
processCollatz = fromIntegral . length . takeWhile (1 /=) . iterate processStep

makeValid :: Integer -> Maybe Integer
makeValid x = if x > 0 then Just x else Nothing

collatz :: Integer -> Maybe Integer
collatz x = fmap processCollatz (makeValid x)
