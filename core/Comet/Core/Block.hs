module Comet.Core.Block where

import Data.Text
import Data.Word

data Block = Block
  { blockHeader :: Header
  , blockData :: Data
  , blockEvidence :: [Evidence]
  , blockLastCommit :: Commit
  }

data Header = Header
  { headerVersion :: Version
  , headerChainId :: Text -- Must be less than 50 bytes, potentiall opportunity for refinement types
  , headerHeight :: Word64

