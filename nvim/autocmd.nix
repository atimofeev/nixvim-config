{

  extraConfigLua = # lua
    ''
      vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) text",
        callback = function()
          vim.highlight.on_yank { higroup = "Search", timeout = 300 }
        end,
      })

      vim.api.nvim_create_autocmd("TermClose", {
        desc = "Close terminal if its process has ended",
        callback = function()
          vim.cmd "bdelete"
        end,
      })

      vim.api.nvim_create_autocmd("VimResized", {
        desc = "Equalize windows on vim resize",
        callback = function()
          vim.cmd "wincmd ="
        end,
      })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufWritePost" }, {
        desc = "Update kitty tab title with current filename",
        callback = function()
          vim.fn.system { "kitty", "@", "set-tab-title", vim.fn.expand "%:t" }
        end,
      })
    '';

}
