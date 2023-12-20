module Lesson1 where

one :: Int
one = 1

two :: Int
two = one + 1

increase :: Int -> Int
increase x = x + 1

incTwice :: Int -> Int
incTwice x = increase ( increase x)

letter :: Char
letter = 'E'

okay :: Bool
okay = True

isEven :: Int -> Bool
isEven number = mod number 2 ==0--prefix!
--isEven number = number mod 2 ==0