module Main where

import GeneralQuicksort
import FizzBuzz
import System.Environment

main :: IO ()
main = do
	args <- getArgs
	runFizzBuzz $ head args

runFizzBuzz :: String -> IO ()
runFizzBuzz num = print $ fizzbuzz $ read num

runQuicksort :: [String] -> IO ()
runQuicksort args = let intList = fmap read args in print $ sort (intList :: [Int])
