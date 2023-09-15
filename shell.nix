{ pkgs ? import (fetchTarball "https://releases.nixos.org/nixpkgs/nixpkgs-23.11pre525954.46688f8eb5cd/nixexprs.tar.xz") { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs_20
    (pkgs.nodePackages.pnpm.override { 
        nodejs = pkgs.nodejs_20;
    })
  ];

  shellHook = ''
    pnpm install
    pnpm build
  '';
}
