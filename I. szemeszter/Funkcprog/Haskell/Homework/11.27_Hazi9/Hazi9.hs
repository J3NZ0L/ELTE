module Hazi9 where
    data Table = T String
        deriving (Show, Eq)

    to_table :: String -> Table
    to_table s = T s

    change :: Table -> String -> Table
    change T{} s= T s

    data Dummy = Alive Int | Dead
        deriving (Show, Eq)
    
    hit :: Dummy -> Int -> Dummy
    hit Dead _ = Dead
    hit dummy1 damage 
        | dummy1==Dead = Dead
        | getDummyHealth(dummy1)-damage>0 = Alive ((getDummyHealth dummy1)-damage)
        | otherwise = Dead
            where 
                getDummyHealth :: Dummy -> Int
                getDummyHealth (Alive x) = x
                getDummyHealth _ = 0
    
    multi_hit :: [Dummy] -> Int -> [Dummy]
    multi_hit [] _ = []
    multi_hit (x:xs) damage = [hit x damage] ++ multi_hit xs damage
    
    megahit :: [Dummy] -> Int -> [Dummy]
    megahit [] _ = []
    megahit (x:xs) damage 
        | hit x damage == Dead = [hit x damage] ++ megahit xs (damage-(getDummyHealth x))
        | otherwise = [hit x damage] ++ xs
            where 
                getDummyHealth :: Dummy -> Int
                getDummyHealth (Alive x) = x
                getDummyHealth _ = 0
