{ lib, stdenv, windows, pkg-config, cmake}:

stdenv.mkDerivation rec {
  src = ./.;
  pname = "example-addon";
  version = "0.1.0";

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
