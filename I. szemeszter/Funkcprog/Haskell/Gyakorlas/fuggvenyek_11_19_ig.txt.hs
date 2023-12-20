module fuggvenyek_11_19_ig where
    {-
    count :: (a -> Bool) ->[a] -> Int
    count _ [] = 0
    count f (x:xs)
        | f x  = 1 + count f xs
        | True = count f xs
    -}
    
    takeWhile :: (a -> Bool) -> [a] -> [a]
    takeWhile p [] = []
    takeWhile p (x:xs)
        | p x = x : takeWhile p xs
        | True = []

    dropWhile :: (a -> Bool) -> [a] -> [a]
    dropWhile _ [] = []
    dropWhile p l@(x:xs) 
        | p x = dropWhile p xs
        | True = l

    span :: (a -> Bool) -> [a]{-véges-} -> ([a],[a])
    span _ [] = ([],[])
    span p l@(x:xs)
        | p x = (x:as, bs)
        | otherwise = ([], l)
            where
                (as, bs) = span p xs
            
    iterate :: (a -> a) -> a -> [a]
    iterate  f x = x : iterate f (f x)

    infixr 0 $
    ($) :: (a -> b) -> a -> b
    f $ a = f a

    infixr 9 .
    (.) :: (b -> c) -> (a -> b) -> a -> c
    --(.) f g a = f $ g a
    f . g = \ x -> f $ g x

    curry                   :: ((a, b) -> c) -> a -> b -> c
    curry f x y             =  f (x, y)

    elem' :: Eq a => a -> [a] {-veges-} -> Bool
    elem' e = any (==e)

    filters :: Eq a => [a] -> [a] -> [a]
    filters fs l = filter (`notElem` fs) l

    zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
    zipWith _ [] _ = []
    zipWith _ _ [] = []
    zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys

    zip :: [a] ->[b] -> [(a,b)]
    zip = zipWith (,)
       
    import Prelude hiding(sum, foldr, foldl,prod,length,(++))
    sum' :: Num a => [a] -> a 
    sum' (x:xs) = x+ sum' xs

    prod' :: Num a => [a] -> a
    prod' [] = 0
    prod' (x:xs) = x * prod' xs

    foldr :: (a -> b -> b) -> b -> [a] -> b
    foldr f acc [] = acc
    foldr f acc (x:xs) = x `f` (foldr f acc xs )

    foldl :: (b -> a -> b) -> b -> [a] -> b
    foldl _ acc [] = acc
    foldl f acc (x:xs) = foldl f (f acc x) xs

    length :: [a] -> Int
    length l = foldr (\_ acc -> 1 + acc) 0 l

    (++) :: [a] -> [a] -> [a]
    (++) l1 l2 = foldr (:) l2 l1
{-
    partSum :: Num a => [a] -> [a]
    partSum l = go 0 l
        where
            go :: Num a => a -> [a] -> [a] --altalanos segedfgv nev haskellben
            go acc [] = [acc]
            go acc (x:xs) = acc: go (acc + x) xs
-}

    reverse :: [a] -> [a]  --"koltseges" muveleteket tartalmaz
    reverse [] =[]
    reverse (x:xs) = reverse xs ++ [x]

    infixr 5 ++ --"koltseges" muveleteket tartalmaz
    (++) :: [a] -> [a] -> [a]
    []      ++ l = l
    (x:xs)  ++ l = x : xs ++ l

    --koltsegek elkerulesere akkumulalas:

    reverse :: [a] -> [a] --
    reverse l = rev [] l
        where
            rev :: [a] -> [a] -> [a] --az elso [a] az akkumulalo parameter
            rev acc []     = acc  --acc lesz a gyujtogeto parameter
            rev acc (x:xs) = rev (x:acc) xs --nem az akkumulalo parameter ertekenek elejere fuzzuk
    {-
    inc :: Num a => a -> a 
    inc a = 1+a
    -}

    map :: (a -> b) -> [a] -> [b]
    map _ [] = []
    map f (x:xs) = f x : map f xs 

    all :: (a -> Bool) -> [a] -> Bool
    all p l = and (map p l)  --p mint predikatum, nem szamit am --and beepitett fgv listaelemeket esel ossze

    any :: (a -> Bool) -> [a] -> Bool
    any p l = or (map p l)

    elem :: Eq a => a -> [a] -> Bool
    elem x = any (==x)

    filter :: (a -> Bool) -> [a] -> [a]
    filter _ [] = []
    filter p (x:xs) 
        | p x = x : filter p xs
        | True = filter p xs

    length :: [a] -> Int
    length l = foldr (\_ acc -> 1 + acc) 0 l


    (++) :: [a] -> [a] -> [a]
    (++) l1 l2 = foldr (:) l2 l1
    {-
    numberWords :: Integral a => String -> [(a,String)]
    numberWords str = zip [1..] (words str)

    deletions :: [a] -> [[a]]
    deletions [] =[]
    deletions (x:xs) = xs : [x:ys | ys <- deletions xs]
    -}
    min :: Ord a => a-> a -> a
    min n m 
        | n < m = n     
        | True  = m

    take :: Int -> [a] -> [a]
    take _ [] = []
    take n (x:xs)
        | n <=0 =[]
        | otherwise = x : take (n-1) xs

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

    fact :: Integer -> Integer
fact 0 = 1
fact x = x* fact(x-1)

-- fact 3

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib(n-1)+fib(n-2)

pow :: Integral a => a -> a-> a
pow n 0 = 1 
pow n k = n* pow n (k-1)

countEvens :: [Integer] -> Integer
countEvens [] = 0
countEvens (x:xs) = even x 

inc :: Num a => a -> a
inc x = x+1

add :: Num a => a -> a -> a
add x y = x+y

lessT :: Ord a => a -> a -> Bool
lessT n m = n < m

eveN :: Integral a => a -> Bool
eveN n = mod n 2 == 0

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