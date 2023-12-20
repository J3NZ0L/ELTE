module Nagybeadando where
    --1. feladat
    showState a = show a
    showMage a = show a
    eqMage a b =  a == b
    showUnit a = show a
    showOneVOne a = show a 

    type Name = String
    type Health = Integer
    type Spell = (Integer -> Integer)
    type Army = [Unit]
    type EnemyArmy = Army
    type Amount = Integer

    data State unit = Alive unit | Dead 

    instance (Show u) => Show (State u) where
        show Dead = "Dead"
        show (Alive unit) = show unit


    data Entity = Golem Health | HaskellElemental Health
        deriving (Show)

    showJustEntityName :: Entity -> String
    showJustEntityName (Golem _) = "Golem"
    showJustEntityName (HaskellElemental _) = "HaskellElemental"

    data Mage = Master Name Health Spell

    --Masterek
    papi = let 
        tunderpor enemyHP
            | enemyHP < 8 = 0
            | even enemyHP = div (enemyHP * 3) 4
            | otherwise = enemyHP - 3
        in Master "Papi" 126 tunderpor
    java = Master "Java" 100 (\x ->  x - (mod x 9))
    traktor = Master "Traktor" 20 (\x -> div (x + 10) ((mod x 4) + 1))
    jani = Master "Jani" 100 (\x -> x - div x 4)
    skver = Master "Skver" 100 (\x -> div (x+4) 2)
    potionMaster = 
        let plx x
                | x > 85  = x - plx (div x 2)
                | x == 60 = 31
                | x >= 51 = 1 + mod x 30
                | otherwise = x - 7 
        in Master "PotionMaster" 170 plx


    instance Show Mage where
        show (Master name health spell)
            | health < 5 = "Wounded " ++ name
            | otherwise = name

    instance Eq Mage where
        (Master n1 h1 _) == (Master n2 h2 _) = n1 == n2 && h1 == h2

    data Unit = M (State Mage)  | E (State Entity) 

    instance Show Unit where
--        show :: Unit -> String
        show (M s) = tail $ init $ showMage . showState $ s
        show (E s) = show s

    --2. feladat
    
    instance Eq Unit where
        M (s1) == M (s2) = show(showUnit(s2)) == show(showUnit(s1))
        E (s1) == E (s2) = show(showUnit(s2)) == show(showUnit(s1))
        _ == _ = False

    formationFix :: Army -> Army  
    formationFix [] = []
    formationFix l@(x:xs) = go l [] []
        where 
            go :: Army -> Army -> Army -> Army
            go [] alive_acc dead_acc = reverse(alive_acc)++reverse(dead_acc)
            go (x:xs) alive_acc dead_acc
                |  showState x == "Dead" = go xs alive_acc (x:dead_acc)
                | otherwise = go xs (x:alive_acc) dead_acc
                
    --3. feladat

    over :: Army -> Bool
    over [] = True
    over (x:xs)= showState x == "Dead" && over xs
        
    --4. feladat
    
    fight :: EnemyArmy -> Army -> Army
    fight [] l = l
    fight l [] = []
    fight ((M (Alive (Master n h s))):xs) l@(y:ys) = [alterUnitHealth y s] ++ fight xs (alterArmyHealth ys s)
    fight ((E (Alive (Golem h))):xs) l@(y:ys) = [alterUnitHealth y (\x -> x-1)] ++ fight xs ys
    fight ((E (Alive (HaskellElemental h))):xs) l@(y:ys) = [alterUnitHealth y (\x -> x-3)] ++ fight xs ys
    fight ((M (Dead)):xs) (y:ys) =y: fight xs ys 
    fight ((E (Dead)):xs) (y:ys) =y:fight xs ys 

    alterUnitHealth :: Unit -> (Integer -> Integer) -> Unit
    alterUnitHealth (M (Alive (Master name health spell))) damagef
        | damagef health <=0 = M $ Dead
        | otherwise = M $ Alive (Master name (damagef health) spell)
    alterUnitHealth (M (Dead)) _ =  (M (Dead))
    alterUnitHealth (E (Dead)) _ = (E (Dead))
    alterUnitHealth (E (Alive (Golem health))) damagef 
        | damagef health <=0 = E $ Dead
        | otherwise = (E (Alive (Golem (damagef health))))
    alterUnitHealth (E (Alive (HaskellElemental health))) damagef 
        | damagef health <=0 = E $ Dead
        | otherwise = (E (Alive (HaskellElemental (damagef health))))

    alterArmyHealth :: Army -> (Integer -> Integer) -> Army
    alterArmyHealth [] _ = []
    alterArmyHealth (x:xs) f = [alterUnitHealth x f] ++ alterArmyHealth xs f

    --5. feladat
    
    haskellBlast :: Army -> Army
    haskellBlast [] = []
    haskellBlast l@(x:xs) = (take (indexOfMaxList l ) l) ++ (alterArmyHealth (maxSumOf5 l) (\x -> x-5)) ++ (drop ((indexOfMaxList l )+5) l)
        where
            every5 :: Army -> [Army]
            every5 [] = []
            every5 [a] = []
            every5 [a, b] = []
            every5 [a, b, c] = []
            every5 [a, b, c,d] = []
            every5 (a:b:c:d:e:xs) = [a, b, c, d, e] : every5 (b:c:d:e:xs)

            sumsOfevery5s :: [Army] -> [Integer]  
            sumsOfevery5s l = map sumOfPossibleDamage l

            sumOfPossibleDamage :: Army -> Integer
            sumOfPossibleDamage [] = 0
            sumOfPossibleDamage (x:xs) 
                | (healthOfUnit x)<5 = (healthOfUnit x) + sumOfPossibleDamage xs
                | otherwise = 5 + sumOfPossibleDamage xs
                    where
                        healthOfUnit :: Unit -> Integer
                        healthOfUnit (M (Alive (Master name health spell))) = health
                        healthOfUnit (M (Dead)) = 0
                        healthOfUnit (E (Dead)) = 0
                        healthOfUnit (E (Alive (Golem health))) = health
                        healthOfUnit (E (Alive (HaskellElemental health))) = health

            maxOfsumsOfevery5s :: [Army] -> Integer
            maxOfsumsOfevery5s l = maximum( sumsOfevery5s l) 
            
            indexOfMaxList :: Army -> Int
            indexOfMaxList l = length(takeWhile (\x -> x/=(maxOfsumsOfevery5s (every5 l))) (sumsOfevery5s (every5 l)))

            maxSumOf5 :: Army -> Army
            maxSumOf5 [] = []
            maxSumOf5 l@(x:xs) 
                | length(l)<5 = l
                | otherwise = take 5 (drop (indexOfMaxList  l) l)
    

    --6. feladat
    
    multiHeal :: Health -> Army -> Army
    multiHeal h [] = []
    multiHeal 0 l = l
    multiHeal h (M (Dead):xs) = [M (Dead)] ++ multiHeal h xs
    multiHeal h (E (Dead):xs) = [E (Dead)] ++ multiHeal h xs
    multiHeal h l@(x:xs) =healAcc h l []

    healAcc :: Integer -> Army -> Army -> Army
    healAcc n [] accl = multiHeal n accl
    healAcc n (M (Dead):xs) accl = healAcc n xs (accl++[M (Dead)])
    healAcc n (E (Dead):xs) accl = healAcc n xs (accl++[E (Dead)])
    healAcc n l@(x:xs) accl
        | n<=0 = accl++l
        | otherwise = healAcc (n-1) xs (accl++[(alterUnitHealth (x) (\x -> x+1))])
        

    --10. feladat OneVOne
    data OneVOne = Winner String | You Health OneVOne | HaskellMage Health OneVOne
        deriving Eq

    instance Show OneVOne where
        show x = "<"++(showspec x)++">"
            where
                showspec :: OneVOne -> String
                showspec (Winner s) = "|| Winner "++ s ++" ||"
                showspec (You n next) = "You "++show n++"; "++showspec next
                showspec (HaskellMage n next) ="HaskellMage "++show n++"; "++showspec next

    --7. feladat
    battle :: Army -> EnemyArmy -> Maybe Army {- vagy EnemyArmy lesz az eredmény. -}
    battle [] [] = Nothing
    battle [] l = Just l
    battle l [] = Just l
    battle l@(x:xs) el@(y:ys)
        | over l && over el = Nothing
        | over el = Just l
        | over l = Just el
        | otherwise = battle (formationFix (multiHeal 20 (haskellBlast (fight el l)))) ((formationFix (fight l el)))
        
    isAlive :: Unit -> Bool
    isAlive (M (Alive (Master name health spell))) = True
    isAlive (M (Dead)) = False
    isAlive (E (Dead)) = False
    isAlive (E (Alive (Golem health))) = True
    isAlive (E (Alive (HaskellElemental health))) = True 

    --8. feladat
    chain :: Amount -> (Army, EnemyArmy) -> (Army, EnemyArmy)
    chain _ ([],[]) = ([],[])
    chain _ ([],x) = ([],x)
    chain a (l@(x:xs),[]) = ((alterUnitHealth x (\x-> x+a)):xs,[])
    chain 0 (x,y) = (x,y)
    chain a (l@(x:xs),el@(y:ys))
        | a<=0 = (l,el)
        | not(isAlive x) && not(isAlive y) = (x:c1xs,y:c1ys)--mindketto halott
        | not(isAlive x) && (isAlive y) = (x:c2xs,((alterUnitHealth y (\x-> x-a)):c2ys))--egyik halott
        | (isAlive x) && not(isAlive y) = ((alterUnitHealth x (\x-> x+a)):c2xs,y:c2ys)
        | otherwise = ((alterUnitHealth x (\x-> x+a)):c3xs,(alterUnitHealth y (\x-> x-(a-1))):c3ys)--mindketto el
            where
                (c1xs,c1ys) = chain a (xs,ys)
                (c2xs,c2ys) = chain (a-1) (xs,ys)
                (c3xs,c3ys) = chain (a-2) (xs,ys)

       -- |   over l && over el = (l, el)
       -- |   otherwise = chain (a-1) ((multiHeal a l), (multiHeal (-a) el))
    {-
    Ezt a függvényt ugráltatod sorban a két sereg között. A saját egységeidet gyógyítod, míg az ellenfelet sebzed a 
    megadott erőddel, de ennek az értéke minden ugrással csökken 1-gyel, amíg el nem fogy vagy nem tud továbbugrani. De vigyázz, 
    a halottakat csak átugorja.


    chain 5 ([],[]) == ([],[])
    chain 5 ([E (Alive (Golem 5))], [E (Alive (HaskellElemental 5))]) == ([E (Alive (Golem 10))],[E (Alive (HaskellElemental 1))])
    chain 5 ([E (Alive (Golem n)) | n <- [5,5,5,5]], [E (Alive (HaskellElemental n)) | n <- [10,10,10,10]]) == ([E (Alive (Golem 10)),E (Alive (Golem 8)),E (Alive (Golem 6)),E (Alive (Golem 5))],[E (Alive (HaskellElemental 6)),E (Alive (HaskellElemental 8)),E (Alive (HaskellElemental 10)),E (Alive (HaskellElemental 10))])
    chain 5 ([E (Alive (Golem n)) | n <- [5,5]], [E (Alive (HaskellElemental n)) | n <- [10,10,10,10]]) == ([E (Alive (Golem 10)),E (Alive (Golem 8))],[E (Alive (HaskellElemental 6)),E (Alive (HaskellElemental 8)),E (Alive (HaskellElemental 10)),E (Alive (HaskellElemental 10))])
    chain 5 ([E (Alive (Golem n)) | n <- [5,5,5,5]], [E (Alive (HaskellElemental n)) | n <- [10]]) == ([E (Alive (Golem 10)),E (Alive (Golem 8)),E (Alive (Golem 5)),E (Alive (Golem 5))],[E (Alive (HaskellElemental 6))])
    chain 5 ([E Dead, E (Alive (Golem 5)), E Dead], [E (Alive (HaskellElemental n)) | n <- [10,10,10]]) == ([E Dead,E (Alive (Golem 9)),E Dead],[E (Alive (HaskellElemental 5)),E (Alive (HaskellElemental 7)),E (Alive (HaskellElemental 8))])
    chain 5 ([E Dead | _ <- [1..5]], [E (Alive (HaskellElemental n)) | n <- [10,10,10,10,10]]) == ([E Dead,E Dead,E Dead,E Dead,E Dead],[E (Alive (HaskellElemental 5)),E (Alive (HaskellElemental 6)),E (Alive (HaskellElemental 7)),E (Alive (HaskellElemental 8)),E (Alive (HaskellElemental 9))])
    -}
    

    