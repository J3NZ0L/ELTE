module Seged_1 where
    
    every5 :: (Ord a) => [a] -> [[a]]
    every5 [] = []
    every5 [a] = []
    every5 [a, b] = []
    every5 [a, b, c] = []
    every5 [a, b, c,d] = []
    every5 (a:b:c:d:e:xs) = [a, b, c, d, e] : every5 (b:c:d:e:xs)

    sumsOfevery5s :: (Ord a, Num a) => [[a]] -> [a] 
    --sumsOfevery5s l = map sum (l) -- > visszaadja az osszegeket --->>>EBBOL KELL A SUM HELYERE OLYAN FGV, HOGY VISSZAADJA A LEVONHATO ELETERO OSSZEGET
    sumsOfevery5s l = map sumOfPossibleDamage l

    sumOfPossibleDamage :: (Ord a, Num a) => [a] -> a
    sumOfPossibleDamage [] = 0
    sumOfPossibleDamage (x:xs) 
        | x<5 = x + sumOfPossibleDamage xs
        | otherwise = 5 + sumOfPossibleDamage xs

    maxOfsumsOfevery5s :: (Ord a, Num a) => [[a]] -> a 
    maxOfsumsOfevery5s l = maximum( sumsOfevery5s l) 
    
    indexOfMaxList :: (Ord a, Num a) => [a]-> Int
    indexOfMaxList l = length(takeWhile (\x -> x/=(maxOfsumsOfevery5s (every5 l))) (sumsOfevery5s (every5 l)))
    --length(takeWhile (\x -> x/=maximum(map sum (every5 l))) (map sum (every5 l))) -> visszaadja azt h hanyadik ilyen 5-os lista utan kovetkezik a jo lista
    
    --take 5 ( drop length l )

    maxSumOf5 :: (Ord a, Num a) =>[a] -> [a]
    maxSumOf5 [] = []
    maxSumOf5 l@(x:xs) 
        | length(l)<5 = l
        | otherwise = take 5 (drop (indexOfMaxList  l) l)

    --multiHealhez

    multiHeal' :: Health -> Army -> Army
    multiHeal' h [] = []
    multiHeal' h l@(x:xs) 
        | h<integerLength(filter isAlive l) = alterUnitHealth --ha a h< integerLength(filter isAlive l) akkor vissza kene adnia a healelt listat
        | otherwise = multiHeal (h-integerLength(filter isAlive l)) ((alterUnitHealth (x) (\x -> x+1) ):(multiHeal (h-1) xs))

    integerLength :: [a] -> Integer
    integerLength [] = 0
    integerLength (x:xs) = 1+ integerLength xs

    isAlive :: Unit -> Bool
    isAlive (M (Alive (Master name health spell))) = True
    isAlive (M (Dead)) = False
    isAlive (E (Dead)) = False
    isAlive (E (Alive (Golem health))) = True
    isAlive (E (Alive (HaskellElemental health))) = True 


       {-
    (M (Alive (Master name health spell)))
    (M (Dead))
    (E (Dead))
    (E (Alive (Golem health)))
    (E (Alive (HaskellElemental health)))
    -}
