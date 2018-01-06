module Main where

import ReversePolishCalculator
import Data.List.Split

main :: IO ()
main = 
    let inp = "10 4 3 + 2 * -"
        split = splitOn " " inp
    in print $ calculate split
