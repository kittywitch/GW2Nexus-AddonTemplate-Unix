{
  description = "example nexus-rs addon";
  inputs = {
    self.submodules = true;
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, nixpkgs, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
          crossSystem.config = "x86_64-w64-mingw32";
        };

        example = pkgs.callPackage ./package.nix { };
      in
      rec {
        inherit pkgs;
        devShell = {
          default = example.devShell;
        };
        packages = {
          inherit example;
          default = example;
        };
      });
}

