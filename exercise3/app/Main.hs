module Main where

import Fruits

main :: IO ()
main = print $ checkout [ Apple, Apple, Orange, Apple ]
