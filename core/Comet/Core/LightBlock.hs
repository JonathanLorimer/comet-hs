module Comet.Core.LightBlock where

import Comet.Core.Header
import Comet.Core.Validator

data LightBlock = LightBlock
  { lightBlockSignedHeader :: SignedHeader
  , lightBlockValidatorSet :: ValidatorSet
  }
