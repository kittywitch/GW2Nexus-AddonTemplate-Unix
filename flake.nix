{
  description = "example C++ nexus addon";
  inputs = {
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    imgui = {
      url = "github:RaidcoreGG/imgui/master";
      flake = false;
    };
    mumble = {
      url = "github:RaidcoreGG/RCGG-lib-mumble-api/main";
      flake = false;
    };
    nexus = {
      url = "github:RaidcoreGG/RCGG-lib-nexus-api/main";
      flake = false;
    };
    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, flake-utils, nixpkgs, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import nixpkgs) {
          inherit system;
          crossSystem.config = "x86_64-w64-mingw32";
        };

        example = pkgs.callPackage ./package.nix {
          imgui = inputs.imgui;
          mumble = inputs.mumble;
          nexus = inputs.nexus;
        };
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

