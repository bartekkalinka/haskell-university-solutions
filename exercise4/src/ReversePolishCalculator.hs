module ReversePolishCalculator
    ( calculate
    ) where

import Text.Read

calculate :: [String] -> Either String Float
calculate xs = calc xs []
  where
    calc [] (x:[]) = Right x
    calc [] _ = Left "too many numbers"
    calc (o:os) acc | isNumber o = calc os ((read o):acc)
    calc (o:os) (x:y:xs) | isOperator o = calc os ((useOperator o x y):xs)
    calc (o:os) _ | isOperator o = Left "too many operators"
    calc _ _ = Left "neither number nor operator"

isNumber :: String -> Bool
isNumber str = 
  case readMaybe str :: Maybe Int of
    Just n -> True
    Nothing -> False

isOperator :: String -> Bool
isOperator str =
    str == "+" || str == "-" || str == "*" || str == "/"

useOperator :: String -> Float -> Float -> Float
useOperator "+" a b = a + b
useOperator "-" a b = a - b
useOperator "*" a b = a * b
useOperator "/" a b = a / b

