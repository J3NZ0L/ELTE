module Lesson08 where
    import Prelude hiding(sum, foldr, foldl,prod,length,(++))
    sum' :: Num a => [a] -> a 
    sum' (x:xs) = x+ sum' xs

    prod' :: Num a => [a] -> a
    prod' [] = 0
    prod' (x:xs) = x * prod' xs

    foldr :: (a -> b -> b) -> b -> [a] -> b
    foldr f acc [] = acc
    foldr f acc (x:xs) = x `f` (foldr f acc xs )

    foldl :: (b -> a -> b) -> b -> [a] -> b
    foldl _ acc [] = acc
    foldl f acc (x:xs) = foldl f (f acc x) xs

    sum :: Num a => [a] -> a 
    sum l = foldr (+) 0 l

    
    prod :: Num a => [a] -> a 
    prod l = foldr (*) 1 l

    length :: [a] -> Int
    length l = foldr (\_ acc -> 1 + acc) 0 l

    and' :: [Bool]{-veges-} -> Bool
    and' l = foldr (&&) True l

    (++) :: [a] -> [a] -> [a]
    (++) l1 l2 = foldr (:) l2 l1

