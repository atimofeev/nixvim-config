# nixvim-config

Coding is just an excuse to use Vim!

## Features

## TODOs

### Global

- `config` move everything to `extraConfigLua` for easy portability

### Builtins

- `window` better resizing by moving splits. Example: [1](https://github.com/Akianonymus/dotfiles/blob/550a16d0e707f0803f079a8bdf6e5b9fdec3c436/src/.config/nvim/lua/utils.lua#L70)
- `window` better movement. Currently moves active window to edges

### Plugins

#### Configure

- `none-ls` migrate to [conform.nvim](https://github.com/stevearc/conform.nvim) and [nvim-lint](https://github.com/mfussenegger/nvim-lint)
- `obsidian.nvim` disable UI and use [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) instead
- `toggleterm` add keymap to kill term OR exit from :TermExec app
- `toggleterm` more useful terminal name template (as seen in `:Telescope toggleterm`)
- `telescope` check [Configuration-Recipes](https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes) for useful info
- `treesitter-refactor` keymaps for actions. [gh](https://github.com/nvim-treesitter/nvim-treesitter-refactor)
- `yaml-companion` KB to show current yaml schema
- `yaml-companion` integrate [actual](https://github.com/yannh/kubernetes-json-schema) k8s schemas

#### Upgrade

- `cursorline` [Issue](https://github.com/yamatsum/nvim-cursorline/issues/10)

## Issues

- `treesitter` ensureInstalled list has no effect\
  All langs are installed anyway (at least according to :TSInstallInfo)
- `builtin terminal` does not support _proper_ reflow (both render & copy)
- `terraformls` can't load completion schema from providers: \
  `2024/08/01 22:35:09 module_ops.go:301: preloaded schema not available for registry.terraform.io/hashicorp/aws`
