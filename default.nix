{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation rec {
  name = "nix-boilerplate";

  src = pkgs.nix-gitignore.gitignoreSource [] ./.;

  installPhase = ''
    mkdir -p $out
    cp -r * $out
  '';
}