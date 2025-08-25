module Bob (responseFor) where

import Data.Char (isAlpha, isUpper)
import Data.String.HT (trim)
import Data.String.Utils (endswith)

blackBird :: (a -> b -> c) -> (d -> a) -> (d -> b) -> d -> c
blackBird f1 f2 f3 xs = f1 (f2 xs) (f3 xs)

shouting :: String -> Bool
shouting = blackBird (&&) (all isUpper) (not . null) . filter isAlpha

responseFor :: String -> String
responseFor xs
  | null $ trim txs = "Fine. Be that way!"
  | shouting txs && endswith "?" txs = "Calm down, I know what I'm doing!"
  | shouting txs = "Whoa, chill out!"
  | endswith "?" txs = "Sure."
  | otherwise = "Whatever."
    where txs = trim xs
