module Raindrops (convert) where

factorNamePairs :: [(Int, String)]
factorNamePairs = [(3, "Pling"), (5, "Plang"), (7, "Plong")]

convert :: Int -> String
convert n =
  let get_factor_name factor num = if rem num (fst factor) == 0
                                   then snd factor
                                   else ""
      factor_fun_results = map get_factor_name
      factor_name_result = concatMap (\fun -> fun n)
                           $ factor_fun_results factorNamePairs
  in if not (null factor_name_result)
     then factor_name_result
     else show n
