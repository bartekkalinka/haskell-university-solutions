module Main where
    
import ReversePolishCalculator
import Data.List.Split
import Control.Monad
import Control.Monad.State
import qualified Data.Map.Strict as Map

main :: IO ()
main = 
    do 
        let stateList = fmap runOne [1..]
        let listState = sequence stateList
        evalStateT listState $ Map.empty
        return ()

runOne :: Int -> StateT IdentMap IO ()
runOne counter = 
    do
        lift $ putStrLn ">"
        exp <- lift getLine
        res <- calcOne counter exp
        lift $ print res

calcOne :: Monad m => Int -> String -> StateT IdentMap m (Either String Float)
calcOne counter exp = 
    do
        mp <- get
        let res = calculate mp $ splitOn " " exp
        let nmp = case res of 
                Right f -> 
                    let ident = "res" ++ (show counter)
                     in Map.insert ident f mp
                Left err -> mp
        put nmp
        return res
