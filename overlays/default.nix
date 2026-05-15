(final: prev: {
  ansible-language-server =
    let
      ansiblels_1_2_1 = import (builtins.fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/4910b0b71543d8c62f2eaf7cf52f6f9d8ae7ce62.tar.gz";
        sha256 = "sha256:09j62ibsiifwv4i6sbr69zvw7qy1r5wn7in82pnkga1lhaf4baaw";
      }) { system = final.stdenv.hostPlatform.system; };
    in
    ansiblels_1_2_1.ansible-language-server;

  # toggleterm.nvim: PR #670 - conditional_auto_scroll
  # Pauses autoscroll when scrolled up; resumes when cursor at bottom
  # Remove when PR merges and lands in nixpkgs
  vimPlugins = prev.vimPlugins.extend (
    _: super: {
      toggleterm-nvim = super.toggleterm-nvim.overrideAttrs (old: {
        version = old.version + "-pr670";
        src = final.fetchFromGitHub {
          owner = "Run1e";
          repo = "toggleterm.nvim";
          rev = "91564fbfd2eaf4f5f6f943fcb7edeb3e0df1aa5f";
          hash = "sha256-LwyV54IUSwS15sFBIivKyi6trm+XDMDKjLLncXSQmQg=";
        };
      });
    }
  );
})
