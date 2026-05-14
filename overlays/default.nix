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
          rev = "6500760f45a617e08d0ad10b3bb7d5f9997b0944";
          hash = "sha256-5jB/KAWe27UzMG9gzQV1fqbS5Xm7WHs5FLVDpIq3HTI=";
        };
        patches = (old.patches or []) ++ [
          # Fix: guard nvim_win_get_cursor against closed/missing window
          # Prevents crash on close + chord keybind race
          (final.writeText "toggleterm-conditional-autoscroll-fix.patch" ''
            diff --git a/lua/toggleterm/terminal.lua b/lua/toggleterm/terminal.lua
            index 55f1a1e..2f7d8cb 100644
            --- a/lua/toggleterm/terminal.lua
            +++ b/lua/toggleterm/terminal.lua
            @@ -385,8 +385,11 @@ function Terminal:__make_output_handler(handler)
                 return function(...)
                   if self.auto_scroll then
                     if self.conditional_auto_scroll then
            -          local cursor = vim.api.nvim_win_get_cursor(self.window)
            -          if cursor[1] == vim.api.nvim_buf_line_count(self.bufnr) then self:scroll_bottom() end
            +          if self.window and vim.api.nvim_win_is_valid(self.window) then
            +            local cursor = vim.api.nvim_win_get_cursor(self.window)
            +            if cursor[1] == vim.api.nvim_buf_line_count(self.bufnr) then self:scroll_bottom() end
            +          end
            +          -- if window is invalid (closed), skip autoscroll
                     else
                       self:scroll_bottom()
                     end
          '')
        ];
      });
    }
  );
})
