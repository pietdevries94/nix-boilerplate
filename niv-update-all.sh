#!/usr/bin/env bash

nix-env -iA niv -f https://github.com/nmattia/niv/tarball/master \
    --substituters https://niv.cachix.org \
    --trusted-public-keys niv.cachix.org-1:X32PCg2e/zAm3/uD1ScqW2z/K0LtDyNV7RdaxIuLgQM=

cd ./templates
current=$(pwd)
for p in $(ls); do
  cd $p
  niv init
  niv update
  cd $current
done