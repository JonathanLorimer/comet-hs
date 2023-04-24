module Comet.Core.BlockParts where

import Comet.Core.Hash
import Comet.Core.Proof
import Data.ByteString
import Data.Word

data PartSetHeader = PartSetHeader
  { partSetHeaderTotal :: Word32
  , partSetHeaderHash :: Hash32
  }

data Part = Part
  { partIndex :: Word32
  , partBytes :: ByteString
  , partProof :: Proof
  }
