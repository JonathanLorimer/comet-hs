module Comet.Core.Consensus where
import Data.Word

data ConsensusParams = ConsensusParams
  { consensusParamsBlock :: BlockParams
  , consensusParamsEvidence :: EvidenceParams
  , consensusParamsValidator :: ValidatorParams
  , consensusParamsVersion :: BlockParams
  }

data BlockParams = BlockParams
  { blockParamsMaxBytes :: Word64
  , blockParamsMaxGas :: Word64
  }
