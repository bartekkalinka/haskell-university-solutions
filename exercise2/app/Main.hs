module Main where

import Quicksort
import System.Environment

main :: IO ()
main = do
	args <- getArgs
	let intList = fmap read args in print $ sort intList
