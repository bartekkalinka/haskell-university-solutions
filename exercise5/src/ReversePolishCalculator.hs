module ReversePolishCalculator
    ( 
        IdentMap,
        calculate
    ) where

import Text.Read
import qualified Data.Map.Strict as Map

type IdentMap = Map.Map String Float

calculate :: IdentMap -> [String] -> Either String Float
calculate mp xs = calc xs []
  where
    calc [] (x:[]) = Right x
    calc [] _ = Left "too many numbers"
    calc (o:os) acc | isNumber o = calc os ((read o):acc)
    calc (o:os) acc | isIdent mp o = calc os ((mp Map.! o):acc)
    calc (o:os) (y:x:xs) | isOperator o = calc os ((useOperator o x y):xs)
    calc (o:os) _ | isOperator o = Left "too many operators"
    calc (o:os) _ = Left $ "unknown token: " ++ o

isNumber :: String -> Bool
isNumber str = 
  case readMaybe str :: Maybe Int of
    Just n -> True
    Nothing -> False

isOperator :: String -> Bool
isOperator str =
    str == "+" || str == "-" || str == "*" || str == "/"

isIdent :: IdentMap -> String -> Bool
isIdent mp str = Map.member str mp

useOperator :: String -> Float -> Float -> Float
useOperator "+" a b = a + b
useOperator "-" a b = a - b
useOperator "*" a b = a * b
useOperator "/" a b = a / b

