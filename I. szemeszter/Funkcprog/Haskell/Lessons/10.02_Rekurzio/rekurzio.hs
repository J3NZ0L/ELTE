module Rekurzio where

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