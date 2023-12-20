module Hazi2 where

--I. Chapter
inc :: Int -> Int 
inc x = x+1

-- gyogyitas
lesser_heal :: Int -> Int
lesser_heal x = inc(inc(inc(x)))

--megfigyeles
lookout :: Int -> Int -> Bool
lookout x y = x> (div y 10)

--faradtsag
volume :: Int -> Int -> Int
volume nrg trn = nrg+trn*(mod nrg 12)

--II. Chapter

--Types
type CurrentDistrict = Int
type NextDistrict = Int
type HealthDamage = Int
type ArmorDamage = Int
type Health = Int
type Armor = Int
type Enhance = Int

-- tajekozodas
move :: (CurrentDistrict , NextDistrict) -> NextDistrict
move (x, y) = y

--tamadas
arcane_missiles :: (HealthDamage , ArmorDamage) -> (Health , Armor) -> (Health , Armor)
arcane_missiles (hd, ad) (h, a) = (h-hd, a-ad)

--erosites
arcane_missiles_mark_1 :: Enhance -> (HealthDamage , ArmorDamage) -> (Health , Armor) -> (Health , Armor)
arcane_missiles_mark_1 e (hd, ad) (h, a) = (h-e*hd, a-e*ad)

--arcane_blast
arcane_blast :: (HealthDamage , ArmorDamage) -> (HealthDamage , ArmorDamage) -> (Health , Armor) -> (Health , Armor)
arcane_blast (hd1, ad1) (hd2, ad2) (h, a) = (h-hd1*hd2-ad1*ad2, a-hd1*hd2-ad1*ad2)

