{ sources ? import ./nix/sources.nix}:

let
  pkgs = import sources.nixpkgs {};
  mkYarnDist = (import sources.personal-nix-channel {}).mkYarnDist;
  inherit (pkgs) nix-gitignore callPackage;
in
mkYarnDist {
  inherit pkgs;
  src = nix-gitignore.gitignoreSource [] ./.;
  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;
}
