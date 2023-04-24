module Comet.Core.Header where

import Comet.Core.Address
import Comet.Core.BlockId
import Comet.Core.ChainId
import Comet.Core.Commit
import Comet.Core.Hash
import Comet.Core.Time
import Comet.Core.Version
import Data.ByteString
import Data.Word

data Header = Header
  { headerVersion :: Version
  , headerChainId :: ChainId
  , headerHeight :: Word64
  , headerTime :: BFTTime
  , headerLastBlockId :: BlockId
  , headerLastCommitHash :: Hash32
  , headerDataHash :: Hash32
  , headerValidatorHash :: Hash32
  , headerNextValidatorHash :: Hash32
  , headerConsensusHash :: Hash32
  , headerAppHash :: ByteString
  , headerLastResultHash :: Maybe Hash32
  , headerEvidenceHash :: Hash32
  , headerProposerAddress :: ValidatorAddress
  }

data SignedHeader = SignedHeader
  { signedHeaderHeader :: SignedHeader
  , signedHeaderCommit :: Commit
  }
