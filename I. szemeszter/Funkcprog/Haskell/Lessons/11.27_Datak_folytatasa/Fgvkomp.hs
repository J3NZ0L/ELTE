module Fgvkomp where
    import Prelude hiding ((.))
    (.) :: (b -> c) -> (a -> b) -> (a -> c)
    (f . g) x = f (g x)
    -- f . g = \ x -> f (g x)
    -- (.) f g x = f (g x)

    numbersMadeOfOnes :: [Integer]
    numbersMadeOfOnes = iterate ((+1) . (*10)) 1 
    --(*10) . (+1) = \ x -> (*10) (( +1) x) 

    numbersMadeOfThrees :: [Integer]
    numbersMadeOfThrees = iterate ((+3) . (*10)) 3 

    numbersMadeOfThreesAndOnes :: [Integer]
    numbersMadeOfThreesAndOnes = iterate ((+1) . (*10)) 1 
    --numbersMadeOfThreesAndOnes = iterate ((+1) . (*10) . (+2)) 1

    dropSpaces :: String -> String
    dropSpaces = dropWhile (==' ')

    trim :: String -> String
    trim =reverse . dropSpaces . reverse . dropSpaces 
    
    maximumOfMinimums :: Ord a => [[a]] -> a
    maximumOfMinimums = maximum . map minimum 

    mapMap :: (a -> b) -> [[a]] -> [[b]]
    mapMap = map . map
    --mapMap f = (map . map) f 
    --           ( f  .  g ) x =  f  ( g x)
    --              mapMap f l = map (map f)
    