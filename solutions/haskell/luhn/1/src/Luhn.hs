module Luhn (isValid) where

import Data.Char (digitToInt, isDigit)

if' :: Bool -> a -> a -> a
if' True  x _ = x
if' False _ y = y

doubleOddIndicies :: (Ord a, Integral a) => [a] -> [a]
doubleOddIndicies = reverse . zipWith (*) (cycle [1,2]) . reverse

adjustOverNine :: (Ord a, Integral a) => [a] -> [a]
adjustOverNine = map (\x -> if' (x > 9) (x - 9) x)

checkValidity :: (Ord a, Integral a) => [a] -> Bool
checkValidity = (0 ==) . flip mod 10 . sum . adjustOverNine . doubleOddIndicies

isValid :: String -> Bool
isValid xs =
    if' (length intList <= 1) False (checkValidity intList)
    where intList = map digitToInt $ filter isDigit xs
