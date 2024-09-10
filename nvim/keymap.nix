_: {

  globals.mapleader = " ";

  extraConfigLua = # lua
    ''
      function map(mode, lhs, rhs, opts)
        local options = {noremap = true, silent = true}
        if opts then
          options = vim.tbl_extend("force", options, opts)
        end
        vim.keymap.set(mode, lhs, rhs, options)
      end

      -- main
      map('n',';',':',{silent = false}) -- cmd mode with ;
      map('n',':',';',{silent = false}) -- next symbol match with :
      map('x','p','P') -- paste without yank
      map('x','P','p') -- paste and yank
      map({'n','v'},'j','gj') -- go through wrapped lines
      map({'n','v'},'k','gk')
      map({'n','v'},'<S-g>','<S-g>10<C-e>') -- scrolloff 10 lines after going to EOF
      map('n','<Esc>','<Cmd>noh<CR>' ) -- clear highlight
      map('v','>','>gv' ) -- horizontally move lines; get back to `v` selection
      map('v','<','<gv' ) -- redundant with mini.move?

      -- buffers & tabs
      map('n','<leader>b','<Cmd>enew<CR>',{desc = 'New buffer'})
      map('n','<leader>x','<Cmd>confirm bdelete<CR>',{desc = 'Close buffer'})
      -- map('n','<Tab>','<Cmd>bnext<CR>',{desc = 'Next buffer'}) -- conflicts with barbar
      -- map('n','<S-Tab>','<Cmd>bprev<CR>',{desc = 'Prev buffer'})
      map('n','<leader>t','<Cmd>tabnew<CR>',{desc = 'New tab'})

      -- terminal
      -- map('t','jk','<C-\\><C-n>') -- escape terminal mode; now handled with new `better-escape`
      map('n','<leader>B','<Cmd>enew | setlocal nonumber norelativenumber | term<CR>i',{desc = 'Term buffer'})
      map('n','<leader>T','<Cmd>tabnew | setlocal nonumber norelativenumber | term<CR>i',{desc = 'Term tab'})

      -- navigate windows
      map('n','<C-h>','<C-w>h')
      map('n','<C-j>','<C-w>j')
      map('n','<C-k>','<C-w>k')
      map('n','<C-l>','<C-w>l')

      -- navigate out of terminal windows
      map('t','<C-h>','<Cmd>wincmd h<CR>')
      map('t','<C-j>','<Cmd>wincmd j<CR>')
      map('t','<C-k>','<Cmd>wincmd k<CR>')
      -- map('t','<C-l>','<Cmd>wincmd l<CR>') -- conflict with <C-l> for `clear`

      -- resize windows
      map('n','<C-Up>','<Cmd>resize -2<CR>')
      map('n','<C-Down>','<Cmd>resize +2<CR>')
      map('n','<C-Left>','<Cmd>vertical resize -2<CR>')
      map('n','<C-Right>','<Cmd>vertical resize +2<CR>')

      -- move windows
      map('n','<C-S-Up>','<Cmd>wincmd K<CR>')
      map('n','<C-S-Down>','<Cmd>wincmd J<CR>')
      map('n','<C-S-Left>','<Cmd>wincmd H<CR>')
      map('n','<C-S-Right>','<Cmd>wincmd L<CR>')
    '';
}
