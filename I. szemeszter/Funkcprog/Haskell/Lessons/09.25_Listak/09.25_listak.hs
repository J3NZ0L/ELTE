module Listak1 where

--lancolt listak vannak
--homogen adatszerkezet, barmilyen fajta adatot tarolhat, de egy listaban tobbfajta nem lehet

myFirstList :: Num a => [a]
myFirstList = [1,2,3]

--type String = [Char] tipusszinonima

myFirstString :: String
myFirstString = "Szius"

l1 :: [(Int, Bool)]
l1 = [(1, True), (2, True)]

--Listamuveletek: ###TUDNI!!###

--head [1,2,3] -> 1
--tail [] -elson kivul ossz elem
--last[] utso elem
--init[] utson kivuli
--take x [] listakent visszaadja elso x elemet
--drop x [] listakent visszaadja az elso x elemen kivuli elemeket
--length [] VEGES lista hosszat adja meg, nem szeretjuk hasznalni!
-- [] !! 1 visszaadja masodik elemet, nem szeretjuk hasznalni!
-- reverse [] megforditja a fgv-t
--null [] visszaadja, h ures-e a fgv
-- [ ] ++ [] ket ugyanolyan tipusu listat osszefuz
-- 9 : [] egy elem belefuzese elejere
-- Data.List-bol az intersect, union, \\, sort
-- Enum -From (kezdoelem) -FromThen (kezdo, kov elem) -FromTo (kezdo,utso elem) -FromThenTo (kezdo, kovi, felso korlat)
-- [1..] [1, 2..] [1..3] [1, 3..5]

-- head/tail [] -> hiba

{-
##LISTAGENERATOROK  
{n^2 | n eleme N , n paros} -> [n^2| n <-[1..], even n] 
listagenerator, generator nelkul?:
    f:: Integral a => a -> [a]
    f x = [x | even x]

onlyfAns :: String -> [String]
onlyfAns s = [ "a" | "a" <- words s ] --words(hatarolo karakterenkent feldarabolja a stringet amit parameterkent kap)

initials :: String -> String
initials s = [ x | (x:_) <- words s ]

g :: [(Int, Char) ]
g = [(i,c) | i <- [1..3], c <- ['a'...]] --eloszor az i aztan a c 1a 1b 1c... 2a 2b 2c
-}
dominos :: [(Int, Int)]
dominos = [ (x, y ) | x <- [1..6] , y <- [x..6]]


--Halmazkifejezesek, konverziok es kerekitesek, lambda.inf.elte.hu

-- []: üres lista
-- (x:[]): egyy elemu lista
-- 1: (2: (3:[]))
-- (x:xs) 1-nél tobb elemu lista
-- ((True, a):x2:x3:xs)
-- (x1:x2:(True, a):xs)
