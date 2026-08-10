passesTests = verify [7,1,5,3,6,4] 5
    && verify [7,6,4,3,1] 0

verify :: [ Int ] -> Int -> Bool
verify prices output = output == maxProfit prices

maxProfit :: [ Int ] -> Int
maxProfit prices = maximum ([0]  ++ [ prices !! b - prices !! a |
    a <- [0..(length prices - 1)],
    b <- [0..(length prices - 1)],
    b > a,
    prices !! b > prices !! a])