module FruitsSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Fruits

instance Arbitrary Fruit where
  arbitrary = elements [Apple, Orange]

spec :: Spec
spec = do
  describe "checkoutWithPromo" $ do
    it "returns lower value than checkout" $ property $
      \l -> checkoutWithPromo l <= checkout l
