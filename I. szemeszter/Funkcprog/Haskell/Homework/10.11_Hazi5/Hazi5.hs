module Hazi5 where
type Title = String
type Count = Integer 

o_O_count :: Title -> Count
o_O_count ([]) = 0
o_O_count (x:xs)
    | x =='o' || x =='O' = 1+o_O_count(xs)
    | otherwise = 0+o_O_count(xs)

longerThan :: [item] -> Count -> Bool
longerThan ([]) a
    | a<0 = True
    | otherwise = False
longerThan (_:xs) a
    |   a<=0 = True
    |   otherwise =longerThan(xs) (a-1)
--longerThan (x:_) a = not(a<1)
{-
longerThan :: [a] -> Int -> Bool
longerThan [] n = n < 1
longerThan (x:xs) n = longerThan xs (n-1)
-}

merge :: [magic] -> [magic] -> [magic]
merge [] [] = []
merge [] (x:xs) = (x:xs)
merge (x:xs) [] = (x:xs)
merge (x:xs) (y:ys) = x:y: merge (xs) (ys)



starter :: Eq magic => [magic] -> [magic] -> Bool
starter [] _ = True
starter _ [] = False
starter (x:xs) (y:ys) = x == y && starter (xs) (ys)
{-
starter (x:[]) (y:ys) = x==y
starter (x:xs) (y:[]) = x==y
starter (x:xs) (y:ys)
    |   x==y = starter (xs) (ys)
    |   x/=y = False
-}