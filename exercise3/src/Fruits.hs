module Fruits
    ( Fruit(..), checkout
    ) where

data Fruit = Apple | Orange

checkout :: [Fruit] -> Int
checkout fruits = foldl (+) 0 (fmap price fruits)

price :: Fruit -> Int
price Apple = 60
price Orange = 25
