module Main where

import GeneralQuicksort
import System.Environment

main :: IO ()
main = do
	args <- getArgs
	let intList = fmap read args in print $ sort (intList :: [Int])
