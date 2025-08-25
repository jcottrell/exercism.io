module CollatzConjecture (collatz) where

processEven :: Integer -> Integer
processEven x = x `div` 2

processOdd :: Integer -> Integer
processOdd x = x * 3 + 1

processStep :: Integer -> Integer -> Integer
processStep count x
  | x == 1 = count
  | otherwise = processStep (count + 1) nextX
  where nextX = if even x then processEven x else processOdd x

makeValid :: Integer -> Maybe Integer
makeValid x = if x > 0 then Just x else Nothing

collatz :: Integer -> Maybe Integer
collatz x = fmap (processStep 0) (makeValid x)
