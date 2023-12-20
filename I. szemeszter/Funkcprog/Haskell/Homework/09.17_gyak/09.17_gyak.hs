module Gyak where

    int1 :: Int
    int1 = 4

    int2 :: Int
    int2 = 20

    float2 :: Float
    float2 = 3.17

    double2 :: Double 
    double2 = 3.1177

    boool1 :: Bool
    boool1 = True

    char1 :: Char
    char1 = 'A'

    string1 :: String
    string1 = "Szalami"

    inc :: Int -> Int
    inc x = x + 1

    triple :: Int -> Int
    triple x = x*3

 {- ez egy
 multi line
 comment -}

    --tizenharom
    thirteen1 :: Int
    thirteen1 = inc(triple(inc(inc(inc(inc(0))))))

    --osztasi maradek
    cmpRem5Rem7 :: Int -> Bool
    cmpRem5Rem7 x = (mod x 5) > (mod x 7)

    --tipusszignatura
    foo :: Int -> Bool -> Bool
    foo x y = (x < 10) || False

    bar :: Bool -> Int -> Bool
    bar x y = foo y x




