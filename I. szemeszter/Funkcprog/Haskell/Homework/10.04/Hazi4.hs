module Hazi4 where
    import Data.List hiding(find)
    type Room = String
    type Air = Int
    type Fire = Integer
    type MagicLevel = Int
    --1. feladat

    find :: [Room] -> [Room]
    find (x) = [n | n <-(x), n=="2.620"]

    --2. feladat

    add :: (Integral magic1, Integral magic2, Num magic3) => magic1 -> magic2 -> magic3
    add magic1 magic2 = fromIntegral magic1 + fromIntegral magic2 

    --3. feladat

    prime_magic :: MagicLevel -> MagicLevel -> [MagicLevel]
    prime_magic x y = [a | a <- [x..y], [ n | n <- [1..a `div`2], mod a n == 0 ]==[1]]

    --4. feladat

    compress :: Eq magic => [magic] -> [(magic, MagicLevel)]
    compress a =[(head cs, length cs) | cs <- group (a)]

    --5. feladat
    decompress :: Eq magic => [(magic, MagicLevel)] -> [magic]
    decompress a = concat [replicate ml m | (m,ml) <-(a)]

    --LISTAGENERATOROK
-- {n^2 | n eleme N , n paros} -> [n^2| n <-[1..], even n] 

--Halmazkifejezesek, konverziok es kerekitesek, lambda.inf.elte.hu

-- []: üres lista
-- (x:[]): egyy elemu lista
-- 1: (2: (3:[]))
-- (x:xs) 1-nél tobb elemu lista
-- ((True, a):x2:x3:xs)
-- (x1:x2:(True, a):xs)