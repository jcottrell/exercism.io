module Pangram (isPangram) where

import Data.Char (isAlpha, toLower)
import Data.List

isPangram :: String -> Bool
isPangram =
  (lowerAlphabet ==) . nub . sort . map toLower . filter isAlpha
  where lowerAlphabet = "abcdefghijklmnopqrstuvwxyz"
