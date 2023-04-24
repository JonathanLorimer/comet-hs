module Comet.Core.Address (
  mkValidatorAddress,
  ValidatorAddress,
) where

import Data.ByteString (ByteString)
import Data.ByteString qualified as BS

-- TODO: Maybe just add a generic address type if they are all the same format, and then type specific wrappers
-- like ValidatorAddress

newtype ValidatorAddress = ValidatorAddress {unValidatorAddress :: ByteString}

mkValidatorAddress :: ByteString -> Maybe ValidatorAddress
mkValidatorAddress bs = if BS.length bs == 20 then Just $ ValidatorAddress bs else Nothing
