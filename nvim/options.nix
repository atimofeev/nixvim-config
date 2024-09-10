_: {

  extraConfigLua = # lua
    ''
      local o = vim.opt

      -- main
      o.shortmess:append "sI" -- disable nvim intro
      o.mouse = ""  --fkin stop registering touchpad
      o.undofile = true
      o.termguicolors = true
      o.updatetime = 250
      o.timeoutlen = 400
      -- o.autochdir = true -- breaks project-nvim
      o.backup = false
      o.backspace = "indent,eol,start"
      -- o.fillchars.eob = " "
      o.langmap = table.concat({
        'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        'фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz',
        'ёхъжэбю;\\`\\[\\]\\;\'\\,\\.',
        'ЁХЪЖЭБЮ;~{}:\\"<>'
      }, ',')
      o.foldcolumn = "auto"

      -- cursor / line
      o.cursorline = true
      o.scrolloff = 5
      o.number = true
      o.relativenumber = true
      o.numberwidth = 2
      o.ruler = false
      o.signcolumn = "yes"
      -- o.whichwrap:append "<>[]hl" -- change lines with h or l (at line end)

      -- cmd / search / substitute
      o.ignorecase = true
      o.smartcase = true
      o.hlsearch = true
      o.showmatch = true
      o.inccommand = 'split' -- show `:s` preview in split window

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
