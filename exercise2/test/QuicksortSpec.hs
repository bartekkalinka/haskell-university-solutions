module QuicksortSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Test.Hspec.Core.QuickCheck (modifyMaxSuccess)
import Quicksort

spec :: Spec
spec = do
  describe "sort" $ do
    it "orders a list" $ do
      sort [4, 3, 1, 5, 2] `shouldBe` [1, 2, 3, 4, 5]
  describe "sort" $ do
    modifyMaxSuccess (const 100) $ it "doesn't change length" $ property $
      \l -> length (sort l) == length l
    it "orders the list" $ property $
      \l-> let sorted = sort l 
               zipped = zip ((minBound :: Int) : (init sorted)) sorted
	       checked = filter (\(x,y) -> x > y) zipped
            in null checked
