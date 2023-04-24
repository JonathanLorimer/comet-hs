module Comet.Core.Signature where

import Data.ByteString (ByteString)
import Data.ByteString qualified as BS

-- TODO: Add smart constructors for all of these!!!

newtype Ed25519Hash = Ed25519Hash { unEd25519Hash :: ByteString }

newtype Secp256k1Hash = Secp256k1Hash { unSecp256k1Hash :: ByteString }

data Signature where
  Ed25519 :: Ed25519Hash -> Signature
  Secp256k1 :: Secp256k1Hash -> Signature
