module PerfectNumbers (classify, Classification(..)) where

import Data.List

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

getMoreFactors :: Int -> [Int] -> Int -> Int -> [Int]
getMoreFactors originalNumber factors currentNumber maxNumber
  | currentNumber > maxNumber               = factors
  | originalNumber `mod` currentNumber == 0 = getMoreFactors
                                                originalNumber
                                                (factors ++ [currentNumber] ++ [quotient])
                                                (currentNumber + 1)
                                                quotient
  | otherwise                               = getMoreFactors
                                                originalNumber
                                                factors
                                                (currentNumber + 1)
                                                quotient
  where quotient = (originalNumber `div` currentNumber)


gatherFactors :: Int -> [Int]
gatherFactors x = getMoreFactors x [] 1 (x - 1)

getClassification :: Int -> [Int] -> Maybe Classification
getClassification target factors
  | target == aliquotSum = Just Perfect
  | target < aliquotSum  = Just Abundant
  | target > aliquotSum  = Just Deficient
  | otherwise            = Nothing
  where aliquotSum = sum (filter (\x -> x /= target) (nub factors))

classify :: Int -> Maybe Classification
classify x
  | x <= 0 = Nothing
  | otherwise = getClassification x
                $ gatherFactors x
