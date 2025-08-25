module CryptoSquare (encode) where

import Data.Char (isAlphaNum, toLower)

if' :: Bool -> a -> a -> a
if' True  x _ = x
if' False _ y = y

generateGuess :: Int -> Int -> Int -> (Int, Int)
generateGuess target rows columns
    | target <= rows * columns && columns - rows <= 1 = (rows, columns)
    | otherwise                                       = generateGuess target nextRowGuess nextColumnGuess
    where nextRowGuess      = if' (columns > rows) (rows + 1) rows
          nextColumnGuess   = if' (columns > rows) columns (columns + 1)

getDimensions :: Int -> (Int, Int)
getDimensions l = generateGuess l 0 0

makeCodeGroups :: (Int, Int) -> String -> String
makeCodeGroups rowsColumns s = unwords
    $ filter (\x -> length x > 0)
    $ map (makeCodeSubGroup s columns) [0 .. rows]
    where columns = snd rowsColumns
          rows    = fst rowsColumns

makeCodeSubGroup :: String -> Int -> Int -> String
makeCodeSubGroup s gSize gRound
  | gSize == gRound = ""
  | otherwise       = map (\x -> s !! x) [gRound, gRound + gSize .. (length s - 1)]

makeCode :: String -> String
makeCode s = makeCodeGroups rowsColumns (s ++ (replicate padLength ' '))
    where padLength      = (fst rowsColumns) * (snd rowsColumns) - originalLength
          rowsColumns    = getDimensions originalLength
          originalLength = length s

encode :: String -> String
encode xs = makeCode
            $ map toLower
            $ filter isAlphaNum xs
