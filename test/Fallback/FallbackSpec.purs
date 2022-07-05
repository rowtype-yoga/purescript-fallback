module Test.Fallback.FallbackSpec where

import Prelude

import Data.Int as Int
import Data.Maybe (Maybe(..))
import Fallback.Fallback (withFallback, (|>))
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)

spec ∷ Spec Unit
spec = describe "Fallback" do
  it "fallback (1)" do
    let
      test = withFallback do
        i :: String <- Nothing |> const (Just 0)
        result <- Int.fromString i |> const (Just 1)
        pure result
    test `shouldEqual` (Just 0)
  it "fallback (2)" do
    let
      test = withFallback do
        i :: String <- Just "abc" |> const (Just 0)
        result <- Int.fromString i |> const (Just 1)
        pure result
    test `shouldEqual` (Just 1)
  it "fallback (3)" do
    let
      test = withFallback do
        i :: String <- Just "10" |> const (Just 0)
        result <- Int.fromString i |> const (Just 1)
        pure result
    test `shouldEqual` (Just 10)
