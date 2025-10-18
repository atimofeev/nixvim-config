{

  extraConfigLua = # lua
    ''
      local o = vim.opt

      -- main
      -- o.autochdir = true -- breaks project-nvim
      -- o.fillchars.eob = " "
      -- o.winborder = "rounded" -- conflicts with many plugins
      o.backspace = "indent,eol,start"
      o.backup = false
      o.confirm = true -- get confirmation prompt on exit
      o.mouse = "" -- fkin stop registering touchpad
      o.shortmess:append "sI" -- disable nvim intro
      o.swapfile = false
      o.termguicolors = true
      o.timeoutlen = 400
      o.undofile = true
      o.updatetime = 250

      -- cursor / line / gutter
      -- o.whichwrap:append "<>[]hl" -- change lines with h or l (at line end)
      o.cursorline = true
      -- o.foldcolumn = "auto" -- gets triggered by obsidian.nvim
      o.number = true
      o.numberwidth = 2
      o.relativenumber = true
      o.ruler = false
      o.scrolloff = 5
      o.signcolumn = "yes"

      -- cmd / search / substitute
      o.hlsearch = true
      o.ignorecase = true
      o.inccommand = "split" -- show `:s` preview in split window
      o.showmatch = true
      o.smartcase = true

      -- indenting
      -- o.smartindent = true
      o.autoindent = true
      o.breakindent = true -- keep indent for wrapped parts of lines

      -- tab
      o.expandtab = true
      o.shiftwidth = 2
      o.smarttab = true
      o.softtabstop = 2
      o.tabstop = 2

      -- split
      o.splitbelow = true
      o.splitright = true
    '';

}
