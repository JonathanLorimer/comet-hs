module Comet.Core.Hash (
  mkHash32,
  Hash32
) where

import Data.ByteString (ByteString)
import Data.ByteString qualified as BS

newtype Hash32 = Hash32 { unHash32 :: ByteString }

mkHash32 :: ByteString -> Maybe Hash32
mkHash32 bs = if BS.length bs == 32 then Just $ Hash32 bs else Nothing
