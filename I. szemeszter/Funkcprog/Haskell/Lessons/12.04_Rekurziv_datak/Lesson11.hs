module Lesson11 where
    --ez a tema csak opcionalisan kellhet csak beadandoban
    --Vizsgahoz nem fog kelleni!!

    --Természetes számok definiálása rekurziv datakkal
    data Nat = Zero | Suc Nat --suc konstruktor ami magabol var parametert
        deriving (Show,Eq)
    nulla :: Nat
    nulla = Zero

    one :: Nat
    one = Suc Zero

    two :: Nat
    two = Suc $ Suc $ Zero

    instance Num Nat where
        (+) a Zero = a
        (+) Zero a = a
        x + Suc(y) = Suc(x+y)

        (-) Zero a = Zero
        (-) a Zero = a
        (-) (Suc a)  (Suc b) = Suc (a-b) 
        

        (*) Zero _ = Zero
        (*) (Suc a) b = b + (a*b)

        abs x = x

        signum Zero = Zero
        signum (Suc _) = Suc Zero

        fromInteger 0 = Zero
        fromInteger x = Suc (fromInteger (x-1))

    inc :: Num a => a -> a
    inc = (+1)

    instance Ord Nat where
        Zero <= _ = True
        x <= Zero = False
        (Suc x) <= (Suc y) = x <= y

    data List a = Nil | Cons a (List a)
        --deriving (Show)

    instance Show a => Show (List a) where
        -- <1;2;3>
        show l = '<' : showHelp l ++ ">"
            where
                showHelp Nil = ""
                showHelp (Cons a Nil) = show a
                showHelp (Cons a as) = show a ++ ";" ++ showHelp as

    instance Foldable List where
        foldMap f Nil = mempty
        --foldr _ acc Nil = acc
        --foldr f acc (Cons a as)=a `f` foldr f acc as
                
        




