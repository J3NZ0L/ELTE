module Lesson09 where
    --algebrai adatszerkezetek : az elemszáma megszámlálható
    --data kulcsszo kell a definialasahoz
    -- szintakszis:
    data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun -- Mon .. Sun konstans konstruktorok
    --instanceok: tipuszosztalyok peldanyositasa sajat adatszerkezettel
        deriving ( Eq) --megkerjuk a ghcit hogy instancolja az eq-t, ugyanazt csinalja mint kommentben az instancokkal
        
    instance Show Day where -- instance: peldanyt szeretnenk letrehozni a show tipusosztalybol a day tipusra, where lokalis scope megnyitasa
        --meg kell nezni :i-vel ghciben a showt ilyenkor
        show :: Day -> String
        show Mon = "Monday"
        show Tue = "Tuesday"
        show Wed = "Wednesday"
        show Thu = "Thursday"
        show Fri = "Friday"
        show Sat = "Saturday"
        show Sun = "Sunday"
    {-
    instance Eq Day where
        (==) Mon Mon = True -- stb
    -}

    isWeekend :: Day -> Bool
    isWeekend Sun = True
    isWeekend Sat = True
    isWeekend _ = False

    isWeekday :: Day -> Bool
    isWeekday = not . isWeekend 

    type Red = Int
    type Green = Int
    type Blue = Int

    data Color = RGB Red Green Blue | HSL Int Int Int
        deriving(Show, Eq)

    isRGB :: Color -> Bool
    isRGB RGB {} = True
    isRGB _ = False

    getRGBRed :: Color -> Red
    getRGBRed (RGB r _ _) = r