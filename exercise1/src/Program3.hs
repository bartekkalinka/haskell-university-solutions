module Program3
    ( greetingLoop
    ) where

import Program2    	
import Control.Monad

greetingLoop :: IO ()
greetingLoop = forever greeting