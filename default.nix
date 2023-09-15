{ pkgs ? import (fetchTarball "https://releases.nixos.org/nixpkgs/nixpkgs-23.11pre525954.46688f8eb5cd/nixexprs.tar.xz") { } }:

pkgs.stdenv.mkDerivation rec {
  name = "betterdiscord";
#   version = "1.0.0";

  src = ./.;

  buildInputs = [
    pkgs.nodejs_20
    (pkgs.nodePackages.pnpm.override { 
        nodejs = pkgs.nodejs_20;
    })
  ];

  buildPhase = ''
    pnpm install
    pnpm build
  '';

  installPhase = ''
    mkdir -p $out
    cp -r ./dist/* $out/
  '';
}
