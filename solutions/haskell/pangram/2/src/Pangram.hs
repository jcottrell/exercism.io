module Pangram (isPangram) where

import Data.Char (isAlpha, toLower)
import qualified Data.Set as Set

isPangram :: String -> Bool
isPangram =
  (alphabet ==) . Set.toAscList . Set.fromList . map toLower . filter isAlpha
  where alphabet = ['a' .. 'z']
