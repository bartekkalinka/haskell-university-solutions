module Main where

import Fruits

main :: IO ()
main = print $ checkoutWithPromo [ Apple, Apple, Orange, Apple ]
