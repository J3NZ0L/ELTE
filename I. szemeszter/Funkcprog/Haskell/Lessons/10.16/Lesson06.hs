module Lesson06 where
    
    --Hány eleműre listára illeszkedik:
    
    --[] -0
    
    -- [x] ==(x:[]) -1
   
    --(x:xs) legalább 1 elemu, eltarolja a fejelem erteket, fel tudjuk hasznalni a fuggveny jobb oldalan
    
    --(xs:x) itt is xs az elso elem es x a tobbi
    
    --(_:_) legalabb 1 elemu, nincs eltarolva a fejelem erteke, nem foglal memoriateruletet neki
    
    -- ([]:[]) -- [[]] ketszintu lista, elso szinten egy elemu, masodikon 0
    
    -- (zs:y:z) -- legalabb ket elemu, zarojelezes: (zs:(y:z))
    
    -- ((zs:y):z) -- legalabb egy elemu listakbol allo lista

    mintwoel :: [[a]] -> Bool
    mintwoel ((x:xs):xz) = True
    
    -- ([x,_]) pontosan ket elemu lista, pontosan egyenlo ezzel [x,_]
    
    -- [(x,_)] egy tuplet tartalmazo lista, aminek a masodik komponense nem szamit
    
    -- ((x,_):xs) legalabb egy tuplet tartalmazo lista
    
    -- (x1:x2:[]) pontosan ket elemu lista, ekvivalens ezzel: [x1:x2]
    
    -- ((,) x y:z) egyenerteku ezzel: ((x,y):z) 
    
    --TUPLE KONSTRUKTORA PREFIX MODON IS HASZNALHATO
    
    -- ([xs:zs:_]) egy egyelemu lista ami tartalmaz egy legalabb ket elemu listat --> [(xs:(zs:_))] --> (xs:(zs:_)):[]
    
    -- : A LISTA KONSTRUKTORA
    
    -- ([_,_:xs]) legalabb ket elemu lista --> [_,_:xs], nem tuple mert zarojel kene hozza, :xs miatt a homogenitast igy tartja
    
    -- [a,(x,y),_x] masodik elem miatt mindenkepp a homogenitast a tuplek fele tartja
    
    -- _x ugyanugy altalanos minta mint pl a, lehet hasznalni fgv jobb oldalan is
    
    -- (c:cs:[(x,xs)]) --> (c:cs:(x,xs):[])
    
    -- (c:cs:[(x,xs)]) --> (c:[cs,(x,xs)]) --> [c,cs,(x,xs)]
    megflistaa :: [(a,b)] -> Bool
    megflistaa (c:cs:[(x,xs)]) = True
    megflistaa _ = False


    -- ([(x,y)]:xs)
    megflista :: [[(a,b)]] -> Bool
    megflista ([(x,y)]:xs) = True
    megflista _ = False

    -- (((x,y):hs):xs)
    megflist :: [[(a,b)]] -> Bool
    megflist (((x,y):hs):xs) = True
    megflist _ = False

    -- [c,cs,((x,xs):ts)]
    megflis :: [[(a,b)]] -> Bool
    megflis [c,cs,((x,xs):ts)] = True
    megflis _ = False

    -- ([d]:[ds]) --> [[d],ds]

--Mokasabb rekurziv fgvk

-- fogalmak: lokalis fgv, globalis fgv
    numberWords :: Integral a => String -> [(a,String)]
    numberWords str = zip [1..] (words str)

    numberWords' :: Integral a => String -> [(a,String)]
    numberWords' str = zip (fromN 1) (words str) --ennek a sornak a vegen is lehet a where
        where  -- ezzel a kulcsszoval uj scopeot fogunk letrehozni, ami a numberword' fgv-hez fog tartozni, kulon ahhoz a sorhoz!! mas soraban nem fogjuk tudni felhasznalni
            fromN :: Num a => a -> [a] -- nem jo hogy a felhasznalo hozzafer a terminalbol!
            fromN x = x: fromN (x+1) -- tipusszignatura nelkul is lehet megadni lokalis scopeban

            f :: String
            f = 'a' : str

    f :: String
    f = "a"

--KIPROBALNI: where-t elozo sorba rakni, mennyivel kell beljebb kezdeni fromN-t

    numberWords'' :: Integral a=> String -> [(a, String)]
    numberWords'' str = 
        let -- kinyitjuk ezzel a lokalis scopeot, in-ig tart, igazabol ugyanaz mint a where
            fromN :: Num a => a -> [a]
            fromN x = x: fromN (x+1)
        in -- ezutan adjuk meg a kifejezest
            zip (fromN 1) (words str)

    safeFact :: Integral a=> a -> a 
    safeFact n 
        |   n<0 = (-1)
        |   n==0 = 1
        |   otherwise = n *safeFact(n-1)

    splitAt' :: Integral a => a-> [b] -> ([b],[b])
    splitAt' _[] = ([],[])
    splitAt' n xs
        | n<=0 = ([],xs)
    splitAt' n (x:xs) = (x : ys, zs)
        where
            (ys, zs) = splitAt' (n-1) xs

    -- splitAt' 2 [1,2,3]   
    -- (1:ys, zs)
    --      (ys, zs) = splitAt' 1 [2,3]
    --      (1: 2: ys, zs)
    --          (ys, zs) = splitAt' 0 [3]
    --          (ys, zs) = (1: 2: [],  [3])    
{-
splitAt' _ [] = []
splitAt' i (x:xs)
    | i>0 (x:[],xs)
    | i<=0 (x,xs:[])
-}

--Töröljünk egy elemet az osszes lehetseges modon
-- deletions [1,2,3] == [[2,3],[1,3],[1,2]]
-- deletions "alma" == ["lma","ama","ala","alm"]
    deletions :: [a] -> [[a]]
    deletions [] =[]
    deletions (x:xs) = xs : [x:ys | ys <- deletions xs]

    {-
    deletions "ab"
    deletions ['a':'b'] = 'b' : ["a": ys | ys <- deletions "b"]
        deletions ["b"] = [] : ["b":[] | [] <- deletions []]
    -}

    numberWords''' :: Integral a => String -> [(a,String)]
    numberWords''' str = zip (fromN 1) (words str) where  -- ezzel a kulcsszoval uj scopeot fogunk letrehozni, ami a numberword' fgv-hez fog tartozni, kulon ahhoz a sorhoz!! mas soraban nem fogjuk tudni felhasznalni
        --fromN :: Num a => a -> [a] -- nem jo hogy a felhasznalo hozzafer a terminalbol!
        fromN x = x: fromN (x+1)