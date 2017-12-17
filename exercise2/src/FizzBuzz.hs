module FizzBuzz
    ( fizzbuzz
    ) where

fizzbuzz :: Int -> [String]
fizzbuzz len = reverse (fb 1 [])
	where fb n xs | n == len + 1 = xs
		      | n <= len && mod n 3 == 0 = fb (n+1) $ "Fizz" : xs
                      | n <= len && mod n 5 == 0 = fb (n+1) $ "Buzz" : xs
                      | n <= len = fb (n+1) $ (show n) : xs

