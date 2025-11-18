(final: prev: {
  # nixd =
  #   let
  #     nixd_2_3_1 = import (builtins.fetchTarball {
  #       url = "https://github.com/NixOS/nixpkgs/archive/b959f399d27ce028a0a87317b45306b4c3c8a1b1.tar.gz";
  #       sha256 = "sha256:0wyk3f4f12pvxvhq50c2zvrcipzmsmm1gv61pj4hlxxgszk7dr9h";
  #     }) { inherit (final) system; };
  #   in
  #   nixd_2_3_1.nixd;
  ansible-language-server =
    let
      ansiblels_1_2_1 = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/4910b0b71543d8c62f2eaf7cf52f6f9d8ae7ce62.tar.gz";
        sha256 = "sha256:09j62ibsiifwv4i6sbr69zvw7qy1r5wn7in82pnkga1lhaf4baaw";
      }) { inherit (final) system; };
    in
    ansiblels_1_2_1.ansible-language-server;
})
