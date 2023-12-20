module Eloadas1 where
import System.Win32 (COORD(yPos))

inc :: Num a => a -> a
inc x = x+1

add :: Num a => a -> a -> a
add x y = x+y

lessT :: Ord a => a -> a -> Bool
lessT n m = n < m

eveN :: Integral a => a -> Bool
eveN n = mod n 2 == 0

odD n = not (eveN n)

