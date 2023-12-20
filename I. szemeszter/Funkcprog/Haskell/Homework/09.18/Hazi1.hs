module Hazi1 where

--1. Deklaracio
    intExpr1 :: Int
    intExpr1 = 1

    intExpr2 :: Int
    intExpr2 = 2
    
    intExpr3 :: Int  
    intExpr3 = 3

    charExpr1 :: Char
    charExpr1 = 'A'

    charExpr2 :: Char
    charExpr2 = 'B'

    charExpr3 :: Char
    charExpr3 = 'C'

    boolExpr1 :: Bool
    boolExpr1 = True
    
    boolExpr2 :: Bool
    boolExpr2 = False
    
    boolExpr3 :: Bool
    boolExpr3 = 3<4

    stringExpr1 :: String
    stringExpr1 = "szalami"

--2. Fuggvenyek: inc, triple

    inc :: Int -> Int
    inc x = x + 1

    triple :: Int -> Int
    triple x = x * 3

--3. Tizenharom

    thirteen1 :: Int
    thirteen1 = inc(triple(inc(inc(inc(inc(0))))))

    thirteen2 :: Int
    thirteen2 = inc(inc(inc(inc(triple(triple(inc(0)))))))

    thirteen3 :: Int
    thirteen3 = inc(triple(inc(triple(inc(0)))))

--4. Osztasi maradek

    cmpRem5Rem7 ::Int -> Bool
    cmpRem5Rem7 x =((mod x 5) > (mod x 7))

--5. Tipusszignatura
 
    foo :: Int -> Bool -> Bool
    foo x y = (((div (x+1) 2)==0) && y)

    bar :: Bool -> Int -> Bool
    bar x y =foo y x




