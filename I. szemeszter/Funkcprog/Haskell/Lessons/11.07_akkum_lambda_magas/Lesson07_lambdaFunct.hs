module Lesson07_lambdaFunct where
    --nevtelen fgvk
    --paricalisan applikalt fuggveny: A fuggvenynek adtunk at parametert, de nem az osszeset!!
    --totalisan applikalt fuggveny: A fuggvenynek atadtuk az osszes parametert!!
    inc :: Num a => a -> a 
    inc a = 1+a

    inc' :: Num a => a -> a
    inc' = (1 +) -- Operátor szelet!! parcialis applikalas

    --osszeadas parcialis fgv, varhat meg parametereket, pl ertelmes a (+ 1) (1 +) (+) 1, de nem ugyanazok, hiszen mas parameter kotott (elsonel masodik, masodiknal elso)

    inc'' :: Num a => a -> a
    inc'' = (\x -> (1 +) x) --ez egy lambda fuggveny!! zarojel itt elhagyhato

    --(\x y z w -> x + y + z + w) 1 2 3 4
