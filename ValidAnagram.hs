-- https://leetcode.com/problems/valid-anagram/description/

import Data.List

passesTests = verify  "anagram" "nagaram"
    && False == verify "rat" "car"

verify :: String -> String -> Bool
verify s t = validAnagram s t

validAnagram :: String -> String -> Bool
validAnagram s t = length s == length t
    && sortMatch s t

-- at the end of the day this is probably more efficient overall than trying to min-max a solution for big O time
sortMatch :: String -> String -> Bool
sortMatch s t = sort s == sort t