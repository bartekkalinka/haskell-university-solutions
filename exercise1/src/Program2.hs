module Program2
    ( greeting
    ) where

greeting :: IO ()
greeting = do
	putStrLn "Welcome, please enter your name:"
	name <- getLine
	putStrLn $ "Hello " ++ name ++ "!"