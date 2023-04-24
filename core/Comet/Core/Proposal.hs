module Comet.Core.Proposal where
import Comet.Core.SignedMessage
import Data.Word
import Comet.Core.BlockId
import Google.Protobuf.Timestamp
import Comet.Core.Signature

data Proposal = Proposal
  { proposalType :: SignedMessage
  , proposalHeight :: Word64           -- TODO: create a newtype with a non-zero smart constructor
  , proposalRound :: Word32            -- TODO: create a newtype with a non-zero smart constructor
  , proposalProofOfLockRound :: Word64 -- TODO: create a newtype with a non-zero smart constructor
  , proposalBlockId :: BlockId
  , proposalTime :: Timestamp
  , proposalSignature :: Signature
  }
