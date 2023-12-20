module Lesson08 where
    import Prelude hiding(takeWhile,dropWhile,span, iterate,($),(.),filters,zipWith,zip)
    {-
    Kovi pluszminusz!!!:
        -fuggvenyek atnezese tipusszignaturaval es a preludeban definialt nevevel, az osszeset amire volt pelda oran
            valszeg meg lesz nevezve egy fgv es replikalni kell
        -2 pontot fog erni
        -lambda.inf.elte.hu jo gyakorlas
    -}
    count :: (a -> Bool) ->[a] -> Int
    count _ [] = 0
    count f (x:xs)
        | f x  = 1 + count f xs
        | True = count f xs

    count' :: (a -> Bool) ->[a] -> Int
    count' p l = length (filter p l)

    takeWhile :: (a -> Bool) -> [a] -> [a]
    takeWhile p [] = []
    takeWhile p (x:xs)
        | p x = x : takeWhile p xs
        | True = []

    dropWhile :: (a -> Bool) -> [a] -> [a]
    dropWhile _ [] = []
    dropWhile p l@(x:xs) 
        | p x = dropWhile p xs
        | True = l

    span :: (a -> Bool) -> [a]{-véges-} -> ([a],[a])
    span _ [] = ([],[])
    span p l@(x:xs)
        | p x = (x:as, bs)
        | otherwise = ([], l)
            where
                (as, bs) = span p xs
            
    iterate :: (a -> a) -> a -> [a]
    iterate  f x = x : iterate f (f x)

    infixr 0 $
    ($) :: (a -> b) -> a -> b
    f $ a = f a

    infixr 9 .
    (.) :: (b -> c) -> (a -> b) -> a -> c
    --(.) f g a = f $ g a
    f . g = \ x -> f $ g x

    elem' :: Eq a => a -> [a] {-veges-} -> Bool
    elem' e = any (==e)

    filters' :: Eq a => [a] -> [a] -> [a]
    filters' [] l = l
    filters' (f:fs) l = filters' fs (filter (/=f) l)

    filters :: Eq a => [a] -> [a] -> [a]
    filters fs l = filter (`notElem` fs) l

    zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
    zipWith _ [] _ = []
    zipWith _ _ [] = []
    zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys

    zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
    zipWith' f as bs = map (\(a,b) -> f a b) (zip as bs)

    zip :: [a] ->[b] -> [(a,b)]
    zip = zipWith (,)


