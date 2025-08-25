module Bob (responseFor) where

import Data.String.HT (trim)
import Data.Char (isAlpha, isUpper)
import Data.String.Utils (endswith)
import Data.Function.Tools (apply2way)

shouting :: String -> Bool
shouting = apply2way (&&) (all isUpper) (not . null) . filter isAlpha

responseFor :: String -> String
responseFor xs
  | null $ trim txs = "Fine. Be that way!"
  | shouting txs && endswith "?" txs = "Calm down, I know what I'm doing!"
  | shouting txs = "Whoa, chill out!"
  | endswith "?" txs = "Sure."
  | otherwise = "Whatever."
    where txs = trim xs
