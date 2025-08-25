module Acronym (abbreviate) where

import Data.Char (isAlpha, isLower, isUpper, toLower, toUpper)

if' :: Bool -> a -> a -> a
if' True  x _ = x
if' False _ y = y

lowercaseIfSecondLower :: String -> String
lowercaseIfSecondLower xs = if' (isLower (head xs)) xs (map toLower xs)

uppercaseWords :: String -> String
uppercaseWords [] = ""
uppercaseWords [x] = [x]
uppercaseWords (x:xs) = [toUpper x] ++ (lowercaseIfSecondLower xs)

abbreviate :: String -> String
abbreviate xs =
    filter isUpper
    $ filter isAlpha
    $ unwords
    $ map uppercaseWords
    $ filter (\x -> x /= " ")
    $ words
    $ map (\x -> if' ('-' == x) ' ' x) xs
