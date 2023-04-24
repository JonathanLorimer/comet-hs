module Comet.Core.Vote where

import Comet.Core.Address
import Comet.Core.BlockId
import Comet.Core.SignedMessage
import Data.ByteString (ByteString)
import Data.ByteString qualified as BS
import Data.Text
import Data.Word
import Google.Protobuf.Timestamp

newtype ValidatorSignature = ValidatorSignature {unSignature :: ByteString}

mkSignature :: ByteString -> Maybe ValidatorSignature
mkSignature bs =
  let l = BS.length bs
   in if l > 0 && l < 64 then Just $ ValidatorSignature bs else Nothing

data Vote = Vote
  { voteType :: SignedMessage
  , voteHeight :: Word64
  , voteRound :: Word32
  , voteBlockId :: BlockId
  , voteTimestamp :: Timestamp
  , voteValidatorAddress :: ValidatorAddress
  , voteValidatorIndex :: Word32
  , voteSignature :: ValidatorSignature
  }

data CanonicalVote = CanonicalVote
  { canonicalVoteType :: SignedMessage
  , canonicalVoteHeight :: Word64
  , canonicalVoteRound :: Word32
  , canonicalVoteROund :: BlockId
  , canonicalVoteTimestamp :: Timestamp
  , canonicalChainId :: Text
  }
