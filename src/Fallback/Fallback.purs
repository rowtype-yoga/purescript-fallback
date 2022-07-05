module Fallback.Fallback where

import Prelude

import Control.Monad.Cont (ContT(..), lift, runContT)
import Control.Monad.Error.Class (class MonadError, try)
import Data.Either (either)
import Data.Traversable (class Traversable, sequence)

fallback :: forall m e input output. MonadError e m => Traversable m => m input -> (e -> m output) -> ContT output m input
fallback ma errorHandler = try ma # sequence # either left right
  where
  left = \e -> ContT $ const $ errorHandler e
  right = lift

withFallback :: forall output m. Applicative m => ContT output m output -> m output
withFallback = flip runContT (identity >>> pure)

infixl 1 fallback as |>
