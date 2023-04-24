module Comet.Core.Commit where
import Comet.Core.BlockId
import Data.Word
import Comet.Core.Address
import Google.Protobuf.Timestamp
import Comet.Core.Signature

data Commit = Commit
  { commitHeight :: Word64 -- TODO: add height newtype with validation
  , commitRound :: Word32 -- TODO: add round newtype with validation
  , commitBlockId :: BlockId
  , commitSignatures :: [CommitSig]
  }

-- TODO: implement this
-- https://docs.cometbft.com/v0.37/spec/core/data_structures#commitsig
data CommitSig = CommitSig
  { commitSigBlockIdFlag :: BlockIdFlag
  , commitSigValidatorAddress :: ValidatorAddress
  , commitSigTimestamp :: Timestamp
  , commitSignature :: Signature
  }

