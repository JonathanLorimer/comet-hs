module Comet.Core.Block where

import Comet.Core.Address
import Comet.Core.Evidence
import Comet.Core.Hash
import Comet.Core.Proof
import Comet.Core.Time
import Data.ByteString
import Data.Int (Int32)
import Data.Word

data Block = Block
  { blockHeader :: Header
  , blockData :: TransactionList
  , blockEvidence :: [Evidence]
  , blockLastCommit :: Commit
  }

newtype TransactionList = TransactionList {unTransactionList :: [ByteString]}
