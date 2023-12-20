module Hazi7 where
    type Crate item = [[item]]
    type Recipe item = (item -> Bool)
    type Measure item = (item -> item)
    type Amount = Int

    type Box item = [item] --sajat tipus

    recipe :: Eq item => Recipe item -> Crate item -> Bool 
    recipe _ [] = True
    recipe f (x:xs) = g f x && recipe f xs
        where
            g :: Eq item => Recipe item -> Box item -> Bool
            g _ [] = True
            g f (x:xs) = f x && g f xs

    measure :: Measure item -> Crate item -> Crate item
    measure _ [] = []
    measure f (x:xs) = [g f x] ++ measure f xs
        where 
            g :: Measure item -> Box item -> Box item
            g _ [] = []
            g f (x:xs) = [f x] ++ g f xs

    {-
    measure_until :: Eq item => Recipe item -> Measure item -> Crate item {-not empty-} -> Amount
    --measure_until _ _ [] = True
    measure_until f g (x:xs) = h f g x + measure_until f g xs
        where
            h :: Eq item => Recipe item -> Measure item -> Box item {-not empty-} -> Amount
            h f g (x:xs)
                | f g x = 1 + h f g xs
                | otherwise = 0
    measure_until _ _ [] = 1
    measure_until f g (x:xs)  --h keszit egy listat g alapjan, es f vegigmegy az elemein, ha igaz mind akkor 
        | h f g x && measure_until 
        where
            h :: Eq item => Recipe item -> Measure item -> Box item {-not empty-} -> Amount
            h f g (x:xs)
                | f g x = 1 + h f g xs
                | otherwise = 0
    -}
    
    {-
    measure_until :: Eq item => Recipe item -> Measure item -> Crate item {-not empty-} -> Amount
    measure_until p f (x:xs)
        | measure_crate p f (x:xs) = 1 + measure_until p f (apply_to_crate f (x:xs))  
        | otherwise = 0
            where
                    measure_crate :: Eq item => Recipe item -> Measure item -> Crate item -> Bool
                    measure_crate _ _ [] = True
                    measure_crate p f (x:xs) = measure_list p f x && measure_crate p f xs

                    measure_list :: Eq item => Recipe item ->  Measure item -> Box item  -> Bool
                    measure_list _ _ [] = True
                    measure_list p f (x:xs) = p (f x) && measure_list p f xs

                    apply_to_crate :: Eq item => Measure item -> Crate item  -> Crate item 
                    apply_to_crate _ [] = []    
                    apply_to_crate f (x:xs) = apply_to_box f x : apply_to_crate f xs

                    apply_to_box :: Eq item => Measure item -> Box item  -> Box item
                    apply_to_box _ [] = []
                    apply_to_box f (x:xs) = f x : apply_to_box f xs
    -}

    measure_until :: Eq item => Recipe item -> Measure item -> Crate item {-not empty-} -> Amount
    measure_until p f (x:xs)
        | measure_crate p (x:xs) = 1 + measure_until p f (apply_to_crate f (x:xs))  
        | otherwise = 0
            where
                    measure_crate :: Eq item => Recipe item -> Crate item -> Bool
                    measure_crate _ [] = True
                    measure_crate p (x:xs) = measure_list p x && measure_crate p xs

                    measure_list :: Eq item => Recipe item -> Box item  -> Bool
                    measure_list _ [] = True
                    measure_list p (x:xs) = p x && measure_list p xs

                    apply_to_crate :: Eq item => Measure item -> Crate item  -> Crate item 
                    apply_to_crate _ [] = []    
                    apply_to_crate f (x:xs) = apply_to_box f x : apply_to_crate f xs

                    apply_to_box :: Eq item => Measure item -> Box item  -> Box item
                    apply_to_box _ [] = []
                    apply_to_box f (x:xs) = f x : apply_to_box f xs
