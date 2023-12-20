module Lesson07_magasabbrendu_fgvk where
    import Prelude hiding (map,any,filter)
    --Olyan fuggveny, ami fuggvenyt var parameterul

    map :: (a -> b) -> [a] -> [b]
    map _ [] = []
    map f (x:xs) = f x : map f xs 

    map' :: (a-> b) -> [a] -> [b]
    map' f l = [ f x | x <- l ]

    all :: (a -> Bool) -> [a] -> Bool
    all p l = and (map p l)  --p mint predikatum, nem szamit am --and beepitett fgv listaelemeket esel ossze

    any :: (a -> Bool) -> [a] -> Bool
    any p l = or (map p l)

    elem :: Eq a => a -> [a] -> Bool
    elem x = any (==x)

    filter :: (a -> Bool) -> [a] -> [a]
    filter _ [] = []
    filter p (x:xs) 
        | p x = x : filter p xs
        | True = filter p xs

    filter' :: (a-> Bool) -> [a] -> [a]
    filter' p l = [ x | x <- l, p x]
    