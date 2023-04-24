module Comet.Core.Validator where

import Comet.Core.Address
import Data.ByteString
import Data.Word
import Data.Set

data Validator = Validator
  { validatorAddress :: ValidatorAddress
  , validatorPubkey :: ByteString
  , validatorVotingPower :: Word64
  , validatorProposePriority :: Word64
  }

data ValidatorSet = ValidatorSet
  { validatorSetValidators :: Set Validator -- TODO: Add validation rules
  , vlidatorSetProposer :: Validator
  }
