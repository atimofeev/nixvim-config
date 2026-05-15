(final: prev: {
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
