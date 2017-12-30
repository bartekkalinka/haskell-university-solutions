module Fruits
    ( Fruit(..), checkout, checkoutWithPromo
    ) where

data Fruit = Apple | Orange deriving (Show)

checkout :: [Fruit] -> Int
checkout fruits = 
  let (a, o) = count fruits (0, 0)
   in (price Apple) * a + (price Orange) * o

checkoutWithPromo :: [Fruit] -> Int
checkoutWithPromo fruits = 
  let (a, o) = count fruits (0, 0)
      aProm = a `div` 2 + a `mod` 2
      oProm = 2 * (o `div` 3) + o `mod` 3
   in (price Apple) * aProm + (price Orange) * oProm

price :: Fruit -> Int
price Apple = 60
price Orange = 25

count :: [Fruit] -> (Int, Int) -> (Int, Int)
count [] acc = acc
count (Apple:fs) (a, o) = count fs (a + 1, o)
count (Orange:fs) (a, o) = count fs (a, o + 1)
