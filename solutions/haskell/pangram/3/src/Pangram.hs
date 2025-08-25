module Pangram (isPangram) where

-- after enabling test:
-- "determine pangram by terminating as soon as all letters have occurred"
import Data.Char (isAlpha, toLower)

isPangram :: String -> Bool
isPangram xs =
    not (any (`notElem` prepped) ['a' .. 'z'])
    where prepped = map toLower $ filter isAlpha xs
