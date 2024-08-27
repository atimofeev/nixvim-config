# nixvim-config

Coding is just an excuse to use Vim!

## Features

## TODOs

### Builtins

- `smartindent` fix behavior with #\
  In many occasions entering # (i) will reset current indent
- `window` implement dynamic resizing based on current window position

### Plugins

#### Configure

- `harpoon` setup
- `none-ls` migrate from unmaintained builtins. [issue](https://github.com/nvimtools/none-ls.nvim/issues/58)
- `toggleterm` add keymap to kill term OR exit from :TermExec app
- `toggleterm` more useful terminal name template (as seen in `:Telescope toggleterm`)
- `telescope` check [Configuration-Recipes](https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes) for useful info
- `treesitter-refactor` keymaps for actions
- `dashboard` recent projects and files. [example](https://github.com/jakehamilton/neovim/blob/cdc0749394ed0645bd9516977514108c410cec15/modules/nixvim/dashboard/default.nix#L57)
- `yaml-companion` KB to show current yaml schema
- `yaml-companion` integrate [actual](https://github.com/yannh/kubernetes-json-schema) k8s schemas
- `vim-move` figure out keymaps. [source code](https://github.com/matze/vim-move/blob/516a47e8365a7664a8691d306d5ec91a6f5e5772/plugin/move.vim)

#### Upgrade

- `better-escape` [Pull](https://github.com/max397574/better-escape.nvim/pull/59)
- `cursorline` [Issue](https://github.com/yamatsum/nvim-cursorline/issues/10)

#### Etc

- Learn best practices from [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim?tab=readme-ov-file#%EF%B8%8F--features)
- Good nixvim [template](https://github.com/elythh/nixvim)

## Issues

- `treesitter` ensureInstalled list has no effect\
  All langs are installed anyway (at least according to :TSInstallInfo)
- `terminal (builtin)` does not support reflow. [merged into 0.10](https://github.com/neovim/neovim/pull/21124)
- `terraformls` can't load completion schema from providers: \
  `2024/08/01 22:35:09 module_ops.go:301: preloaded schema not available for registry.terraform.io/hashicorp/aws`

## Notes

### Movement

#### Words

Move between words. Punctuation and other symbols are also considered words.\
To move based on whitespace, use capital letters (WBE).

- `w` start of next word
- `b` start of prev word
- `e` end of next word
- `ge` end of prev word

#### Lines

- `12G` or `:12` go to line 12
- `C-e` scroll one line down
- `C-y` one line up

#### Window

- `C-d` scroll half screen down
- `C-u` half screen up
- `C-f` full screen down
- `C-b` full screen up

- `zz` center current line
- `zt` scroll line to top of window
- `zb` scroll line to bottom of window

#### Other

- `%` jump to matching ({[
- `gt` next tab
- `gT` previous tab
- `gx` open link
- `gf` open file

### Selection

- `*` search word under cursor
- `gn` go to next search match and select it
- `o` switch selection direction
- `vib` select within ()
- `viB` select within {}

### Editing

- `cc` change whole line
- On selection `:norm A test` will play entered keys, appending `test` to end of line

#### Numbers

- `C-a` increment number
- `C-x` decrement number
- On selection: `g C-a` create sequence of numbers

#### Case

- `~` toggle case
- `g~w` toggle case of word
- V: `u` lower case
- V: `U` upper case

### Tricks

#### Renaming things

##### Method 1

- `*` select all matches for a word under cursor
- `cgn` change next match
- `.` to repeat action

##### Method 2

- `* -> :%s//replacement/g` \*: select word and all matches in buffer

##### Method 3

- `:%s/foo/bar/gc` %: in whole buffer, s: replace foo with bar, g: global (several times per line), c: confirm

##### Method 4

- `Telescope results -> C-q -> :cdo {{cmd}} -> :wa` refactor via quickfix list and bulk actions

#### Add opening and closing tags on multiple lines

- `C-q -> I` insert opening tag
- `gv` go to last visual selection
- `$ -> A` append closing tag

### Registers

- `:reg` show registers
- `"ay` copy to register `a`
- `"ap` paste from register `a`
- `"Ay` append to register `a`

### Macros

- `qw -> {{do stuff}} -> q -> 4@w` q: start/stop macro record, w: in register w, 4@w: repeat 4 times the macro w

### Sessions

- `:mksession file.vim` save current session
- `:source file.vim` load saved session

### Marks

- `ma` create mark `a`
- `'a` or \`a go to mark `a`

Scope:

- `lowercase` current buffer
- `uppercase` session (move to any buffer)

### Folds

- `zf` create fold
- `za` toggle fold
- `zc` close fold
- `zo` open fold
- `zd` delete fold

### Misc

- `:%y` yank whole buffer
- `:e` reload buffer from file
- `:r file` or `:r !cmd` read and insert results into buffer
- `ZZ` save and quit
- `ZQ` quit without saving
- `gg=G` indent whole file
- `J` join current and next lines (with space between)
- `gJ` join without space
- `!open %` open file in external app
