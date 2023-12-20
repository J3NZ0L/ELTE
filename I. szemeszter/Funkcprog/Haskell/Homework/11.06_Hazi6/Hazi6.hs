module Hazi6 where
    type Air = Int
    type Fire = Integer
    type Shadow = Float
    type Haskell = Double
    type Open = String
    type Key a b = [[(a,[b])]]
    type Type = String
    type Power = Integer
    type Missile = (Type, Power)

    mind_vision :: Ord magic => [magic] -> Bool
    mind_vision [] = True;
    mind_vision (x:[])= True;
    mind_vision (x1:x2:xs) = x1 <= x2 && mind_vision (x2:xs)

    lock :: Key a b -> Open
    lock [(x, xs):[y, ys]]            = "First"
    lock ([_]:[(x, [xs])]:[y, ys]:[]) = "Second"
    lock ([(x, y:_:[])]:[])          = "Third"

    magic_key_1 :: (Num a, Num b) => [[(a,[b])]]
    --magic_key_1 = [(x, xs):[y, ys]] 
    magic_key_1 = [(1, [2]):[(3, [4]), (3, [4])]]
    
    magic_key_2 :: (Num a, Num b) => [[(a,[b])]]
    --magic_key_2 = ([_]:[(x, [xs])]:[y, ys]:[])
    magic_key_2 = ([(1,[2])]:[(2, [3])]:[(2, [3]), (2, [3])]:[])

    magic_key_3 :: (Num a, Num b) => [[(a,[b])]]
    --magic_key_3 = ([(x, y:_:[])]:[])
    magic_key_3 = ([(1, [1,2])]:[])

    mage_armor :: [Missile] -> Type -> Power
    mage_armor [] _ = 0;
    mage_armor [(st, it)] sp
        | st/=sp = it
        | True = 0
    mage_armor ((st,it):xs) sp
        | st/=sp = it + mage_armor xs sp
        | True = 0 + mage_armor xs sp

    {-
    backfire :: [(String, Integer)] -> [(String, Integer)]
    backfire [] = []
    backfire [(st, it)]
        | it>=50 = (st, it):[]
        | True = []
    backfire ((st1, it1):(st2, it2):xs)
    --    | it1>=50 = (st1, it1) : backfire xs
    --    | it2-it1<50 && (st1 /= st2) = backfire xs
    --    | it2-it1<50 && (st1 == st2) = 
    --    | (it1<50) && (st1 == st2) = (st1, it2-it1) : backfire ((st1, it1):xs)
        | it1>=50 = (st1, it1) : backfire((st2, it2):xs)
    --    | it1<50 && st1==st2 && it2-it1>=50 = (st1, it2-it1) : backfire xs
        | it1<50 && st1==st2 && it2-it1>=50 = (st1, it2-it1) : backfire ((st1, it1):xs)
    --    | it1<50 && st1==st2 && it2-it1<50 = backfire((st1, it2-it1):xs) 
        | it1<50 && st1==st2 && it2-it1<50 = backfire((st1, it2-it1):xs) 
    --    | otherwise = (st2, it2) :backfire xs
    --    | otherwise = backfire ((st1, it1): xs)
        | it1<50 && st1/=st2 = backfire((st1, it1):xs) ++ backfire((st2, it2):xs)
    --    | it1<50 && st1/=st2 = backfire((st1, it1):xs)
    -}

    {-
    backfire :: [(String, Integer)] -> [(String, Integer)]
    backfire [] = []
    backfire ((st, it):xs)
        | it >= 50   = (st,it) : backfire xs
        | True = backfire [(ls1, lit1 - it) | (ls1, lit1) <- xs, ls1 == st, lit1 >= it] ++ backfire [(ls1, lit1) | (ls1, lit1) <- xs, ls1/=st]
    -}

    backfire :: [Missile] -> [Missile]
    backfire [] = []
    backfire [(st, it)]
        | it>=50 = (st, it):[]
        | True = []
    backfire ((st1, it1):(st2, it2):xs)
        | it1>=50 = (st1, it1) : backfire((st2, it2):xs)
        | it1<50 = backfire(kivon((st1, it1):(st2, it2):xs))
            where
                kivon :: [(String, Integer)] -> [(String, Integer)]
                kivon [] = []
                kivon [(st, it)]
                    | it>=50 = (st, it):[]
                    | True = []
                kivon ((st1, it1):(st2, it2):xs)
                    |   st1==st2= (st1, it2-it1):kivon((st1,it1):xs)
                    |   otherwise = (st2, it2):kivon((st1,it1):xs)
