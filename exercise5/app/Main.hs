module Main where
    
import ReversePolishCalculator
import Data.List.Split
import Control.Monad
import Control.Monad.State
import qualified Data.Map.Strict as Map

main :: IO ()
main = 
    do 
        evalStateT (forever runOne) $ Map.fromList [("res", 5.0)]
        return ()

runOne :: StateT IdentMap IO ()
runOne = 
    do
        lift $ putStrLn ">"
        exp <- lift getLine
        res <- calcOne exp
        lift $ print res

calcOne :: Monad m => String -> StateT IdentMap m (Either String Float)
calcOne exp = 
    do
        mp <- get
        let res = calculate mp $ splitOn " " exp
        let nmp = case res of 
                Right f -> Map.insert "res" f mp
                Left err -> mp
        put nmp
        return res
