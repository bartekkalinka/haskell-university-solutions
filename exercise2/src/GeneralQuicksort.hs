module GeneralQuicksort
    ( sort
    ) where

sort :: (Ord a) => [a] -> [a]
sort [] = []
sort (h:[]) = [h]
sort (h:t) = 
	let (a, b) = partition h [] [] t 
	in (sort a) ++ [h] ++ (sort b)

partition :: (Ord a) => a -> [a] -> [a] -> [a] -> ([a], [a])
partition pivot acc1 acc2 [] = (acc1, acc2)
partition pivot acc1 acc2 (x: xs) = 
	if pivot <= x
		then partition pivot acc1 (x:acc2) xs
		else partition pivot (x:acc1) acc2 xs
