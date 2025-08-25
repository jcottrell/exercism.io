module Anagram (anagramsFor) where

import Data.List
import Data.Char (toLower)

hasMatch :: String -> String -> Bool
hasMatch "" ""    = True
hasMatch "" _     = False
hasMatch _ ""     = False
hasMatch (x:xs) h = x `elem` h && hasMatch xs (delete x h)

notSame :: String -> String -> Bool
notSame xs ys = xs /= ys

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = filter ((\w -> notSame lowerXs w && hasMatch lowerXs w).(map toLower)) xss
    where lowerXs = map toLower xs
