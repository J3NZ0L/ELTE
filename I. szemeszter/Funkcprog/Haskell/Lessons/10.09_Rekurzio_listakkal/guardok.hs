module Guardok where
    import Prelude hiding(min,take)
--Guardok: esetszetvalogatas igazabol
    min :: Ord a => a-> a -> a
    min n m 
        | n < m = n     
        | True  = m

        --otherwise :: Bool
        -- Otherwise = True
    take :: Int -> [a] -> [a]
    take _ [] = []
    take n (x:xs)
        | n <=0 =[]
        | otherwise = x : take (n-1) xs
    