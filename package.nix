{ lib, stdenv, windows, pkg-config, cmake, imgui, nexus, mumble}:

stdenv.mkDerivation rec {
  src = ./.;
  pname = "example-addon";
  version = "0.1.0";

  patchPhase = ''
    mkdir -p ./modules/
    cp --no-preserve=mode -r ${imgui.outPath} ./modules/imgui
    cp --no-preserve=mode -r ${nexus.outPath} ./modules/nexus
    cp --no-preserve=mode -r ${mumble.outPath} ./modules/mumble
  '';

  installPhase = ''
    mkdir -p $out/lib
    cp ./*.dll $out/lib
  '';

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
      windows.pthreads
  ];
}
