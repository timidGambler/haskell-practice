-- https://leetcode.com/problems/two-sum/description/

passesTests = verify [ 2,7,11,15 ] 9 ( 0, 1 )
    && verify [ 3, 2, 4 ] 6 ( 1, 2 )
    && verify [ 3,3 ] 6 (0,1)

verify :: [ Int ] -> Int -> ( Int, Int ) -> Bool
verify nums target output = output == ((twoSum nums target) !! 0) -- !! 0 requires the "exactly one solution" assumption holds true

twoSum :: [ Int ] -> Int -> [( Int, Int )]
twoSum nums target = [ (a, b) |
    a <- [0..((length nums)-1)],    -- check each index
    b <- [0..((length nums)-1)],    -- a second value to make pairs of indices
    (nums !! a) + (nums !! b) == target, -- the sum of the two values must be the target
    a < b]                          -- a and b must be different, also require a LT b so we don't repeat solutions