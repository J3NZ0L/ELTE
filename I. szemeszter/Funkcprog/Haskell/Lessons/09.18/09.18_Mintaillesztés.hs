module Lesson2 where

    isEven :: Int -> Bool
    isEven x = mod x 2 ==0
    
    isOdd :: Int -> Bool
    isOdd x = mod x 2/=0

    betterIsOdd :: Int -> Bool
    betterIsOdd x = not (isEven x)

    --Mintaillesztés
        --konstruktor
    not' :: Bool -> Bool 
    not' True = False -- not' False nem illeszkedik a not' True-ra, hanem csak utana a not' False ra, igy visszaadjuk h True
    not' False = True

    --Csak arra illesszunk mintat ha feltetlenul szukseges, specialis eset van!

    (&&&) :: Bool -> Bool -> Bool
    (&&&) True True = True
    (&&&) True False = False
    (&&&) False True = False
    (&&&) False False = False

    (&&&&) :: Bool -> Bool -> Bool
    (&&&&) True True = True
    _ &&&& _ = False

    or' :: Bool -> Bool -> Bool
    or' False False = False
    _ `or'` _ = True

    is4 :: Int -> Bool
    is4 4 = True --eddig!! Parcialis fgv, nincs minden Int-re ertelmezve
    is4 _ = False

    isLetterE :: Char -> Bool
    isLetterE 'E' = True
    isLetterE _ = False

    --Tuple-k

    myFirstTuple :: (Int, Char)
    myFirstTuple = (99, 'c') -- komponensek

    tuple3 :: (Int,Int,Int)
    tuple3 = (1,2,3)


    isEvenTuple :: Int -> (Int,Bool)
    isEvenTuple x = (x,even x)

    alwaysOdd :: (Int, Bool) -> Int
    alwaysOdd (x, True) = x-1
    alwaysOdd (x, _) = x-1
    --alwaysOdd x = fst x

    first :: (Int, Bool) -> Int
    first (x, _) = x -- fst

    --Polimorfizmus
    --parametrikus polimorfizmus, alt nincs tipusmegkotes
    triplicate :: a->  (a, a, a)
    triplicate a = (a, a, a)

    betterTriplicate :: a -> (a, a, a)
    betterTriplicate a = (a, a, a)

    --Num a => --tipusmegkotes: 
    -- Num: tipusosztaly
    -- :t tipus
    -- :i informacio valamirol :info

    -- ad-hoc polimorfizmus, alt ennel van tipusmegszoritas
    triplecalc :: Num a => a -> (a, a, a) 
    triplecalc x = (x, 2*x, 3*x)   -- ez igy nem mukodik megkotes nelkul, mert a  * csak Num-ra van ertelmezve

    --prefix operatorok
    --(+) 3 2

    --muveleti precedencia, kotesi erosseg es irany
    (|||) :: Bool -> Bool -> Bool
    False ||| _ = False -- ||| x = x
    True ||| x = True