module Prime (nth) where

if' :: Bool -> a -> a -> a
if' True x _  = x
if' False _ y = y

getIndex :: Int -> Maybe Integer
getIndex x
  | x <= 0    = Nothing
  | otherwise = Just $ toInteger x

checkForPrime :: Integer -> Bool
checkForPrime x = 
    ((0 ==).length)
    $ filter (\y -> y /= 1 && x /= y)
    $ filter (\y -> x `mod` y == 0) [2..(x `div` 2)]

getNextPrime :: Integer -> Integer -> Integer
getNextPrime prime increment = if' (checkForPrime (prime + increment))
                                   (prime + increment)
                                   (getNextPrime prime (increment + 1))

getPrime :: Integer -> Integer -> Integer -> Maybe Integer
getPrime primeNumber primeIndex targetIndex
  | primeIndex == targetIndex = Just primeNumber
  | primeIndex < targetIndex  = getPrime (getNextPrime primeNumber 1) (primeIndex + 1) targetIndex
-- it wants to be exhaustive so I added a Maybe, which meant monads already
getPrime _ _ _                = Nothing

nth :: Int -> Maybe Integer
nth n = getPrime 2 1 =<< getIndex n
