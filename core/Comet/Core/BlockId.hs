module Comet.Core.BlockId where

import Comet.Core.BlockParts
import Comet.Core.Hash

-- TODO: Implement this
-- https://docs.cometbft.com/v0.37/spec/core/data_structures#blockid
data BlockId = BlockId
  { blockIdHash :: Hash32
  , blockIdPartSetHeader :: PartSetHeader
  }

data BlockIdFlag = BlockUnknown | BlockAbsent | BlockCommit | BlockNil
