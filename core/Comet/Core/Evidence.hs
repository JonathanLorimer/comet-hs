module Comet.Core.Evidence where

import Comet.Core.Vote
import Data.Word
import Google.Protobuf.Timestamp
import Comet.Core.LightBlock
import Comet.Core.Validator
import Data.Int

-- TODO: Implement actual semantics
-- https://docs.cometbft.com/v0.37/spec/consensus/evidence

data DuplicateVote = DuplicateVote
  { duplicateVoteVoteA :: Vote
  , duplicateVoteVoteB :: Vote
  , duplicateVoteTotalVotingPower :: Word64
  , duplicateVoteTotalValidatorPower :: Word64
  , duplicateVoteTimestamp :: Timestamp
  }

data LightClientAttackEvidence = LightClientAttackEvidence
  { lightClientAttackEvidenceConflictingBlock :: LightBlock
  , lightClientAttackEvidenceCommonHeight :: Word64 -- TODO: Add height type with smart constructor
  , lightClientAttackEvidenceByzantineValidators :: [Validator]
  , lightClientAttackEvidenceProposerPriority :: Int64
  , lightClientAttackEvidenceTimestamp :: Timestamp
  }

data Evidence where
  Unknown :: Evidence
  Equivocation :: DuplicateVote -> Evidence
  LightClientAttack :: LightClientAttackEvidence -> Evidence
