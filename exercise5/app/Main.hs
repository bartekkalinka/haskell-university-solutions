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
calcOne exp = state (\mp ->
    case calculate mp $ splitOn " " exp of
        Right f -> (Right f, Map.insert "res" f mp)
        Left err -> (Left err, mp)
    )
    
