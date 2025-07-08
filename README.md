# GW2Nexus-AddonTemplate-Unix
Addon Template for GW2 Nexus, optimized for using with CLion/CMake

## Usage via Nix

```
# get submodules
git submodule update --init --recursive

# development shell from the package
nix develop .#example

# build package
nix build .#example
```
