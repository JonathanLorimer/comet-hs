module Comet.Core.ChainId where

import Data.Text

-- TODO: add smart constructor
newtype ChainId = ChainId {unChainId :: Text}
