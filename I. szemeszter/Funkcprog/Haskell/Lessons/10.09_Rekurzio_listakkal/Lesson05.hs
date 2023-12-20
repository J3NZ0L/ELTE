module Lesson05 where
    import Prelude hiding(head,last,tail,init, length, sum, elem, zip)
    
    head ::[a] -> a
    head (x:_) = x -- parcialis fgv

    tail :: [a] -> [a]
    tail (_:xs) = xs

    last :: [a] -> a
    last [a] = a
    last (_:xs) = last xs

    init :: [a] -> [a]
    init (a:[]) = []
    init (x:xs) = x: init xs

        {-kiertekeles:
    init [1,2,3]
    init 1 : 2: 3:[]
    1 : init (2: 3: [])
    1: 2: init [3]
    1: 2: []
    -}

    length :: [a] -> Int
    length []     = 0
    length (x:xs) = 1+ length xs

    sum :: Num a => [a] -> a
    sum [a] = a
    sum (x:xs) = x+ sum xs
    
    minkiv :: Ord a => [a] -> a
    minkiv [x] = x
    minkiv (x:xs) = x `min` minkiv xs

    elem :: Eq a => a -> [a] -> Bool
    elem _ [] = False
    elem e (x:xs) = e == x || elem e xs 

    --elem [1..] -> haskell nem tudja  hogy szig mon no, nem fog terminalni

    zip :: [elso] -> [masodik] -> [(elso,masodik)] --tamogatja az ekezetes betuket a haskell
    --prelude.zip: [1,2,3] ['a','b',...]
    zip (x:xs) (y:ys) =  (x,y) : zip xs ys
    zip _ _ = []
    {-
    zip _ [] = []
    zip [] _ = []
    zip (x:xs) (y:ys) =  (x,y) : zip xs ys
    -}

    


