module Main where

import ReversePolishCalculator
import Data.List.Split
import Control.Monad

main :: IO ()
main = forever calcOne

calcOne :: IO ()
calcOne = 
  do
    putStrLn ">"
    exp <- getLine
    print $ calculate $ splitOn " " exp