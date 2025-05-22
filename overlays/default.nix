(final: prev: {
  nixd =
    let
      nixd_2_3_1 = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/b959f399d27ce028a0a87317b45306b4c3c8a1b1.tar.gz";
        sha256 = "sha256:0wyk3f4f12pvxvhq50c2zvrcipzmsmm1gv61pj4hlxxgszk7dr9h";
      }) { inherit (final) system; };
    in
    nixd_2_3_1.nixd;
})
