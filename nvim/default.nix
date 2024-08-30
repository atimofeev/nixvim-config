_: {

  imports = [ ./plugins ./filetype.nix ./keymap.nix ./options.nix ];

  clipboard.register = "unnamedplus";

  extraConfigLua = # lua
    ''
      vim.api.nvim_create_autocmd('TextYankPost', {
        desc = 'Highlight when yanking (copying) text',
        group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
        callback = function()
          vim.highlight.on_yank({higroup='Search', timeout=300})
        end,
      })

      vim.api.nvim_create_autocmd("TermClose", {
        desc = 'Close terminal if its process has ended',
        callback = function()
           vim.cmd("bdelete")
        end
      })
    '';

}
