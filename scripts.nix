{s}: rec
{
  ghcidScript = s "dev" "ghcid --command 'cabal new-repl lib:comet-hs' --allow-eval --warnings";
  hoogleScript = s "hgl" "hoogle serve";
}
