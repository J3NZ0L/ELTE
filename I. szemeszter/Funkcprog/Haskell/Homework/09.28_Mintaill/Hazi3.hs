module Hazi3 where

--1. Oszthatosag

divides :: Integral n=> n -> n -> Bool
divides 0 0 = True
divides 0 a = False
divides x y = mod y x== 0

--2/a. Singleton

isSingleton :: [a] -> Bool
isSingleton (x:[]) = True
isSingleton (_:_) = False
isSingleton (_) = False

--2/b. Pont. ketto vagy min. negy

exactly2OrAtLeast4 :: [a] -> Bool
exactly2OrAtLeast4 (x1:x2:x3:[]) = False
exactly2OrAtLeast4 (x1:x2:[]) = True
exactly2OrAtLeast4 (x1:x2:x3:x4) = True
exactly2OrAtLeast4 (_) = False

--3. Elso ket elem

firstTwoElements :: [a] -> [a]
firstTwoElements [] = []
firstTwoElements (x1:[]) = []
firstTwoElements (x1:x2:_) = (x1:x2:[])

--4. Harmadik nelkul

withoutThird :: [a] -> [a]
withoutThird (x1:x2:x3:x) = (x1:x2:x)
withoutThird (x) = (x)
--withoutThird (x1:[]) = [x1:[]]
--withoutThird (x1:x2:_) = (x1:x2:[])

--5. Logikai implikacio

(⊃) :: Bool -> Bool -> Bool
(⊃) False _ = True
(⊃) True a = (a)

--Bonusz: xor fgv

--xor :: Bool -> Bool -> Bool
--xor x y = mod (x+y) 2 ==0