# nixvim-config

## Features

## TODOs

### Nix

- `nixpkgs-stable` Implement second nixpkgs channel\
  Non-working example of my try:

```nix
{
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
  }
  outputs = {nixpkgs-stable, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      perSystem = { pkgs-stable ... }:
        let
          nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
            inherit pkgs-stable;
          };
        in {
          _module.args.pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
        };
    };
}
```

### Builtins

- `smartindent` fix behavior with #\
  In many occasions entering # (i) will reset current indent
- `window` implement dynamic resizing based on current window position
- `buffer` refresh on file update. [reddit](https://www.reddit.com/r/neovim/comments/f0qx2y/automatically_reload_file_if_contents_changed/), nvim roadmap(?), [workaround](https://neovim.discourse.group/t/a-lua-based-auto-refresh-buffers-when-they-change-on-disk-function/2482)

### Plugins

#### Configure

- `harpoon` setup
- `oil` setup; install [gx.nvim](https://github.com/chrishrb/gx.nvim) to fix `gx` action. [video guide](https://www.youtube.com/watch?v=EEoJQWgpWqE)
- `none-ls` add tflint
- `none-ls` migrate from unmaintained builtins. [issue](https://github.com/nvimtools/none-ls.nvim/issues/58)
- `toggleterm` add keymap to kill term OR exit from :TermExec app
- `toggleterm` more useful terminal name template (as seen in `:Telescope toggleterm`)
- `telescope` check [Configuration-Recipes](https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes) for useful info
- `treesitter` add [jinja2](https://github.com/varpeti/tree-sitter-jinja2) support; enable multiple grammars for .j2 files
- `treesitter-refactor` keymaps for actions
- `dashboard` recent projects and files. [example](https://github.com/jakehamilton/neovim/blob/cdc0749394ed0645bd9516977514108c410cec15/modules/nixvim/dashboard/default.nix#L57)
- `yaml-companion` KB to show current yaml schema
- `yaml-companion` integrate [actual](https://github.com/yannh/kubernetes-json-schema) k8s schemas
- `nvim-tree` implement dynamic size of float window. examples: [1](https://www.reddit.com/r/neovim/comments/13u9okq/nvimtree_vs_neotree/), [2](https://github.com/MarioCarrion/videos/blob/269956e913b76e6bb4ed790e4b5d25255cb1db4f/2023/01/nvim/lua/plugins/nvim-tree.lua)
- `mini.surround` avoid additional spaces in new [] and () pairs
- `mini.surround` make two spaces in empty new [] and () pairs on single SPC press
- `vim-move` figure out keymaps. [source code](https://github.com/matze/vim-move/blob/516a47e8365a7664a8691d306d5ec91a6f5e5772/plugin/move.vim)
- `hover.nvim` try out (nvim 0.10.0+)

#### Upgrade

- `better-escape` [Pull](https://github.com/max397574/better-escape.nvim/pull/59)
- `cursorline` [Issue](https://github.com/yamatsum/nvim-cursorline/issues/10)

#### Misc

- Learn best practices from [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim?tab=readme-ov-file#%EF%B8%8F--features)
- Create terraform template autodetect and syntax, base it on [jinja.nvim](https://github.com/HiPhish/jinja.vim).
- Good nixvim [template](https://github.com/elythh/nixvim)

## Issues

- `treesitter` ensureInstalled list has no effect\
  All langs are installed anyway (at least according to :TSInstallInfo)
- `terminal (builtin)` does not support reflow. [merged into 0.10](https://github.com/neovim/neovim/pull/21124)
- `terraformls` can't load completion schema from providers: \
  `2024/08/01 22:35:09 module_ops.go:301: preloaded schema not available for registry.terraform.io/hashicorp/aws`

## Notes

### Movement

- `C-d` move half page down
- `C-u` move half page up

### Rename word flow

- `*` select all matches in buffer
- `cgn` change next match
- `.` to repeat action

### Replace

- `:%s/foo/bar/gc` %: in whole buffer, s: replace foo with bar, g: global (several times per line), c: confirm
- `* -> :%s//replacement/g` \*: select word and all matches in buffer
- `Telescope results -> C-q -> :cdo {{cmd}} -> :wa` refactor via quickfix list and bulk actions

### Macros

- `qw -> {{do stuff}} -> q -> 4@w` q: start/stop macro record, w: in register w, 4@w: repeat 4 times the macro w
- `:reg` show registers

### Misc

- `:%y` yank whole buffer
- `gt` next tab
- `gT` previous tab
- `:e` reload buffer from file
- `:r file` or `:r !cmd` read and insert results into buffer
