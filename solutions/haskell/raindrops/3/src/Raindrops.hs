module Raindrops (convert) where

factorNamePairs :: [(Int, String)]
factorNamePairs = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

isNotEmpty :: String -> Bool
isNotEmpty = not . null

isFactor :: Int -> Int -> Bool
isFactor factor num = rem num factor == 0

getNumberName :: Int -> String
getNumberName = show

convert :: Int -> String
convert n = if isNotEmpty factorName
            then factorName
            else getNumberName n
  where factorName                              = concatMap (\fun -> fun n)
                                                  $ factorFunResults factorNamePairs
        factorFunResults                        = map ifFactorGetName
        ifFactorGetName (factor, name) possible = if isFactor factor possible
                                                  then name
                                                  else ""
