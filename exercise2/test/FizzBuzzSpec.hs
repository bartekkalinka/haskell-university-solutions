module FizzBuzzSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import FizzBuzz

spec :: Spec
spec = do
  describe "fizzbuzz" $ do
    it "returns a list of given length" $ property $
      \num -> if num >= 0 then length (fizzbuzz num) == num else True

