module Hazi8 where
    type Spell magic = (magic -> (Bool, magic))
    type Stabilizer magic = (magic -> magic)
    type Crate item = [[item]]
    type Checker item = (item -> Bool)
    type Amount = Int
    type Cool = (Amount -> Bool)

    prepare :: [(a -> (Bool, a))] -> a -> a
    prepare [] a = a
    prepare (f:fs) a
        | p = prepare fs result 
        | True = prepare fs a
            where
                (p, result) = f a
            
    stabilize :: Eq a => (a -> a) -> a -> a
    stabilize f x
        | x == (f x) = x 
        | True = stabilize f (f x)

    {-
    brew :: (Integral a, Num b) => (b -> Bool) -> (b -> b) -> [[a]] -> b
    brew p f [] = 0
    brew p f l = stabilizep p g total
        where 
            total = sum . map fromIntegral . concat $ l

            g a 
                | p a = a
                | otherwise = f a

            stabilizep :: (a -> Bool) -> (a -> a) -> a -> a
            stabilizep p f x
                | p x = x 
                | otherwise = stabilizep p f (f x)
    -}

    brew :: (Integral a, Num b) => (b -> Bool) -> (b -> b) -> [[a]] -> b
    brew p f [] = 0
    brew p f l = brew' p f 0 l
        where
            brew' p f l' [] = l'
            brew' p f l' (x:xs)
                | p nextSum = brew' p f nextSum xs
                | otherwise = brew' p f (f l') (x:xs)
                    where 
                        nextSum
                            | null x = l'
                            | otherwise = l' + sum (map fromIntegral x)

    --brew (> 30) (+ 1) [[], [12]] == 43
    --brew (> 500) (+ 1) [replicate 300 1, replicate 300 1] == 801

    {-
    cooldown :: Eq a => [a] -> (Int -> Bool) -> [a]
    cooldown [] _ = []
    cooldown [x] p
        | p 1 = []
        | True = [x]
    cooldown l@(x:xs) p
        | p length(l) = cooldown xs p 
        | True = takeWhile (==x) l : cooldown dropWhile (==x) l p
    -}

    cooldown :: Eq a => [a] -> (Int -> Bool) -> [a]
    cooldown [] _ = []
    cooldown l@(x:xs) p
        | (p (length(takeWhile (==x) l)) ) && (length(takeWhile (==x) l))>1 = cooldown ([x]++(dropWhile (==x) l)) p
        | True = (takeWhile (==x) l) ++ (cooldown (dropWhile (==x) l) p)