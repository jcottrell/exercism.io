module Strain (keep, discard) where

if' :: Bool -> a -> a -> a
if' True  x _ = x
if' False _ y = y

discard :: (a -> Bool) -> [a] -> [a]
discard _ []     = []
discard p (x:xs) = if' (p x) (discard p xs) ([x] ++ (discard p xs))

keep :: (a -> Bool) -> [a] -> [a]
keep p = discard (not . p)
