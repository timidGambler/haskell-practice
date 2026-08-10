-- https://leetcode.com/problems/roman-to-integer/description/

import Data.Map

passesTests = verify "III" 3
    && verify "IV" 4
    && verify "LVIII" 58

verify :: String -> Int -> Bool
verify str output = output == romanToInt str

numeralValues = fromList [ ('I', 1), ('V', 5), ('X', 10), ('L', 50), ('C', 100), ('D', 500), ('M', 1000) ]

{-
    Recursive solution
    Look at the first two characters, if the first is smaller than the second we know the first should be "negative"
    Otherwise just add everything together
-}
romanToInt :: String -> Int
romanToInt (c1:c2:str)
    | numeralValues ! c1 < numeralValues ! c2 = (numeralValues ! c2 - numeralValues ! c1) + romanToInt str
    | otherwise = numeralValues ! c1 + romanToInt([ c2 ] ++ str)
romanToInt c1
    | c1 == "" = 0
    | otherwise = numeralValues ! (c1 !! 0)