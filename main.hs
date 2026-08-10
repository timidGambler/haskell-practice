-- `ghci` in terminal to open the cli
-- `:l main.hs` to load this file, `:r` to reload it after changes

-- https://learnyouahaskell.github.io/starting-out.html
doubleMe x = x * 2

doubleSmallNumber x =
    if x <= 100
        then x * 2
        else x

-- square brackets for getting values out of lists is *so* imperative
valueAtIndex list index = list !! index

-- `null` function checks if a list is empty

giveFirstXElements list x = take x list

-- the whole lowercase alphabet as a string thanks to `..` range
alphaRange = ['a'..'z']
upTo20 = [1..20]
evensTo20 = [2,4..20]
downFrom20 = [20,19..1]

-- ** list comprehension magics **
-- normal, easy way
first10Evens = take 10 [2,4..]
-- way that looks like "set comprehension notation"
-- left of the pipe is the operation we do to get the output, right of the pipe is how we define the input (in this case x is a number 1 to 10)
first10Evens' = [ x * 2 | x <- [1..10] ]
-- add a predicate to the input data to only use the output if it is greater than 12
first10Evens'' = [ x * 2 | x <- [1..10], x * 2 >= 12]

-- pass a list into the comprehension, also use the odd function
boomBangs xs = [ if x > 10 then "BOOM!" else "BANG!" | x <- xs, odd x ]

-- operate on a string and also `elem` exists
removeLowercase str = [ s | s <- str, s `elem` ['A'..'Z'] ]

-- let's make some tuples
zipShowcase = zip [1..5] ['A'..'E']

-- we can zip an infinite list with a finite one if we want:
zipInfinity = zip [1..] ["apple", "orange", "cherry", "mango"]  

rightTriangles = [ (a, b, c) | a <- [1..10], b <- [1..10], c <- [1..10], a^2 + b^2 == c^2, b <= a ]

-- explicit input and output types
stoi :: String -> Int
-- use the "read" function to parse as something, and be explicit that we want an Int
stoi str = read str :: Int



-- https://learnyouahaskell.github.io/syntax-in-functions.html
 
-- Integral is all Ints and Integers, Ints are bound to be like 64 bit or something, Integers are not bound
-- if we only wanted to allow Ints, this would be `lucky :: Int -> String` instead
lucky :: (Integral a) => a -> String
lucky 7 = "Wow it's lucky 7"
lucky x = "Sure aint 7"

-- avoid awful if/else trees with this type of pattern matching
sayMe :: (Integral a) => a -> String
sayMe 1 = "one!"
sayMe 2 = "two!"
sayMe 3 = "three!"
sayMe x = "Not between 1 and 3"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x - 1)

-- guards are like pattern matching...sort of
densityTell :: (RealFloat a) => a -> String
densityTell density
    | density < 1.2 = "Wow you can fly"
    | density <= 1000.0 = "Have fun swimming"
    | otherwise = "You're gonna sink"

-- you can mix guards and pattern matching:
densityTell' :: (RealFloat a) => a -> String
densityTell' density
    | density < 1.2 = "Wow you can fly"
    | density <= 1000.0 = "Have fun swimming"
densityTell' x = "You're gonna sink"

-- use `where` to store density as a variable
densityTell'' :: (RealFloat a) => a -> a -> String
densityTell'' mass volume
    | density < 1.2 = "Wow you can fly"
    | density <= 1000.0 = "Have fun swimming"
    | otherwise = "You're gonna sink"
    where density = mass / volume    

-- use `where` a few more times just to prove a point
densityTell''' :: (RealFloat a) => a -> a -> String
densityTell''' mass volume
    | density < air = "Wow you can fly"
    | density <= water = "Have fun swimming"
    | otherwise = "You're gonna sink"
    where density = mass / volume    
          air = 1.2
          water = 1000.0
          -- the "where bindings" need to be aligned to the same column or Haskell throws an error