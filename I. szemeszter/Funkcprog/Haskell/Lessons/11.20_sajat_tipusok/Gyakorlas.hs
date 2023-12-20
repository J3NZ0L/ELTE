module Gyakorlas where
    data CardinalPoint = East | West | North | South
        deriving (Show)        
    -- Bináris számok típusa
    type Binary = [Bit]

    -- Bitek típusa
    data Bit = Zero | One deriving (Eq, Show)
    data BlackOrWhite = Black | White
    data Piece = King | Queen | Rook | Knight | Bishop BlackOrWhite | Paw
    
            