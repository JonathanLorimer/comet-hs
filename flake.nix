{
  description = "comet-hs";

  inputs = {
    # Nix Inputs
    nixpkgs.url = github:nixos/nixpkgs/nixpkgs-unstable;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }: let
    utils = flake-utils.lib;
  in
    utils.eachDefaultSystem (system: let
      compilerVersion = "ghc927";
      pkgs = nixpkgs.legacyPackages.${system};
      hsPkgs = pkgs.haskell.packages.${compilerVersion}.override {
        overrides = hfinal: hprev: {
          comet-hs = hfinal.callCabal2nix "comet-hs" ./. {};
          # # Needed for hls on ghc 9.2.5 and 9.4.3
          # # https://github.com/ddssff/listlike/issues/23
          # ListLike = pkgs.haskell.lib.dontCheck hprev.ListLike;
          data-diverse = pkgs.haskell.lib.unmarkBroken (pkgs.haskell.lib.dontCheck hprev.data-diverse);
          proto3-wire = pkgs.haskell.lib.dontCheck (hfinal.callPackage ./nix/deps/proto3-wire.nix {});
          proto3-suite = pkgs.haskell.lib.dontCheck (hfinal.callPackage ./nix/deps/proto3-suite.nix {});
        };
      };
    in {
      # nix build
      packages =
        utils.flattenTree
        {
          comet-hs = hsPkgs.comet-hs;
          default = hsPkgs.comet-hs;
        };

      # You can't build the comet-hs package as a check because of IFD in cabal2nix
      checks = {};

      # nix fmt
      formatter = pkgs.alejandra;

      # nix develop
      devShell = hsPkgs.shellFor {
        packages = p: [
          p.comet-hs
        ];
        buildInputs = with pkgs;
          [
            hsPkgs.haskell-language-server
            haskellPackages.cabal-install
            cabal2nix
            haskellPackages.ghcid
            haskellPackages.fourmolu
            haskellPackages.cabal-fmt
            nodePackages.serve
          ]
          ++ (builtins.attrValues (import ./scripts.nix {s = pkgs.writeShellScriptBin;}));
      };

      # nix run
      apps = let
        comet-hs = utils.mkApp {
          drv = self.packages.${system}.default;
        };
      in {
        inherit comet-hs;
        default = comet-hs;
      };
    });
}
