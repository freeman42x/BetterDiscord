{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.git
    pkgs.nodejs_20
    (pkgs.nodePackages.pnpm.override { 
        nodejs = pkgs.nodejs_20;
    })
  ];

  shellHook = ''
    pnpm install
    pnpm build
    pnpm inject
  '';
}
