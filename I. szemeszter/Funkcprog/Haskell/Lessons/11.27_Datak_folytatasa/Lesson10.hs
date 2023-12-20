module Lesson10 where
    import Prelude hiding ( Maybe (..), Either (..)) --osszes konstruktorat is elrejti (..)
    
    type Red = Int
    type Green = Int
    type Blue = Int
    type Hue = Int
    type Saturation = Int
    type Lightness = Int

    data Color = RGB Red Green Blue | HSL Hue Saturation Lightness
        deriving ( Show, Eq)

    getRGBRed :: Color -> Int -- !parcialis fgv
    getRGBRed (RGB r _ _) = r

    -- ! Maybe
    data Maybe a = Nothing | Just a  
        --deriving (show)

    instance (Show a) =>  Show (Maybe a) where 
        show :: Show a => Maybe a -> String
        show Nothing = "Nothing"
        show (Just a) = "Just " ++ show a --tipusmegkotes nelkul (Show a) nem lenne instanceja az a-nak

    instance (Eq a) => Eq (Maybe a) where
        Just a == Just b = a == b
        Nothing == Nothing = True
        _ == _ = False

    isJust :: Maybe a -> Bool
    isJust (Just a) = True
    isJust _ = False

    isNothing :: Maybe a -> Bool
    isNothing = not.isJust

    fromJust :: Maybe a ->a
    fromJust (Just a) = a

    safeDiv :: Integral a => a -> a -> Maybe a
    safeDiv _ 0 = Nothing
    safeDiv n m = Just $ div n m

    safeHead :: [a] -> Maybe a
    safeHead [] = Nothing
    safeHead (x:xs) = Just x

    safeGetRGBRed :: Color -> Maybe Int
    safeGetRGBRed (RGB r _ _) = Just r
    safeGetRGBRed _           = Nothing

    -- ! Either tipus (osszeg tipus) algebrai adatszerkezet
    data Either a b = Left a | Right b

    eitherBoolOrBool1 :: Either Bool Bool
    eitherBoolOrBool2 :: Either Bool Bool
    eitherBoolOrBool3 :: Either Bool Bool
    eitherBoolOrBool4 :: Either Bool Bool

    -- Either Bool Int
    eitherBoolOrBool1 = Left False
    eitherBoolOrBool2 = Left True
    eitherBoolOrBool3 = Right False
    eitherBoolOrBool4 = Right True

    {-
    Either Bool Int -- |Bool| + |Int| = 2 + Int szamossaga
    Left True
    Left False
    ...
    Right (-3)
    Right (-2)
    Right (-1)
    Right 0
    Right 1
    Right 2
    ...
    -}

    --Instanceok Eitherre

    instance (Show a,Show b) => Show (Either a b) where
        show (Left a ) = "Left " ++ show a  
        show (Right b) = "Right " ++ show b

    instance (Eq a, Eq b) => Eq (Either a b) where
        (Left a) == (Left b) = a == b
        (Right a) == (Right b) = a == b
        _ == _ = False

        --Left( Just (Left 'a')) == Left (Just ( Left 'a'))

    
