module Lesson07_accFunct where
    import Prelude hiding (reverse,(++),map)
    --Van kulon parametere, amiben a reszeredmeny(eket) "gyujtogetjuk" es utana visszaadjuk
    -- csak veges listanal mukodik!!
    reverse :: [a] -> [a]  --"koltseges" muveleteket tartalmaz
    reverse [] =[]
    reverse (x:xs) = reverse xs ++ [x]

    infixr 5 ++ --"koltseges" muveleteket tartalmaz
    (++) :: [a] -> [a] -> [a]
    []      ++ l = l
    (x:xs)  ++ l = x : xs ++ l

    --koltsegek elkerulesere akkumulalas:

    reverse' :: [a] -> [a] --
    reverse' l = rev [] l
        where
            rev :: [a] -> [a] -> [a] --az elso [a] az akkumulalo parameter
            rev acc []     = acc  --acc lesz a gyujtogeto parameter
            rev acc (x:xs) = rev (x:acc) xs --nem az akkumulalo parameter ertekenek elejere fuzzuk

    {-
     reverse' [1,2,3]
     rev [] [1,2,3]
     rev (1:[]) [2,3]
     rev ([1]) [2,3]
     rev (2:[1]) [3]
     rev ([2,1]) [3]
     rev (3:[2,1]) [] = [3,2,1]
    -}

    partSum :: Num a => [a] -> [a]
    partSum l = go 0 l
        where
            go :: Num a => a -> [a] -> [a] --altalanos segedfgv nev haskellben
            go acc [] = [acc]
            go acc (x:xs) = acc: go (acc + x) xs

    factAcc :: Integral a => a -> a
    factAcc n = go 1 n
        where
            go :: Integral a => a-> a -> a
            go acc 0 = acc
            go acc m = go (m*acc) (m-1)


