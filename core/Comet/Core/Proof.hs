module Comet.Core.Proof where

import Data.ByteString
import Data.Int

data Proof = Proof
  { proofIndex :: Int64
  , proofTotal :: Int64
  , proofLeafHash :: ByteString
  , proofAunts :: ByteString
  }
