module Comet.Core.SignedMessage where

data SignedMessage
  = SignedMessageUnknown
  | SignedMessagePrevote
  | SignedMessagePrecommit
  | SignedMessageProposal

